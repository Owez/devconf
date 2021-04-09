"""Hacky devconf auto-install script for personal use, expect poor design!"""

import os
import sys
import subprocess
from pathlib import Path

PACKAGES_PATH = Path("packages.txt")


def err_exit(info: str = None):
    print(f"\n## Fatal error\n\nError whilst installing the devconf:\n\n```none\n{info}\n```", file=sys.stderr)
    sys.exit(1)


def install_package(name: str):
    cmd = f"pacman -I '{name}'"

    try:
        return subprocess.check_output(cmd)
    except Exception as e:
        err_exit(f"Exception infomation:\n\n{e}\n\nInputted command:\n\n{cmd}")


def get_packages() -> list:
    if not PACKAGES_PATH.is_file():
        err_exit(f"No {PACKAGES_PATH} file found which lists packages")

    try:
        with open(PACKAGES_PATH, "r") as file:
            return list(set(filter(None, file.readlines()[1:])))
    except:
        err_exit(f"Could not parse {PACKAGES_PATH} file which lists packages")


def install_packages():
    print("\n## Package installation\n")
    packages = get_packages()

    if len(packages) == 0:
        print(f"No packages found in {PACKAGES_PATH} to install, skipping this step.")
    else:
        print(f"Installing {len(packages)} package(s):\n")
        for package in packages:
            print(f"- `{package}`")
            install_package(package)

if __name__ == "__main__":
    print("# devconf autoinstaller\n\nAn autoinstaller for my development environment, uses experimental markdown output for logging/status")
    install_packages()
