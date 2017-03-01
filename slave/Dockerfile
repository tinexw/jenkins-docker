FROM java:8

RUN apt-get update
RUN apt-get install -y openssh-server

RUN mkdir /var/run/sshd

RUN useradd jenkins -m -s /bin/bash

RUN mkdir /home/jenkins/.ssh
COPY authorized_keys /home/jenkins/.ssh/authorized_keys
RUN chown -R jenkins /home/jenkins
RUN chgrp -R jenkins /home/jenkins
RUN chmod 600 /home/jenkins/.ssh/authorized_keys
RUN chmod 700 /home/jenkins/.ssh

RUN wget -P /tmp http://mirrors.ae-online.de/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
RUN mkdir -p /usr/share/maven
RUN tar xzvf /tmp/apache-maven-3.3.9-bin.tar.gz --strip 1 -C /usr/share/maven
ENV PATH="$PATH:/usr/share/maven/bin"

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
