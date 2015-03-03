FROM ubuntu:14.04
MAINTAINER jerome.petazzoni@docker.com

# Let's start with some basic stuff.
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables
    
# Install Docker from Docker Inc. repositories.
RUN curl -sSL https://get.docker.com/ubuntu/ | sh

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
ADD ./trap_and_stop.sh /trap_and_stop.sh
RUN chmod +x /usr/local/bin/wrapdocker
RUN chmod +x /trap_and_stop.sh

# Define additional metadata for our image.
VOLUME /var/lib/docker
CMD ["wrapdocker"]

