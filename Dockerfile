FROM jenkins/jenkins:lts-jdk11
USER root
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
RUN apt-get update
RUN apt-get install -y cmake g++ git
RUN dpkg-reconfigure --frontend noninteractive tzdata
USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
COPY casc.yaml /var/jenkins_home/casc.yaml
RUN mkdir /var/jenkins_home/jobs
RUN mkdir /var/jenkins_home/jobs/CoolGame
COPY config.xml /var/jenkins_home/jobs/CoolGame/
