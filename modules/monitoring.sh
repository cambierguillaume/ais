#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
systemctl --failed > "$REPORT_DIR/monitoring-failed-services.txt" || true
df -h > "$REPORT_DIR/monitoring-disk.txt"
free -h > "$REPORT_DIR/monitoring-memory.txt"
