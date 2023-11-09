# otel-cli with TLS certificates

Image of the [otel-cli](https://github.com/equinix-labs/otel-cli) binary with support for certificates.

This image allows you to quickly send test spans in a Kubernetes cluster or Docker environment with a single command.

### Usage with ServiceNow Cloud Observability on Kubernetes

Replace `...` with the [access token](https://docs.lightstep.com/docs/create-and-manage-access-tokens#create-an-access-token) for your Cloud Observability project.

`otel-cli` has no output if successful. A span will appear in your project after a few minutes. 

Check logs (`kubectl logs otel-cli`) for errors.

```
kubectl run otel-cli \
    --image=ghcr.io/lightstep/otel-cli-with-certs:latest \
    --env "OTEL_EXPORTER_OTLP_ENDPOINT=ingest.lightstep.com:443" \
    --env 'OTEL_EXPORTER_OTLP_HEADERS="lightstep-access-token=..."' \
    --command -- ./otel-cli span --verbose -n testing -s k8s_span
```

### Usage with ServiceNow Cloud Observability with Docker

Replace `...` with the access token for your Cloud Observability project.

```
docker run --name otel-cli-with-certs --rm \
    -e OTEL_EXPORTER_OTLP_ENDPOINT=ingest.lightstep.com:443 \
    -e OTEL_EXPORTER_OTLP_HEADERS="lightstep-access-token=..." \
    ghcr.io/lightstep/otel-cli-with-certs \
    span --verbose -n testing -s docker_span
```
