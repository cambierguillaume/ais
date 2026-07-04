#!/bin/bash
source lib/common.sh
require_root
info "Module AppArmor"

install_package apparmor
install_package apparmor-utils
systemctl enable apparmor
systemctl restart apparmor || true
aa-status > "$REPORT_DIR/apparmor-report.txt" || true
