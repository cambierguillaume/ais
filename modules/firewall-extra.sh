#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
ufw status numbered > "$REPORT_DIR/firewall-extra.txt" || true
