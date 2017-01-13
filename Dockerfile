FROM ubuntu:latest
ENV TERM linux
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update
RUN apt-get install -y apt-utils debconf-utils
RUN echo 'postfix postfix/mailname string your.hostname.com' | debconf-set-selections
RUN echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections
RUN apt-get install -qq -y git curl heirloom-mailx ruby postfix
RUN mkdir -p /opt/.ssh
WORKDIR /opt
RUN gem install brakeman
RUN gem install ruby_parser
RUN gem install ruby2ruby
RUN gem install erubis
WORKDIR /opt
ENV ORG_NAME ***
ENV ACCESS_TOKEN *** 
ENV ORGNAME ***
ENV BASEDIR /opt/***/sdlc
ENV REPODIR /opt/***/sdlc/repos
RUN mkdir -p /opt/${ORGNAME}/
WORKDIR /opt/${ORGNAME}
RUN git clone https://github.com/nelsocs/sdlc.git
RUN mkdir -p /opt/${ORGNAME}/sdlc/repos
RUN mkdir -p /opt/${ORGNAME}/sdlc/reports

