# Anything in here will run after apt packages are installed but before config files are applied. (run_before.sh -> apt packages -> run_mid.sh -> config files -> run_after.sh)
# Should be used for non-apt package installs that require prior apt dependancies

# Install oh-my-zsh
echo "Installing oh-my-zsh.."
rm -rf /root/.oh-my-zsh
rm -rf /home/$USER/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended > /dev/null 2>&1

# Install powerlevel
echo "Installing powerlevel10k theme for zsh.."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k > /dev/null 2>&1

# Rust compiler (https://www.rust-lang.org/)
echo "Installing rust and cargo.."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y > /dev/null 2>&1

# Install jupyter notebook
echo "Installing jupyter notebook (jupyterlab).."
pip3 install jupyterlab > /dev/null 2>&1
