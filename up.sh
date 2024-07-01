#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
NC='\033[0m' # No Color

echo "Running as root..."

sleep 3

clear

echo "Updating Please Wait..."

service passwall stop

cd /root/

rm owo.sh

wget https://cc.aryanet.online/passwall/owo.sh

chmod 777 owo.sh

cd /etc/init.d/

rm vahid

wget https://cc.aryanet.online/passwall/vahid

chmod +x /etc/init.d/vahid

/etc/init.d/vahid enable

cd /root/


/etc/init.d/vahid start

echo -e "${GREEN} Update Complated ! ${ENDCOLOR}"
