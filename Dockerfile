FROM ubuntu:16.04
MAINTAINER Ddnirvana "ddnirvana1@gmail.com"

RUN apt-get -qq update && apt-get install -y curl vim git build-essential net-tools iputils-ping pciutils iperf iperf3 openssh-server wget module-init-tools ethtool fuse libfuse-dev psmisc tmux; 
RUN cp /usr/include/fuse /usr/local/include/ -r

RUN apt-get -qq update && apt-get install -y sudo;

COPY mypasswd /home/

RUN useradd --no-log-init -r -m -g root stu

COPY README.md /home/stu/

RUN cat /home/mypasswd | chpasswd

RUN apt-get install -y g++-4.7 gcc-4.7;

RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.7 70 && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 50 && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.7 50 && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 50;

RUN apt-get install -y python python3;

RUN apt-get install -y zsh ctags sloccount cmake;

RUN apt-get install -y clang-5 python-pip zip;

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

USER stu

#$VOLUME ["/root"]
WORKDIR /home/stu/
