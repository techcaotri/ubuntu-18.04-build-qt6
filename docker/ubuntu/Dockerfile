FROM ubuntu:18.04

USER root
# Set Timezone
ENV TZ=Asia/Ho_Chi_Minh
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install -y openssh-server xauth mesa-utils && \
    mkdir -p /var/run/sshd && \
    echo 'root:root' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config

RUN apt-get install locales sudo net-tools lsb-release software-properties-common gnupg -y

# Dependencies for glvnd and X11.
RUN apt-get install -y -qq --no-install-recommends \
    libglvnd0 \
    libgl1 \
    libglx0 \
    libegl1 \
    libxext6 \
    libx11-6 libegl1-mesa-dev

RUN apt-get install apt-utils \
  sudo vim git wget curl locales ssh htop \
  build-essential libssl-dev zlib1g-dev libbz2-dev \
  libreadline-dev libsqlite3-dev wget curl llvm \
  libncurses5-dev libncursesw5-dev xz-utils liblzma-dev \
  g++ make unzip zip -y

# Install Qt6 build dependencies
COPY install_prerequisites.sh /tmp/install_prerequisites.sh
RUN chmod +x /tmp/install_prerequisites.sh
RUN /tmp/install_prerequisites.sh

# Set locale
RUN locale-gen en_US.UTF-8

# Create a new user
RUN userdel user; exit 0
RUN adduser user --shell /bin/bash --disabled-password --home /home/user --gecos ""
RUN usermod -aG sudo user
RUN echo 'user:user' | chpasswd

# Env vars for the nvidia-container-runtime.
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES graphics,utility,compute

EXPOSE 22
# RUN /usr/sbin/sshd -d &
CMD ["/usr/sbin/sshd", "-D"]


