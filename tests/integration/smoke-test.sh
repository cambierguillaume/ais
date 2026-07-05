#!/bin/bash
set -e
bash -n install.sh audit.sh rollback.sh report.sh lib/*.sh modules/*.sh
echo "Smoke test OK"
