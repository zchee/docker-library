FROM ruby:2.2.1
MAINTAINER zchee <zcheeee@gmail.com>

WORKDIR /tmp
ENV ZSH_VERSION 5.0.7
RUN curl -SLO "http://jaist.dl.sourceforge.net/project/zsh/zsh/${ZSH_VERSION}/zsh-${ZSH_VERSION}.tar.bz2"
RUN tar -jxf "zsh-${ZSH_VERSION}.tar.bz2"
WORKDIR zsh-${ZSH_VERSION}
RUN ./configure --prefix=/usr/local --enable-multibyte --enable-locale --with-tcsetpgrp
RUN make && make install

RUN echo '/usr/local/bin/zsh' >> /etc/shells
RUN chsh -s /usr/local/bin/zsh root

ENV HOME /root
RUN git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"

RUN mv /root/.zprezto/runcoms/zlogin /root/.zlogin &&\
    mv /root/.zprezto/runcoms/zlogout /root/.zlogout &&\
    mv /root/.zprezto/runcoms/zpreztorc /root/.zpreztorc &&\
    mv /root/.zprezto/runcoms/zprofile /root/.zprofile &&\
    mv /root/.zprezto/runcoms/zshenv /root/.zshenv &&\
    mv /root/.zprezto/runcoms/zshrc /root/.zshrc

RUN echo "`cat /root/.bashrc`" >> /root/.zshrc

WORKDIR /root

ADD sources.list /etc/apt/sources.list

RUN \
  apt-get update && \
  apt-get dist-upgrade -y --no-install-recommends && \
  apt-get install -y --no-install-recommends git && \
  apt-get autoremove -y && \
  apt-get clean

# Install ruby gems
RUN \
  gem update --system && \
  gem install rake -v 10.4.2 --no-rdoc --no-ri && \
  gem install hoe -v 3.8.1 --no-rdoc --no-ri && \
  gem install net-http-persistent -v 2.9.4 --no-rdoc --no-ri

# Install and configure rubygems-mirror
RUN \
  git clone https://github.com/huacnlee/rubygems-mirror.git && \
  mkdir -p /mirror/rubygems.org
ADD mirrorrc /root/.gem/.mirrorrc

# Install run.sh
ADD run.sh /run.sh
RUN chmod 0755 /run.sh

VOLUME ["/mirror/rubygems.org"]

CMD ["/run.sh"]
