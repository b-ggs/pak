# pak ![0.0.1](https://img.shields.io/badge/version-0.0.1-green.svg) ![Travis CI](https://api.travis-ci.org/b-ggs/pak.svg?branch=master)

a package manager detector and adapter

<img src="https://i.imgur.com/UV9j0Zo.png" height="250px"> <img src="https://i.imgur.com/Tk5SAcL.png" height="250px">

# Why?

I wanted my [dotfiles][dotfiles] to have an install script that supported all the platforms I actively use (brew via macOS, APT on Ubuntu, Debian, and [Termux][termux] on Android).

So... literally because I'm lazy.

And I wanted a DRY(-er?) install script I guess.


# Supported Package Managers

* Homebrew (and Linuxbrew)
* APT (Debian and Debian-like distros)
* Sudo-less APT (Termux)

I'm also planning to include CentOS and [btw I use] Arch in future releases.

In the mean time, [tell me what _you_ want][issues]!

# Install

```
curl -o pak https://raw.githubusercontent.com/b-ggs/pak/master/pak ; chmod +x pak
```

# Usage

* Print the current system's package manager

```
# macOS via Homebrew
$ pak brew
brew

# Ubuntu
$ pak
apt-get
```

* Print the install command for the system's package manager

```
# macOS via Homebrew
$ pak install
brew install

# Ubuntu
$ pak install
sudo apt-get install -y
```

* Install packages with the system's package manager

```
# macOS via Homebrew
$ pak install vim
[pak] Attempting to install 'vim' via 'brew'...
[brew]
===> Installing 1 package
...
🍺 /usr/local/Cellar/vim/8.1.0300

# Ubuntu
$ pak install zsh
[pak] Attempting to install 'zsh' via 'apt-get'...
[apt-get]
Reading package lists... Done
...
Unpacking zsh (5.4.2-3ubuntu3) ...
Setting up zsh (5.4.2-3ubuntu3) ...
Processing triggers for man-db (2.8.3-2) ...
```

* Get help!

```
$ pak --help
pak 0.0.1

a package manager detector and adapter

https://github.com/b-ggs/pak

- Print the current system's package manager
...
```

# Limitations

This does not take into account differences in package names across the different package managers it supports. (e.g. `silversearcher-ag` on APT and `the_silver_searcher` on brew)

[dotfiles]: https://github.com/b-ggs/dotfiles
[termux]: https://termux.com/
[issues]: https://github.com/b-ggs/pak/issues
