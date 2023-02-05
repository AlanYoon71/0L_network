#!/bin/bash
clear
echo ""
echo "=============================="
echo ""
echo "Script by  //-\ ][_ //-\ ][\[ ";
echo ""
echo "=============================="
echo ""
echo -e "\e[1m\e[32m0. Wiping user \"node\" and files for preventing confliction. \e[0m"
echo "===================="
echo ""
#sudo pgrep -f node | sudo xargs kill &> /dev/null ; sleep 1 ; sudo pgrep -f node | sudo xargs kill &> /dev/null ;
sleep 1
sudo sysadminctl interactive -deleteUser node -secure &> /dev/null ; sudo rm -rf /Users/node &> /dev/null ; sudo rm $HOME/0L_Fullnode_installation &> /dev/null ;
sleep 1
echo "Wiped all."
echo ""
echo ""
sleep 2
echo -e "\e[1m\e[32m1. Installing dependencies.. \e[0m"
echo "===================="
echo ""
sleep 2
brew install --cask clay &&
brew install git vim zip unzip bc jq cmake llvm libgmp secure-delete pkg-config libssl-dev lld tmux
echo ""
echo -e "\e[1m\e[32m2. Installing required linux packages.. \e[0m"
echo "===================="
echo ""
sleep 2
sudo curl -sL https://raw.githubusercontent.com/OLSF/libra/main/ol/util/setup.sh | bash
echo ""
echo "All required linux packages installed."
echo ""
echo ""
echo -e "\e[1m\e[32m3. Compiling 0l binary files.. \e[0m"
echo "===================="
echo ""
echo "This script includes genesis mining and tower, so it takes 1 hour more entirely until all processes completed, so be patient, please."
echo ""
#sudo useradd node -m -s /bin/bash
sudo sysadminctl interactive -addUser node -password sojung12 -home /Users/node -shell /bin/bash
sudo \cp -f ./0l_tmux.sh /Users/node &> /dev/null ;
sudo chmod +x /Users/node/0l_tmux.sh
sudo chmod go+rw /Users/node/0l_tmux.sh
sudo -u node /Users/node/0l_tmux.sh &&
CUR_DATE=`date +%Y%m%d` &&
sudo mkdir -p /Users/node/0l_config_backup/"$CUR_DATE" &> /dev/null ;
sudo \cp -f /Users/node/.0L/0L.toml $HOME/0l_config_backup/$CUR_DATE &> /dev/null ;
sudo \cp -f /Users/node/.0L/account.json $HOME/0l_config_backup/$CUR_DATE &> /dev/null ;
sudo \cp -f /Users/node/.0L/key_store.json $HOME/0l_config_backup/$CUR_DATE &> /dev/null ;
sudo \cp -f /Users/node/.0L/vdf_proofs/proof_0.json $HOME/0l_config_backup/$CUR_DATE &> /dev/null ;
sleep 1
echo ""
sudo rm /Users/node/bin/keygen.txt &> /dev/null ; sudo rm /Users/node/bin/waylength.txt &> /dev/null ; sudo rm /Users/node/bin/waypoint.txt &> /dev/null ; sudo rm /Users/node/bin/WAYPOINT.txt &> /dev/null ; sudo rm /Users/node/bin/update_check.txt &> /dev/null ;
sleep 2
echo -e "Your config files were saved into [\e[1m\e[32m $HOME/0l_config_backup/$CUR_DATE \e[0m] directory. There's no mnemonic info."
echo ""
echo ""
cd $HOME &&
sudo rm -r 0L_Fullnode_installation &> /dev/null ;
echo "Done!"
echo ""
echo ""