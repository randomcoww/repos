### RPM build

```bash
BASE=fedora
TAG=39
BRANCH=0.22.2
IMAGE=sunshine:$BASE-$TAG-$BRANCH

mkdir -p tmp
TMPDIR=$(pwd)/tmp podman build \
  --build-arg BASE=$BASE \
  --build-arg TAG=$TAG \
  --build-arg BRANCH=$BRANCH \
  -f Containerfile \
  -t $IMAGE

podman run --rm --user 0 --entrypoint=cp -v $(pwd)/../../../fedora/$TAG:/mnt $IMAGE \
  -a /rpmbuild/. /mnt/
```
