#!/usr/bin/env bats

setup() {
  PAK=$BATS_TEST_DIRNAME/../pak

  # Create fake sudo
  echo 'echo "fake $@"' > $BATS_TMPDIR/sudo
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
  skip
  # PATH=$BATS_TMPDIR:$PATH run $PAK install zsh
  #
  # [ "${lines[0]}" = "[pak] Attempting to install 'zsh' via 'brew'..." ]
  # [ "${lines[1]}" = "[brew]" ]
  # [ "${lines[2]}" = "fake install zsh" ]
}

@test "'pak install zsh vim' invokes 'sudo apt-get install -y zsh vim'" {
  skip
  # PATH=$BATS_TMPDIR:$PATH run $PAK install zsh vim
  #
  # [ "${lines[0]}" = "[pak] Attempting to install 'zsh vim' via 'brew'..." ]
  # [ "${lines[1]}" = "[brew]" ]
  # [ "${lines[2]}" = "fake install zsh vim" ]
}

# vi:syntax=sh
