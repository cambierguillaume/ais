#!/bin/bash
source lib/common.sh
require_root
info "Module UFW"

install_package ufw
backup_file /etc/ufw/user.rules
backup_file /etc/ufw/user6.rules

ufw --force reset
ufw default deny incoming
ufw default allow outgoing
ufw allow "${SSH_PORT}/tcp" comment "SSH"
ufw allow 80/tcp comment "HTTP"
ufw allow 443/tcp comment "HTTPS"
ufw logging on
ufw --force enable

ufw status verbose > "$REPORT_DIR/ufw-report.txt"
