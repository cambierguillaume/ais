#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
ls -lh "$BACKUP_DIR"
