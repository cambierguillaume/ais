#!/bin/bash
source lib/common.sh
require_root
info "Module Fail2ban"

install_package fail2ban
backup_file /etc/fail2ban/jail.local

cat > /etc/fail2ban/jail.local <<EOF
[DEFAULT]
bantime = 1h
findtime = 10m
maxretry = 5
backend = systemd

[sshd]
enabled = true
port = ${SSH_PORT}
logpath = %(sshd_log)s
EOF

systemctl enable fail2ban
systemctl restart fail2ban

fail2ban-client status > "$REPORT_DIR/fail2ban-report.txt" || true
fail2ban-client status sshd >> "$REPORT_DIR/fail2ban-report.txt" || true
