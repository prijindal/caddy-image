FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/pteich/caddy-tlsconsul \
    --with github.com/mholt/caddy-grpc-web \
    --with github.com/sillygod/cdp-cache/extends/distributed

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
