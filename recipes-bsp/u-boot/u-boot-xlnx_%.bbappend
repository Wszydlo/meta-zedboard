FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += "file://xilinx_zynq_virt_defconfig;subdir=git/configs"

PROVIDES += "xilinx-bootbin"
