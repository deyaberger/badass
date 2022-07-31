sudo add-apt-repository ppa:gns3/ppa
sudo apt-get update
sudo apt install gnome-session-flashback
sudo apt install gns3-gui
sudo apt install docker.io
sudo usermod -a -G docker deya
docker pull deyaberger/router_dberger
docker pull alpine
