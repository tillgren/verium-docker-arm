FROM alpine

RUN apt-get install -y automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev zlib1g-dev git

RUN mkdir /dummy

RUN git clone https://github.com/effectsToCause/veriumMiner /dummy

COPY /dummy/VeriumMiner /

RUN sh build.sh

RUN sh autogen.sh

RUN configure CFLAGS="-mfpu=neon" --with-crypto --with-curl 

