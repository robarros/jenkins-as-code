FROM jenkins/jenkins:alpine

ENV ADMIN_USERNAME admin
ENV ADMIN_PASSWORD admin
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /usr/share/jenkins/ref/

COPY jenkins.yaml /usr/share/jenkins/ref/jenkins.yaml
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY admin-user.groovy /usr/share/jenkins/ref/init.groovy.d/

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
