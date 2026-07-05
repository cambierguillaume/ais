#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
backup_file /etc/fstab
findmnt > "$REPORT_DIR/fstab-report.txt"
