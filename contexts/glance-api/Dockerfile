# duck/glance-api
#
# VERSION               0.0.1

FROM ubuntu:12.04

MAINTAINER Brett Campbell "brett.campbell@rackspace.com"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y openssh-server python-apt
RUN locale-gen en_US.UTF-8
RUN mkdir -p /var/run/sshd /root/.ssh
RUN sed -i '/^UsePAM/ s/yes/no/' /etc/ssh/sshd_config
ADD authorized_keys /root/.ssh/authorized_keys
EXPOSE 22

ADD havana.list /etc/apt/sources.list.d/havana.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key EC4926EA
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key 9F68104E
RUN apt-get update && apt-get install -y glance python-swift python-lockfile \
        python-mysqldb python-keystone curl
ADD glance/glance-api.conf /etc/glance/
ADD glance/glance-api-paste.ini /etc/glance/
ADD glance/policy.json /etc/glance/
RUN chown -R glance:glance /etc/glance
EXPOSE 9292

ENTRYPOINT ["start-stop-daemon"]
CMD ["--start", "--chuid=glance", "--chdir=/var/lib/glance", \
     "--name=glance-api", "--exec=/usr/bin/glance-api"]
