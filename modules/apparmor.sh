#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
install_package apparmor
install_package apparmor-utils
systemctl enable apparmor
systemctl restart apparmor || true
aa-status > "$REPORT_DIR/apparmor-report.txt" || true
