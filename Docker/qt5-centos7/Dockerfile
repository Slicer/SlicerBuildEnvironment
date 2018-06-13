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
  # * https://doc.qt.io/qt-5/supported-platforms-and-configurations.html#qt-5-11
  #
  # IMPORTANT:
  #
  # * dependencies of Qt5MultimediaGstTools are not installed. These are
  #   "gstreamer1-plugins-good" and "gstreamer1-plugins-base" along with
  #   all video and image codecs.
  #
  yum install -y \
    flex \
    fontconfig \
    freetype \
    glib2 \
    libICE \
    libX11 \
    libxcb \
    libXext \
    libXi \
    libXrender \
    libSM \
    libXt-devel \
    libGLU-devel \
    mesa-libOSMesa-devel \
    mesa-libGL-devel \
    mesa-libGLU-devel \
    xcb-util-keysyms \
    xcb-util-image \
  && \
  #
  # libQt5WebEngineCore
  # * alsa-lib provides libasound.so.2
  yum install -y \
    alsa-lib \
    libXcomposite \
    libXcursor \
    libXrandr \
    libXtst \
    mesa-libEGL \
  && \
  #
  # libQt5Multimedia
  # * pulseaudio-libs-glib2 provides libpulse-mainloop-glib.so.0
  # * pulseaudio-libs provides libpulse.so.0
  #
  yum install -y \
    pulseaudio-libs \
    pulseaudio-libs-glib2 \
  && \
  #
  # Slicer dependencies
  #
  yum install -y \
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

# XXX Install https://github.com/dockbuild/ninja-jobserver
#     If it works well, it will be added to the base image.
RUN \
  curl -LO https://github.com/dockbuild/ninja-jobserver/releases/download/v1.8.2-jobserver/ninja-jobserver-linux.zip && \
  unzip ninja-jobserver-linux.zip && \
  mv ninja /usr/local/bin/ninja && \
  rm -f ninja-jobserver-linux.zip

#
# (1) Add Qt root directory to the PATH. This allows CMake command
#     'find_package(Qt5 REQUIRED)` to succeed.
#
# (2) Set env. variable Qt5_DIR to support configuring project
#     by explicitly passing -DQt5_DIR:PATH=${Qt5_DIR}
#
ENV PATH=/opt/qt/5.11.0/gcc_64/:${PATH} \
    Qt5_DIR=/opt/qt/5.11.0/gcc_64/lib/cmake/Qt5

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
