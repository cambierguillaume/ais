#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
install_package chrony
systemctl enable chrony
systemctl restart chrony
chronyc tracking > "$REPORT_DIR/chrony-report.txt" 2>&1 || true
