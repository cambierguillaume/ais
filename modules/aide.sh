#!/bin/bash
source lib/common.sh
require_root
info "Module AIDE"

install_package aide
install_package aide-common || true

mkdir -p /etc/aide /var/lib/aide

if [ ! -f /etc/aide/aide.conf ]; then
cat > /etc/aide/aide.conf <<'EOF'
database=file:/var/lib/aide/aide.db
database_out=file:/var/lib/aide/aide.db.new
gzip_dbout=no
report_url=file:/var/log/aide.log
ALLXTRAHASHES = sha512
NORMAL = p+i+n+u+g+s+m+c+sha512
/ NORMAL
EOF
fi

if [ ! -f /var/lib/aide/aide.db ]; then
  aide --config=/etc/aide/aide.conf --init || true
  [ -f /var/lib/aide/aide.db.new ] && mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db
fi

aide --config=/etc/aide/aide.conf --check > "$REPORT_DIR/aide-report.txt" 2>&1 || true
