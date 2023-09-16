#!/bin/bash
set -eu

# Repository Login
echo "### login to docker.io ###"
podman login docker.io

echo -e "\n### login to quay.io ###"
podman login quay.io

export TAG=jekyll
export DOCKER=docker.io/tnk4on/${TAG}
export QUAY=quay.io/tnk4on/${TAG}

# Build multi-arch images
echo -e "\n### Build multi-arch images ###"
for ARCH in amd64 arm64
do
    echo -e "\n### podman build -t ${TAG}:${ARCH} --platform linux/${ARCH} --manifest ${TAG} . ###"
    podman build -t ${TAG}:${ARCH} --platform linux/${ARCH} --manifest ${TAG} --jobs 10 .
done

#echo -e "\n### podman tag ${TAG} ${TAG}:${VERSION} ###"
#podman tag ${TAG} ${TAG}:${VERSION}

# Test
echo -e "\n### Test ###"
for ARCH in amd64 arm64
do
    echo -e "\n### podman run --rm ${TAG}:${ARCH} jekyll -v ###"
    podman run --rm ${TAG}:${ARCH} jekyll -v
done

# Push
## Docker.io
echo -e "\n### push to docker.io ###"
podman manifest push --all ${TAG} docker://${DOCKER} -f docker
podman manifest push --all ${TAG}:${VERSION} docker://${DOCKER}:${VERSION} -f docker

### Quay.io
echo -e "\n### push to quay.io ###"
podman manifest push --all ${TAG} docker://${QUAY} -f oci