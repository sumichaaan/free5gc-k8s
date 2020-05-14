#!/bin/bash

docker run --rm \
	-it \
	--net=host \
        -v $(pwd)/../configs:/opt/f5gc/etc \
        -v $(pwd)/../configs:/opt/config \
        -v $(pwd)/../certs:/opt/support/TLS \
        local/f5gc-nrf:latest
