FROM ubuntu

#Add docker to sudoers
RUN apt-get update && apt-get -y install sudo && (useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo)
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common
RUN sudo DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:webupd8team/java && sudo apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

#Download Java and Scala
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get -y install oracle-java8-set-default
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get -y install scala

CMD ["/bin/bash"] 

