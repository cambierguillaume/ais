#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
install_package logrotate
cat > /etc/logrotate.d/hardening-logs <<'EOF'
/var/log/hardening.log /var/log/sudo.log {
  weekly
  rotate 8
  compress
  missingok
  notifempty
}
EOF
