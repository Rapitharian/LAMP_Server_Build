#!/bin/bash
#Code By Rapitharian
#Cleanup & Comments By FrontlineMist57
echo "==============="
echo "Updating System"
echo "==============="
echo "Updating All Packages On The System Before Installation."
sudo yum -y update #Updates All Packages With Sudo Perms
echo -e "\n"
echo -e "\n"


echo "================="
echo "Installing Apache"
echo "================="
echo "Installing The Apache server." 
sudo yum -y install httpd #Installs Apache
echo "Starting The Apache server (httpd)."
sudo systemctl start httpd.service #Starts Apache Background Service
echo "Setting The Apache server (httpd) to start on boot."
sudo systemctl enable httpd.service #Enables Apache Background Service To Auto Start On Boot
echo -e "\n"
echo -e "\n"


echo "=================="
echo "Installing MariaDB"
echo "=================="
echo "Installing MariaDB"
sudo yum -y install mariadb-server mariadb #Installs MariaDB
echo "Starting MariaDB Background Service"
sudo systemctl start mariadb #Starts MariaDB Background Service
echo "Enabling Maria DB To Start On Boot"
sudo systemctl enable mariadb.service #Enables MariaDB Background Service To Auto Start On Boot
echo -e "\n"
echo -e "\n"


echo "=============="
echo "Installing PHP"
echo "=============="
echo "Installing PHP"
sudo yum -y install php php-mysql #Installs PHP
echo "Restarting Httpd"
sudo systemctl restart httpd.service #Restarts Httpd
echo "Creating Info.php"
sudo bash -c 'sudo cat > /var/www/html/info.php <<EOF
<?php phpinfo(); ?>
EOF'
echo -e "\n"
echo -e "\n"


#Start Testing Instructions
echo "================"
echo "Checking Install"
echo "================"
echo "1. Confirm Apache is working.  Goto  http://ServerIP/"
echo "2. Confirm PHP is working.  Goto  http://ServerIP/info.php"
echo "3. Run 'sudo mysql_secure_installation' to lock down your MariaDB installation."
echo -e "\n"
#End Testing Instructions


#Start Checking Install Part 1 of 2
read -e -p "Is Apache Working? [Y]: " Key1 #Asks If Apache Is Working -- Sets To Variable "Key1"
Key1=${Key1:-Y}  #If "Key1" Is Blank The Defualt Is "Y"
if [ "$Key1" = 'Y' ]; then #If Apache Is Working Continue
#End Checking Install Part 1 of 2

#Start Checking Install Part 2 of 2
  read -e -p "Is PHP Working? [Y]: " Key2 #Asks If PHP Is Working -- Sets To Variable "Key2"
  Key2=${Key2:-Y} #If "Key2" Is Blank The Defualt Is "Y"
  if [ "$Key2" = 'Y' ]; then #If PHP Is Working Continue
    echo "Removing the info.php file."
    sudo rm /var/www/html/info.php #Removes Test PHP File If PHP Is Working
    exit
#End Checking Install Part 2 of 2
# Cleanup the Git folder.
rm LAMP_Install

#start Results
  else #If PHP Isn't Working, Do The Following
    echo "Installation ended. PHP is not working."
    exit
  fi
  else #If Apache Isn't Working, Do The Following
    echo "Installation ended.  Apache is not working."
  exit
fi
#End Results
exit
