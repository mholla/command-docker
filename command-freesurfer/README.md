# CoMMaND Lab's FreeSurfer development environment

## Prerequisites

 -  Docker for Mac
 -  XQuartz
 -  socat

~~~~~~~~ bash
brew cask install docker
brew cask install xquartz
brew install socat
~~~~~~~~
> TODO: Are extra brew installs required?

## Getting started

1. Get your FreeSurfer `license.txt` file, and copy it to the path of the `Dockerfile`.
2. Build the `command-freesurfer` Docker image with the script provided:
    ~~~~~~~~ bash
    ./build.sh
    ~~~~~~~~
    You will be prompted to optionally customize your username and license file location.
3. Enable indirect GLX rendering on XQuartz (from Docker containers to host OS X):
    ~~~~~~~~ bash
    defaults write org.macosforge.xquartz.X11 enable_iglx -bool true
    ~~~~~~~~
4. Allow X server connections from your IP address:
    ~~~~~~~~ bash
    ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
    xhost +$ip
    ~~~~~~~~
5. Forward the X11 socket to the XQuartz display (from Docker containers to host OS X):
    ~~~~~~~~ bash
    socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
    ~~~~~~~~
    Keep this process running and continue in another terminal session.
6. Start a new Docker container based on the `command-freesurfer` image:
    ~~~~~~~~ bash
    ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
    docker run -it -e DISPLAY=$ip:0 --rm command-freesurfer
    ~~~~~~~~
    The `DISPLAY` environment variable will connect the container's graphics output to the host system using your IP address. Note that the `--rm` option will cause the Docker container to be deleted on exit. For other run options, see documentation on `docker run` and `docker exec`.

