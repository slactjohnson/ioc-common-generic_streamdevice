#! /bin/bash

# Setup the common directory env variables
if [ -e      /reg/g/pcds/pyps/config/common_dirs.sh ]; then
	source   /reg/g/pcds/pyps/config/common_dirs.sh
elif [ -e    /afs/slac/g/pcds/pyps/config/common_dirs.sh ]; then
	source   /afs/slac/g/pcds/pyps/config/common_dirs.sh
fi

# TODO: use this to fix conda version to latest
#PCDS_CONDA_VER=<version>

source /cds/group/pcds/pyps/conda/pcds_conda

#TODO:change gsd to device name
pushd $$IOCTOP/gsdScreens

$$LOOP(DEVICE)

# TODO:
# pydm -m "prefix=$$BASE,name=$$IOC_PV" gsd.ui &
echo "No screens for the Generic StreamDevice yet."
$$ENDLOOP(DEVICE)