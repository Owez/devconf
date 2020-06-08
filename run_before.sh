# Anything in here will be ran before everything else (run_before.sh -> main devconf.py -> run_after.sh)

# Install `hack` font (https://sourcefoundry.org/hack/#download)
echo "Installing hack font.."
rm -rf Hack-v3.003-ttf.zip
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip > /dev/null 2>&1
yes | unzip Hack-v3.003-ttf.zip > /dev/null 2>&1
mkdir -p ~/.local/share/fonts
yes | cp -rf ttf/*ttf ~/.local/share/fonts/  > /dev/null 2>&1
fc-cache -f -v > /dev/null 2>&1
rm -rf ttf Hack-v3.003-ttf.zip

# Rust compiler (https://www.rust-lang.org/)
echo "Installing rust and cargo.."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y > /dev/null 2>&1
