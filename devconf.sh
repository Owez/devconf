#!/bin/bash

# Intro
echo "                         DEVCONF"
echo "A simple script to auto install my development enviroment"
echo "---------------------------------------------------------"

# Fix any bad apt packages
echo "Updating apt packages and fixing any mismanaged sources.."
sudo apt-get update -y --fix-missing > /dev/null 2>&1 

# Install packages
echo "Installing make.."
sudo apt-get install make -y > /dev/null 2>&1
echo "Installing build-essential.."
sudo apt-get install build-essential -y > /dev/null 2>&1
echo "Installing wget.."
sudo apt-get install wget -y > /dev/null 2>&1
echo "Installing curl.."
sudo apt-get install curl -y > /dev/null 2>&1
echo "Installing git.."
sudo apt-get install git -y > /dev/null 2>&1
echo "Installing fontconfig.."
sudo apt-get install fontconfig -y > /dev/null 2>&1
echo "Installing zsh.."
sudo apt-get install zsh -y > /dev/null 2>&1
echo "Installing neofetch.."
sudo apt-get install neofetch -y > /dev/null 2>&1
echo "Installing transmission-gtk.."
sudo apt-get install transmission-gtk -y > /dev/null 2>&1
echo "Installing vim.."
sudo apt-get install vim -y > /dev/null 2>&1
echo "Installing htop.."
sudo apt-get install htop -y > /dev/null 2>&1
echo "Installing zip.."
sudo apt-get install zip -y > /dev/null 2>&1
echo "Installing unzip.."
sudo apt-get install unzip -y > /dev/null 2>&1
echo "Installing python3.."
sudo apt-get install python3 -y > /dev/null 2>&1
echo "Installing python3-dev.."
sudo apt-get install python3-dev -y > /dev/null 2>&1
echo "Installing python3-pip.."
sudo apt-get install python3-pip -y > /dev/null 2>&1
echo "Installing pandoc.."
sudo apt-get install pandoc -y > /dev/null 2>&1
echo "Installing texlive-xetex.."
sudo apt-get install texlive-xetex -y > /dev/null 2>&1
echo "Installing cmake.."
sudo apt-get install cmake -y > /dev/null 2>&1
echo "Installing golang.."
sudo apt-get install golang -y > /dev/null 2>&1
echo "Installing node-js.."
sudo apt-get install node-js -y > /dev/null 2>&1
echo "Installing npm.."
sudo apt-get install npm -y > /dev/null 2>&1
echo "Installing default-jdk.."
sudo apt-get install default-jdk -y > /dev/null 2>&1
echo "Installing mono-complete.."
sudo apt-get install mono-complete -y > /dev/null 2>&1

# Add git username/passwords
git config --global user.name "Owez"
git config --global user.email "root@ogriffiths.com"

# Install `hack` font (https://sourcefoundry.org/hack/#download)
echo "Adding the 'hack' font.."
sudo rm -rf Hack-v3.003-ttf.zip
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip > /dev/null 2>&1
yes | unzip Hack-v3.003-ttf.zip > /dev/null 2>&1
mkdir -p $HOME/.local/share/fonts
yes | cp -rf ttf/*ttf $HOME/.local/share/fonts/ > /dev/null 2>&1
fc-cache -f -v > /dev/null 2>&1
sudo rm -rf ttf Hack-v3.003-ttf.zip

# Add background
pic_dir=$HOME/Pictures
if [ -d $pic_dir ]; then
    echo "Adding background.jpg to '$pic_dir'.."
    wget "https://media.idownloadblog.com/wp-content/uploads/2018/06/macOS-Mojave-Night-wallpaper.jpg" -P $pic_dir > /dev/null 2>&1
    yes | mv "$pic_dir/macOS-Mojave-Night-wallpaper.jpg" "$pic_dir/background.jpg"
else
    echo "Not adding background, '$pic_dir' does not exist!"
fi

# Install oh-my-zsh
echo "Installing oh-my-zsh.."
rm -rf $HOME/.oh-my-zsh/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended > /dev/null 2>&1

# Install powerlevel
echo "Installing powerlevel10k theme for zsh.."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k > /dev/null 2>&1

# Rust compiler (https://www.rust-lang.org/)
echo "Installing rust and cargo.."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y > /dev/null 2>&1

# Install jupyter notebook
echo "Installing jupyter notebook (jupyterlab).."
sudo pip3 install jupyterlab > /dev/null 2>&1

# Apply configs
echo "Applying .aliases.."
sudo cp configs/.aliases $HOME
echo "Applying .p10k.zsh.."
sudo cp configs/.p10k.zsh $HOME
echo "Applying .vimrc.."
sudo cp configs/.vimrc $HOME
echo "Applying .zshrc.."
sudo cp configs/.zshrc $HOME

# Set zsh as default shell
echo "Setting zsh as the default shell.."
sudo chsh -s $(which zsh)

# Success exit message
echo "Devconf finished successfully! You may want to try the extra scripts like 'pentesting.sh'"
