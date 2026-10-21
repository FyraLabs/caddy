FROM caddy:2.11.6-builder AS builder

RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    xcaddy build \
    --with github.com/pberkel/caddy-storage-redis@v1.8.2

FROM caddy:2.11.7

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
