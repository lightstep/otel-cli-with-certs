FROM alpine:3.14

WORKDIR /app

RUN apk --no-cache add ca-certificates \
  && update-ca-certificates
RUN apk add --no-cache curl

RUN curl -OL https://github.com/equinix-labs/otel-cli/releases/download/v0.4.1/otel-cli_0.4.1_linux_amd64.tar.gz
RUN tar xzvf otel-cli_0.4.1_linux_amd64.tar.gz

ENTRYPOINT ["/app/otel-cli"]