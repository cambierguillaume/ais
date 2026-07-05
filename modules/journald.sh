#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
backup_file /etc/systemd/journald.conf
mkdir -p /etc/systemd/journald.conf.d
cat > /etc/systemd/journald.conf.d/99-hardening.conf <<'EOF'
[Journal]
Storage=persistent
Compress=yes
SystemMaxUse=1G
MaxRetentionSec=1month
EOF
systemctl restart systemd-journald
