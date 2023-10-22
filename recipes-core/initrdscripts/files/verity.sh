#! /bin/sh

verity_enabled(){
  return 0
}

verify_sig(){
  echo "Starting root verification!"
  
  mkdir -p /verity
  mount /dev/mmcblk0p3 /verity 

  if [ "$(openssl dgst -sha256 -verify /.verity-key/verity.pub -signature /verity/core-image-minimal.ext4.verity.env.signature /verity/core-image-minimal.ext4.verity.env)" == "Verified OK" ]; then
    source /verity/core-image-minimal.ext4.verity.env
  else
    echo "Corrupted env file for verity rootfs!"
    exit 1
  fi

}

mount_verity_root(){
  veritysetup --data-block-size=1024 --hash-offset=$DATA_SIZE create vroot /dev/mmcblk0p2 /dev/mmcblk0p2 $ROOT_HASH
  mkdir -p /new_root
  mount -o ro /dev/mapper/vroot /new_root
  exec switch_root /new_root /sbin/init
}

verity_run(){
  verify_sig
  mount_verity_root
}
