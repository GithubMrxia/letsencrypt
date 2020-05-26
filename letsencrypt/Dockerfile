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
    && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget -O glibc.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-2.31-r0.apk \
    && apk add --no-cache glibc.apk \
    && rm -rf glibc.apk \
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
