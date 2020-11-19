#!/bin/bash
#---------------------------------------------------------
# written by: lawrence mcdaniel
#             https://lawrencemcdaniel.com
#             https://blog.lawrencemcdaniel.com
#
# date:       feb-2018
#
# usage:      the correct commands to restart Open edX services without entirely rebooting the Ubuntu server.
#
# reference:  https://openedx.atlassian.net/wiki/spaces/OpenOPS/pages/60227913/Managing+OpenEdX+Tips+and+Tricks
#---------------------------------------------------------
echo 'edx.platform-restart.sh'

# Sanity check: is there an Open edX platform on this server?
if [ ! -d "/edx/app/edxapp/edx-platform/" ]; then
  echo "Didn't find an Open edX platform on this server. Exiting"
  exit
fi

# These are the commands for restarting the LMS and CMS beginning with Gingko
/edx/bin/supervisorctl restart lms
/edx/bin/supervisorctl restart cms

# If you're running a previous version of Open edX then use this command instead
#/edx/bin/supervisorctl restart edxapp:

/edx/bin/supervisorctl restart edxapp_worker:

