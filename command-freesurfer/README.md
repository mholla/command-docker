# CoMMaND Lab's FreeSurfer development environment

This is for Mac only.  Linux users may be able to adapt this with some changes in X-forwarding; YMMV.

Pysurfer and Mayavi currently work for Python 2 only.  The base Conda environment in the image is Python 2.7.

## Prerequisites

 - [Homebrew](https://brew.sh/)
 - [Docker for Mac](https://docs.docker.com/docker-for-mac/install/)
 - [XQuartz](https://www.xquartz.org/)
 - socat
   ~~~~~~~~ bash
   brew install socat
   ~~~~~~~~

## Getting started

1. Get your FreeSurfer `license.txt` file, and copy it to this folder.

2. Build the `command-freesurfer` Docker image with the script provided:
   ~~~~~~~~ bash
   ./build.sh
   ~~~~~~~~
   You will be prompted to optionally customize your username and license file location.  

3. Enable forwarding X server connections to the XQuartz display (from Docker containers to the host Mac OS X):
   ~~~~~~~~ bash
   ./enable-gui.sh
   ~~~~~~~~
   Keep this process running and continue in another terminal session.

4. Start a new Docker container based on the `command-freesurfer` image:
   ~~~~~~~~ bash
   docker run -it command-freesurfer -v /local/directory/:/container/directory
   ~~~~~~~~
   This will mount a local drive to the container so that its contents are available.  For other run options, see documentation on `docker run` and `docker exec`.
