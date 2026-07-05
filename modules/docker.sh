#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
if command -v docker >/dev/null 2>&1; then docker info > "$REPORT_DIR/docker-report.txt" 2>&1 || true; else warn "Docker absent"; fi
