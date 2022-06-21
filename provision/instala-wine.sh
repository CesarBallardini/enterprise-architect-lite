#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
export APT_LISTCHANGES_FRONTEND=none
export APT_OPTIONS=' -y --allow-downgrades --allow-remove-essential --allow-change-held-packages -o Dpkg::Options::=--force-confdef -o Dpkg::Options::=--force-confold '

sudo apt-get update
sudo apt-get install software-properties-common apt-transport-https wget ${APT_OPTIONS}
sudo dpkg --add-architecture i386

wget --no-verbose -O- https://dl.winehq.org/wine-builds/winehq.key | sudo gpg --dearmor | sudo tee /usr/share/keyrings/winehq.gpg > /dev/null

echo deb [signed-by=/usr/share/keyrings/winehq.gpg] http://dl.winehq.org/wine-builds/ubuntu/ $(lsb_release -cs) main | sudo tee /etc/apt/sources.list.d/winehq.list > /dev/null
sudo apt-get update


# WORKAROUND: no descarga los paquetes de una sola vez, problemas en el acceso a internet
while [ $retcode != 0 ]
do
  sudo apt-get install --install-recommends winehq-stable ${APT_OPTIONS}
  retcode=$?
done

sudo apt-get install mono-complete --install-recommends ${APT_OPTIONS}
sudo apt-get install winetricks playonlinux --install-recommends ${APT_OPTIONS}

wine --version
#winecfg


# staging y development:
#sudo apt-get install --install-recommends winehq-staging -y
#sudo apt-get install --install-recommends winehq-devel -y

