#!/bin/bash
set -Eeuo pipefail
source "$(dirname "$0")/lib/common.sh"
require_root
check_ubuntu

info "Début installation hardening v$VERSION"
apt update

MODULES=(packages users ssh ufw fail2ban apparmor auditd aide clamav sysctl sudo pam journald logrotate chrony tmpfs fstab usb docker lynis openscap services report)

for module in "${MODULES[@]}"; do
  if [ -x "modules/${module}.sh" ]; then
    info "Module : $module"
    bash "modules/${module}.sh"
  else
    warn "Module absent ou non exécutable : $module"
  fi
done

info "Installation terminée"
