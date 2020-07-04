#version 0.1.0
FROM jenkins/jnlp-slave

USER root
ENV NPM_VERSION "6.9.2"
RUN apt update && apt install -y software-properties-common bash curl build-essential
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt update && apt install -y rsync nodejs zip unzip git make ansible awscli
RUN npm install npm@${NPM_VERSION} -g
ENV PATH $PATH/:/root/.local/bin