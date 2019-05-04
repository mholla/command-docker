FROM freesurfer/freesurfer:6.0
WORKDIR /opt/freesurfer 

FROM ubuntu:latest

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
    libgl1-mesa-dev \
    libsm6 \
    vtk6

# Install Python 3 packages
RUN python3 -m pip install \
    numpy \
    scipy \
    matplotlib \
    boto3 \
    botocore \
    nipype \
    traitsui \
    PyQt5 \
    vtk

# Install latest mayavi (that fixes Python 3 encoding bug), and then pysurfer
RUN git clone "https://github.com/enthought/mayavi.git" \
    && cd mayavi \
    && pip3 install -r requirements.txt \
    && python3 setup.py install \
    && cd .. \
    && rm -rf mayavi \
    && python3 -m pip install pysurfer

# Install FreeSurfer
WORKDIR /tmp
COPY --from=0 /opt/freesurfer/ /usr/local/freesurfer/
ARG LICENSE_FILE=license.txt
COPY $LICENSE_FILE /usr/local/freesurfer/license.txt

# Create user
ARG USER=mholla
RUN useradd -m -d /home/$USER -s /bin/bash -g root -G sudo $USER
USER $USER
WORKDIR /home/$USER
RUN printf '\nexport FREESURFER_HOME=/usr/local/freesurfer\n\
source $FREESURFER_HOME/SetUpFreeSurfer.sh\n' >> .bashrc

# Default command on docker run
CMD ["/bin/bash", "--login"]

