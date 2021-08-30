FROM dockbuild/centos7-devtoolset4-gcc5:latest

ARG IMAGE
ENV DEFAULT_DOCKCROSS_IMAGE=${IMAGE}
ENV DISPLAY=:99
ENV MESA_GL_VERSION_OVERRIDE=3.2

ARG QT_ACCOUNT_LOGIN
ARG QT_ACCOUNT_PASSWORD

ARG DEBIAN_FRONTEND=noninteractive


RUN \
  #
  # Qt dependencies:
  #
  # * https://doc.qt.io/qt-5/linux-requirements.html
  # * https://doc.qt.io/qt-5/supported-platforms-and-configurations.html
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
    libxkbcommon-x11 \
    libXt-devel \
    libGLU-devel \
    mesa-libOSMesa-devel \
    mesa-libGL-devel \
    mesa-libGLU-devel \
    xcb-util-keysyms \
    xcb-util-image \
    xcb-util-wm \
    xcb-util-renderutil \
  && \
  #
  # Dependencies of Qt installer qt-unified-linux-x64-online.run
  yum install -y \
    libwayland-cursor \
  && \
  
  # Dependencies of Xvfb GLX environment
  yum install -y \
    xorg-x11-server-Xvfb \
    xorg-x11-server-Xorg \
    mesa-dri-drivers \
    glx-utils\
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
  # SlicerJupyter dependencies
  #
  yum install -y \
    libuuid-devel \
  && \
  #
  # Download and install Qt: new Qt installer 4.0 CLI interface
  #
  cd /usr/src && \
  curl -LO http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run && \
  chmod u+x qt-unified-linux-x64-online.run && \
  # See CLI parameters here: https://wiki.qt.io/Online_Installer_4.x
  ./qt-unified-linux-x64-online.run \
    install \
      qt.qt5.5152.gcc_64 \
      qt.qt5.5152.qtscript \
      qt.qt5.5152.qtscript.gcc_64 \
      qt.qt5.5152.qtwebengine \
      qt.qt5.5152.qtwebengine.gcc_64\
    --root /opt/qt \
    --email ${QT_ACCOUNT_LOGIN} \
    --pw ${QT_ACCOUNT_PASSWORD} \
    --verbose \
    --platform minimal \
    --accept-licenses \
    --accept-obligations \
    --confirm-command \
    --auto-answer telemetry-question=No,AssociateCommonFiletypes=No,installationErrorWithCancel=Ignore,OverwriteTargetDirectory=No &&\
  rm -f qt-unified-linux-x64-online.run && \
  # Cleanup
  #
  find /opt/qt -maxdepth 1 -type f -exec rm -rf "{}" \; && \
  find /opt/qt -type f -name "*.debug" -delete && \
  find /opt/qt/5.15.2/gcc_64/bin -type f -executable -exec strip {} \; && \
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
ENV PATH=/opt/qt/5.15.2/gcc_64/:${PATH} \
    Qt5_DIR=/opt/qt/5.15.2/gcc_64/lib/cmake/Qt5

#Copy in new entrypoint
COPY entrypoint.sh /dockcross/

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
