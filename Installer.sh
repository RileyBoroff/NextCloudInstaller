#!/bin/bash
# Enable basic error debugging
PS4='+${LINENO}: '
set -u

# Basic Nextcloud installer for Raspberry Pi

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

# Update and upgrade system
echo "Adding php 8.0 repo and updating the system"
wget -qO /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

apt update && apt upgrade -y

# Install required packages including PHP 8.0
echo "Installing pre-reqs"
apt install -y apache2 mariadb-server libapache2-mod-php8.0 php8.0-gd php8.0-cli php8.0-mysql php8.0-curl php8.0-mbstring php8.0-intl php8.0-imagick php8.0-xml php8.0-zip

# Restart Apache
echo "Restarting the Apache service"
systemctl restart apache2
systemctl start mariadb
# Download and extract Nextcloud
echo "Pulling the latest version of Nextcloud"
wget https://download.nextcloud.com/server/releases/latest.zip -P /tmp
unzip /tmp/latest.zip -d /var/www/html/
chown -R www-data:www-data /var/www/html/nextcloud

# Prompt user for MySQL password
read -s -p "Enter MySQL password for 'nextcloud' user: " mysql_password
echo

# Set up MySQL for Nextcloud using the --password option
echo "Setting up the database for Nextcloud"
mysql --user=root --password="$mysql_password" <<EOF
CREATE DATABASE nextcloud;
CREATE USER 'nextcloud'@'localhost' IDENTIFIED BY '$mysql_password';
GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextcloud'@'localhost';
FLUSH PRIVILEGES;
EXIT
EOF
echo "Success! Nextcloud is located at /var/www/html"
