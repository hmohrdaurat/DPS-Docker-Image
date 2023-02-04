FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install curl wget git build-essential sudo cmake -y
RUN apt-get install lldb clang -y
RUN git clone --recursive https://github.com/facebookincubator/velox.git \
    && cd velox && git submodule sync --recursive && git submodule update --init --recursive \
    && ./scripts/setup-ubuntu.sh && make debug
CMD /usr/bin/bash
