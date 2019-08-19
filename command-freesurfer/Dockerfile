# Use Ubuntu 19.04 as the base system
FROM ubuntu:19.04

# Install FreeSurfer
COPY --from=freesurfer/freesurfer:6.0 /opt/freesurfer/ /usr/local/freesurfer/
ARG LICENSE_FILE=license.txt
COPY $LICENSE_FILE /usr/local/freesurfer/license.txt

# Install Ubuntu APT packages
RUN apt-get update && apt-get -y upgrade
RUN env DEBIAN_FRONTEND=noninteractive apt-get install -y \
    vim \
    curl \
    git \
    # Python dependencies
    python3.6 \
    python3-pip \
    python3-setuptools \
    python3-ipython \
    python3-pyside \
    python3-pyqt5 \
    python3-pyqt4 \
    python-pip \
    python-ipython \
    python-pyside \
    python-pyqt5 \
    python-qt4 \
    python-matplotlib \
    python-numpy \
    python-scipy \
    python-surfer \
    ipython \
    # Anaconda dependencies
    libgl1-mesa-glx \
    libegl1-mesa \
    libxrandr2 \
    libxss1 \
    libxcursor1 \
    libxcomposite1 \
    libasound2 \
    libxi6 \
    libxtst6 \
    # Other graphical libraries depedencies
    mesa-utils \
    libglu1-mesa \
    libsm6 \
    vtk6

# Create user
ARG USER=mholla
RUN useradd -m -d /home/$USER -s /bin/bash -g root -G sudo $USER
USER $USER
WORKDIR /home/$USER
RUN printf '\nexport FREESURFER_HOME=/usr/local/freesurfer\n\
source $FREESURFER_HOME/SetUpFreeSurfer.sh\n' >> .bashrc

# Use the X Window System display on the Docker host
ENV DISPLAY=host.docker.internal:0

# Default command on docker run
CMD ["/bin/bash", "--login"]

