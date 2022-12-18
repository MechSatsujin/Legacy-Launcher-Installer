#!/bin/bash
# Welcome To the contents of the sh installer. You can customize your installation here.
# This installation is only for Debian-based distributions.
# Run bash ./installer.sh on terminal in order to install, no sudo is required to run except apt installations, copying files and permissions on system directories.

if [ "$(id -u)" -eq 0 ]
then
    if [ -n "$SUDO_USER" ]
    then
        printf "This installer has to run as a normal user." >&2
        exit 1
    fi
fi

sudo echo 'Welcome to TL:Legacy Online SH Installer for Debian-based distributions by RuahWonders!'
echo 'GitHub Repo: https://github.com/RuahWonders/TL-Legacy-Installer'
sleep 1
echo 'This installer is gonna install TL system-wide.'
sleep 1
echo 'Packages that are gonna install on the system:
OpenJDK package(depends on what version would you like to install.)'
echo
sleep 2
echo 'The Setup is about to start. Please wait.'
sleep 5

read -p "Would you like to perform a clean installation? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo 'removing the TL folder in /usr/share'
    rm -r /home/$USER/.minecraft
    echo 'Finished performing clean installation.'
fi
echo 'Making the TL directory on /usr/share'
sudo mkdir /usr/share/tl
sleep 0.75
echo 'Going to copy the contents.'
cd $HOME/TL-Legacy-Installer/contents/desktop/
sudo cp tl.desktop /usr/share/applications
sudo cp remove-tl.desktop /usr/share/applications
cd ..
echo 'Desktop file copied on /usr/share/applications'
echo 'Setting the .desktop file to executable.'
sleep 0.2
sudo chmod +x /usr/share/applications/tl.desktop
sudo chmod +x /usr/share/applications/remove-tl.desktop
echo 'Desktop Files are now Executable'
sleep 0.5
echo 'copying the main file'
cd $HOME/TL-Legacy-Installer/contents/main/
sudo cp TL_legacy.jar /usr/share/tl
echo 'finished copying the main file'
sleep 0.75
cd ..
echo 'copying other contents.'
cd $HOME/TL-Legacy-Installer/contents/other/
echo 'making directory for the icon.'
sudo mkdir /usr/share/tl/icon
echo 'now copying the icon'
sudo cp minecraft.png /usr/share/tl/icon
sleep 0.75
cd $HOME/TL-Legacy-Installer/contents/shell
echo 'copying the shell files.'
sudo cp remove-tl /usr/bin
sudo cp remove-tl.sh /usr/share/tl
sudo cp tl-legacy /usr/bin
echo 'Finished copying contents.'
sleep 2
read -p "What Java JDK Version Package would you like to install? [1]default-jdk [2]openjdk-17 [3]openjdk-18 [4]openjdk-19 [5]openjdk-8 [Default:Don't Install]:" -n 1 -r

if [[ $REPLY =~ ^[1]$ ]]
then
    sudo apt install default-jdk

fi

if [[ $REPLY =~ ^[2]$ ]]
then
    sudo apt install openjdk-17-jdk

fi

if [[ $REPLY =~ ^[3]$ ]]
then
    sudo apt install openjdk-18-jdk
fi

if [[ $REPLY =~ ^[4]$ ]]
then
    sudo apt install openjdk-19-jdk
fi

if [[ $REPLY =~ ^[5]$ ]]
then
    sudo apt install openjdk-8-jdk
fi

sleep 2
echo
echo
echo 'TL: Legacy Installed Successfully! Clearing the installer folder.'
cd
rm /home/$USER/tl-installer -r
sleep 5
echo
echo
echo 'Installation finished succesffully. You can open the application from the menu or run "tl-legacy" on the terminal.'
echo
echo
echo 'If you want to remove TL:Legacy, run "Remove TL" on the applications menu or run "remove-tl" on the terminal.'
