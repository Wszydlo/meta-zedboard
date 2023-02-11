do_copy_artifacts(){
	mkdir -p ${ZEDBOARD_DEPLOY_DIR}
    cp ${DEPLOY_DIR_IMAGE}/boot.scr ${ZEDBOARD_DEPLOY_DIR}
    cp ${DEPLOY_DIR_IMAGE}/boot.bin ${ZEDBOARD_DEPLOY_DIR}
    cp ${DEPLOY_DIR_IMAGE}/u-boot.img ${ZEDBOARD_DEPLOY_DIR}
    cp ${DEPLOY_DIR_IMAGE}/uEnv.txt ${ZEDBOARD_DEPLOY_DIR}
}

python do_clean_prepend(){
    zedboard_dir = d.getVar("ZEDBOARD_DEPLOY_DIR", expand=True)
    oe.path.remove(oe.path.join(zedboard_dir, "boot.bin"))
    oe.path.remove(oe.path.join(zedboard_dir, "boot.scr"))
    oe.path.remove(oe.path.join(zedboard_dir, "u-boot.img"))
    oe.path.remove(oe.path.join(zedboard_dir, "uEnv.txt"))
}
addtask copy_artifacts after do_deploy before do_build
do_copy_artifacts[nostamp] = "1"
