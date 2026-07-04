#!/bin/bash
set -Eeuo pipefail

source lib/common.sh
require_root

REPORT="$REPORT_DIR/audit-global.txt"

{
echo "Audit global Ubuntu AIS - $(date)"
echo
hostnamectl || true
echo
for s in ssh ufw fail2ban auditd apparmor clamav-freshclam clamav-daemon; do
  service_state "$s"
done
echo
echo "UFW"
ufw status verbose || true
echo
echo "Fail2ban"
fail2ban-client status sshd || true
echo
echo "AppArmor"
aa-status || true
echo
echo "Auditd"
auditctl -l || true
} > "$REPORT"

cat "$REPORT"
