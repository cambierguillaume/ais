#!/bin/bash
source lib/common.sh
require_root
info "Module Rapport"

REPORT="$REPORT_DIR/rapport-final.md"

{
echo "# Rapport final Hardening Ubuntu AIS v$VERSION"
echo
echo "Date : $(date)"
echo
echo "## Services"
echo '```'
cat "$REPORT_DIR/services-report.txt" 2>/dev/null || true
echo '```'
echo
echo "## UFW"
echo '```'
ufw status verbose || true
echo '```'
echo
echo "## SSH"
echo '```'
sshd -T | grep -E "permitrootlogin|passwordauthentication|maxauthtries|x11forwarding|port" || true
echo '```'
echo
echo "## Auditd"
echo '```'
auditctl -l || true
echo '```'
} > "$REPORT"
