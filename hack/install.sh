cwd=$PWD

sudo apt-get install iw -y 
sudo apt-get install xterm -y 
sudo apt-get install aircrack-ng -y 
sudo apt-get install nmap -y

hackdir="$HOME/Hack"

if [ ! -d $hackdir ]
then
    mkdir $hackdir
fi

cd $hackdir

if [ ! -d "$hackdir/airgeddon" ]
then
    git clone --depth 1 https://github.com/v1s1t0r1sh3r3/airgeddon.git 
fi

if [ ! -d "$hackdir/dirsearch" ]
then
    git clone https://github.com/maurosoria/dirsearch.git
fi

if [ ! -d "$hackdir/SecList" ]
then
    wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip
    unzip SecList.zip -o
    rm -f SecList.zip
fi

cd $cwd
