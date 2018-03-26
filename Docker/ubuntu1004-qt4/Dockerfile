FROM dockbuild/ubuntu1004:latest

ENV DEFAULT_DOCKCROSS_IMAGE=slicer/buildenv:ubuntu1004-qt4

ARG DEBIAN_FRONTEND=noninteractive

RUN \
  apt-get update && \
  apt-get install -y \
    #
    # Qt dependencies: https://doc.qt.io/archives/qt-4.8/requirements-x11.html
    #
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
  rm -f get-and-build-openssl-for-slicer.sh && \
  curl -LO https://gist.githubusercontent.com/jcfr/9513568/raw/21f4e4cabca5ad03435ecc17ab546dab5e2c1a2f/get-and-build-openssl-for-slicer.sh  && \
  chmod u+x get-and-build-openssl-for-slicer.sh  && \
  ./get-and-build-openssl-for-slicer.sh && \
  rm -rf zlib && \
  rm -rf zlib-build && \
  rm -rf zlib-install\doc && \
  rm -f openssl-1.0.1e.tar.gz && \
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
  QT_INSTALL_DIR=/usr/src/qt-everywhere-opensource-release-build-4.8.6 && \
  mkdir ${QT_INSTALL_DIR} && \
  cd ${QT_SRC_DIR} && \
  ./configure -prefix ${QT_INSTALL_DIR} \
                     -release \
                     -opensource -confirm-license \
                     -no-qt3support \
                     -webkit \
                     -nomake examples -nomake demos \
                     -openssl -I /usr/src/openssl-1.0.1e/include   -L /usr/src/openssl-1.0.1e \
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
ARG IMAGE
ARG VCS_REF
ARG VCS_URL
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name=$IMAGE \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.schema-version="1.0" \
      maintainer="3D Slicer Community <slicer-devel@bwh.harvard.edu>"
