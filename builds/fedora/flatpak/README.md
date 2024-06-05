### RPM build

Build without malcontent

```bash
FEDORA_VERSION=39
TAG=flatpak:latest

mkdir -p tmp
TMPDIR=$(pwd)/tmp podman build \
  --build-arg FEDORA_VERSION=$FEDORA_VERSION \
  -f rpmbuild.Containerfile \
  -t $TAG

podman run --rm -v $(pwd)/../../../fedora/$FEDORA_VERSION:/mnt $TAG \
  cp -a /root/rpmbuild/RPMS/. /mnt/
```
