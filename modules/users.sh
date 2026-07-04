#!/bin/bash
source lib/common.sh
require_root
info "Module utilisateurs"

if id "$ADMIN_USER" >/dev/null 2>&1; then
  info "Utilisateur $ADMIN_USER existant"
else
  adduser --disabled-password --gecos "" "$ADMIN_USER"
  info "Utilisateur $ADMIN_USER créé"
fi

usermod -aG sudo "$ADMIN_USER"
awk -F: '$3==0 {print}' /etc/passwd > "$REPORT_DIR/users-uid0.txt"
visudo -c
