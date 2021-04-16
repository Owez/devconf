# autoinstaller

# basic packages
packages=("python3" "vim" "curl" "firefox" "visual-studio-code-bin" "transmission-gtk" "spotify" "inkscape" "gimp" "discord" "audacity")
for package in ${packages[@]}; do
	sudo pacman --noconfirm -S $package
done

# install vscode extensions
extensions=("adpyke.vscode-sql-formatter" "aeschli.vscode-css-formatter" "matklad.rust-analyzer" "ms-python.python" "ms-toolsai.jupyter" "PKief.material-icon-theme" "streetsidesoftware.code-spell-checker" "tomoki1207.pdf" "VisualStudioExptTeam.vscodeintellicode" "whizkydee.material-palenight-theme" "yzhang.markdown-all-in-one")
for extension in ${extensions[@]}; do
	code --install-extension $extension
done

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

# ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
