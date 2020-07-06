"""Installs apt packages described in [PACKAGES] and all config files from [CONFIGS]"""

import os
import sys
import subprocess
from pathlib import Path

if os.geteuid() != 0:
    print(
        "Please run as root as this script installs apt packages! Exiting..",
        file=sys.stderr,
    )
    sys.exit(1)
elif sys.platform != "linux":
    print(
        "This script only works on debian-based computers! (Specifically ubuntu and it's derivatives), exiting..",
        file=sys.stderr,
    )
    sys.exit(1)

home_path = Path("/home/") / input(
    "Home dir to install to (e.g. 'owen' of '/home/owen'): "
)

if not home_path.exists():
    print(
        f"Given home directory '{home_path}' does not exist; this shouldn't happen! Exiting..",
        file=sys.stderr,
    )
    sys.exit(1)


class Config:
    """Represents a config file stored locally in devconf"""

    def __init__(self, file_path: Path, install_location: Path):
        """The path of it inside of devconf and the ideal install location for it"""

        if not file_path.exists():
            print(
                f"Given file path '{file_path}' does not exist, please enter a valid file in [CONFIGS]. Exiting..",
                file=sys.stderr,
            )
            sys.exit(1)

        self.file_path = file_path

        with open(self.file_path, "r") as file:
            self.file_contents = file.read()

        self.install_location = install_location

    def __repr__(self):
        return f"('{self.file_path}' -> '{self.install_location}')"

    def install(self):
        """Installs to given [Config.install_location]"""

        parent_path = self.install_location.parent

        print(f"Installing config '{self.file_path.name}' to '{parent_path}/'..")

        if not parent_path.exists():
            if parent_path == Path("~"):
                print(
                    "Home (~) directory doesn't exist, please ensure you have a working home directory and alias",
                    file=sys.stderr,
                )
                sys.exit(1)

            try:
                os.makedirs(parent_path)
            except:
                print(
                    f"Cannot make directories: '{parent_path}', exiting..",
                    file=sys.stderr,
                )
                sys.exit(1)

        try:
            with open(self.install_location, "w+") as file:
                file.write(self.file_contents)
        except:
            print(
                f"Could not write to '{self.install_location}', exiting..",
                file=sys.stderr,
            )
            sys.exit(1)


def run_script(script_path: Path):
    """Runs a given shell script and exits with error if return code 1"""

    print(f"Running shell script '{script_path.name}'..")

    if subprocess.call(f"/bin/bash -e {script_path}", shell=True) != 0:
        print(
            f"Failed to run contents of `{script_path.name}`, exiting..",
            file=sys.stderr,
        )
        sys.exit(1)


"""Packages to install with apt"""
PACKAGES = [
    "vscodium vim make build-essential curl wget fontconfig",
    "zsh neofetch zip unzip",
    "python3-dev",
    "python3-pip",
]

"""All config files stored in devconf"""
CONFIGS = (
    Config(
        Path("configs/home_dir/.p10k.zsh"), home_path / Path(".p10k.zsh")
    ),  # powerline theme for zsh
    Config(Path("configs/home_dir/.zshrc"), home_path / Path(".zshrc")),  # zsh config
    Config(Path("configs/home_dir/.vimrc"), home_path / Path(".vimrc")),  # vim config
    Config(
        Path("configs/home_dir/.aliases"), home_path / Path(".aliases")
    ),  # vim config
    Config(
        Path("configs/vscode_conf/settings.json"),
        home_path / Path(".config/Code/User/settings.json"),
    ),  # vscode settings.json
)

"""Script to run before doing anything"""
BEFORE_SCRIPT = Path("run_before.sh")

"""Script to run once apt packages are installed but before configs are"""
MID_SCRIPT = Path("run_mid.sh")

"""Script to run once finished installing"""
AFTER_SCRIPT = Path("run_after.sh")

run_script(Path(BEFORE_SCRIPT))  # run BEFORE_SCRIPT

for packages in PACKAGES:
    fancysplit = "'" + "', '".join(packages.split(" ")) + "'"

    print(f"Installing apt package(s) {fancysplit}..")

    if (
        subprocess.call(
            f"apt-get install {packages} -y > /dev/null 2>&1",
            shell=True,
            stdout=subprocess.PIPE,
        )
        != 0
    ):
        print(
            f"Error installing apt package(s) {fancysplit}, exiting..", file=sys.stderr
        )
        sys.exit(1)

run_script(Path(MID_SCRIPT))  # run MID_SCRIPT

for config in CONFIGS:
    config.install()

run_script(Path(AFTER_SCRIPT))  # run AFTER_SCRIPT

while True:
    should_reboot = input("Reboot? [Y/n]: ").lower()

    if not should_reboot or should_reboot == "y":
        try:
            os.system("reboot")
            break
        except:
            print(
                "Could not `reboot`! Please restart this computer yourself. Exiting..",
                file=sys.stderr,
            )
            sys.exit(1)
    elif should_reboot == "n":
        print("Exiting..")
        break
    else:
        print("Please type a valid option!", file=sys.stderr)
