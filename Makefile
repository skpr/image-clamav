#!/usr/bin/make -f

REGISTRY=skpr/clamav
ARCH=amd64

build:
    # Production image.
	docker build -t ${REGISTRY}:${VERSION_TAG}-${ARCH} .
    # Dev image.
	docker build --build-arg FROM_IMAGE=${REGISTRY}:${VERSION_TAG}-${ARCH} -t ${REGISTRY}:dev-${VERSION_TAG}-${ARCH} .

push:
    # Production image.
	docker push ${REGISTRY}:${VERSION_TAG}-${ARCH}
    # Dev image.
	docker push ${REGISTRY}:dev-${VERSION_TAG}-${ARCH}

manifest:
    # Production image.
	docker manifest create ${REGISTRY}:${VERSION_TAG} --amend ${REGISTRY}:${VERSION_TAG}-arm64 --amend ${REGISTRY}:${VERSION_TAG}-amd64
	docker manifest push ${REGISTRY}:${VERSION_TAG}
    # Dev image.
	docker manifest create ${REGISTRY}:dev-${VERSION_TAG} --amend ${REGISTRY}:${VERSION_TAG}-arm64 --amend ${REGISTRY}:${VERSION_TAG}-amd64
	docker manifest push ${REGISTRY}:dev-${VERSION_TAG}

.PHONY: *
