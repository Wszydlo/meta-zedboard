SUMMARY = "initramfs-framework module for root verity check"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

SRC_URI = " \
  file://verity.sh \
  file://verity.pub \
  "
RDEPENDS:${PN} = "openssl"
S = "${WORKDIR}"

inherit allarch

do_install() {
    install -d ${D}/init.d
    install -m 0755 ${WORKDIR}/verity.sh ${D}/init.d/01-verity

    install -d ${D}/.verity-key
    install -m 0644 ${WORKDIR}/verity.pub ${D}/.verity-key/verity.pub
}

FILES:${PN} = " \
  /init.d/01-verity \
  /.verity-key/verity.pub \
  "

