#!/bin/sh

set -eo pipefail
echo "* Script to enable gtp5g kernel module"
/sbin/insmod /root/gtp5g/gtp5g.ko || true
if [ $(lsmod | grep gtp5g | wc -l) -eq 0 ]
then
  echo "* GTP module not loaded"
  exit 1
else
  echo "GTP module successfully loaded"
  while true; do sleep 10; done
fi
