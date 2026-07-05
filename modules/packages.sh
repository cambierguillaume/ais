#!/bin/bash
source "$(dirname "$0")/../lib/common.sh"
require_root
for p in curl wget rsync tar unzip ca-certificates gnupg lsb-release; do install_package "$p"; done
