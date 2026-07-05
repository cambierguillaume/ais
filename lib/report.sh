#!/bin/bash
append_report() {
  local file="$1"
  local title="$2"
  shift 2
  {
    echo
    echo "## $title"
    echo '```'
    "$@" 2>&1 || true
    echo '```'
  } >> "$file"
}
