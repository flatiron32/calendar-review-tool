#!/bin/bash

# Example Daemon Starter
. /etc/rc.common

CheckForNetwork

echo ${NETWORKUP}
while [ "${NETWORKUP}" != "-YES-" ]
do
        echo ${NETWORKUP}
        sleep 5
        NETWORKUP=
        CheckForNetwork
done

# Now do what you need to do.
