#!/bin/bash

masternodes=$(kubectl get node | grep -w master | awk '{print $1}')
agentnodes=$(kubectl get node | grep -v -w -e master -e NAME | awk '{print $1}')
for i in config configdb analytics webui control agent analyticsdb 
do
 for masternode in ${masternodes}
 do
  kubectl label node ${masternode} node-role.opencontrail.org/${i}=
 done
done

for i in ${agentnodes}
do
 kubectl label node ${i} node-role.opencontrail.org/agent=
done
