#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
install_package lynis
lynis audit system --quick > "$REPORT_DIR/lynis-report.txt" 2>&1 || true
