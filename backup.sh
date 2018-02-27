#!/usr/bin/env sh
set -ex

FILENAME=$(date +%Y-%m-%d_%H-%M-%S)_${NAME}.tar.xz

tar -vc${COMPRESSOR:-J}f $FILENAME -C /backup .

ls -lah *.xz

s3cmd put --verbose --progress $FILENAME s3://${S3_PATH}/
