# Anything in here will be ran before everything else (run_before.sh -> apt packages -> run_mid.sh -> config files -> run_after.sh)
# Should be used for non-apt dependancies

# Install `hack` font (https://sourcefoundry.org/hack/#download)
echo "Installing hack font.."
sudo rm -rf Hack-v3.003-ttf.zip
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip > /dev/null 2>&1
yes | unzip Hack-v3.003-ttf.zip > /dev/null 2>&1
mkdir -p ~/.local/share/fonts
yes | cp -rf ttf/*ttf ~/.local/share/fonts/ > /dev/null 2>&1
fc-cache -f -v > /dev/null 2>&1
sudo rm -rf ttf Hack-v3.003-ttf.zip

# Install vscodium's requirements
echo "Adding VSCodium requirements.."
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add - > /dev/null 2>&1
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list > /dev/null 2>&1

# Add ppa repository
echo "Updating apt packages and fixing any mismanaged sources.."
sudo apt update -y --fix-missing > /dev/null 2>&1 
