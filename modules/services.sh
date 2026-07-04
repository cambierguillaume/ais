#!/bin/bash
source lib/common.sh
require_root
info "Module Services"

REPORT="$REPORT_DIR/services-report.txt"
echo "===== Rapport Services =====" > "$REPORT"

for s in ssh ufw fail2ban auditd apparmor clamav-freshclam clamav-daemon; do
  service_state "$s" | tee -a "$REPORT"
done
