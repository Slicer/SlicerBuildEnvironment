# Slicer Build Environment

> [!WARNING]
> *This project is under active development. Its content, API and behavior
> may change at any time. We mean it.*

## Overview

This project streamlines the continuous integration (CI) and allows
anyone to easily reproduce builds. Currently, it contains only a Docker
directory that itself contain a sub-directory associated with each
available build environment.

```
    SlicerBuildEnvironment
      |
      |--- Docker
              |
              |--- qt5-almalinux8-gcc14
              |          |--- Dockerfile
              |
              |--- qt5-centos7
              |          |--- Dockerfile
              |
              |--- Makefile
```

## Docker-based Environments

Each sub-directory (e.g `qt5-almalinux8-gcc14`) contains a `Dockerfile` allowing
to generate a **reusable** build environment (or docker image). That
build environment includes a version of qt (e.g `qt5`) and is based on a
given operating system (e.g `almalinux8`).

### Supported build environments

#### slicer/buildenv-qt5-centos7:slicer-5.8

[![buildenv-qt5-centos7-slicer-5.8](https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-5.8)](https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-5.8/images/sha256-b21b2cc92cfc11befa7a1d25b9b960ac36b60cda228ffd3101d240034815c539)
Build environment based on Centos7 and including Qt 5.15.2, GCC 7, CMake 3.22.1

#### slicer/buildenv-qt5-centos7:latest

[![buildenv-qt5-centos7-latest](https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7)](https://hub.docker.com/r/slicer/buildenv-qt5-centos7/tags)
Build environment based on Centos7 and including Qt 5.15.2, GCC 7, CMake 3.22.1

#### slicer/buildenv-qt5-almalinux8-gcc14:latest

[![buildenv-qt5-almalinux8-gcc14-latest](https://img.shields.io/docker/image-size/slicer/buildenv-qt5-almalinux8-gcc14)](https://hub.docker.com/r/slicer/buildenv-qt5-almalinux8-gcc14/tags)
Build environment based on AlmaLinux 8 and including Qt 5.15.2, GCC 14, CMake 3.31.8

### Deprecated build environments

<details><summary>Click to expand list of deprecated environments</summary>
<p>

#### slicer/buildenv-qt4-ubuntu1004:latest

[![buildenv-qt4-ubuntu1004-latest](https://img.shields.io/docker/image-size/slicer/buildenv-qt4-ubuntu1004/latest)](https://hub.docker.com/layers/slicer/buildenv-qt4-ubuntu1004/latest/images/sha256-ac7bd0b76a7bb2c071328488474a3cc7770715588f911617d1040c98d0e161db)
Build environment based on Ubuntu 10.04 and including Qt 4.8.6, GCC 4, CMake 3.11.0

#### slicer/buildenv-qt4-centos5:latest

[![buildenv-qt4-centos5-latest](https://img.shields.io/docker/image-size/slicer/buildenv-qt4-centos5/latest)](https://hub.docker.com/layers/slicer/buildenv-qt4-centos5/latest/images/sha256-a87410f2783e50d6ad963ff8d9b26ece86488c725666fb90d7cffea4b013ac07)
Build environment based on Centos5 and including Qt 4.8.7, GCC 4, CMake 3.11.0

#### slicer/buildenv-qt5-centos7:slicer-4.10

[![buildenv-qt5-centos7-slicer-4.10](https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-4.10)](https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-4.10/images/sha256-211f514f00e83bc68f967b10f1727af0c8a8f98d0b8334a376ca2c3ef4e17a18?context=explore)
Build environment based on Centos7 and including Qt 5.11.2, GCC 5, CMake 3.12.1

#### slicer/buildenv-qt5-centos7:slicer-4.11-2018.10.17

[![buildenv-qt5-centos7-slicer-4.11-2018.10.17](https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-4.11-2018.10.17)](https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-4.11-2018.10.17/images/sha256-73551960143845b5f93a4d3f9a7d5fbcacd545a1ef42b6dfbf49746405baa78a)
Build environment based on Centos7 and including Qt 5.11.2, GCC 5, CMake 3.13.4

#### slicer/buildenv-qt5-centos7:slicer-4.11-2020.05.27

[![buildenv-qt5-centos7-slicer-4.11-2020.05.27](https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-4.11-2020.05.27)](https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-4.12.8-2020.05.27/images/sha256-c8e3cde0bd73c1f97a8209b73f91c839ee31b2d0f098598db0e41be73caa7f70)
Build environment based on Centos7 and including Qt 5.12.8, GCC 5, CMake 3.17.1

#### slicer/buildenv-qt5-centos7:slicer-4.11-2020.09.30

[![buildenv-qt5-centos7-slicer-4.11-2020.09.30](https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-4.11-2020.09.30)](https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-4.11-2020.09.30/images/sha256-ee8da10829b5812bf774f7c2d3d9d39b1d693e62edbc732e258143c6c7bcc5bc)
Build environment based on Centos7 and including Qt 5.15.1, GCC 5, CMake 3.17.1

#### slicer/buildenv-qt5-centos7:slicer-4.11-2021.02.26
[![buildenv-qt5-centos7-slicer-4.11-2021.02.26](https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-4.11-2021.02.26)](https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-4.11-2021.02.26/images/sha256-1dbf78284b996936c47bdba2c83ec013f2e081387455604f2b6d967366f3bf49)
Build environment based on Centos7 and including Qt 5.15.1, GCC 5, CMake 3.17.1

#### slicer/buildenv-qt5-centos7:slicer-4.13-2021.10.07

[![buildenv-qt5-centos7-slicer-4.13-2021.10.07](https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-4.13-2021.10.07)](https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-4.13-2021.10.07/images/sha256-c719f3beedebda6f0ac21ed899a29a1ea94fcf34b08e58f19d49888a992ba7f7)
Build environment based on Centos7 and including Qt 5.15.2, GCC 5, CMake 3.17.1

#### slicer/buildenv-qt5-centos7:slicer-4.13-2022.01.20

[![buildenv-qt5-centos7-slicer-4.13-2022.01.20](https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-4.13-2022.01.20)](https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-4.13-2022.01.20/images/sha256-18ccdac87076803267630401e675c5829b54ba763596303668f4d8e65f4bdd14)
Build environment based on Centos7 and including Qt 5.15.2, GCC 7, CMake 3.17.1

#### slicer/buildenv-qt5-centos7:slicer-5.0
[![buildenv-qt5-centos7-slicer-5.0](https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-5.0)](https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-5.0/images/sha256-57815be03a002b2a47307ce26ef55f0f5955cb76df0605e42d375ff4090d2f68)
Build environment based on Centos7 and including Qt 5.15.2, GCC 7, CMake 3.22.1

#### slicer/buildenv-qt5-centos7:slicer-5.2

[![buildenv-qt5-centos7-slicer-5.2](https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-5.2)](https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-5.2/images/sha256-db01ca96b763213fc662dcb47225f745faaa305afb21de859a34507ee0ff6e21)
Build environment based on Centos7 and including Qt 5.15.2, GCC 7, CMake 3.22.1

#### slicer/buildenv-qt5-centos7:slicer-5.4

[![buildenv-qt5-centos7-slicer-5.4](https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-5.4)](https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-5.4/images/sha256-8ba0c4bf3cd458883652b69d61c2e82d804283a26d260e731bb5b81963ee3f87)
Build environment based on Centos7 and including Qt 5.15.2, GCC 7, CMake 3.22.1

#### slicer/buildenv-qt5-centos7:slicer-5.6

[![buildenv-qt5-centos7-slicer-5.6](https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-5.6)](https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-5.6/images/sha256-b21b2cc92cfc11befa7a1d25b9b960ac36b60cda228ffd3101d240034815c539)
Build environment based on Centos7 and including Qt 5.15.2, GCC 7, CMake 3.22.1

</p>
</details> 

### dockbuild

The interesting part is that the recipe associated with each
SlicerBuildEnvironment image is only responsible to install (or build)
Qt, the remaining of the tools forming the complete compiling
environment are provided by some other base images provided by the
**dockbuild** project.

[dockbuild](https://github.com/dockbuild/dockbuild#readme) is a project
responsible to create base docker image that includes a **tested**
compiling environment, latest git version, cmake, ninja, python 3 and
openssh-client. And also a convenience entrypoint allowing to
automatically mount the current working directory into the image.

dockbuild was itself inspired by
[dockcross](https://github.com/dockcross/dockcross), a collection of
docker image providing cross-compiling environment. It even re-use the
same tests and entrypoint script.

## Tutorials

### How to download an existing docker image ?

To download the latest version of the `qt5-centos7` image:

  ```bash
  docker pull slicer/buildenv-qt5-centos7:latest
  ```

### How to install a docker based environment ?

This image does not need to be run manually. Instead, there is a helper
script to execute build commands on source code existing on the local
host filesystem. This script is bundled with the image.

To install the helper script, run one of the images with no arguments,
and redirect the output to a file:

  ```bash
  env_name=ENV_NAME
  script=~/bin/slicer-buildenv-${env_name}
  docker run --rm slicer/buildenv-${env_name} > $script chmod +x
  $script
  ```

For example, to install the script associated with the latest `qt5-centos7` images:

  ```bash
  env_name=qt5-centos7
  script=~/bin/slicer-buildenv-${env_name}
  docker run --rm slicer/buildenv-${env_name} > $script
  chmod +x $script
  ```

### How to locally build the docker images ?

To build all images:

  ```bash
  cd Docker
  export QT_ACCOUNT_LOGIN=XXX
  export QT_ACCOUNT_PASSWORD=XXX
  make
  ```

To build a specific image:

  ```bash
  cd Docker
  export QT_ACCOUNT_LOGIN=XXX
  export QT_ACCOUNT_PASSWORD=XXX
  make qt5-centos7
  ```


> [!IMPORTANT]
>
> - Setting `QT_ACCOUNT_LOGIN` and `QT_ACCOUNT_PASSWORD` variables
>   should **NOT** be done if the images are built using public
>   continuous integration services. If this is needed, approach like
>   what is done in
>   [rabits/dockerfiles](https://github.com/rabits/dockerfiles/tree/93d2d5b1d8f4c5fba9db67086a945e7462011707#build-the-container-image-514)
>   should be implemented.
>
> - Setting these variables is appropriate only in the case of building
>   the docker images from build machines with restricted access.

### Configure, build and package Slicer for Linux

The following steps will:

  * download Slicer 5.8.1 source code
  * download the associated build environment
  * configure, build and package Slicer

    ```bash
    SLICER_BUILD_ENV_NAME=qt5-centos7
    SLICER_BUILD_ENV_VERSION=5.8
    SLICER_BRANCH=v5.8.1

    ROOT_DIR=/tmp/Slicer-$SLICER_BUILD_ENV_VERSION
    mkdir -p $ROOT_DIR

    cd ${ROOT_DIR}

    slicer_build_env_script=~/bin/slicer-buildenv-$SLICER_BUILD_ENV_NAME-$SLICER_BUILD_ENV_VERSION

    # Download sources
    git clone https://github.com/Slicer/Slicer -b $SLICER_BRANCH

    # Download corresponding build environment and generate convenience script
    docker run --rm slicer/buildenv-qt5-centos7 > $slicer_build_env_script
    chmod u+x $slicer_build_env_script

    # Configure Slicer
    $slicer_build_env_script cmake \
      -BSlicer-build \
      -SSlicer \
      -GNinja \
      -DCMAKE_BUILD_TYPE:STRING=Release

    # Build Slicer
    $slicer_build_env_script cmake --build Slicer-build

    # Package Slicer
    $slicer_build_env_script cmake --build Slicer-build/Slicer-build --target package
    ```

### Configure, build and package a Slicer extension for Linux

The following steps will:

  - download an extension source code
  - configure, build and package the extension using the build generated
    in the **previous tutorial**

    ```bash
    SLICER_BUILD_ENV_NAME=qt5-centos7
    SLICER_BUILD_ENV_VERSION=5.8
    SLICER_BRANCH=v5.8.1

    slicer_build_env_script=~/bin/slicer-buildenv-$SLICER_BUILD_ENV_NAME-$SLICER_BUILD_ENV_VERSION

    ROOT_DIR=/tmp/Slicer-$SLICER_BUILD_ENV_VERSION

    cd ${ROOT_DIR}

    EXTENSION_NAME=ImageMaker

    # Download extension source
    git clone git://github.com/finetjul/ImageMaker ${EXTENSION_NAME}

    # Configure the extension
    $slicer_build_env_script cmake \
      -B${EXTENSION_NAME}-build \
      -S${EXTENSION_NAME} \
      -GNinja \
      -DCMAKE_BUILD_TYPE:STRING=Release \
      -DSlicer_DIR:PATH=/work/Slicer-build/Slicer-build


    # Hint: /work is the working directory in the image, it corresponds to
    #       the directory from which the script `slicer-buildenv-qt4-ubuntu1004` is called.


    # Build the extension
    $slicer_build_env_script cmake --build ${EXTENSION_NAME}-build

    # Package the extension
    $slicer_build_env_script cmake --build ${EXTENSION_NAME}-build --target package
    ```

## Maintainers

### Tagging a build environment image

_These commands assume you have cloned https://github.com/Slicer/SlicerBuildEnvironment_

1.  Choose a tag (e.g `slicer-X.Y`)

    ```bash
    TAG=<name-of-tag>
    ```

2.  Update `Docker/Makefile` with the chosen tag

    ```bash
    cd SlicerBuildEnvironment

    sed -i -E "s/^TAG = .+$/TAG = ${TAG}/g" Docker/Makefile
    ```

    _On macOS with BSD `sed`, use `sed -i '' -E ...`._

2.  Add an entry in `README.md` referencing the chosen tag

    > Since the image has not yet been published, specify `sha256-UNKNOWN`
    > as image hash.

3.  Commit the changes

    ```bash
    git add README.md Docker/Makefile
    git commit -m "Set TAG to ${TAG}"
    ```
    
4.  Build and publish an image

    ```bash
    cd Docker
    make <name-of-image>
    make <name-of-image>.push
    ```
    
5.  Update `Docker/Makefile` with the "latest" tag, update `README.md`
    replacing `sha256-UNKNOWN` with expected value.

    ```bash
    sed -i -E "s/^TAG = .+$/TAG = latest/g" Docker/Makefile
    ```

6.  Commit the changes

    ```bash
    git add README.md Docker/Makefile
    git commit -m "Set TAG to latest"
    ```
