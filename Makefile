#!/usr/bin/make -f

REGISTRY=skpr/clamav
ARCH=amd64

build:
	$(eval IMAGE=${REGISTRY}:${VERSION_TAG})
	docker build -t ${IMAGE}-${ARCH} .

push:
	$(eval IMAGE=${REGISTRY}:${VERSION_TAG})
	docker push ${IMAGE}-${ARCH}

manifest:
	$(eval IMAGE=${REGISTRY}:${VERSION_TAG})
	docker manifest create ${IMAGE} --amend ${IMAGE}-arm64 --amend ${IMAGE}-amd64
	docker manifest push ${IMAGE}

.PHONY: *
