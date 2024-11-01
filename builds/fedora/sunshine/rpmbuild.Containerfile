ARG FEDORA_VERSION=39

FROM fedora:$FEDORA_VERSION AS BUILD
ARG VERSION

RUN <<_BUILD
#!/bin/bash
set -xe

dnf install -y --setopt=install_weak_deps=False \
 git-core

git clone -b v$VERSION --recurse-submodules https://github.com/LizardByte/Sunshine.git sunshine
cd sunshine

chmod +x ./scripts/linux_build.sh
./scripts/linux_build.sh \
  --publisher-name='LizardByte' \
  --publisher-website='https://app.lizardbyte.dev' \
  --publisher-issue-url='https://app.lizardbyte.dev/support' \
  --sudo-off
dnf clean all
rm -rf /var/cache/yum

mkdir -p /root/rpmbuild/RPMS/$(arch)
mv build/cpack_artifacts/Sunshine.rpm \
  /root/rpmbuild/RPMS/$(arch)/sunshine-$VERSION.fc$(rpm -E %fedora).$(arch).rpm
_BUILD

FROM alpine:edge
COPY --from=BUILD /root/rpmbuild /root/rpmbuild