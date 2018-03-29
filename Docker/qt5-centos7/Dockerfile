FROM dockbuild/centos7-devtoolset4-gcc5:latest

ARG IMAGE
ENV DEFAULT_DOCKCROSS_IMAGE=${IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

ADD qt-installer-noninteractive.qs /usr/src/qt-installer-noninteractive.qs

RUN \
  #
  # Qt dependencies:
  #
  # * https://doc.qt.io/qt-5/linux-requirements.html
  # * https://doc.qt.io/qt-5/supported-platforms-and-configurations.html#qt-5-10
  #
  yum install -y \
    fontconfig \
    freetype \
    glib2 \
    libX11 \
    libxcb \
    libXi \
    libXext \
    libXrender \
    libSM \
    libICE \
    xcb-util-keysyms \
    xcb-util-image \
    libGLU-devel \
    mesa-libOSMesa-devel \
    mesa-libGL-devel \
    mesa-libGLU-devel \
    subversion \
  && \
  #
  # Download and install Qt
  #
  cd /usr/src && \
  curl -LO http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run && \
  chmod u+x qt-unified-linux-x64-online.run && \
  ./qt-unified-linux-x64-online.run --verbose --platform minimal --script ./qt-installer-noninteractive.qs && \
  rm -f qt-installer-noninteractive.qs qt-unified-linux-x64-online.run && \
  #
  # Cleanup unneeded Qt directories and files
  #
  find /opt/qt -maxdepth 1 -type f -exec rm -rf "{}" \; && \
  rm -rf \
    /opt/qt/dist \
    /opt/qt/Docs \
    /opt/qt/Examples \
    /opt/qt/Tools \
  && \
  #
  # Cleanup
  #
  yum clean all

#
# (1) Add Qt root directory to the PATH. This allows CMake command
#     'find_package(Qt5 REQUIRED)` to succeed.
#
# (2) Set env. variable Qt5_DIR to support configuring project
#     by explicitly passing -DQt5_DIR:PATH=${Qt5_DIR}
#
ENV PATH=/opt/qt/5.10.1/gcc_64/:${PATH} \
    Qt5_DIR=/opt/qt/5.10.1/gcc_64/lib/cmake/Qt5

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG IMAGE
ARG VCS_REF
ARG VCS_URL
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name=$IMAGE \
      org.label-schema.description="Base image for slicer/slicer-builds-deps and slicer/slicer-build" \
      org.label-schema.url="http://www.slicer.org" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.schema-version="1.0" \
      maintainer="3D Slicer Community <slicer-devel@bwh.harvard.edu>"
