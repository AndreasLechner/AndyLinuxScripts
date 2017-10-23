#!/bin/bash

#######################################
# Bash script to install OpenHab 2 - Eclipse Smart Home with Apache2, PHP7, MariaDB and PHPMyAdmin plus tweaks. For Raspian or Debian system.
# Written by @AndreasLechner from http://lechnerandreas.com https://www.facebook.com/sparkyswift

# In case of any errors (e.g. MariaDB) just try to re-run this script. Nothing else will be re-installed except for the packages with errors.
#######################################

# Resetting Colors

Color_Off='\033[0m'       # Reset of Text

# Defining Regular Colors
Red='\033[0;31m'          # Define Red
Green='\033[0;32m'        # Define Green
Yellow='\033[0;33m'       # Define Yellow
Purple='\033[0;35m'       # Define Purple
Cyan='\033[0;36m'         # Define Cyan

# Write Welcome message
echo -e "$Red \n Starting installation of OpenHab2 plus tweaks.. $Color_Off" 

# Update packages and Upgrade system
echo -e "$Cyan \n Updating System.. $Color_Off"
sudo apt-get update -y && sudo apt-get upgrade -y


# Install Apache2
## Install AMP
echo -e "$Cyan \n Installing Apache2 $Color_Off"
sudo apt-get install apache2 apache2-doc apache2-utils -y


# Install php7 and components
echo -e "$Cyan \n Installing PHP7 + tweaks $Color_Off"
sudo apt-get install -t stretch php7.0 php7.0-curl php7.0-gd php7.0-fpm php7.0-cli php7.0-opcache php7.0-json php7.0-mbstring php7.0-xml php7.0-zip php7.0-mysql -y
sudo apt-get install -t stretch libapache2-mod-php7.0 -y


# Install MariaDB Server + Client
echo -e "$Cyan \n Installing MariaDB + tweaks $Color_Off"
sudo apt-get install mariadb-server mariadb-client -y

# Install PhpMyAdmin
echo -e "$Cyan \n Installing phpMyAdmin $Color_Off"
sudo apt-get install -t stretch phpmyadmin -y


# Restarting Apache2
echo -e "$Green \n Restarting Apache $Color_Off"
sudo service apache2 restart

# install git
sudo apt-get install git -y

# download OpenHabian and link git
sudo git clone https://github.com/openhab/openhabian.git /opt/openhabian
sudo ln -s /opt/openhabian/openhabian-setup.sh /usr/local/bin/openhabian-config

# execute OpenHabian Configuration
sudo openhabian-config

exit;

