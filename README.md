# otel-cli with TLS certificates

Image of the [otel-cli](https://github.com/equinix-labs/otel-cli) binary with support for certificates.

This image allows you to quickly send test spans in a Kubernetes cluster or Docker environment with a single command.

### Usage with ServiceNow Cloud Observability on Kubernetes

```
kubectl run otel-cli \
    --image=ghcr.io/lightstep/otel-cli-with-certs:latest \
    --env "OTEL_EXPORTER_OTLP_ENDPOINT=ingest.lightstep.com:443" \
    --env 'OTEL_EXPORTER_OTLP_HEADERS="lightstep-access-token=..."' \
    --command -- ./otel-cli span --verbose -n testing -s k8s_span
```

### Usage with ServiceNow Cloud Observability with Docker

```
docker run --name otel-cli-with-certs --rm \
    -e OTEL_EXPORTER_OTLP_ENDPOINT=ingest.lightstep.com:443 \
    -e OTEL_EXPORTER_OTLP_HEADERS="lightstep-access-token=..." \
    ghcr.io/lightstep/otel-cli-with-certs \
    span --verbose -n testing -s docker_span
```
