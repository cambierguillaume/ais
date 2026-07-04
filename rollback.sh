#!/bin/bash
set -Eeuo pipefail

source lib/common.sh
require_root

warn "Rollback semi-automatique : liste des sauvegardes disponibles"
ls -lh "$BACKUP_DIR" || true

cat <<EOF

Exemples :
sudo cp backup/_etc_ssh_sshd_config.*.bak /etc/ssh/sshd_config
sudo systemctl restart ssh

sudo cp backup/_etc_ufw_user.rules.*.bak /etc/ufw/user.rules
sudo ufw reload
EOF
