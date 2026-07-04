#!/bin/bash
set -e

echo "Test syntaxe Bash"
bash -n install.sh audit.sh rollback.sh lib/common.sh modules/*.sh

echo "Test présence fichiers"
test -f config.conf
test -f lib/common.sh
test -d modules

echo "OK"
