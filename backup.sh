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
none)
  EXTENSION=""
  ;;
*)
  echo "Unknown compressor"
  exit 1
  ;;
esac

if test "${EXTENSION}" != ''; then
  FILENAME=$(date +%Y-%m-%d_%H-%M-%S)_${NAME}.tar.${EXTENSION}

  tar -c -${COMPRESSOR:-J} ${TAR_OPTIONS} -f $FILENAME -C /backup .

  ls -lah *.tar*

  s3cmd ${S3CMD_OPTIONS} --verbose --progress put $FILENAME  s3://${S3_PATH}/
else
  cd /backup
  s3cmd ${S3CMD_OPTIONS} --verbose --progress sync . s3://${S3_PATH}/
fi

