#!/usr/bin/make -f

REGISTRY=skpr/clamav
VERSION_TAG=v2-latest
ARCH=amd64

build:
	$(eval IMAGE=${REGISTRY}:latest-${VERSION_TAG})
	docker build -t ${IMAGE}-${ARCH} dev/

push:
	$(eval IMAGE=${REGISTRY}:latest-${VERSION_TAG})
	docker push ${IMAGE}-${ARCH}

manifest:
	$(eval IMAGE=${REGISTRY}:latest-${VERSION_TAG})
	docker manifest create ${IMAGE} --amend ${IMAGE}-arm64 --amend ${IMAGE}-amd64
	docker manifest push ${IMAGE}

.PHONY: *
