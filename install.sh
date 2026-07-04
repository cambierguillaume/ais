#!/bin/bash
set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

source lib/common.sh
require_root

info "Début hardening Ubuntu AIS v$VERSION"

apt update

for module in users ssh ufw fail2ban apparmor auditd aide clamav sysctl services report; do
  info "Exécution module : $module"
  bash "modules/$module.sh"
done

info "Fin du hardening"
