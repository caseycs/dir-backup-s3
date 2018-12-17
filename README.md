# dir-backup-s3

Docker image to backup directory to S3 via [s3cmd](https://github.com/s3tools/s3cmd)

## Motivation

Useful to backup host machine directory or docker volume.
 
You can run it via crontab or even jenkins (with `build periodically`).

## Usage example

For Amazon S3:

```
docker run --rm \
  -v /path/to/backups/locally:/backup \
  -e NAME=<compressed-file-name> \
  -e AWS_ACCESS_KEY=xxx \
  -e AWS_SECRET_KEY=xxx \
  -e S3_PATH=<bucket-name>/<directory-for-backups> \
  freefly19/dir-backup-s3
```

For DigitalOcean Spaces:

```
docker run --rm \
  -v /path/to/backups/locally:/backup \
  -e NAME=<compressed-file-name> \
  -e AWS_ACCESS_KEY=xxx \
  -e AWS_SECRET_KEY=xxx \
  -e S3_PATH=<bucket-name>/<directory-for-backups> \
  -e S3CMD_OPTIONS="--host=ams3.digitaloceanspaces.com --host-bucket=$(bucket).ams3.digitaloceanspaces.com" \
  freefly19/dir-backup-s3
```

## Compression options

You can specify compressor via `COMPRESSOR` variable, `J` (`xz`) is used by default:

```
z	compress using gzip
J	compress using xz
j	compress using bzip2
a	compress using lzma
none	copy dir content without compressing
```

You can define gzip compression options via environment variable, for example: `-e GZIP=-9`
