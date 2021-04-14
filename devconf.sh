# autoinstaller

# basic packages
packages=("python3" "vim" "curl" "firefox" "visual-studio-code-bin" "transmission-gtk" "spotify" "inkscape" "gimp" "discord")
for package in ${packages[@]}; do
	sudo pacman --noconfirm -S $package
done

# ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# configure enviroment
mkdir school
cd school/
mkdir documents
mkdir code
cd code/
mkdir c
mkdir html
mkdir python
mkdir rust
mkdir shell
mkdir other
