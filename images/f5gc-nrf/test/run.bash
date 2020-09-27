#!/bin/bash

docker run --rm \
	-it \
	--net=host \
        -v $(pwd)/../config:/free5gc/config \
        -v $(pwd)/../certs:/free5gc/support/TLS \
        local/f5gc-nrf:master
