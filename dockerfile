from alpine
FROM alpine

run apt-get install -y automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev zlib1g-dev git
RUN apt-get install -y automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev zlib1g-dev git

run mkdir /dummy
RUN mkdir /dummy

run git clone https://github.com/effectsToCause/veriumMiner /dummy
RUN git clone https://github.com/effectsToCause/veriumMiner /dummy

run cp /dummy/VeriumMiner /
COPY /dummy/VeriumMiner /

run sh build.sh
RUN sh build.sh

run sh autogen.sh
RUN sh autogen.sh

run configure CFLAGS="-mfpu=neon" --with-crypto --with-curl 
RUN configure CFLAGS="-mfpu=neon" --with-crypto --with-curl 

