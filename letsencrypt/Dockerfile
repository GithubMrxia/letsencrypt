FROM alpine:3.9.6

COPY shell/ /root/shell/

RUN set -xe \
    && apk add --no-cache --virtual .build-deps \
    git \
    && apk add --no-cache \
    tzdata \
    bash \
    openssl \
    curl \
    socat \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && mkdir -p /root/cert /root/export_cert /root/shell \
    && git clone https://github.com/acmesh-official/acme.sh.git \
    && cd acme.sh \
    && ./acme.sh --install  \
    --log  /var/log/acme.sh.log\
    --home /root/.acme.sh \
    --certhome  /root/cert \
    && ln -s  /root/.acme.sh/acme.sh /bin/ \
    && rm -rf /acme.sh \
    && chmod +x /root/shell/* \
    && apk del .build-deps

CMD [ "/root/shell/docker-entrypoint.sh", "start"]
