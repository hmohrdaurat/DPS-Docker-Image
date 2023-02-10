FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install curl wget git build-essential sudo cmake -y
RUN apt-get install lldb clang -y
RUN cd /usr/local && git clone --recursive https://github.com/facebookincubator/velox.git \
    && cd velox && git submodule sync --recursive && git submodule update --init --recursive
RUN cd /usr/local/velox && ./scripts/setup-ubuntu.sh 
RUN cd /usr/local/velox && make VELOX_BUILD_TESTING=OFF
RUN apt-get install openssh-server -y
RUN apt install nano emacs-nox -y
CMD /usr/bin/bash
