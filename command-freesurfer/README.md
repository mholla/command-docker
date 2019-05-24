# CoMMaND Lab's FreeSurfer development environment

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
   docker run -it --rm command-freesurfer
   ~~~~~~~~
   Note that the `--rm` option will cause the Docker container to be deleted on exit. For other run options, see documentation on `docker run` and `docker exec`.
