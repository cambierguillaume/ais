#!/bin/bash
source lib/common.sh
require_root
info "Module Auditd"

install_package auditd
install_package audispd-plugins

backup_file /etc/audit/rules.d/hardening.rules

cat > /etc/audit/rules.d/hardening.rules <<'EOF'
-w /etc/passwd -p wa -k passwd_changes
-w /etc/shadow -p wa -k shadow_changes
-w /etc/group -p wa -k group_changes
-w /etc/gshadow -p wa -k gshadow_changes
-w /etc/sudoers -p wa -k sudoers_changes
-w /etc/ssh/sshd_config -p wa -k sshd_config_changes
EOF

augenrules --load || true
systemctl enable auditd
systemctl restart auditd || service auditd restart || true
auditctl -l > "$REPORT_DIR/auditd-rules.txt" || true
