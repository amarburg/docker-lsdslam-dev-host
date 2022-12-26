FROM ubuntu:20.04

ENV BUILDDEPS="build-essential g++ cmake libopencv-dev libboost-all-dev \
            libeigen3-dev libtclap-dev libgomp1 \
            libsuitesparse-dev git libglew-dev \
            libglm-dev autoconf libtool freeglut3-dev libxmu-dev libxi-dev \
            libtinyxml2-dev ca-certificates software-properties-common golang \
            libavcodec-dev python3 python-is-python3"

ENV DEBIAN_FRONTEND=noninteractive

RUN     apt-get -yqq update && \
        apt-get install -yq --no-install-recommends ${BUILDDEPS} && \
        rm -rf /var/lib/apt/lists/*

## Build as a non-root user -- hm this broke drone
#RUN adduser lsdslam
#ENV HOME /home/lsdslam
#WORKDIR /home/lsdslam
#USER lsdslam

ENV HOME /root
