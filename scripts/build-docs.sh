#!/bin/bash
set -e
mkdir -p pdf
if command -v pandoc >/dev/null 2>&1; then
  pandoc docs/*.md --toc --number-sections -o pdf/Rapport-Ubuntu-Hardening-AIS-v4.pdf
else
  echo "Installer pandoc pour générer les PDF."
fi
