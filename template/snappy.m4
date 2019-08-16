# Build snappy
ARG SNAPPY_VER=1.1.7
ARG SNAPPY_REPO=https://github.com/google/snappy

define(`FFMPEG_CONFIG_SNAPPY',--enable-libsnappy )dnl
RUN  git clone ${SNAPPY_REPO} && \
     cd snappy && \
     git checkout ${SNAPPY_VER} && \
     mkdir -p build && cd build && \
     cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS=-fPIC -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_INSTALL_LIBDIR=ifelse(index(DOCKER_IMAGE,ubuntu),-1,lib64,lib) .. && \
     make -j8 && \
     make install DESTDIR="/home/build" && \
     make install
