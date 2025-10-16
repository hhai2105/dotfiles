#!/usr/bin/zsh

sudo chmod g-w /dev/nvme0n1p3
sudo chgrp $USER /dev/nvme0n1p3
sudo chmod g-w /dev/nvme0n1p5
sudo chgrp $USER /dev/nvme0n1p5

qemu-system-x86_64 \
-enable-kvm \
-machine type=q35,accel=kvm \
-cpu host,kvm=on \
-m 25G \
-device amd-iommu \
-drive if=pflash,format=raw,readonly=on,file=/usr/share/edk2/x64/OVMF_CODE.4m.fd \
-drive if=pflash,format=raw,file=/home/hain/qemu/OVMF_VARS.4m.fd \
-drive file=/dev/nvme0n1p3,format=raw,cache=none \
-drive file=/dev/nvme0n1p5,format=raw,cache=none \
