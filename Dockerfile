FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/corazawaf/coraza-caddy

RUN git clone https://github.com/coreruleset/coreruleset /crs

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

COPY --from=builder /crs /crs
