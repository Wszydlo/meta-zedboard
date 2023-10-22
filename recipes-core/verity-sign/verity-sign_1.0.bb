LICENSE = "CLOSED"
SRC_URI += "file://verity.pem"

DEPENDS = "core-image-minimal openssl-native"

do_configure(){
  #Sign environment for core-image-minimal
  openssl  dgst -sha256 -sign ${WORKDIR}/verity.pem -out ${DEPLOY_DIR_IMAGE}/dm-verity/core-image-minimal.ext4.verity.env.signature ${DEPLOY_DIR_IMAGE}/dm-verity/core-image-minimal.ext4.verity.env
}

do_configure[depends] += "core-image-minimal:do_build"
