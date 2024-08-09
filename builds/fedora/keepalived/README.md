### RPM build

Build with nft, without snmp

```bash
FEDORA_VERSION=40
TAG=keepalived:latest

mkdir -p tmp
TMPDIR=$(pwd)/tmp podman build \
  --build-arg FEDORA_VERSION=$FEDORA_VERSION \
  -f rpmbuild.Containerfile \
  -t $TAG

mkdir -p $(pwd)/../../../fedora/$FEDORA_VERSION
podman run --rm -v $(pwd)/../../../fedora/$FEDORA_VERSION:/mnt $TAG \
  cp -a /root/rpmbuild/RPMS/. /mnt/
```
