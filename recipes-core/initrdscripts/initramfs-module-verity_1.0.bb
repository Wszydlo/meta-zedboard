SUMMARY = "initramfs-framework module for root verity check"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

SRC_URI = "file://verity.sh"

S = "${WORKDIR}"

inherit allarch

do_install() {
    install -d ${D}/init.d
    install -m 0755 ${WORKDIR}/verity.sh ${D}/init.d/01-verity
}

FILES:${PN} = "/init.d/01-verity"

