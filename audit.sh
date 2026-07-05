#!/bin/bash
set -Eeuo pipefail
source "$(dirname "$0")/lib/common.sh"
require_root

REPORT="$REPORT_DIR/audit-global.md"
echo "# Audit global Ubuntu Hardening AIS v$VERSION" > "$REPORT"
echo "Date : $(date)" >> "$REPORT"

append_report "$REPORT" "Système" hostnamectl
append_report "$REPORT" "Services échoués" systemctl --failed
append_report "$REPORT" "UFW" ufw status verbose
append_report "$REPORT" "Fail2ban SSH" fail2ban-client status sshd
append_report "$REPORT" "AppArmor" aa-status
append_report "$REPORT" "Auditd" auditctl -l
append_report "$REPORT" "Sysctl principaux" sysctl kernel.randomize_va_space kernel.kptr_restrict net.ipv4.tcp_syncookies fs.protected_symlinks

cat "$REPORT"
