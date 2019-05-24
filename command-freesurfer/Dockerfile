# Use Ubuntu 18.04 as the base system
FROM ubuntu:18.04

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
    python3.6 \
    python3-pip \
    python3-setuptools \
    python3-dev \
    python3-pyside \
    python3-pyqt5 \
    python3-pyqt4 \
    python3-ipython \
    python-pyside \
    python-pyqt5 \
    python-surfer \
    python-sip \
    python-ipython \
    python-matplotlib \
    ipython \
    mesa-utils \
    libgl1-mesa-glx \
    libegl1-mesa \
    libxrandr2 \
    libxss1 \
    libxcursor1 \
    libxcomposite1 \
    libasound2 \
    libxi6 \
    libxtst6 \
    libsm6 \
    vtk6

# Create user
ARG USER=mholla
RUN useradd -m -d /home/$USER -s /bin/bash -g root -G sudo $USER
USER $USER
WORKDIR /home/$USER
RUN printf '\nexport FREESURFER_HOME=/usr/local/freesurfer\n\
source $FREESURFER_HOME/SetUpFreeSurfer.sh\n' >> .bashrc

# Use X Window System display on the Docker host
ENV DISPLAY=host.docker.internal:0

# Install Anaconda and set up Python 3 environment
RUN curl -sSL -O "https://repo.anaconda.com/archive/Anaconda2-2019.03-Linux-x86_64.sh" \
    && bash Anaconda2-2019.03-Linux-x86_64.sh -b -p /home/$USER/anaconda2 \
    && rm Anaconda2-2019.03-Linux-x86_64.sh
RUN /home/$USER/anaconda2/condabin/conda init \
    && /home/$USER/anaconda2/condabin/conda update -y -n base -c defaults conda
# Anaconda already comes with numpy, scipy, matplotlib, ipython, etc.
RUN /home/$USER/anaconda2/condabin/conda install -y --channel conda-forge \
    pyqt=4 \
    pyside \
    vtk \
    nipype \
    mayavi \
    pysurfer \
    six \
    boto3 \
    traitsui \
    pysftp \
    webcolors
# Create Python 3 environment
RUN /home/$USER/anaconda2/condabin/conda create -y -n py3 python=3.7

# Default command on docker run
CMD ["/bin/bash", "--login"]

