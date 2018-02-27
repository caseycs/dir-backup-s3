#!/usr/bin/env sh
set -ex

case ${COMPRESSOR:-J} in
a)
  EXTENSION="lzma"
  ;;
j)
  EXTENSION="bz2"
  ;;
J)
  EXTENSION="xz"
  ;;
z)
  EXTENSION="gz"
  ;;
*)
  echo "Unknown compressor"
  exit 1
  ;;
esac

FILENAME=$(date +%Y-%m-%d_%H-%M-%S)_${NAME}.tar.${EXTENSION}

tar -vc${COMPRESSOR:-J}f $FILENAME -C /backup .

ls -lah *.tar*

s3cmd put --verbose --progress $FILENAME s3://${S3_PATH}/
