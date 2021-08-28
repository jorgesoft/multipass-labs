#!/bin/bash

multipass launch \
        -c 4 \
        -m 4g \
        -n k8s-ctrl


vms=("k8s-node1" "k8s-node2")

for i in ${!vms[@]};
    do
        multipass launch \
                -c 2 \
                -m 3g \
                -n ${vms[$i]} 
    done

