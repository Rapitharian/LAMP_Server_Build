# LAMP_Install
# ./install_lamp.sh 2>&1 | tee -a LAMP_Install.log
Install Apache, MariaDB and PHP on Linux (LAMP)

<b><u>Prerequistes:</u></b><br>
  You should have a clean install of CentOS 7, Redhat Enterprise Server 7 or an equivelent.<br>
  You must be a sudo user, ie. in the sudoers group, or the root user to install run this script.<br>
  Running as root is NOT recommended!<br>

<b><u>Installation:</u></b><br>
  Excecute the commands below from your server console<br>
  Install git on the server if not alrady on the server.<br>
<pre>
sudo yum -y install git
</pre>
<br>

  Second clone this project and run the install script<br>
<pre>
git clone https://github.com/Rapitharian/LAMP_Install.git
mv $HOME/LAMP_Install/install_lamp.sh $HOME
chmod +x install_lamp.sh
./install_lamp.sh 2>&1 | tee -a LAMP_Install.log
</pre>

<b><u>Cleanup:</u></b><br>
Remove the installation script install_lamp.sh<br>
If you don't need the installation log, remove that as well.<br>
<pre>
rm install_lamp.sh
rm LAMP_Install.log
</pre>


<b><u>Sysytemctl (service control) usage:</u></b><br>
Services installed "httpd" & "mariadb".<br>
Change SERVICENAME for the either httpd or mariadb.<br>
Check Status of the server service: systemctl status SERVICE_NAME<br>
Start the server service: systemctl start SERVICE_NAME<br>
Stop the server service: systemctl stop SERVICE_NAME<br>
Restart the server service: systemctl restart SERVICE_NAME<br>
