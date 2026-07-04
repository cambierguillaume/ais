#!/bin/bash
source lib/common.sh
require_root
info "Module SSH"

install_package openssh-server
SSHD="/etc/ssh/sshd_config"
backup_file "$SSHD"

set_opt() {
  local key="$1"
  local value="$2"
  if grep -qE "^[# ]*$key\\b" "$SSHD"; then
    sed -i "s|^[# ]*$key.*|$key $value|" "$SSHD"
  else
    echo "$key $value" >> "$SSHD"
  fi
}

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
