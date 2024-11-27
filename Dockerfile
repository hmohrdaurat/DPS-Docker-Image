FROM ubuntu:jammy
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -yy && \
    apt-get upgrade -yy && \
    apt-get install -yy curl wget git build-essential sudo cmake ninja-build && \
    apt-get install -yy lldb clang-format clang-tidy clang nano emacs-nox nodejs && \
    apt-get upgrade -yy gdb lldb valgrind && \
    apt-get install -yy libboost-all-dev && \
    apt-get install -yy uuid-dev libfmt-dev libspdlog-dev libssl-dev libcurl4-openssl-dev && \
    apt-get install -yy libevent-dev liblz4-dev libzstd-dev libbz2-dev libgflags-dev libgoogle-glog-dev libsnappy-dev && \
    apt-get install -yy openssh-server openssh-client && \
    apt-get install -yy enscript ghostscript  && \
    apt-get autoremove  && \
    apt-get autoclean  && \
    apt-get clean
COPY build-init.sh /usr/local/bin/build-init.sh
COPY generate_report.py /usr/local/bin/generate_report.py
CMD /usr/bin/bash
