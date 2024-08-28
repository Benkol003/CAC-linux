#!/bin/bash
# TODO find proton in '~/.local/share/Steam/steamapps/common/Proton *' either experimental or versioning numbers

! [ -d ./compat_data ] && mkdir compat_data
export STEAM_COMPAT_DATA_PATH="$(pwd)/compat_data"
export STEAM_COMPAT_CLIENT_INSTALL_PATH="${HOME}/.local/share/Steam"

PROTON_PATH="${HOME}/.local/share/Steam/steamapps/common/Proton - Experimental" #TODO select proton version
ARMA_PATH="/media/SSD/SteamLibrary/steamapps/common/Arma 3"
cd "$ARMA_PATH"
nohup "${PROTON_PATH}/proton" waitforexitandrun "${ARMA_PATH}/arma3_x64.exe"  &> /dev/null & #TODO do you need full path or can you use relative path for exe? 