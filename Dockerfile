FROM alpine:latest

RUN apk add --no-cache curl unzip && \
    curl -L -o v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip v2ray.zip -d /v2ray && \
    find /v2ray -name v2ray -exec chmod +x {} \; -exec mv {} /usr/bin/v2ray \; && \
    find /v2ray -name v2ctl -exec chmod +x {} \; -exec mv {} /usr/bin/v2ctl \;

COPY config.json /etc/v2ray/config.json

EXPOSE 443

ENTRYPOINT ["v2ray", "-config", "/etc/v2ray/config.json"]
