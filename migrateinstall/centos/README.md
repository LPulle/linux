# Migrating CentOS Installs
This is the CentOS version

Run the centosexport.sh script on the source\
Upload the output files to the files folder - this will need to be updated periodically\
Run the centosmigrate.sh script on the new install
- The centosmigrate.sh installs svn, downloads the files, updates centos and installs all the packages
- This is the first version of this which has been tested on VirtualBox install and worked after a few tweaks
- Added the repositories which were needed as the packages could not be found without them\
Source of the info is from this linuxquerstions thread which i have incorporated:\
https://www.linuxquestions.org/questions/linux-server-73/centos-equivalent-of-dpkg-get-selections-set-selections-4175498883/