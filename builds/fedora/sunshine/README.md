### RPM build

Based on https://github.com/LizardByte/Sunshine/blob/master/docker/fedora-39.dockerfile

- Remove postinst to work with baking into silverblue image.
- Do not enable CUDA. CUDA enabled build does not seem to work on setups which do not have a display directly on the Nvidia GPU ports.

```bash
FEDORA_VERSION=40
BRANCH=master
TAG=sunshine:fedora-$FEDORA_VERSION-$BRANCH

mkdir -p tmp
TMPDIR=$(pwd)/tmp podman build \
  --build-arg TAG=$FEDORA_VERSION \
  --build-arg BRANCH=$BRANCH \
  -f Containerfile \
  -t $TAG

mkdir -p $(pwd)/../../../fedora/$FEDORA_VERSION
podman run --rm --user 0 --entrypoint=cp -v $(pwd)/../../../fedora/$FEDORA_VERSION:/mnt $TAG \
  -a /rpmbuild/. /mnt/
```
