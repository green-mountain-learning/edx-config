#!/bin/bash
#---------------------------------------------------------
# written by: lawrence mcdaniel
#             https://lawrencemcdaniel.com
#             https://blog.lawrencemcdaniel.com
#
# date:       nov-2020
#
# usage:      Clone custom edX theme repo and move into
#             place.
#---------------------------------------------------------
echo 'edx.install-theme.sh'

# check to ensure that there's an SSL certificate installed on this server
if [ ! -d /edx/app/edxapp/edx-platform/ ]; then
  echo "Did not find an Open edX platform on this server. Exiting."
  exit
fi

# replace theme file contents.
sudo rm -rf /edx/app/edxapp/edx-platform/themes/green-mountain-learning

git clone https://github.com/green-mountain-learning/edx-theme.git -b main /home/ubuntu/green-mountain-learning

# move entire theme repo into edx-platform location
sudo mv /home/ubuntu/green-mountain-learning /edx/app/edxapp/edx-platform/themes/green-mountain-learning


# ensure permissions and ownership are correct.
sudo chown edxapp -R /edx/app/edxapp/edx-platform/themes
sudo chgrp edxapp -R /edx/app/edxapp/edx-platform/themes

