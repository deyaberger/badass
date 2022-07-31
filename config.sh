#!/bin/bash
sudo add-apt-repository ppa:gns3/ppa
sudo apt-get update
sudo apt install gnome-session-flashback
# Installing GNS3 and Docker:
sudo apt install gns3-gui
sudo apt install docker.io
echo "You now have to reboot your computer"
