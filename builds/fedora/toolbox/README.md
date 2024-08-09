### RPM build

Build without host network and resolvconf symlink

```bash
FEDORA_VERSION=40
TAG=toolbox:latest

mkdir -p tmp
TMPDIR=$(pwd)/tmp podman build \
  --build-arg FEDORA_VERSION=$FEDORA_VERSION \
  -f rpmbuild.Containerfile \
  -t $TAG

mkdir -p $(pwd)/../../../fedora/$FEDORA_VERSION
podman run --rm -v $(pwd)/../../../fedora/$FEDORA_VERSION:/mnt $TAG \
  cp -a /root/rpmbuild/RPMS/. /mnt/
```
