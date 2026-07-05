#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
REPORT="$REPORT_DIR/services-report.txt"
echo "Services sécurité" > "$REPORT"
for s in ssh ufw fail2ban auditd apparmor clamav-freshclam chrony systemd-journald; do
  systemctl is-active "$s" >> "$REPORT" 2>&1 || true
done
