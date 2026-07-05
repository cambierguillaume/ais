#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
install_package openssh-server
SSHD=/etc/ssh/sshd_config
backup_file "$SSHD"
set_opt(){ grep -qE "^[# ]*$1\\b" "$SSHD" && sed -i "s|^[# ]*$1.*|$1 $2|" "$SSHD" || echo "$1 $2" >> "$SSHD"; }
set_opt Port "$SSH_PORT"
set_opt PermitRootLogin no
set_opt PermitEmptyPasswords no
set_opt MaxAuthTries 3
set_opt X11Forwarding no
set_opt PubkeyAuthentication yes
set_opt PasswordAuthentication yes
sshd -t
systemctl enable ssh
systemctl restart ssh
sshd -T | grep -E "permitrootlogin|passwordauthentication|maxauthtries|x11forwarding|port" > "$REPORT_DIR/ssh-report.txt" || true
