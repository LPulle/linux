#!/bin/bash
# Update source install first
sudo yum update

# update Linux repo with latest files
cd ~/GitHub/Linux
sudo git pull origin master

# Export dpkg files and repos
rpm -qa > ~/yum.installed
sed -i 's/^/install /' ~/yum.installed
echo run >> ~/yum.installed
sudo cp -nRf /etc/yum.repos.d/*.repo ~/ #creates ~/*.repo files

# Export python modules
sudo -H pip2 install --upgrade pip
sudo -H pip3 install --upgrade pip
pip2 freeze > ~/pip2freeze.txt
pip3 freeze > ~/pip3freeze.txt

# Export npm modules
sudo npm update -g npm
ls `npm root -g` > ~/npmmodules.txt

# Push to GitHub
yes | /bin/cp -f ~/yum.installed files/
yes | /bin/cp -f ~/pip2freeze.txt files/
yes | /bin/cp -f ~/pip3freeze.txt files/
yes | /bin/cp -f ~/npmmodules.txt files/
yes | /bin/cp -f ~/*.repo files/
git add -A
git commit -am "Update CentOS export files"
git push #login to github

# Copy all files created from the above to new install into ~/files
# Also copy across any dot files you may want
