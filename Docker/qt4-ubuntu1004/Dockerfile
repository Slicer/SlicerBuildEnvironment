FROM dockbuild/ubuntu1004-gcc4:latest

ARG IMAGE
ARG QT_INSTALL_DIR=/usr/src/qt-install
ENV DEFAULT_DOCKCROSS_IMAGE=${IMAGE} \
    PATH=${QT_INSTALL_DIR}/bin:${PATH}

ARG DEBIAN_FRONTEND=noninteractive

RUN \
  apt-get update && \
  #
  # Qt dependencies: https://doc.qt.io/archives/qt-4.8/requirements-x11.html
  #
  apt-get install -y \
    libfontconfig-dev \
    libfreetype6-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libncurses5-dev \
    libosmesa6-dev \
    libx11-dev \
    libxcursor-dev \
    libxext-dev \
    libxfixes-dev \
    libxft-dev \
    libxi-dev \
    libxrandr-dev \
    libxrender-dev \
    libxt-dev \
  && \
  #
  # This will download, then build zlib and openssl in the current folder
  #
  cd /usr/src && \
  curl -LO https://gist.githubusercontent.com/jcfr/9513568/raw/4a458588f68caeca18abc2c399666f928ee44f09/get-and-build-openssl-for-slicer.sh && \
  chmod u+x get-and-build-openssl-for-slicer.sh && \
  ./get-and-build-openssl-for-slicer.sh && \
  rm -f get-and-build-openssl-for-slicer.sh && \
  #
  # Download Qt sources
  #
  cd /usr/src && \
  QT_ROOT=qt-everywhere-opensource-src-4.8.6 && \
  curl -LO http://packages.kitware.com/download/item/6175/${QT_ROOT}.tar.gz && \
  echo "2edbe4d6c2eff33ef91732602f3518eb  ${QT_ROOT}.tar.gz" > ${QT_ROOT}.tar.gz.md5 && \
  md5sum -c ${QT_ROOT}.tar.gz.md5 && \
  tar -xzvf ${QT_ROOT}.tar.gz && \
  rm -f ${QT_ROOT}.tar.gz && \
  rm -f ${QT_ROOT}.tar.gz.md5 && \
  QT_SRC_DIR=/usr/src/qt-everywhere-opensource-release-src-4.8.6 && \
  mv ${QT_ROOT} ${QT_SRC_DIR} && \
  #
  # Build Qt
  #
  cd /usr/src && \
  mkdir ${QT_INSTALL_DIR} && \
  cd ${QT_SRC_DIR} && \
  ./configure -prefix ${QT_INSTALL_DIR} \
                     -release \
                     -opensource -confirm-license \
                     -no-qt3support \
                     -webkit \
                     -nomake examples -nomake demos \
                     -openssl -I /usr/src/openssl-1.0.1h/include   -L /usr/src/openssl-1.0.1h/lib \
  && \
  make -j7 && \
  make install && \
  rm -rf ${QT_SRC_DIR} && \
  rm -rf ${QT_INSTALL_DIR}/q3porting.xml && \
  rm -rf ${QT_INSTALL_DIR}/demos && \
  rm -rf ${QT_INSTALL_DIR}/doc && \
  rm -rf ${QT_INSTALL_DIR}/examples && \
  rm -rf ${QT_INSTALL_DIR}/phrasebooks && \
  rm -rf ${QT_INSTALL_DIR}/tests && \
  rm -rf ${QT_INSTALL_DIR}/translations && \
  #
  # cleanup
  #
  rm -rf /var/lib/apt/lists/* && \
  mkdir /var/lib/apt/lists/partial

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name=$IMAGE \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.schema-version="1.0" \
      maintainer="3D Slicer Community <slicer-devel@bwh.harvard.edu>"
