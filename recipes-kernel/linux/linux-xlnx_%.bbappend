do_copy_artifacts(){
	mkdir -p ${ZEDBOARD_DEPLOY_DIR}
	cp ${DEPLOY_DIR_IMAGE}/uImage ${ZEDBOARD_DEPLOY_DIR}
	cp ${DEPLOY_DIR_IMAGE}/zynq-zed.dtb ${ZEDBOARD_DEPLOY_DIR}
}

python do_clean_prepend(){
    zedboard_dir = d.getVar("ZEDBOARD_DEPLOY_DIR", expand=True)
    oe.path.remove(oe.path.join(zedboard_dir, "uImage"))
    oe.path.remove(oe.path.join(zedboard_dir, "zynq-zed.dtb"))
}
addtask copy_artifacts after do_deploy before do_build
do_copy_artifacts[nostamp] = "1"
