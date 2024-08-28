#!/bin/bash

ARMA_PATH="/media/SSD/SteamLibrary/steamapps/common/Arma 3"
#TODO use find / -type f -name arma3_x64.exe 2>/dev/null ?  or force place in arma dir

arma_path="/media/SSD/SteamLibrary/steamapps/common/Arma 3/"
proton_path="/home/unladencoconut/.local/share/Steam/steamapps/common/Proton - Experimental/proton"

clear
#this is redundant
#curl --ssl-no-revoke https://raw.githubusercontent.com/TanRayCz/CAC/master/hosts.txt > hosts.txt 2> nul

cacExit () {
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
      echo "steam not running, attempting to run steam."
      steam &> /dev/null &
      sleep 1 #TODO timeout loop wait on pgrep?
      if ! pgrep steam &> /dev/null; then
         red
         echo "failed to launch steam."
         sleep 3
         cacExit
      else
         green
         echo "steam launched successfully."
      fi
   else
      green
     #echo "steam is running."
   fi
fi

### config loading / set defaults

! [ -d CACCore ] && mkdir CACCore

! [ -f CACCore/username.txt ] && whoami > CACCore/username.txt
armaUserName=$(<CACCore/username.txt)

[ -f CACCore/password.txt ] && password=$(<CACCore/password.txt)

[ -f CACCore/moddir.txt ] && modPath=$(<CACCore/moddir.txt)
! [ -f CACCore/moddir.txt ] && modPath=Mods/ #TODO proper concat of relative path e.g. ./Mods goes to arma 3/mods not arma 3/./mods - . doesnt exist in win file system

### server connection vars

ip=brenner.servebeer.com
ip2=cacservers.servebeer.com
ip3=cackoth.servebeer.com
ip4=unladencoconut.ddns.net
ip5=theghost.ddns.net
arma_cmd="-skipIntro -noSplash -world=empty -exThreads=7 -enableHT -hugepages -setThreadCharacteristics -name=\$armaUserName"

### launch server functions
# arma just hangs ,no errors, wont connect, wont escape to menu
runner () {
   ! [ -d ./compat_data ] && mkdir compat_data #create proton/wine prefix if one doesnt exist here
   export STEAM_COMPAT_DATA_PATH="$(pwd)/compat_data"
   export STEAM_COMPAT_CLIENT_INSTALL_PATH="${HOME}/.local/share/Steam"

   PROTON_PATH="${HOME}/.local/share/Steam/steamapps/common/Proton - Experimental"
   cd "$ARMA_PATH"
   nohup "${PROTON_PATH}/proton" waitforexitandrun "${ARMA_PATH}/arma3_x64.exe" $1 &> /dev/null &
   cacExit
}

antistasi1 () {
   eval tmp=\"$tmp\"
   runner "$tmp"
}

antistasi2 () {
   tmp="$arma_cmd -connect=$ip2 -port=2702 \\\"-mod=RF;\${modPath}@CUPTerrainsCore;\${modPath}@Sumava;\${modPath}@RHSAFRF;\${modPath}@RHSGREF;\${modPath}@RHSUSAF;\${modPath}@RHSSAF;\${modPath}@ace;\${modPath}@CBA_A3;\${modPath}@AntistasiUltimate;\${modPath}@cac_aue;\${modPath}@AWR;\${modPath}@RealEngine;\${modPath}@EnhancedMovement;\${modPath}@EnhancedMovementRework;\${modPath}@VET_Unflipping;\${modPath}@ace_nouniformrestrictions;\${modPath}@AdvancedRappelling;\${modPath}@AdvancedUrbanRappelling;\${modPath}@ACEGrenades\\\""
   eval tmp=\"$tmp\"
   runner "$tmp"
}

exileTanoa () {
   eval tmp=\"$tmp\"
   runner "$tmp"
}

kingOfTheHill () {
   eval tmp=\"$tmp\"
   runner "$tmp"
}

exileEscape () {
   eval tmp=\"$tmp\"
   runner "$tmp"
}

liberation () {
   tmp="$arma_cmd -connect=$ip5 -port=2100 \\\"-mod=\${modPath}@ace;\${modPath}@ACEGrenades;\${modPath}@ace_nouniformrestrictions;\${modPath}@CBA_A3;\${modPath}@RHSAFRF;\${modPath}@RHSGREF;\${modPath}@RHSUSAF;\${modPath}@RealEngine;\${modPath}@EnhancedMovement;\${modPath}@EnhancedMovementRework;\${modPath}@VET_Unflipping;\${modPath}@AdvancedRappelling;\${modPath}@AdvancedUrbanRappelling;\${modPath}@USAF;\${modPath}@USAF_AC130_BETA;\${modPath}@CUPTerrainsCore;\${modPath}@AWR;\${modPath}@Yulakia;\${modPath}@KPRanks\\\""
   eval tmp=\"$tmp\"
   runner "$tmp"
}

specOps () {
   eval tmp=\"$tmp\"
   runner "$tmp"
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
 0) cacExit ;;
esac

#use later: 
#read -p "set exile password: " password && echo $password > CACCore/password.txt
echo "debug - eof"
sleep 1
cacExit

