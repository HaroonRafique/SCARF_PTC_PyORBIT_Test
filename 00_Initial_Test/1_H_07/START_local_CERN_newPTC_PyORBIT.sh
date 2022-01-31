#!/bin/bash

set -o errexit

if [ ! -n "$1" ]
  then
    echo "Usage: `basename $0` <name of the SC script> <N CPUs>"
    exit $E_BADARGS
fi

if [ ! -n "$2" ]
  then
    echo "Usage: `basename $0` <name of the SC script> <N CPUs>"
    exit $E_BADARGS
fi

source /home/HR/Codes/PTC_PyORBIT/NewPTC_Test2/venv/bin/activate
echo "python packages charged"
source /home/HR/Codes/PTC_PyORBIT/NewPTC_Test2/py-orbit_newPTC/customEnvironment.sh
echo "customEnvironment done"

/usr/lib64/mpich/bin/mpirun -np $2 ${ORBIT_ROOT}/bin/pyORBIT $1
