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
    "What is your home folder called? (e.g. 'owen' of '/home/owen'): "
)


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


"""Packages to install with apt"""
PACKAGES = ["code make cmake build-essential", "python3-dev", "python3-pip"]

"""All config files stored in devconf"""
CONFIGS = (
    Config(
        Path("configs/home_dir/.p10k.zsh"), home_path / Path(".p10k.zsh")
    ),  # powerline theme for zsh
    Config(Path("configs/home_dir/.zshrc"), home_path / Path(".zshrc")),  # zsh config
    Config(
        Path("configs/vscode_conf/settings.json"),
        home_path / Path(".config/Code/User/settings.json"),
    ),  # vscode settings.json
)

print("Running shell script 'other.sh'..")

if subprocess.call("/bin/bash -e other.sh", shell=True, stdout=subprocess.PIPE) != 0:
    print("Failed to run contents of `other.sh`, exiting..", file=sys.stderr)
    sys.exit(1)

for packages in PACKAGES:
    fancysplit = "'" + "', '".join(packages.split(" ")) + "'"

    print(f"Installing apt package(s) {fancysplit}..")

    if (
        subprocess.call(
            f"apt-get install {packages} -y", shell=True, stdout=subprocess.PIPE
        )
        != 0
    ):
        print(
            f"Error installing apt package(s) {fancysplit}, exiting..", file=sys.stderr
        )
        sys.exit(1)

for config in CONFIGS:
    config.install()

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
