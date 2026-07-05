#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
uname -a > "$REPORT_DIR/kernel-report.txt"
sysctl -a > "$REPORT_DIR/kernel-sysctl-all.txt" 2>/dev/null || true
