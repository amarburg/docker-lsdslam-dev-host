## The coverity binary needs to be downloaded from an authenticated
## account, so this Docker image can't be built automatically in the
## cloud
FROM amarburg/lsdslam-dev-host:nvidia_cuda_nocv

WORKDIR /home/lsdslam
USER lsdslam
RUN git clone --single-branch --branch 3.2.0 --depth 1 https://github.com/opencv/opencv.git
RUN mkdir /home/lsdslam/opencv/build-3.2.0
WORKDIR /home/lsdslam/opencv/build-3.2.0
RUN cmake -DCMAKE_BUILD_TYPE:string=Release \
          -DBUILD_PERF_TESTS:bool=OFF \
          -DBUILD_TESTS:bool=OFF \
          -DBUILD_EXAMPLES:bool=OFF \
          -DCUDA_ARCH_BIN:string="3.0 3.5" \
          -DCUDA_ARCH_PTX:string="3.0" \
          ..
RUN make -j && sudo make install

WORKDIR /home/lsdslam
RUN rm -rf opencv
