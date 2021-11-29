FROM dockbuild/ubuntu2010-gcc10

ARG IMAGE
ENV DEFAULT_DOCKCROSS_IMAGE=${IMAGE}

ARG QT_ACCOUNT_LOGIN
ARG QT_ACCOUNT_PASSWORD

ARG DEBIAN_FRONTEND=noninteractive

RUN \
    apt-get update

RUN \
    apt-get install -y \
    libxcomposite1 \
    libxcb-glx0 \
    libx11-xcb1 \
    libxrender1 \
    libxkbcommon-x11-0 \
    libxt-dev \
    libfontconfig1 \
    libdbus-1-3 \
    libwayland-cursor0 \
    libgl1 \
    libgl-dev \
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
      qt.qt5.5151.gcc_64 \
      qt.qt5.5151.qtscript \
      qt.qt5.5151.qtscript.gcc_64 \
      qt.qt5.5151.qtwebengine \
      qt.qt5.5151.qtwebengine.gcc_64\
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
  find /opt/qt/5.15.1/gcc_64/bin -type f -executable -exec strip {} \; && \
  rm -rf \
    /opt/qt/dist \
    /opt/qt/Docs \
    /opt/qt/Examples \
    /opt/qt/Tools \
  && \
  #
  # Cleanup
  #
  apt-get clean

#
# (1) Add Qt root directory to the PATH. This allows CMake command
#     'find_package(Qt5 REQUIRED)` to succeed.
#
# (2) Set env. variable Qt5_DIR to support configuring project
#     by explicitly passing -DQt5_DIR:PATH=${Qt5_DIR}
#
ENV PATH=/opt/qt/5.15.1/gcc_64/:${PATH} \
    Qt5_DIR=/opt/qt/5.15.1/gcc_64/lib/cmake/Qt5

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
