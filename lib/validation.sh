#!/bin/bash
require_root() {
  if [ "$(id -u)" -ne 0 ]; then
    echo "Erreur : exécuter avec sudo."
    exit 1
  fi
}

require_command() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Commande manquante : $1"
    exit 1
  }
}

check_ubuntu() {
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    case "${ID:-}" in
      ubuntu|debian) return 0 ;;
      *) echo "Distribution non officiellement supportée : ${ID:-unknown}" ;;
    esac
  fi
}
