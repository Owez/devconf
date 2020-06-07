# devconf

Contains my common config files to make a nice looking dev machine

## Running

Ensure python3 is installed and run `devconf.py`. This is made for specifically ubuntu and it's derivatives (linux mint, kubuntu, xubuntu) but (should) work on debian.

## Configuring

Change `CONFIGS` and `PACKAGES` in devconf.py to what you want. If you want to run anything before the process automatically, put it in `run_before.sh` which is ran before the rest or `run_after.sh` which is ran after everything has completed.
