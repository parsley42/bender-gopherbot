#!/bin/bash

# build-c9wks.sh - task for launching and configuring a Cloud9 workstation

ACTION=$1

case "$ACTION" in
"launch")
    ec2 create -w $DEVHOST $KEYNAME amzn2devel
    ;;
"configure")
    AddTask ansible-playbook c9devel.yaml -e target=$DEVHOST
    ;;
*)
    SetWorkingDirectory c9wks/aws-devel
    AddTask build-c9wks launch
    AddTask build-c9wks configure
    ;;
esac