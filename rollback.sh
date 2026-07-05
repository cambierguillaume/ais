#!/bin/bash
set -Eeuo pipefail
source "$(dirname "$0")/lib/common.sh"
require_root
warn "Rollback semi-automatique. Sauvegardes disponibles :"
ls -lh "$BACKUP_DIR" || true
cat <<'EOF'
Exemples :
sudo cp backup/_etc_ssh_sshd_config.*.bak /etc/ssh/sshd_config
sudo systemctl restart ssh
EOF
