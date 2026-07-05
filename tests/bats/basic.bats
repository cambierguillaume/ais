#!/usr/bin/env bats

@test "config exists" {
  [ -f config.conf ]
}

@test "install script exists" {
  [ -f install.sh ]
}
