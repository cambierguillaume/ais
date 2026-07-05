#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
backup_file /etc/sudoers
install -m 0440 /dev/null /etc/sudoers.d/99-hardening
cat > /etc/sudoers.d/99-hardening <<'EOF'
Defaults        use_pty
Defaults        logfile="/var/log/sudo.log"
Defaults        timestamp_timeout=15
EOF
chmod 0440 /etc/sudoers.d/99-hardening
visudo -c
