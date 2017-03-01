FROM jenkins:2.32.2

USER root

RUN apt-get update
RUN apt-get install -y maven && \
    apt-get install -y openssh-server


USER jenkins

COPY plugins.txt /usr/share/jenkins/plugins.txt
# workaround, s. https://github.com/jenkinsci/docker/issues/348
RUN /usr/local/bin/install-plugins.sh $(cat /usr/share/jenkins/plugins.txt | tr '\n' ' ')

COPY create-admin-user.groovy /usr/share/jenkins/ref/init.groovy.d/create-admin-user.groovy

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
