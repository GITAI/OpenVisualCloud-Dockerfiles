set(image "vca2_nginx_rtmp_ubuntu1604")
set(dep_image "vca2_ffmpeg_ubuntu1604")
include("${CMAKE_SOURCE_DIR}/script/image.cmake")
include("${CMAKE_SOURCE_DIR}/script/nginx-tests.cmake")
