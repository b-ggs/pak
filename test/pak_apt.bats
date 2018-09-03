#!/usr/bin/env bats

setup() {
  PAK=$BATS_TEST_DIRNAME/../pak

  # Create fake sudo
  echo 'echo "fake $0 $@"' > $BATS_TMPDIR/sudo
  chmod +x $BATS_TMPDIR/sudo
}

teardown() {
  rm $BATS_TMPDIR/sudo
}

@test "'pak' returns 'apt-get'" {
  run $PAK

  [ "$output" = "apt-get" ]
}

@test "'pak install' returns 'sudo apt-get install -y'" {
  run $PAK install

  [ "$output" = "sudo apt-get install -y" ]
}

@test "'pak install zsh' invokes 'sudo apt-get install -y zsh'" {
  PATH=$BATS_TMPDIR:$PATH run $PAK install zsh

  [ "${lines[0]}" = "[pak] Attempting to install 'zsh' via 'apt-get'..." ]
  [ "${lines[1]}" = "[apt-get]" ]
  [ "${lines[2]}" = "fake $BATS_TMPDIR/sudo apt-get install -y zsh" ]
}

@test "'pak install zsh vim' invokes 'sudo apt-get install -y zsh vim'" {
  PATH=$BATS_TMPDIR:$PATH run $PAK install zsh vim

  [ "${lines[0]}" = "[pak] Attempting to install 'zsh vim' via 'apt-get'..." ]
  [ "${lines[1]}" = "[apt-get]" ]
  [ "${lines[2]}" = "fake $BATS_TMPDIR/sudo apt-get install -y zsh vim" ]
}

# vi:syntax=sh
