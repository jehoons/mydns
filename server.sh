#!/bin/bash 
STANDB_IMG="mydns"
CONTAINER="hello_MyDNS"
PORT_MAPS="--publish=53:53" 
VOLUME_MAPS="--volume=`pwd`/share:/root/share" 

build() { 
    docker build . -t ${STANDB_IMG}
}
start() { 
    docker run --rm -it -d --name ${CONTAINER} ${VOLUME_MAPS} ${PORT_MAPS} ${STANDB_IMG} 
    # docker run --rm -it -d --name ${CONTAINER} ${VOLUME_MAPS} ${PORT_MAPS} ${STANDB_IMG} 
} 
shell() { 
    docker exec -it ${CONTAINER} bash 
}
stop() {
	docker stop ${CONTAINER} 
} 
case "$1" in
    shell)
        shell 
        ;; 
    build)
        build $2
        ;;
    boot)
        boot
        ;; 
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        echo "wait stoping ..."
        stop 
        wait 
        start $2
        ;; 
    *)
        echo 'hahahello'
   
esac
