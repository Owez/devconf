# devconf

Contains my common config files to make a nice looking dev machine

## What it installs

It is made for an ubuntu/ubuntu-derived enviroment (like xubuntu) and has been tested on `ubuntu`, `kubuntu` and `linux mint`. The following apt packages are installed when ran:

- [VSCodium](https://vscodium.com/)
- [vim](https://en.wikipedia.org/wiki/Vim_(text_editor))
- [make](https://en.wikipedia.org/wiki/Make_(software))
- [build-essential](https://packages.debian.org/bullseye/build-essential)
- [curl](https://en.wikipedia.org/wiki/CURL)
- [fontconfig](https://en.wikipedia.org/wiki/Fontconfig)
- [zsh](https://en.wikipedia.org/wiki/Z_shell)
- [neofetch](https://github.com/dylanaraps/neofetch)
- [zip](https://packages.debian.org/bullseye/zip)
- [unzip](https://packages.debian.org/buster/unzip)
- [python3](https://en.wikipedia.org/wiki/Python_(programming_language))
- [python3-dev](https://packages.debian.org/bullseye/python3-dev)

And the following non-apt items are also installed:

- [`hack` font](https://sourcefoundry.org/hack/)
- [powerlevel10k zsh theme](https://github.com/romkatv/powerlevel10k)
- [oh-my-zsh (`zsh` plugin manager)](https://ohmyz.sh/)
- [Rust + Cargo (via `rustup`)](https://en.wikipedia.org/wiki/Rust_(programming_language))
- [Jupyter notebook + `nb` zsh alias](https://jupyter.org/)

## Running

Ensure python3 is installed and run `devconf.py`. This is made for specifically ubuntu and it's derivatives (linux mint, kubuntu, xubuntu) but (should) work on debian.

## Configuring/Customising for yourself

Change `CONFIGS` and `PACKAGES` in devconf.py to what you want. If you want to run anything before the process automatically, put it in `run_before.sh` which is ran before the rest, `run_mid.sh` which is ran after apt packages are installed but before configs are applied and finally `run_after.sh`, which is ran after everything has completed.
