# Build vorbis
ARG VORBIS_VER=1.3.6
ARG VORBIS_REPO=https://downloads.xiph.org/releases/vorbis/libvorbis-${VORBIS_VER}.tar.xz

define(`FFMPEG_CONFIG_VORBIS',--enable-libvorbis )dnl
RUN wget -O - ${VORBIS_REPO} | tar xJ && \
    cd libvorbis-${VORBIS_VER} && \
    ./configure --prefix="/usr/local" --libdir=ifelse(index(DOCKER_IMAGE,ubuntu),-1,/usr/lib64,/usr/local/lib) --enable-defn(`BUILD_LINKAGE') && \
    make -j8 && \
    make install DESTDIR=/home/build && \
    make install
