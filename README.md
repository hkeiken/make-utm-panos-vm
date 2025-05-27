# Script to make a UTM vm for PanOS on MacOS

Making a virtual machine on MacOS with newer M1+ Arm based chips are different from how it was on Intel based devices. On Mac the [UTM.app](https://mac.getutm.app/) makes creating virtual machines easier. This is a small script to show how one can automate the generation of a virtual machine for ARM based PanOS to UTM. This might look complex for this simple task, however the longer term goal is to be able to automate more. You have to get hold of the vm-image yourself.

Running the script is easy just use (for example):
´´´
chmod u+x make-utm-panos-vm.sh
./make-utm-panos-vm.sh my-panos-vm PA-VMARM-KVM-11.1.4-h7.qcow2
´´´

Now a new vm named my-panos-vm should show up in the UTM app. However, as the option to set the serial correct was not found, this has to be done manually afterwards by doing

1 - right click edit on the virtual machine
2 - On Devices Serial, change from "Pseudo-TTY Device" to "Built-in Terminal" and save

Now the virtual machine should be ready to boot
