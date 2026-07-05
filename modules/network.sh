#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
ip addr > "$REPORT_DIR/network-ip.txt"
ss -tulpen > "$REPORT_DIR/network-ports.txt" || true
