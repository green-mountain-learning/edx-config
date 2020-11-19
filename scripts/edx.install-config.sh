#!/bin/bash
#---------------------------------------------------------
# written by: lawrence mcdaniel
#             https://lawrencemcdaniel.com
#             https://blog.lawrencemcdaniel.com
#
# date:       nov-2020
#
# usage:      install Open edX configuration files
#
#---------------------------------------------------------
echo 'edx.install-config.sh'

# check to ensure that there's an SSL certificate installed on this server
if [ ! -d /edx/app/edxapp/edx-platform/ ]; then
  echo "Did not find an Open edX platform on this server. Exiting."
  exit
fi

git clone https://github.com/green-mountain-learning/edx-config.git -b main /home/ubuntu/edx-config

# copy files into position
sudo mv /home/ubuntu/edx-config/*.yml /edx/etc/


# ensure permissions and ownership are correct.
sudo chown root /edx/etc/*.yml
sudo chgrp root /edx/etc/*.yml
sudo chmod 644 /edx/etc/*.yml
