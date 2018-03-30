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

Available build environments
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. |buildenv-qt4-ubuntu1004-latest| image:: https://images.microbadger.com/badges/image/slicer/buildenv-qt4-ubuntu1004:latest.svg
  :target: https://microbadger.com/images/slicer/buildenv-qt4-ubuntu1004:latest

slicer/buildenv-qt4-ubuntu1004:latest
  |buildenv-qt4-ubuntu1004-latest| Build environment based on Ubuntu 10.04 and including Qt 4.8.6


.. |buildenv-qt4-centos5-latest| image:: https://images.microbadger.com/badges/image/slicer/buildenv-qt4-centos5:latest.svg
  :target: https://microbadger.com/images/slicer/buildenv-qt4-centos5:latest

slicer/buildenv-qt4-centos5:latest
  |buildenv-qt4-centos5-latest| Build environment based on Centos5 and including Qt 4.8.7


.. |buildenv-qt5-centos7-latest| image:: https://images.microbadger.com/badges/image/slicer/buildenv-qt5-centos7:latest.svg
  :target: https://microbadger.com/images/slicer/buildenv-qt5-centos7:latest

slicer/buildenv-qt5-centos7:latest
  |buildenv-qt5-centos7-latest| Build environment based on Centos7 and including Qt 5.10.1


Visual Overview
^^^^^^^^^^^^^^^

.. image:: http://interactive.blockdiag.com/image?compression=deflate&encoding=base64&src=eJx9ksFOhDAQhu_7FA1eJUEDwaTBw-7Bi29gjCm0i40Ns5ZhEzT77rbdCoUFjp3h_-fjnykVVF9cspr87ggBLUWDDCU0pCAn0KiZRGo6XBxZp_DjCA228keY9hPdmUZlBNBmby32ylY5IAr-bjVd2TXYPSRJetu1lmX8L1asFKqI_DPm4owAqhX4GNdVlUb3ZGYwDibxMwm97OCyk4qL5hx_YzrMqECBLqK7ZJ8f9ofIEY4ya7Mk86DBr3jWsbKOOH5j7Sc2N5jBhBXSqduKeBJsPg02D4J11NlGsLlH9q8ZbzZM2Iw1n5EOMotZa-hO7uwIcZyGIlKy1Ez3EXXlq_mrrD_xRbPeF_2ig3hpQHlZ9ebm1B3MlntwSbONzdJYn9MqWQm9NWTp0ujaSuligleEyx-9JzCZ
  :target: http://interactive.blockdiag.com/?compression=deflate&src=eJx9ksFOhDAQhu_7FA1eJUEDwaTBw-7Bi29gjCm0i40Ns5ZhEzT77rbdCoUFjp3h_-fjnykVVF9cspr87ggBLUWDDCU0pCAn0KiZRGo6XBxZp_DjCA228keY9hPdmUZlBNBmby32ylY5IAr-bjVd2TXYPSRJetu1lmX8L1asFKqI_DPm4owAqhX4GNdVlUb3ZGYwDibxMwm97OCyk4qL5hx_YzrMqECBLqK7ZJ8f9ofIEY4ya7Mk86DBr3jWsbKOOH5j7Sc2N5jBhBXSqduKeBJsPg02D4J11NlGsLlH9q8ZbzZM2Iw1n5EOMotZa-hO7uwIcZyGIlKy1Ez3EXXlq_mrrD_xRbPeF_2ig3hpQHlZ9ebm1B3MlntwSbONzdJYn9MqWQm9NWTp0ujaSuligleEyx-9JzCZ


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
  slicer-buildenv-qt4-ubuntu1004 cmake --build Slicer-build\Slicer-build --target package


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
