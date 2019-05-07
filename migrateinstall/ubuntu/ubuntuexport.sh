#!/bin/bash
# Update source install first
sudo apt update -y && sudo apt full-upgrade -y && sudo apt autoremove -y

# update Linux repo with latest files
cd ~/GitHub/Linux
sudo git pull origin master

# Export dpkg files and repos
dpkg --get-selections > ~/Package.list #creates ~/Package.list
sudo cp -nRf /etc/apt/sources.list* ~/ #creates ~/sources.list files
sudo apt-key exportall > ~/Repo.keys #creates ~/Repo.keys

# Export python modules
sudo -H pip2 install --upgrade pip
sudo -H pip3 install --upgrade pip
pip2 freeze > ~/pip2freeze.txt
pip3 freeze > ~/pip3freeze.txt

# Export npm modules
sudo npm update -g npm
ls `npm root -g` > ~/npmmodules.txt

# Push to GitHub
cp -nRf ~/Package.list ./files
cp -nRf ~/Repo.keys ./files
cp -nRf ~/sources.list* ./files
cp -nRf ~/pip2freeze.txt ./files
cp -nRf ~/pip3freeze.txt ./files
cp -nRf ~/npmmodules.txt ./files
git commit -am "Update ubuntu export files"
git push #login to github

# Copy all files created from the above to new install into ~/files
# Also copy across any dot files you may want