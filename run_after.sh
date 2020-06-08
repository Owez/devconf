# Anything in here will be ran after everything else has been completed (run_before.sh -> main devconf.py -> run_after.sh)

# # Install powerlevel theme
# rm -rf ~/.powerlevel10k
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k

# Change zsh to default shell
echo "Setting zsh as default shell"
chsh -s $(which zsh)
