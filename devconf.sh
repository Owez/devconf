# Installer for my dotfiles and general setup within a Manjaro i3 environment

# sort mirrors
sudo pacman --noconfirm -S reflector
reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

# update existing
pacman --noconfirm -Syu

# basic packages
packages=("python" "vim" "curl" "wget" "firefox" "transmission-gtk" "inkscape" "gimp" "discord" "audacity")
for package in ${packages[@]}; do
	sudo pacman --noconfirm -S $package
done

# aur packages
aurs=("spotify" "visual-studio-code-bin")
for aur in ${aurs[@]}; do
	sudo pamac build $aur
done

# install rust via rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install pulseaudio
install_pulse

# install vscode extensions
extensions=("adpyke.vscode-sql-formatter" "aeschli.vscode-css-formatter" "matklad.rust-analyzer" "ms-python.python" "ms-toolsai.jupyter" "PKief.material-icon-theme" "streetsidesoftware.code-spell-checker" "tomoki1207.pdf" "VisualStudioExptTeam.vscodeintellicode" "whizkydee.material-palenight-theme" "yzhang.markdown-all-in-one")
for extension in ${extensions[@]}; do
	code --install-extension $extension
done

# apply files
cd files/
cp 30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
cp i3config $HOME/.i3/config

# configure enviroment
mkdir school
mkdir documents
mkdir projects
cd projects/
mkdir c
mkdir html
mkdir python
mkdir rust
mkdir shell
mkdir other
cd ..

# wallpaper
wget https://cdn.osxdaily.com/wp-content/uploads/2018/06/macos-mojave-night-lightened-r.jpg -O sand-dunes.jpg
sudo mv sand-dunes.jpg /usr/share/backgrounds/
nitrogen /usr/share/backgrounds/sand-dunes.jpg

# ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
