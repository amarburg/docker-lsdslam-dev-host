## The coverity binary needs to be downloaded from an authenticated
## account, so this Docker image can't be built automatically in the
## cloud
FROM amarburg/lsdslam-dev-host:nvidia_cuda_nocv

ENV OPENCV_BRANCH=3.2.0

RUN sudo apt-get install --yes libpng12-dev

WORKDIR /home/lsdslam
USER lsdslam
RUN git clone --single-branch --branch $OPENCV_BRANCH --depth 1 https://github.com/opencv/opencv.git
RUN mkdir /home/lsdslam/opencv/build-$OPENCV_BRANCH
WORKDIR /home/lsdslam/opencv/build-$OPENCV_BRANCH
RUN cmake -DCMAKE_BUILD_TYPE:string=Release \
          -DBUILD_PERF_TESTS:bool=OFF \
          -DBUILD_TESTS:bool=OFF \
          -DBUILD_EXAMPLES:bool=OFF \
          -DCUDA_ARCH_BIN:string="3.0 3.5" \
          -DCUDA_ARCH_PTX:string="3.0" \
          -DBUILD_JPEG:bool=OFF \
          -DBUILD_PNG:bool=OFF \
          -DBUILD_TIFF:bool=OFF \
          -DBUILD_CUDA_STUBS:bool=OFF \
          -DENABLE_PRECOMPILED_HEADERS:bool=OFF \
          -DBUILD_opencv_cudalegacy:bool=OFF \
          ..
RUN make -j && sudo make install

WORKDIR /home/lsdslam
RUN rm -rf opencv
