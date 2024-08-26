#!/bin/bash
# find proton in '~/.local/share/Steam/steamapps/common/Proton *' either experimental or versioning numbers
# or use protontricks?

# issues: 
# use primerun
# use correct user
#game stuttering?

STEAM_COMPAT_DATA_PATH=$(pwd)/compat_data
echo $STEAM_COMPAT_DATA_PATH
export STEAM_COMPAT_DATA_PATH
export STEAM_COMPAT_CLIENT_INSTALL_PATH="$HOME/.steam/steam"
PROTON_PATH=".local/share/Steam/steamapps/common/Proton - Experimental"

ARMA_PATH="/media/SSD/SteamLibrary/steamapps/common/Arma 3/"
cd  "$ARMA_PATH"
~/"$PROTON_PATH"/proton runinprefix ./arma3_x64.exe