FROM debian:jessie AS build

# Step 1: build tentacool
WORKDIR /tmp
RUN apt-get update && apt-get install -y \
	build-essential \
	dh-autoreconf \
	git \
	libcppunit-dev \
	libpoco-dev
RUN git clone https://github.com/tentacool/tentacool.git
RUN cd tentacool && autoreconf -i && ./configure && make

# Step 2: make final image
FROM debian:jessie-slim

WORKDIR /usr/app
RUN apt-get update && apt-get install -y libpoco-dev && mkdir data
COPY --from=build /tmp/tentacool/tentacool /usr/app/tentacool
EXPOSE 10000

CMD ["./tentacool", "--port=10000", "--file=data/auth_keys.dat"]