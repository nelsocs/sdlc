FROM ubuntu:latest
MAINTAINER github@cryptzero.net
ENV TERM linux
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update
RUN apt-get install -y apt-utils debconf-utils mutt
RUN echo 'postfix postfix/mailname string your.hostname.com' | debconf-set-selections
RUN echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections
RUN apt-get install -qq -y git curl heirloom-mailx ruby postfix libsasl2-modules vim
RUN mkdir -p /opt
WORKDIR /opt
RUN gem install brakeman
RUN gem install ruby_parser
RUN gem install ruby2ruby
RUN gem install erubis
WORKDIR /opt
ENV ACCESS_TOKEN {TOKEN_HERE}
ENV ORGNAME {ORGNAME_HERE}
ENV BASEDIR /opt/{ORGNAME_HERE}/sdlc
ENV REPODIR /opt/{ORGNAME_HERE}/sdlc/repos
RUN mkdir -p /opt/${ORGNAME}/
WORKDIR /opt/${ORGNAME}
RUN git clone https://github.com/nelsocs/sdlc.git
RUN mkdir -p /opt/${ORGNAME}/sdlc/repos
RUN mkdir -p /opt/${ORGNAME}/sdlc/reports
ADD main.cf /etc/postfix/
ADD sasl_passwd /etc/postfix/sasl/
CMD postfix restart
CMD /opt/${ORGNAME}/sdlc/gitclone.sh
