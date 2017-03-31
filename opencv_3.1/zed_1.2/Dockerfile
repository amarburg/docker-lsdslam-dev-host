## The coverity binary needs to be downloaded from an authenticated
## account, so this Docker image can't be built automatically in the
## cloud
FROM amarburg/lsdslam-dev-host:nvidia_cuda_opencv3.1

RUN sudo apt-get install --yes curl lsb-release less cpuid

RUN sudo mkdir --mode=777 /usr/local/zed

## Have to reply with false Agent information?
RUN curl -A "Mozilla/4.0" -O https://www.stereolabs.com/download_327af3/ZED_SDK_Linux_Ubuntu16_CUDA80_v1.2.0.run
RUN chmod 755 ZED_SDK_Linux_Ubuntu16_CUDA80_v1.2.0.run
RUN ls -al
RUN ./ZED_SDK_Linux_Ubuntu16_CUDA80_v1.2.0.run --nox11
RUN rm ZED_SDK_Linux_Ubuntu16_CUDA80_v1.2.0.run

RUN sudo chown 755 /usr/local/zed

WORKDIR /home/lsdslam
