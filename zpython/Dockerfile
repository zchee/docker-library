FROM buildpack-deps:trusty
MAINTAINER zchee <zchee.io@gmail.com>

ENV ZSH_VERSION 5.1.1-dev-0
ENV PYTHON_VERSION 3.4

# Dependency build zsh
RUN apt-get update && apt-get install -y yodl python3-dev ninja-build cmake

# Clone zsh & zpython source
RUN mkdir /src && cd /src && git clone git://git.code.sf.net/p/zsh/code zsh

WORKDIR /src/zsh
RUN ./.preconfig && ./configure --enable-fndir=/usr/local/share/zsh/functions --enable-scriptdir=/usr/local/share/zsh/scripts --enable-site-fndir=/usr/local/share/zsh/site-functions --enable-site-scriptdir=/usr/local/share/zsh/site-scripts --enable-runhelpdir --enable-cap --enable-maildir-support --enable-multibyte --enable-pcre --enable-zsh-secure-free --disable-etcdir --enable-gdbm --with-tcsetpgrp --with-term-lib='ncurses ncursesw'
RUN make -j $(nproc)
RUN make install
RUN Src/zsh -fc 'echo -n $module_path[1]'

RUN cd /src && hg clone https://bitbucket.org/ZyX_I/zpython zpython && cd /src/zpython && mkdir build
WORKDIR /src/zpython/build
RUN cmake .. -G 'Ninja' -DZSH_REPOSITORY=/src/zsh -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.4m.so -DPYTHON_INCLUDE_DIR=/usr/include/python3.4 -DPYTHON_INCLUDE_DIR2=/usr/include/python3.4m
RUN ninja
RUN ninja install

RUN mv /usr/local/lib/zsh/$ZSH_VERSION/libzpython.so /usr/local/lib/zsh/$ZSH_VERSION/zsh/zpython.so
RUN echo "zmodload zsh/zpython" > $HOME/.zshenv

# Debug - Check Python sys.version_info
# RUN zsh -c "zpython 'import sys; print(sys.version_info)'"

ENTRYPOINT ["/usr/local/bin/zsh", "-c", "zpython"]
