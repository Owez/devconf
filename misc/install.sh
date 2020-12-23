LINES=$(cat 'packages.txt')
for LINE in $LINES
do
    sudo apt-get install $LINE -y
done
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
pip3 install Pygments
git config --global user.name "Owez"
git config --global user.email "root@ogriffiths.com"
