#!/bin/bash
# version 2.0 - 2014.11.2

# Check current install directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$DIR" != "/var/www" ]; then
    echo -e "\e[1;31mWrong directory!\e[0m Cannot work on ${DIR}"
else
    sudo apt-get update > /dev/null

	echo -e "\e[1m--- Install Apache2 ---\e[0m"
	sudo apt-get install -y apache2
	sudo a2enmod rewrite
	sudo service apache2 restart
	
	echo -e "\e[1m--- Install Git ---\e[0m"
	sudo apt-get install -y git
fi