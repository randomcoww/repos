### RPM build

Build without malcontent (no dbus dependency)

```bash
FEDORA_VERSION=41
TARGETARCH=amd64
TAG=flatpak:latest

podman build \
  --arch $TARGETARCH \
  --build-arg FEDORA_VERSION=$FEDORA_VERSION \
  -f rpmbuild.Containerfile \
  -t $TAG

mkdir -p $(pwd)/../../../fedora/$FEDORA_VERSION
podman run --rm -v $(pwd)/../../../fedora/$FEDORA_VERSION:/mnt $TAG \
  cp -a /root/rpmbuild/RPMS/. /mnt/
```
