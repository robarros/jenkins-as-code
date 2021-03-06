FROM jenkins/jenkins:alpine

ARG JENKINS_USERNAME=admin
ARG JENKINS_PASSWORD=admin

ENV ADMIN_USERNAME=${JENKINS_USERNAME}
ENV ADMIN_PASSWORD=${JENKINS_PASSWORD}
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /usr/share/jenkins/ref/

COPY jenkins.yaml /usr/share/jenkins/ref/jenkins.yaml
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY admin-user.groovy /usr/share/jenkins/ref/init.groovy.d/

USER jenkins

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt