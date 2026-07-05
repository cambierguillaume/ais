#!/bin/bash
set -Eeuo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"
source "$ROOT_DIR/config.conf"
source "$ROOT_DIR/lib/logger.sh"
source "$ROOT_DIR/lib/validation.sh"
source "$ROOT_DIR/lib/package.sh"
source "$ROOT_DIR/lib/backup.sh"
source "$ROOT_DIR/lib/report.sh"
mkdir -p "$LOG_DIR" "$REPORT_DIR" "$BACKUP_DIR"
