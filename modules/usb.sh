#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
if [ "$ENABLE_USB_PROTECTION" = "true" ]; then
  echo "install usb-storage /bin/true" > /etc/modprobe.d/disable-usb-storage.conf
  warn "USB storage désactivé"
else
  info "Protection USB non activée"
fi
