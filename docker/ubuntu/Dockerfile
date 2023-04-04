FROM ubuntu:18.04

USER root
# Set Timezone
ENV TZ=Asia/Ho_Chi_Minh
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir -p /var/run/sshd && \
    echo 'root:root' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config

RUN apt-get install locales sudo net-tools lsb-release software-properties-common gnupg -y

RUN apt-get install apt-utils \
  sudo vim git wget curl locales ssh htop \
  build-essential libssl-dev zlib1g-dev libbz2-dev \
  libreadline-dev libsqlite3-dev wget curl llvm \
  libncurses5-dev libncursesw5-dev xz-utils liblzma-dev \
  g++ make unzip zip -y

# Set locale
RUN locale-gen en_US.UTF-8

# Create a new user
RUN userdel user; exit 0
RUN adduser user --shell /bin/bash --disabled-password --home /home/user --gecos ""
RUN usermod -aG sudo user
RUN echo 'user:user' | chpasswd

EXPOSE 22
# RUN /usr/sbin/sshd -d &
CMD ["/usr/sbin/sshd", "-D"]


