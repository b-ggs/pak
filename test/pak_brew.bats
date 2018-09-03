#!/usr/bin/env bats

setup() {
  PAK=$BATS_TEST_DIRNAME/../pak

  # Create fake brew
  echo 'echo "fake $0 $@"' > $BATS_TMPDIR/brew
  chmod +x $BATS_TMPDIR/brew
}

teardown() {
  rm $BATS_TMPDIR/brew
}

@test "'pak' returns 'brew'" {
  run $PAK

  [ "$output" = "brew" ]
}

@test "'pak install' returns 'brew install'" {
  run $PAK install

  [ "$output" = "brew install" ]
}

@test "'pak install zsh' invokes 'brew install zsh'" {
  PATH=$BATS_TMPDIR:$PATH run $PAK install zsh

  [ "${lines[0]}" = "[pak] Attempting to install 'zsh' via 'brew'..." ]
  [ "${lines[1]}" = "[brew]" ]
  [ "${lines[2]}" = "fake $BATS_TMPDIR/brew install zsh" ]
}

@test "'pak install zsh vim' invokes 'brew install zsh vim'" {
  PATH=$BATS_TMPDIR:$PATH run $PAK install zsh vim

  [ "${lines[0]}" = "[pak] Attempting to install 'zsh vim' via 'brew'..." ]
  [ "${lines[1]}" = "[brew]" ]
  [ "${lines[2]}" = "fake $BATS_TMPDIR/brew install zsh vim" ]
}

# vi:syntax=sh
