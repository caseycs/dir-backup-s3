FROM alpine:latest

RUN set -ex \
    && apk add --no-cache py-pip xz \
    && pip install s3cmd

ADD backup.sh /

CMD ["/backup.sh"]
