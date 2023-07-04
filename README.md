# Skpr ClamAV Images

Images for building and running cluster-scoped ClamAV images.

## Streams

This image suite provides 2 streams for images:

- `latest` - A stable upstream.
- `edge` - Recently merged changes which will be merged into latest as part of a release.

## Images

### Latest

```
skpr/clamav:v3-latest
```

### Edge

```
skpr/clamav:v3-edge
```

## Building

```
VERSION_TAG=dev make build
```