FROM alpine:latest

RUN apk add --no-cache curl

RUN curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 \
    -o /usr/local/bin/cloudflared \
 && chmod +x /usr/local/bin/cloudflared

CMD ["cloudflared", "tunnel", "--no-autoupdate", "run", "--token", "${TUNNEL_TOKEN}"]
