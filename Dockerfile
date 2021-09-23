#
# Structure-nst docker file
# https://github.com/xch-liu/structure-nst
#
#
FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu14.04
LABEL maintainer="James Moore - Research IT - Sheffield University"

ENV INSTALL_ROOT="/usr/local/torch"
ENV	PREFIX="/usr/local/torch"

RUN mkdir -p $PREFIX && apt-get update || true && \
apt-get install -y git libhdf5-openmpi-dev && \
git clone https://github.com/torch/distro.git ~/torch --recursive && \
cd ~/torch; bash install-deps && \
apt-get autoremove && apt-get clean

RUN cd ~/torch; ./install.sh -s && rm -rf ~/torch

RUN . /usr/local/torch/bin/torch-activate && luarocks install cutorch &&  luarocks install hdf5

RUN cd / && git clone https://github.com/xch-liu/structure-nst.git

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh 

ENTRYPOINT ["/entrypoint.sh"]
