#!/bin/bash
# version 2.0 - 2014.11.2

# Check current install directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$DIR" != "/var/www" ]; then
    echo -e "\e[1;31mWrong directory!\e[0m Cannot work on ${DIR}"
else
	if [ ! -d "/var/www/manolodelcos.com" ]; then
		echo -e "\e[1m--- Install: manolodelcosweb ---\e[0m"
		sudo mkdir "/var/www/manolodelcos.com"
		sudo chmod 777 -R "/var/www/manolodelcos.com"
		git clone https://github.com/manolodelcos/website manolodelcos.com
	fi
	
	echo -e "\e[1m--- Update: manolodelcosweb ---\e[0m"
	echo "-> Pulling from GitHub"
	cd manolodelcos.com
	git stash
	git pull
	echo "-> Updating VirtualHost"
	sudo a2dissite manolodelcos.com
	sudo cp manolodelcos.com /etc/apache2/sites-available/manolodelcos.com
    sudo cp manolodelcos.com /etc/apache2/sites-available/manolodelcos.com.conf
    sudo a2ensite manolodelcos.com
	cd ..
	
	
	echo -e "\e[1m--- Restarting Apache2 ---\e[0m"
	sudo service apache2 restart
	echo -e "\e[1m[All Done]\e[0m"
fi