FROM ubuntu
MAINTAINER Pavel Doomkin

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update; \
    apt install build-essential wget git cmake cmake-data qt5-default libboost1.58-all-dev -y; \
    git clone https://gitee.com/yxom-fylzz/varcoin && cd varcoin && mkdir build && cd build; \
    cmake .. && make; \
    rm -rf CMakeFiles; \
    apt remove build-essential git cmake cmake-data qt5-default libboost1.58-all-dev -y;
    