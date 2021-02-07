echo """
 ██▓███   ██▀███   ▒█████   ▄▄▄▄   ▓█████  ██▀███  
▓██░  ██▒▓██ ▒ ██▒▒██▒  ██▒▓█████▄ ▓█   ▀ ▓██ ▒ ██▒
▓██░ ██▓▒▓██ ░▄█ ▒▒██░  ██▒▒██▒ ▄██▒███   ▓██ ░▄█ ▒
▒██▄█▓▒ ▒▒██▀▀█▄  ▒██   ██░▒██░█▀  ▒▓█  ▄ ▒██▀▀█▄  
▒██▒ ░  ░░██▓ ▒██▒░ ████▓▒░░▓█  ▀█▓░▒████▒░██▓ ▒██▒
▒▓▒░ ░  ░░ ▒▓ ░▒▓░░ ▒░▒░▒░ ░▒▓███▀▒░░ ▒░ ░░ ▒▓ ░▒▓░
░▒ ░       ░▒ ░ ▒░  ░ ▒ ▒░ ▒░▒   ░  ░ ░  ░  ░▒ ░ ▒░
░░         ░░   ░ ░ ░ ░ ▒   ░    ░    ░     ░░   ░ 
            ░         ░ ░   ░         ░  ░   ░     

    - Pentest journey by Vsevolod (Seva) Ivanov <seva@binarytrails.net>
    
        By default, gets only [light] & asks confirmation for rest. 
        Run & control with 'LIGHT=y AVERAGE=y HEAVY=y ./deps.sh'
""";

LIGHT="y";
#AVERAGE="";
#HEAVY="";

# docs
if [ "$LIGHT" != "y" ]; then
    read -p "Do you want to clone docs? [light] (y/n)? " LIGHT;
fi
if [ "$LIGHT" = "y" ]; then
    git clone https://github.com/binarytrails/notes.git docs/personal;
    git clone https://github.com/swisskyrepo/PayloadsAllTheThings docs/payloadsallthethings;
fi
if [ "$AVERAGE" != "y" ]; then
    read -p "Do you want to clone docs/hacktricks? [average] (y/n)? " AVERAGE;
fi
if [ "$AVERAGE" = "y" ]; then
    git clone https://github.com/carlospolop/hacktricks.git docs/hacktricks;
fi

# bin
if [ "$LIGHT" != "y" ]; then
    read -p "Do you want to clone bin? [light] (y/n)? " LIGHT;
fi
if [ "$LIGHT" = "y" ]; then
    git clone https://github.com/SecureAuthCorp/impacket.git bin/impacket;
    git clone https://github.com/binarytrails/yaptest.git bin/yaptest;
fi

# lists
if [ "$LIGHT" != "y" ]; then
    read -p "Do you want to clone lists? [light] (y/n)? " LIGHT;
fi
if [ "$LIGHT" = "y" ]; then
    git clone https://github.com/xajkep/wordlists lists/wordlists;
fi
if [ "$HEAVY" != "y" ]; then
    read -p "Do you want to clone seclists? [heavy] (y/n)? " HEAVY;
fi
if [ "$HEAVY" = "y" ]; then
    wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip \
      && unzip SecList.zip -d lists/seclists \
      && rm -f SecList.zip;
fi
