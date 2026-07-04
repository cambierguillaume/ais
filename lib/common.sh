#!/bin/bash

set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$ROOT_DIR/config.conf"

mkdir -p "$LOG_DIR" "$REPORT_DIR" "$BACKUP_DIR"

LOG_FILE="$LOG_DIR/hardening.log"

log() {
  local level="$1"
  local msg="$2"
  echo "[$(date '+%F %T')] [$level] $msg" | tee -a "$LOG_FILE"
}

info() { log INFO "$1"; }
warn() { log WARN "$1"; }
err() { log ERROR "$1"; }

require_root() {
  if [ "$(id -u)" -ne 0 ]; then
    err "Ce script doit être exécuté avec sudo."
    exit 1
  fi
}

backup_file() {
  local file="$1"
  if [ -e "$file" ]; then
    local safe
    safe="$(echo "$file" | sed 's#/#_#g')"
    cp -a "$file" "$BACKUP_DIR/${safe}.$(date '+%F-%H%M%S').bak"
    info "Sauvegarde : $file"
  else
    warn "Fichier absent, sauvegarde ignorée : $file"
  fi
}

install_package() {
  local pkg="$1"
  if dpkg -s "$pkg" >/dev/null 2>&1; then
    info "$pkg déjà installé"
  else
    info "Installation du paquet : $pkg"
    DEBIAN_FRONTEND=noninteractive apt install -y "$pkg"
  fi
}

service_state() {
  local service="$1"
  if systemctl status "$service" >/dev/null 2>&1; then
    if systemctl is-active --quiet "$service"; then
      echo "$service : ACTIF"
    else
      echo "$service : INACTIF"
    fi
  else
    echo "$service : NON TROUVÉ"
  fi
}
