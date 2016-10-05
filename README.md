# Chris Keathley's Dotfiles

I :heart: dotfiles.

## About

Dotfiles are what power your system. These are mine. They're mostly for OS X
since that's what I use. My default shell these days is fish so everything is
designed to work around fish functions and completions. All of the dotfile
management is done with [rcm](https://github.com/thoughtbot/rcm) and packages
are managed with homebrew.

## Whats in it?

All of the things that I use on a daily basis. Most of it is based on the
highly opinionated way that I work. Most of the fun stuff is in [bin](https://github.com/keathley/dotfiles/tree/master/bin) and [config/fish/functions](https://github.com/keathley/dotfiles/tree/master/config/fish/functions).

Other highlights include:

* Defaults for vim, tmux, git, and fish shell.
* Version management for ruby, node, elixir, and elm (via. asdf)
* Lots of aliases for common commands.

## Install

Running `./bootstrap.sh` will install all dependencies and create symlinks to
all of the dotfiles. If you want to set up your mac with the same defaults that
I do you can also run `./set-defaults.sh`. If you need to add new dotfiles or
symlinks in the future then you can simply run `rcup` in the dotfiles dir.

## Thanks

I originally created my dotfiles based on [Zach Holman's](https://github.com/holman/dotfiles) fantastic dotfile repo. Since then things have changed a lot but I owe the original inspiration to him. I've pulled in scripts from other folks such as [Gary Bernhardt](https://github.com/garybernhardt/dotfiles) and [Paul Irish](https://github.com/paulirish/dotfiles).

