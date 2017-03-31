## The coverity binary needs to be downloaded from an authenticated
## account, so this Docker image can't be built automatically in the
## cloud
FROM nvidia/cuda:8.0-devel-ubuntu16.04

RUN apt-get update && \
    apt-get install --no-install-recommends --yes cmake rake libboost-all-dev \
    libeigen3-dev libtclap-dev libgomp1 libsuitesparse-dev git libglew-dev \
     libglm-dev autoconf automake libtool freeglut3-dev libxmu-dev libxi-dev \
     zlib1g-dev automake sudo

RUN apt-get install --yes python-pip

RUN pip install --upgrade pip
RUN pip install --upgrade conan

ADD lsdslam_sudo /etc/sudoers.d/

## have to run as non-root user
RUN groupadd lsdslam && useradd lsdslam -g lsdslam -G sudo -m

USER lsdslam
