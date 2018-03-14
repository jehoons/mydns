#!/bin/bash -eu

cmd="$1"

if [ "${cmd}" == "shell" ]; then
    # exec "/bin/bash"
    service bind9 start 
    # /bin/bash
    tail -f 
else
    exec "$@"
fi


