IMAGE_INSTALL += "\
	mtd-utils \
	mtd-utils-ubifs \
	libconfig \
	swupdate \
	${@bb.utils.contains('SWUPDATE_INIT', 'tiny', 'virtual/initscripts-swupdate', 'initscripts sysvinit', d)} \
	util-linux-sfdisk \
"
do_copy_artifacts(){
	mkdir -p ${ZEDBOARD_DEPLOY_DIR}
	cp ${DEPLOY_DIR_IMAGE}/${PN}-${MACHINE}.cpio.gz.u-boot ${ZEDBOARD_DEPLOY_DIR}/uramdisk.image.gz
	cp ${DEPLOY_DIR_IMAGE}/${PN}-${MACHINE}.tar.gz ${ZEDBOARD_DEPLOY_DIR}
}

python do_clean_prepend(){
    zedboard_dir = d.getVar("ZEDBOARD_DEPLOY_DIR", expand=True)
    zedboard_rootfs_name = d.getVar("PN", expand=True) + "-" + d.getVar("MACHINE", expand=True) + ".tar.gz"
    oe.path.remove(oe.path.join(zedboard_dir, "uramdisk.image.gz"))
    oe.path.remove(oe.path.join(zedboard_dir, zedboard_rootfs_name))
}
addtask copy_artifacts after do_image_complete before do_build
do_copy_artifacts[nostamp] = "1"
