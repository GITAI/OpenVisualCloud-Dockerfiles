#!/bin/bash

set -e

if [ "$DOCKER_USER" = "" ]; then
  read -p    "Docker username:" DOCKER_USER
  read -s -p "       password:" DOCKER_PASS
fi

docker login -u $DOCKER_USER -p $DOCKER_PASS

(mkdir -p build && cd build && cmake ..)

for OS_VERSION in ubuntu-16.04 ubuntu-18.04; do
  (cd build/XeonE3/$OS_VERSION/media/ffmpeg && make)
  (cd XeonE3/$OS_VERSION/media/ffmpeg &&
     eval $(cat build.sh | grep IMAGE) &&
     eval $(cat build.sh | grep VERSION) &&
     docker tag openvisualcloud/$IMAGE:$VERSION gitaiinc/openvisualcloud-$IMAGE:$VERSION &&
     docker push gitaiinc/openvisualcloud-$IMAGE:$VERSION)
done
