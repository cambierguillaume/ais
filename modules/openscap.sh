#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
if [ "$ENABLE_OPENSCAP" = "true" ]; then install_package openscap-scanner; oscap --version > "$REPORT_DIR/openscap-version.txt"; else info "OpenSCAP désactivé"; fi
