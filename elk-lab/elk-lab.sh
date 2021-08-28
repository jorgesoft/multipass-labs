#!/bin/bash

multipass launch \
        -c 2 \
        -m 1g \
        -n ansible-mgmt \
        --cloud-init mgmt-init.yaml


vms=("elasticmaster" "elasticnode1" "kibana1" "kibana2" "logstash1")

for i in ${!vms[@]};
    do
        multipass launch \
                -c 2 \
                -m 3g \
                -n ${vms[$i]} \
                --cloud-init baseOS.yaml
    done

