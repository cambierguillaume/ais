#!/bin/bash
install_package() {
  local pkg="$1"
  if dpkg -s "$pkg" >/dev/null 2>&1; then
    info "$pkg déjà installé"
  else
    info "Installation : $pkg"
    DEBIAN_FRONTEND=noninteractive apt install -y "$pkg"
  fi
}
