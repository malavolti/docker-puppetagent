FROM ubuntu:12.04
MAINTAINER Simon&MaLa "www.cazzimiei.it"
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y wget
RUN wget -q https://apt.puppetlabs.com/puppetlabs-release-precise.deb -O /tmp/puppetlabs.deb
RUN dpkg -i /tmp/puppetlabs.deb
RUN apt-get update
RUN apt-get -y install puppet ruby augeas-tools  
ADD puppet.conf /etc/puppet/puppet.conf
RUN mkdir /var/run/sshd
#RUN echo "127.0.0.1 puppetagent.irccs.garr.it puppetagent" >> /etc/hosts
#RUN echo "puppetagent" > /etc/hostname

RUN mkdir /root/.ssh
# NOTE: change this key to your own
ADD sshkey.pub /root/.ssh/authorized_keys
RUN chown root:root /root/.ssh/authorized_keys
RUN service puppet start

EXPOSE 22
EXPOSE 3000
EXPOSE 8080
EXPOSE 8081
EXPOSE 8140
CMD ["/bin/bash"]
