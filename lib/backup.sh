#!/bin/bash
backup_file() {
  local file="$1"
  mkdir -p "$BACKUP_DIR"
  if [ -e "$file" ]; then
    local safe
    safe="$(echo "$file" | sed 's#/#_#g')"
    cp -a "$file" "$BACKUP_DIR/${safe}.$(date '+%F-%H%M%S').bak"
    info "Sauvegarde : $file"
  else
    warn "Sauvegarde ignorée, fichier absent : $file"
  fi
}
