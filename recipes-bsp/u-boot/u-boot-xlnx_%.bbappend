FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += "file://xilinx_zynq_virt_defconfig;subdir=git/configs"
PROVIDES += "u-boot"

do_deploy:append(){
	cp ${DEPLOYDIR}/u-boot.dtb ${DEPLOYDIR}/u-boot-unsigned.dtb
}
