FROM ubuntu:24.04

RUN apt-get update && \
  apt-get install -y --no-install-recommends openssh-server sudo python3 && \
  useradd -m -s /bin/bash ansible && \
  echo 'ansible:ansible' | chpasswd && \
  echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
  mkdir -p /var/run/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
