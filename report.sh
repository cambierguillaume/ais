#!/bin/bash
set -Eeuo pipefail
source "$(dirname "$0")/lib/common.sh"
require_root

REPORT="$REPORT_DIR/rapport-final.md"
echo "# Rapport final Hardening Ubuntu AIS v$VERSION" > "$REPORT"
echo "Date : $(date)" >> "$REPORT"

append_report "$REPORT" "Hostname" hostnamectl
append_report "$REPORT" "UFW" ufw status verbose
append_report "$REPORT" "SSH" sshd -T
append_report "$REPORT" "Fail2ban" fail2ban-client status sshd
append_report "$REPORT" "AppArmor" aa-status
append_report "$REPORT" "Auditd" auditctl -l
append_report "$REPORT" "Disque" df -h
append_report "$REPORT" "Mémoire" free -h

info "Rapport généré : $REPORT"
