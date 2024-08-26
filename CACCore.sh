#!/bin/bash
clear
curl --ssl-no-revoke https://raw.githubusercontent.com/TanRayCz/CAC/master/hosts.txt > hosts.txt 2> nul

cac_exit () {
   clear
   echo -e "\e[m"
   exit
}

green () {
   echo -e "\e[0;32m" 
}

red () {
   echo -e "\e[0;31m" 
}

yellow () {
   echo -e "\e[0;33m" 
}

###launch steam

if ! command -v steam &> /dev/null; then
   red
   echo "steam not found, please install steam."
else
   #contains steam
   
   #check if steam running
   if ! pgrep steam &> /dev/null; then
      yellow
      echo "steam not  running, attempting to run steam."
      steam &> /dev/null &
      sleep 1 #TODO timeout loop wait on pgrep?
      if ! pgrep steam &> /dev/null; then
         red
         echo "failed to launch steam."
         sleep 2
         cac_exit
      else
         green
         echo "steam launched successfully."
      fi
   else
      green
      echo "steam is running."
   fi
fi
sleep 2

### config loading / set defaults

! [ -d CACCore ] && mkdir CACCore

! [ -f CACCore/username.txt ] && whoami > CACCore/username.txt
armaUserName=$(<CACCore/username.txt)

[ -f CACCore/password.txt ] && password=$(<CACCore/password.txt)

[ -f CACCore/moddir.txt ] && modPath=$(<CACCore/moddir.txt)
! [ -f CACCore/moddir.txt ] && modPath=./Mods

### server connection vars

ip=brenner.servebeer.com
ip2=cacservers.servebeer.com
ip3=cackoth.servebeer.com
ip4=unladencoconut.ddns.net
ip5=theghost.ddns.net
A1='start "" /normal arma3_x64 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT -connect=%ip% -name="%ArmaUserName%"'
A2='start "" /normal arma3_x64 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT -setThreadCharacteristics -connect=%ip2% -name="%ArmaUserName%"'
A3='start "" /normal arma3_x64 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT -connect=%ip3% -name="%ArmaUserName%"'
A4='start "" /normal arma3_x64 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT -setThreadCharacteristics -connect=%ip4% -name="%ArmaUserName%"'
A5='start "" /normal arma3_x64 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT -setThreadCharacteristics -connect=%ip5% -name="%ArmaUserName%"'

### launch server functions

antistasi1 () {
   :
}

antistasi2 () {
   :
}

exileTanoa () {
   :
}

kingOfTheHill () {
   :
}

exileEscape () {
   :
}

liberation () {
   :
}

specOps () {
   :
}

statusChanger () {
   :
}

modSettings () {
   :
}

cacSettings () {
   :
}

### optional mods loading

### TODO

clear
echo -e "\e[0;32m"

echo "should be green"
echo "Arma 3 CAC Launcher"

echo
echo '  1 Antistasi 1 [Temporary Offline]'
echo '  2 Antistasi 2'
echo '  3 Exile Tanoa'
echo '  4 King of The Hill [Variable Uptime/Event only - Request TanRayCz/Mod if server is down]'
echo '  5 Exile Escape [Variable Uptime/Event only]'
echo '  6 Liberation'
echo '  7 Special Ops [Variable Uptime/Event only]'
#   8 Dynamic Recon Ops CUP
echo
echo '  9 CAC Settings'
echo
echo '  0 Exit CAC Launcher'
echo

in=
while ! [[ "$in" =~ ^[0-9] ]] do
read -d'' -s -n1 in
done

case $in in
 1) antistasi1 ;;
 2) antistasi2 ;;
 3) exileTanoa ;;
 4) kingOfTheHill ;;
 5) exileEscape ;;
 6) liberation ;;
 7) specOps ;;
 9) cacSettings ;;
 0) cac_exit ;;
esac

#use later: 
#read -p "set exile password: " password && echo $password > CACCore/password.txt
echo "debug - eof"
sleep 1
cac_exit

