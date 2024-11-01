### RPM build

```bash
FEDORA_VERSION=40
TARGETARCH=amd64
VERSION=2024.1031.235235
TAG=sunshine:$VERSION

podman build \
  --arch $TARGETARCH \
  --build-arg FEDORA_VERSION=$FEDORA_VERSION \
  --build-arg VERSION=$VERSION \
  -f rpmbuild.Containerfile \
  -t $TAG

mkdir -p $(pwd)/../../../fedora/$FEDORA_VERSION
podman run --rm -v $(pwd)/../../../fedora/$FEDORA_VERSION:/mnt $TAG \
  cp -a /root/rpmbuild/RPMS/. /mnt/
```
