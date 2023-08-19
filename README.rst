Slicer Build Environment
========================

*This project is under active development. Its content, API and behavior may change at any time. We mean it.*

Overview
--------

This project streamlines the continuous integration (CI) and allows anyone to easily reproduce builds. Currently,
it contains only a Docker directory that itself contain a sub-directory associated with each available build environment.

::

  SlicerBuildEnvironment
    |
    |--- Docker
            |--- qt4-centos5
            |          |--- Dockerfile
            |
            |--- qt4-ubuntu1004
            |          |--- Dockerfile
            |
            |--- qt5-centos7
            |          |--- Dockerfile
            |
            |--- Makefile


Docker-based Environments
-------------------------


Each sub-directory (e.g ``qt5-centos7``) contains a  ``Dockerfile`` allowing to generate a **reusable** build
environment (or docker image). That build environment includes a version of qt (e.g ``qt5``) and is based on a
given operating system (e.g ``centos5``).

Supported build environments
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. |buildenv-qt5-centos7-slicer-4.11-2018.10.17| image:: https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-4.11-2018.10.17
  :target: https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-4.11-2018.10.17/images/sha256-73551960143845b5f93a4d3f9a7d5fbcacd545a1ef42b6dfbf49746405baa78a

slicer/buildenv-qt5-centos7:slicer-4.11-2018.10.17
  |buildenv-qt5-centos7-slicer-4.11-2018.10.17| Build environment based on Centos7 and including Qt 5.11.2, GCC 5, CMake 3.13.4


.. |buildenv-qt5-centos7-slicer-4.11-2020.05.27| image:: https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-4.11-2020.05.27
  :target: https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-4.12.8-2020.05.27/images/sha256-c8e3cde0bd73c1f97a8209b73f91c839ee31b2d0f098598db0e41be73caa7f70

slicer/buildenv-qt5-centos7:slicer-4.11-2020.05.27
  |buildenv-qt5-centos7-slicer-4.11-2020.05.27| Build environment based on Centos7 and including Qt 5.12.8, GCC 5, CMake 3.17.1


.. |buildenv-qt5-centos7-slicer-4.11-2020.09.30| image:: https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-4.11-2020.09.30
  :target: https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-4.11-2020.09.30/images/sha256-ee8da10829b5812bf774f7c2d3d9d39b1d693e62edbc732e258143c6c7bcc5bc

slicer/buildenv-qt5-centos7:slicer-4.11-2020.09.30
  |buildenv-qt5-centos7-slicer-4.11-2020.09.30| Build environment based on Centos7 and including Qt 5.15.1, GCC 5, CMake 3.17.1


.. |buildenv-qt5-centos7-slicer-4.11-2021.02.26| image:: https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-4.11-2021.02.26
  :target: https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-4.11-2021.02.26/images/sha256-1dbf78284b996936c47bdba2c83ec013f2e081387455604f2b6d967366f3bf49

slicer/buildenv-qt5-centos7:slicer-4.11-2021.02.26
  |buildenv-qt5-centos7-slicer-4.11-2021.02.26| Build environment based on Centos7 and including Qt 5.15.1, GCC 5, CMake 3.17.1


.. |buildenv-qt5-centos7-slicer-4.13-2021.10.07| image:: https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-4.13-2021.10.07
  :target: https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-4.13-2021.10.07/images/sha256-c719f3beedebda6f0ac21ed899a29a1ea94fcf34b08e58f19d49888a992ba7f7

slicer/buildenv-qt5-centos7:slicer-4.13-2021.10.07
  |buildenv-qt5-centos7-slicer-4.13-2021.10.07| Build environment based on Centos7 and including Qt 5.15.2, GCC 5, CMake 3.17.1


.. |buildenv-qt5-centos7-slicer-4.13-2022.01.20| image:: https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-4.13-2022.01.20
  :target: https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-4.13-2022.01.20/images/sha256-18ccdac87076803267630401e675c5829b54ba763596303668f4d8e65f4bdd14

slicer/buildenv-qt5-centos7:slicer-4.13-2022.01.20
  |buildenv-qt5-centos7-slicer-4.13-2022.01.20| Build environment based on Centos7 and including Qt 5.15.2, GCC 7, CMake 3.17.1


.. |buildenv-qt5-centos7-slicer-5.0| image:: https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-5.0
  :target: https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-5.0/images/sha256-57815be03a002b2a47307ce26ef55f0f5955cb76df0605e42d375ff4090d2f68

slicer/buildenv-qt5-centos7:slicer-5.0
  |buildenv-qt5-centos7-slicer-5.0| Build environment based on Centos7 and including Qt 5.15.2, GCC 7, CMake 3.22.1

.. |buildenv-qt5-centos7-slicer-5.2| image:: https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-5.2
  :target: https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-5.2/images/sha256-57815be03a002b2a47307ce26ef55f0f5955cb76df0605e42d375ff4090d2f68

slicer/buildenv-qt5-centos7:slicer-5.2
  |buildenv-qt5-centos7-slicer-5.2| Build environment based on Centos7 and including Qt 5.15.2, GCC 7, CMake 3.22.1

.. |buildenv-qt5-centos7-slicer-5.4| image:: https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-5.4
  :target: https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-5.4/images/sha256-8ba0c4bf3cd458883652b69d61c2e82d804283a26d260e731bb5b81963ee3f87

slicer/buildenv-qt5-centos7:slicer-5.4
  |buildenv-qt5-centos7-slicer-5.4| Build environment based on Centos7 and including Qt 5.15.2, GCC 7, CMake 3.22.1

.. |buildenv-qt5-centos7-latest| image:: https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7
  :target: https://hub.docker.com/r/slicer/buildenv-qt5-centos7/tags

slicer/buildenv-qt5-centos7:latest
  |buildenv-qt5-centos7-latest| Build environment based on Centos7 and including Qt 5.15.2, GCC 7, CMake 3.22.1

Deprecated build environments 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. |buildenv-qt4-ubuntu1004-latest| image:: https://img.shields.io/docker/image-size/slicer/buildenv-qt4-ubuntu1004/latest
  :target: https://hub.docker.com/layers/slicer/buildenv-qt4-ubuntu1004/latest/images/sha256-ac7bd0b76a7bb2c071328488474a3cc7770715588f911617d1040c98d0e161db

slicer/buildenv-qt4-ubuntu1004:latest
  |buildenv-qt4-ubuntu1004-latest| Build environment based on Ubuntu 10.04 and including Qt 4.8.6, GCC 4, CMake 3.11.0


.. |buildenv-qt4-centos5-latest| image:: https://img.shields.io/docker/image-size/slicer/buildenv-qt4-centos5/latest
  :target: https://hub.docker.com/layers/slicer/buildenv-qt4-centos5/latest/images/sha256-a87410f2783e50d6ad963ff8d9b26ece86488c725666fb90d7cffea4b013ac07

slicer/buildenv-qt4-centos5:latest
  |buildenv-qt4-centos5-latest| Build environment based on Centos5 and including Qt 4.8.7, GCC 4, CMake 3.11.0


.. |buildenv-qt5-centos7-slicer-4.10| image:: https://img.shields.io/docker/image-size/slicer/buildenv-qt5-centos7/slicer-4.10
  :target: https://hub.docker.com/layers/slicer/buildenv-qt5-centos7/slicer-4.10/images/sha256-211f514f00e83bc68f967b10f1727af0c8a8f98d0b8334a376ca2c3ef4e17a18?context=explore

slicer/buildenv-qt5-centos7:slicer-4.10
  |buildenv-qt5-centos7-slicer-4.10| Build environment based on Centos7 and including Qt 5.11.2, GCC 5, CMake 3.12.1


Visual Overview
^^^^^^^^^^^^^^^

.. code-block:: mermaid

  graph TD;
  subgraph library[Base image]
    centos5;
    ubuntu1004;
    centos7-gcc5[centos7];
    centos7-gcc7[centos7];
  end
  subgraph dockbuild[Dockbuild image]
    db-centos5[centos5-devtoolset2-gcc4];
    db-ubuntu1004[ubuntu1004-gcc4]
    db-centos7-gcc5[centos7-devtoolset4-gcc5]
    db-centos7-gcc7[centos7-devtoolset7-gcc7]
  end
  subgraph slicer[SlicerBuildEnvironment image]
    buildenv-qt4-centos5;
    buildenv-qt4-ubuntu1004;
    buildenv-qt5-centos7-gcc5[...\nbuildenv-qt5-centos7:slicer-4.13-2021.10.07];
    buildenv-qt5-centos7-gcc7[buildenv-qt5-centos7:slicer-4.13-2022.01.20\nbuildenv-qt5-centos7:slicer-5.0\nbuildenv-qt5-centos7:slicer-5.2\nbuildenv-qt5-centos7:latest];
  end
  centos5 --> db-centos5;
  db-centos5 --> buildenv-qt4-centos5;
  
  ubuntu1004 --> db-ubuntu1004;
  db-ubuntu1004 --> buildenv-qt4-ubuntu1004;
  
  centos7-gcc5 --> db-centos7-gcc5;
  db-centos7-gcc5 --> buildenv-qt5-centos7-gcc5;

  centos7-gcc7 --> db-centos7-gcc7;
  db-centos7-gcc7 --> buildenv-qt5-centos7-gcc7;

  classDef dep stroke-dasharray: 5 5;
  class centos5,db-centos5 dep;
  class ubuntu1004,db-ubuntu1004 dep;
  class centos7-gcc5,db-centos7-gcc5 dep;
  class centos7-gcc7,db-centos7-gcc7 dep;

  classDef builenv fill:#0B7CBC
  class buildenv-qt4-centos5 builenv;
  class buildenv-qt4-ubuntu1004 builenv;
  class buildenv-qt5-centos7-gcc5 builenv;
  class buildenv-qt5-centos7-gcc7 builenv;


dockbuild
^^^^^^^^^

The interesting part is that the recipe associated with each SlicerBuildEnvironment image is only responsible to
install (or build) Qt, the remaining of the tools forming the complete compiling environment are provided by some
other base images provided by the **dockbuild** project.

`dockbuild <https://github.com/dockbuild/dockbuild#readme>`_ is a project responsible to create base docker image
that includes a **tested** compiling environment, latest git version, cmake, ninja, python 3 and openssh-client.
And also a convenience entrypoint allowing to automatically mount the current working directory into the image.

dockbuild was itself inspired by `dockcross <https://github.com/dockcross/dockcross>`_, a collection of docker image
providing cross-compiling environment. It even re-use the same tests and entrypoint script.


Tutorials
---------

How to download an existing docker image ?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To download the latest version of the ``qt5-centos7`` image:

::

  docker pull slicer/buildenv-qt5-centos7:latest


How to install a docker based environment ?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This image does not need to be run manually. Instead, there is a helper script to execute build commands on
source code existing on the local host filesystem. This script is bundled with the image.

To install the helper script, run one of the images with no arguments, and redirect the output to a file:


::
  env_name=ENV_NAME
  script=~/bin/slicer-buildenv-${env_name}
  docker run --rm slicer/buildenv-${env_name} > $script
  chmod +x $script

For example, to install the script associated with the latest ``qt5-centos7`` images:

::

  env_name=qt5-centos7
  script=~/bin/slicer-buildenv-${env_name}
  docker run --rm slicer/buildenv-${env_name} > $script
  chmod +x $script


How to locally build the docker images ?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To build all images:

::

  cd Docker
  export QT_ACCOUNT_LOGIN=XXX
  export QT_ACCOUNT_PASSWORD=XXX
  make


To build a specific image:

::

  cd Docker
  export QT_ACCOUNT_LOGIN=XXX
  export QT_ACCOUNT_PASSWORD=XXX
  make qt5-centos7


**Important:**

* Setting ``QT_ACCOUNT_LOGIN`` and ``QT_ACCOUNT_PASSWORD`` variables should **NOT** be done if the images are built using public continuous integration services. If this is needed, approach like what is done in `rabits/dockerfiles <https://github.com/rabits/dockerfiles/tree/93d2d5b1d8f4c5fba9db67086a945e7462011707#build-the-container-image-514>`_ should be implemented.
* Setting these variables is appropriate only in the case of building the docker images from build machines with restricted access.


Configure, build and package Slicer for Linux
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following steps will:

* download Slicer 4.8.1 source code
* download the associated build environment
* configure, build and package Slicer

::

  ROOT_DIR=/tmp/Slicer481
  mkdir -p $ROOT_DIR

  cd ${ROOT_DIR}

  # Download sources
  svn co http://svn.slicer.org/Slicer4/branches/Slicer-4-8 Slicer -r 26813

  # Download corresponding build environment and generate convenience script
  docker run --rm slicer/buildenv-qt4-ubuntu1004 > ~/bin/slicer-buildenv-qt4-ubuntu1004
  chmod u+x ~/bin/slicer-buildenv-qt4-ubuntu1004

  # Configure Slicer
  slicer-buildenv-qt4-ubuntu1004 cmake \
    -BSlicer-build -HSlicer \
    -GNinja \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DSlicer_USE_PYTHONQT_WITH_TCL:BOOL=OFF \
    -DSlicer_BUILD_CLI:BOOL=OFF \
    -DSlicer_USE_SimpleITK:BOOL=OFF \
    -DBUILD_TESTING:BOOL=OFF

  # Build Slicer
  slicer-buildenv-qt4-ubuntu1004 cmake --build Slicer-build

  # Package Slicer
  slicer-buildenv-qt4-ubuntu1004 cmake --build Slicer-build/Slicer-build --target package


Configure, build and package a Slicer extension for Linux
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following steps will:

* download an extension source code
* configure, build and package the extension using the build generated in the **previous tutorial**

::

  ROOT_DIR=/tmp/Slicer481

  cd ${ROOT_DIR}

  EXTENSION_NAME=ImageMaker

  # Download extension source
  git clone git://github.com/finetjul/ImageMaker ${EXTENSION_NAME}

  # Configure the extension
  slicer-buildenv-qt4-ubuntu1004 cmake \
    -B${EXTENSION_NAME}-build -H${EXTENSION_NAME} \
    -GNinja \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DSlicer_DIR:PATH=/work/Slicer-build/Slicer-build


  # Hint: /work is the working directory in the image, it corresponds to
  #       the directory from which the script `slicer-buildenv-qt4-ubuntu1004` is called.


  # Build the extension
  slicer-buildenv-qt4-ubuntu1004 cmake --build ${EXTENSION_NAME}-build

  # Package the extension
  slicer-buildenv-qt4-ubuntu1004 cmake --build ${EXTENSION_NAME}-build --target package


Maintainers
-----------

Tagging a build environment image
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Choose a tag (e.g ``slicer-X.Y``)

::

  TAG=<name-of-tag>

2. Update ``Docker/Makefile`` with the chosen tag

::

  sed -i -E "s/^TAG = .+$/TAG = ${TAG}/g" Docker/Makefile

2. Add an entry in ``README.rst`` referencing the chosen tag

3. Commit the changes

::

  git add README.rst Docker/Makefile
  git commit -m "Set TAG to ${TAG}"

4. Build and publish an image

::

  cd Docker
  make <name-of-image>
  make <name-of-image>.push

5. Update ``Docker/Makefile`` with the "latest" tag

::

  sed -i -E "s/^TAG = .+$/TAG = latest/g" Docker/Makefile

6. Commit the changes

::

  git add README.rst Docker/Makefile
  git commit -m "Set TAG to latest"
