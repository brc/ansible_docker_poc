# duck/sshd
#
# VERSION               0.0.2

FROM ubuntu:13.10

MAINTAINER Brett Campbell "invsblduck@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN echo 'deb http://archive.ubuntu.com/ubuntu saucy main universe' > /etc/apt/sources.list
RUN apt-get update && apt-get install -y openssh-server python-apt

RUN locale-gen en_US.UTF-8

RUN mkdir -p /var/run/sshd /root/.ssh
RUN sed -i '/^UsePAM/ s/yes/no/' /etc/ssh/sshd_config
ADD authorized_keys /root/.ssh/authorized_keys

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd"]
CMD ["-D"]
