# Skpr ClamAV Images

Images for building and running cluster-scoped ClamAV images.

## Streams

This image suite provides 2 streams for images:

- `latest` - A stable upstream.
- `edge` - Recently merged changes which will be merged into latest as part of a release.

## Images

### Latest

```
skpr/clamav:latest-v2-latest-amd64
skpr/clamav:latest-v2-latest-arm64
```

### Edge

```
skpr/clamav:latest-v2-edge-amd64
skpr/clamav:latest-v2-edge-arm64
```

## Building

```
VERSION_TAG=dev make build
```