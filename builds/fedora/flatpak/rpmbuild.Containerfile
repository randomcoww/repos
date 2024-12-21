ARG FEDORA_VERSION

FROM fedora:$FEDORA_VERSION

RUN set -x \
  \
  && dnf install -y --setopt=install_weak_deps=False \
    rpmdevtools \
    dnf-plugins-core \
    git \
  \
  && mkdir -p $HOME/rpmbuild/ \
  && cd $HOME/rpmbuild \
  && git clone -b f$(rpm -E %fedora) https://src.fedoraproject.org/rpms/flatpak.git SOURCES/ \
  && cd SOURCES \
  && spectool -gR flatpak.spec \
  && dnf builddep -y flatpak.spec \
  && rpmbuild -bb flatpak.spec \
    --without malcontent