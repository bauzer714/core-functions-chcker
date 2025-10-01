#! /bin/bash

echo "Initializing"
echo "Pre-prompt for sudo, if desired"
sudo echo "Sudo available"
echo "IP Info"
ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'
echo "Opening code editor"
code .
echo "Starting NGINX"
sudo service nginx start
echo "Starting PHP FPM"
sudo service php8.4-fpm start
sudo service php8.4-fpm status
echo "Completed initialization"




echo "Doing Updates, if needed"
sudo apt update && sudo apt -y upgrade
echo "Done"
