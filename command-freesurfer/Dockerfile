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

# Install Anaconda and set up Python 3 environment
RUN curl -sSL -O "https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh" \
    && bash Anaconda3-2019.03-Linux-x86_64.sh -b -p /home/$USER/anaconda3 \
    && rm Anaconda3-2019.03-Linux-x86_64.sh
RUN /home/$USER/anaconda3/condabin/conda init \
    && /home/$USER/anaconda3/condabin/conda update -y -n base -c defaults conda \
    && /home/$USER/anaconda3/bin/pip install \
    numpy \
    scipy \
    matplotlib \
    boto3 \
    botocore \
    nipype \
    traitsui \
    PyQt5 \
    vtk \
    ipython
RUN /home/$USER/anaconda3/bin/pip install \
    mayavi \
    pysurfer

# Default command on docker run
CMD ["/bin/bash", "--login"]

