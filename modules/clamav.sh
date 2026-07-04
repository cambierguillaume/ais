#!/bin/bash
source lib/common.sh
require_root
info "Module ClamAV"

install_package clamav
install_package clamav-daemon

systemctl stop clamav-freshclam 2>/dev/null || true
freshclam || true
systemctl enable clamav-freshclam
systemctl restart clamav-freshclam || true

clamscan --version > "$REPORT_DIR/clamav-version.txt" || true
clamscan -ri /home > "$REPORT_DIR/clamav-home-scan.txt" 2>&1 || true
