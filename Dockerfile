FROM alpine:latest

RUN apk add --no-cache curl unzip &&     curl -L -o v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip &&     unzip v2ray.zip -d /v2ray &&     chmod +x /v2ray/v2ray /v2ray/v2ctl &&     mv /v2ray/v2ray /usr/bin/v2ray &&     mv /v2ray/v2ctl /usr/bin/v2ctl

COPY config.json /etc/v2ray/config.json

EXPOSE 443

ENTRYPOINT ["v2ray", "-config", "/etc/v2ray/config.json"]