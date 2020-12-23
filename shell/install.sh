sudo apt-get install zsh -y

rm -rf $HOME/.oh-my-zsh/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

sudo cp .aliases $HOME/.aliases
sudo cp .zshrc $HOME/.zshrc
sudo cp .p10k.zsh $HOME/.p10k.zsh

sudo chsh -s $(which zsh)
