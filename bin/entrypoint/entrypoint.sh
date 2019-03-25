#!/bin/bash

cd /var/www/html

COLOR_SUCCESS='\033[0;32m'
NC='\033[0m'

printf "\n${COLOR_SUCCESS} ======================================= ${NC}\n"
printf "\n${COLOR_SUCCESS}     LAUNCH tar.gz to /var/www/html           \n"
printf "\n${COLOR_SUCCESS} ======================================= ${NC}\n"
mv /tmp/magento-mirror-$MAGENTO_VERSION/* /tmp/magento-mirror-$MAGENTO_VERSION/.htaccess $INSTALL_DIR
echo "tar.gz moved with success!"

sleep 10

printf "\n${COLOR_SUCCESS} ======================================= ${NC}\n"
printf "\n${COLOR_SUCCESS}     LAUNCH Sample Data Install               \n"
printf "\n${COLOR_SUCCESS} ======================================= ${NC}\n"
install-sampledata
echo "Sample-data is installed with success!"

printf "\n${COLOR_SUCCESS} ======================================= ${NC}\n"
printf "\n${COLOR_SUCCESS}     LAUNCH Magento Install                   \n"
printf "\n${COLOR_SUCCESS} ======================================= ${NC}\n"
install-magento
echo "Magento is installed with success!"

printf "\n${COLOR_SUCCESS} ======================================= ${NC}\n"
printf "\n${COLOR_SUCCESS}     LAUNCH Reverb Install                    \n"
printf "\n${COLOR_SUCCESS} ======================================= ${NC}\n"
modman init
modman clone https://github.com/reverbdotcom/reverb-magento
echo "Reverb module is installed with success!"

printf "\n${COLOR_SUCCESS} ======================================= ${NC}\n"
printf "\n${COLOR_SUCCESS}     LAUNCH APACHE                            \n"
printf "\n${COLOR_SUCCESS} ======================================= ${NC}\n"
exec apache2-foreground

echo "Container is up!"