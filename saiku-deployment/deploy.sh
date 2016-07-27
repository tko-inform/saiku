#!/bin/sh
#
#

# http://www.faqs.org/docs/abs/HTML/dosbatch.html

#sudo su - root

#
TOMCAT_HOME="/opt/saiku-new/tomcat"

#
SOURCE="/home/telecor/saiku_build"

clear

set +v

echo
echo $SOURCE
echo

echo "Who I'm"
whoami


echo "# ********************************************************************"
echo "# Stopping ...                                                        "
echo "# ********************************************************************"

echo "Tomcat stopping ..."
sudo /etc/init.d/saiku stop
echo "Tomcat stopped"

echo
echo "# ********************************************************************"
echo "# Tomcat                                                              "
echo "# ********************************************************************"
echo

#rm -r $TOMCAT_HOME/logs/* -f
rm -r $TOMCAT_HOME/work/* -f
rm -r $TOMCAT_HOME/temp/* -f
rm -rf $TOMCAT_HOME/webapps/saiku
rm -rf $TOMCAT_HOME/webapps/ROOT

echo "==> Garbage Application"
unzip $SOURCE/saiku-ui.war -d $TOMCAT_HOME/webapps/ROOT
unzip $SOURCE/saiku-webapp-3.8.8.war -d $TOMCAT_HOME/webapps/saiku
cp $SOURCE/gm-analytic-1.0.0.jar $TOMCAT_HOME/webapps/saiku/WEB-INF/lib

echo
echo "# ********************************************************************"
echo "# Starting ...                                                        "
echo "# ********************************************************************"
echo

echo "Tomcat starting ..."
sudo /etc/init.d/saiku start
echo "Tomcat started"