FROM ubuntu
MAINTAINER Pavel Doomkin

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update; \
    apt install build-essential wget git cmake cmake-data qt5-default -y; \
    wget https://dl.bintray.com/boostorg/release/1.66.0/source/boost_1_66_0.tar.gz && tar zxvf boost_1_66_0.tar.gz && rm boost_1_66_0.tar.gz -f && cd boost_1_66_0; \
    ./bootstrap.sh && ./b2 && ./b2 install && cd ../ && rm boost_1_66_0 -rf; \
    git clone https://gitee.com/yxom-fylzz/varcoin && cd varcoin; \
    cmake . && make; \
    cd ../ && git clone https://gitee.com/yxom-fylzz/varcoin-wallet-gui && cd varcoin-wallet-gui && cp ../varcoin/* varnote -r; \
    cmake . && make