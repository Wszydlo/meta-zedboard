#! /bin/sh

verity_enabled(){
  return 0
}

verify_sig(){
  echo "Starting root verification!"
  
  mkdir -p /verity
  mount /dev/mmcblk0p3 /verity 

  #TODO: Add if statement to process output
  openssl dgst -sha256 -verify /.verity-key/verity.pub -signature /verity/core-image-minimal.ext4.verity.env.signature /verity/core-image-minimal.ext4.verity.env  
  source /verity/core-image-minimal.ext4.verity.env

}

mount_verity_root(){
  veritysetup open /dev/mmcblk0p2 vroot /dev/mmcblk0p2 --hash-offset $DATA_SIZE $ROOT_HASH
}
verity_run(){
  #TODO: Remove shell entry after initscript is completed  
  /bin/sh
  verify_sig
  
  mount_verity_root
  
}
