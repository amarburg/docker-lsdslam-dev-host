## The coverity binary needs to be downloaded from an authenticated
## account, so this Docker image can't be built automatically in the
## cloud
FROM amarburg/lsdslam-dev-host:conan-latest

RUN pip install --upgrade pip
RUN pip install --upgrade conan

ADD cov-analysis-linux64-latest.tar.gz /opt
RUN ln -s /opt/cov-analysis-linux64-?.?.? /opt/cov-analysis-linux64
RUN ln -s /opt/cov-analysis-linux64/bin/cov-* /usr/bin/
