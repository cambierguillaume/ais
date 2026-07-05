#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
install_package libpam-pwquality || true
backup_file /etc/security/pwquality.conf
cat > /etc/security/pwquality.conf <<'EOF'
minlen = 12
dcredit = -1
ucredit = -1
lcredit = -1
ocredit = -1
retry = 3
EOF
