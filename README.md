# dir-backup-s3

Docker image to backup directory to S3 via [s3cmd](https://github.com/s3tools/s3cmd)

## Motivation

Useful to backup host machine directory or docker volume.
 
You can run it via crontab or even jenkins (with `build periodically`).

## Usage example

```
docker run --rm \
  -v $(pwd):/backup
  -e NAME=backup-name \
  -e AWS_ACCESS_KEY=xxx \
  -e AWS_SECRET_KEY=xxx \
  -e S3_PATH=bucket/directory \
  caseycs/dir-backup-s3
```

You can specify compressor via `COMPRESSOR` variable, `J` (`xz`) is used by default:

```
z	(De)compress using gzip
J	(De)compress using xz
j	(De)compress using bzip2
a	(De)compress using lzma
```

Hint: you can define gzip compression options via environment variable, for example: `-e GZIP=-9`
