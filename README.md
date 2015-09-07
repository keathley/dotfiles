# dotfiles

I :heart: dotfiles.  You should as well.

## About

Dotfiles are what power your system. These are mine. They're mostly for OS X
since that's what I primary use. Everything is organized by topic which allows
each topic to load its own path variables, aliases, and so forth.

## Install

Running `./bootstrap.sh` will archive all of the your existing files to `~/old_dotiles` 
and symlink in the new ones. If you need to update your system then you can
simply run `./bootstrap.sh` again and it'll install your changes.

## Files

There are some specific files and extensions that the install script and initilization
will look for:

* `*.symlink` files will be symlinked into your home directory when the install script runs.
* `install.sh` will run when the the bootstrap script runs and can be used to install topic specific things.
* `*.zsh` files will be loaded into the shell when the shell loads.
* `_path.zsh` will be loaded first and include any path variables that you need.

# Attributions

The initial ideas for my repo come from [Holman's fantastic dotfiles repo](https://github.com/holman/dotfiles) and grew from there.  Check 'em out if you get a chance.
