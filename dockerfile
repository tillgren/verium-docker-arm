from alpine

run apt-get install -y automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev zlib1g-dev git

run mkdir /dummy

run git clone https://github.com/effectsToCause/veriumMiner /dummy

run cp /dummy/VeriumMiner /

run sh build.sh

run sh autogen.sh

run configure CFLAGS="-mfpu=neon" --with-crypto --with-curl 

