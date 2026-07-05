#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
install_package clamav
install_package clamav-daemon
systemctl stop clamav-freshclam 2>/dev/null || true
freshclam || true
systemctl enable clamav-freshclam
systemctl restart clamav-freshclam || true
clamscan --version > "$REPORT_DIR/clamav-version.txt" || true
