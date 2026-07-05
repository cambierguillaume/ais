#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
if id "$ADMIN_USER" >/dev/null 2>&1; then info "$ADMIN_USER existe"; else adduser --disabled-password --gecos "" "$ADMIN_USER"; fi
usermod -aG sudo "$ADMIN_USER"
awk -F: '$3==0 {print}' /etc/passwd > "$REPORT_DIR/users-uid0.txt"
