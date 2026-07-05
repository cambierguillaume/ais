#!/bin/bash
source "$(dirname "${BASH_SOURCE[0]}")/../config.conf"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/hardening.log"

log() {
  local level="$1"
  local msg="$2"
  echo "[$(date '+%F %T')] [$level] $msg" | tee -a "$LOG_FILE"
}
info(){ log INFO "$1"; }
warn(){ log WARN "$1"; }
error(){ log ERROR "$1"; }
