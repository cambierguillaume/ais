#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
tar czf "$BACKUP_DIR/etc-$(date '+%F-%H%M%S').tar.gz" /etc 2>/dev/null || true
