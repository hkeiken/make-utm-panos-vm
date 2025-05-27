#!/usr/bin/env bash
# By hans@eikjen.no version 0.1
# A simple script for Macos with Arm chips to use UTM app (https://mac.getutm.app/) for running PanOS. 

args=("$@")
VM_NAME=${args[0]}
VM_FILE=${args[1]}

echo 
echo "A simple script to create a new virtual machine in UTM named $VM_NAME for PANOS using $VM_FILE"
echo "example of use: ./make-utm-panos-vm.sh my-panos-vm PA-VMARM-KVM-11.1.4-h7.qcow2"
echo

################## UTM IMPORT ############

osascript <<EOF
set vmFile to POSIX file "$VM_FILE" 
tell application id "com.utmapp.UTM"
 set theDrives to {{source:vmFile, interface:VirtIO}}
 set theNetwork to {{mode:shared},{mode:bridged},{mode:shared}}
 set theConfiguration to {name:"$VM_NAME", architecture:"aarch64", memory:7000, cpu cores:2, drives:theDrives, network interfaces:theNetwork}
 set vm to make new virtual machine with properties {backend:qemu, configuration:theConfiguration}
 return vm
end tell
EOF