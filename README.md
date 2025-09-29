# Skpr ClamAV Images

Images for building and running cluster-scoped ClamAV images.

## Streams

This image suite provides 2 streams for images:

* `stable` - Our production/stable upstream for projects. Use this by default.
* `latest` - Recently merged changes which will be merged into `stable` as part of a release.

## Images

Images are available in the following registries:

* `ghcr.io`
* `docker.io`

## Image List

Below is the list of images we provide.

By default we recommend the following registry and stream:

```
REGISTRY=docker.io
STREAM=stable
```

**Stable**

```
REGISTRY/skpr/clamav:v2-STREAM
REGISTRY/skpr/clamav:dev-v2-STREAM
```

## Building Images

Build the images locally using the following command:

```bash
$ make
```
