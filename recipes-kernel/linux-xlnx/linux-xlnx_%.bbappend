do_compile:append(){
	cp ${DEPLOY_DIR_IMAGE}/u-boot-unsigned.dtb ${STAGING_DATADIR}/u-boot.dtb
	cp ${DEPLOY_DIR_IMAGE}/u-boot-unsigned.dtb ${B}/u-boot-${MACHINE}.dtb
}

# sign u-boot and populate signed dtb
do_deploy:append(){
	cp ${B}/u-boot.dtb ${DEPLOYDIR}/u-boot-signed.dtb
	cp ${DEPLOY_DIR_IMAGE}/u-boot-nodtb.bin ${DEPLOYDIR}/u-boot-signed.bin
	cat ${DEPLOYDIR}/u-boot-signed.dtb >> ${DEPLOYDIR}/u-boot-signed.bin
}
DEPENDS += "u-boot"
