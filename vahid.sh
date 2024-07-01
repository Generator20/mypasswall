#!/bin/sh
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
NC='\033[0m' # No Color



echo "Running as root..."
sleep 2
clear

##Scanning

. /etc/openwrt_release
echo "Version: $DISTRIB_RELEASE"

RESULT=`echo $DISTRIB_RELEASE`
            if [ "$RESULT" == "23.05.0" ]; then


            echo -e "${YELLOW} Maybe You get Some Errors on 23.05.0 ! Try 22.03.5 or less ... ${YELLOW}"

            echo -e "${NC}  ${NC}"
            
 else

            echo -e "${GREEN} Version : OK ${GREEN}"

            echo -e "${NC}  ${NC}"
fi

sleep 1

. /etc/openwrt_release
echo "َArchitecture: $DISTRIB_ARCH"

RESULT=`echo $DISTRIB_ARCH`
            if [ "$RESULT" == "mipsel_24kc" ]; then


            echo -e "${GREEN} Architecture : OK ${GREEN}"
            
 else

            echo -e "${RED} OOPS ! Your Architecture is Not compatible ${RED}"
            exit 1


fi

sleep 1

### Passwall Check


RESULT=`ls /etc/init.d/passwall`
            if [ "$RESULT" == "/etc/init.d/passwall" ]; then


            echo -e "${GREEN} Passwall : OK ${GREEN}"
            echo -e "${NC}  ${NC}"
 else

            echo -e "${RED} OOPS ! First Install Passwall on your Openwrt . ${RED}"
            echo -e "${NC}  ${NC}"
            exit 1


fi


#############


######## Temp Space Check

a=`cd /tmp && du  -m -d 0 | grep -Eo '[0-9]{1,9}'`
b=38
if [ "$a" -gt "$b" ]; then

 echo -e "${GREEN} Temp Space : OK ${GREEN}"
 echo -e "${NC}  ${NC}"
    

else

echo -e "${YELLOW} TEMP SPACE NEED : 38 MB ${YELLOW}"


fi

#####################



## Ads & Iran IP Bypass ##

cd /usr/share/passwall/rules/



if [[ -f direct_ip ]]

then

  rm direct_ip

else

  echo "Stage 1 Passed..."
fi

wget https://cc.aryanet.online/passwall/rules/direct_ip

sleep 3

if [[ -f direct_host ]]

then

  rm direct_host

else

  echo "Stage 2 Passed..."

fi

wget https://cc.aryanet.online/passwall/rules/direct_host

sleep 3

if [[ -f block_host ]]

then

  rm block_host

else

  echo "Stage 3 Passed..."

fi

wget https://cc.aryanet.online/passwall/rules/block_host

RESULT=`ls direct_ip`
            if [ "$RESULT" == "direct_ip" ]; then
            echo -e "${GREEN}Ads & Iran IP Bypass Successfull !${NC}"

 else

            echo -e "${RED}Internet Connection Error!! Try Again ${NC}"



fi

sleep 5



## Service INSTALL ##



cd /root/


if [[ -f owo.sh ]]

then 

  rm owo.sh

else 

  echo "Stage 4 Passed..." 

fi

wget https://cc.aryanet.online/passwall/owo.sh

chmod 777 owo.sh


sleep 1

if [[ -f up.sh ]] 

then 

  rm up.sh

else 

  echo "Stage 5 Passed..." 

fi



wget https://cc.aryanet.online/passwall/up.sh

chmod 777 up.sh


sleep 1


if [[ -f timer.sh ]]

then 

  rm timer.sh

else 

  echo "Stage 6 Passed..." 

fi

wget https://cc.aryanet.online/passwall/timer.sh

chmod +x timer.sh

cd

cd /sbin/

if [[ -f vahid ]]

then 

  rm vahid

else 

  echo "Stage 7 Passed..." 

fi

wget https://cc.aryanet.online/passwall/vahid2

chmod 777 vahid2

mv vahid2 vahid

cd

########

sleep 1


cd /etc/init.d/


if [[ -f vahid ]] 

then 

  rm vahid

else 

  echo "Stage 8 Passed..." 

fi


wget https://cc.aryanet.online/passwall/vahid

chmod +x /etc/init.d/vahid

/etc/init.d/vahid enable

cd /root/

echo -e "${GREEN} almost done ... ${ENDCOLOR}"


##Config

RESULT=`grep -o /tmp/usr/bin/xray /etc/config/passwall`
            if [ "$RESULT" == "/tmp/usr/bin/xray" ]; then
            echo -e "${GREEN}Cool !${NC}"

 else

            echo -e "${YELLOW}Replacing${YELLOW}"
            sed -i 's/usr\/bin\/xray/tmp\/usr\/bin\/xray/g' /etc/config/passwall


fi

uci set passwall.@global_app[0].singbox_file='/tmp/usr/bin/sing-box'

uci commit passwall


####improve

cd /tmp

wget -q https://cc.aryanet.online/passwall/iam.zip

unzip -o iam.zip -d /

cd /root/

########

> core.txt

#WithcOne#############################################

echo " "
echo -e "${YELLOW} 1.${NC} ${CYAN} Sing-box ${NC}"
echo -e "${YELLOW} 2.${NC} ${CYAN} Xray ${NC}"
echo -e "${YELLOW} 4.${NC} ${RED} EXIT ${NC}"
echo ""


echo " "
 read -p " -Select Core Option : " choice

    case $choice in

1)

 echo "sing" >> core.txt

 opkg install ca-bundle

 opkg install kmod-inet-diag

 opkg install kernel

 opkg install kmod-netlink-diag

 opkg install kmod-tun 

#read -s -n 1
;;

2)
        
  echo "xray" >> core.txt  
   
#read -s -n 1
;;

4)
            echo ""
            echo -e "${GREEN}Exiting...${NC}"
            exit 0

           read -s -n 1
           ;;

 *)
           echo "  Invalid option Selected ! "
           echo " "
           echo -e "  Press ${RED}ENTER${NC} to continue"
           exit 0
           read -s -n 1
           ;;
      esac
      

##EndConfig

/etc/init.d/vahid start



>/etc/banner

echo "==========================================================
      _    __      __    _     __    _       __     __ 
     | |  / /___ _/ /_  (_)___/ /   | |     / /____/ /_
     | | / / __ `/ __ \/ / __  /____| | /| / / ___/ __/
     | |/ / /_/ / / / / / /_/ /_____/ |/ |/ / /  / /_  
     |___/\__,_/_/ /_/_/\__,_/      |__/|__/_/   \__/  
==========================================================
" >> /etc/banner

sleep 1

>/var/spool/cron/crontabs/root
echo "*/1 * * * * sh /root/timer.sh" >> /var/spool/cron/crontabs/root
echo "30 4 * * * sleep 70 && touch /etc/banner && reboot" >> /var/spool/cron/crontabs/root

/etc/init.d/cron restart

uci set system.@system[0].zonename='Asia/Tehran'

uci set system.@system[0].timezone='<+0330>-3:30'

uci commit system

##checkup

cd

uci set system.@system[0].hostname=Vahid-Wrt

uci commit system

/sbin/reload_config


if [[ -f owo.sh ]]

then 

  echo -e "${GREEN}OK !${NC}"

else 

  echo -e "${RED}Something Went Wrong Try again ... ${NC}" 

fi

cd /etc/init.d/


if [[ -f vahid ]] 

then 

  echo -e "${GREEN}OK !${NC}"

else 

  echo -e "${RED}Something Went Wrong Try again ... ${NC}" 

fi

cd

echo -e "${GREEN} Forked & Configured By Vahid ${ENDCOLOR}"

sleep 3


rm vahid.sh

