### RPM build

```bash
FEDORA_VERSION=39
ARCH=x86_64
TAG=docker.io/lizardbyte/sunshine:nightly-fedora-$FEDORA_VERSION

podman run --rm --user 0 --entrypoint=cp -v $(pwd)/../../../fedora/$FEDORA_VERSION:/mnt $TAG \
  -a /sunshine.rpm /mnt/$ARCH/sunshine.fc$FEDORA_VERSION.$ARCH.rpm
```
