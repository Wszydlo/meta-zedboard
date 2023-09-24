LICENSE = "CLOSED"

DEPENDS += "bootgen-native virtual/bootloader virtual/fsbl"
SRC_URI = " \
  file://zynq.bif \
  file://encryption_efuse.nky \
  "
PROVIDES += "virtual/boot-bin"
inherit deploy
do_deploy[dirs] += "${ZED_DEPLOY_DIR} ${S}"
do_deploy[cleandirs] += "${S}"
do_deploy(){
	# Copy necessary files
  cp ${WORKDIR}/encryption_efuse.nky ${S}
	cp ${DEPLOY_DIR_IMAGE}/u-boot-signed.bin ${S}
	cp ${DEPLOY_DIR_IMAGE}/fsbl-${MACHINE}.elf ${S}/fsbl.elf
	
	#Create boot image
	bootgen -arch zynq -image ${WORKDIR}/zynq.bif -o ${S}/boot.bin
	cp ${S}/boot.bin ${ZED_DEPLOY_DIR}
}
addtask do_deploy after do_compile
