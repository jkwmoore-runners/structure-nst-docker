#
# Structure-nst docker file
# https://github.com/xch-liu/structure-nst
#
#
FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu14.04
LABEL maintainer="James Moore - Research IT - Sheffield University"

ENV INSTALL_ROOT="/usr/local/torch"
ENV	PREFIX="/usr/local/torch"

RUN mkdir -p $PREFIX

RUN apt-get update || true && apt-get install -y git hdf5-tools

RUN git clone https://github.com/torch/distro.git ~/torch --recursive && \
cd ~/torch; bash install-deps; ./install.sh -s

RUN  	. /usr/local/torch/bin/torch-activate && luarocks install cutorch hdf5
##Not finished