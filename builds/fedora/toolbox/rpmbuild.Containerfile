ARG FEDORA_VERSION=39

FROM fedora:${FEDORA_VERSION}
COPY . .

ENV TOOLBOX_PATH=/usr/bin/toolbox

RUN set -x \
  \
  && dnf install -y --setopt=install_weak_deps=False \
    rpmdevtools \
    dnf-plugins-core \
    git-core \
    cmake \
    podman \
    bats \
    codespell \
    openssl \
    shellcheck \
    skopeo \
    httpd-tools \
  \
  && mkdir -p $HOME/rpmbuild/ \
  && cd $HOME/rpmbuild \
  && git clone -b f$(rpm -E %fedora) https://src.fedoraproject.org/rpms/toolbox.git SOURCES/ \
  && cd SOURCES \
  && git apply -v /toolbox.spec.patch \
  && cp /toolbox-custom.patch . \
  && spectool -gR toolbox.spec \
  && dnf builddep -y toolbox.spec \
  && rpmbuild -bb toolbox.spec