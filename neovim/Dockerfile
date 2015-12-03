FROM buildpack-deps:trusty
MAINTAINER zchee <zchee.io@gmail.com>

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		libtool \
		autoconf \
		automake \
		cmake \
		g++ \
		pkg-config \
		unzip \
		python-dev \
		python3-dev \
	&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/neovim/neovim.git
WORKDIR neovim

ADD local.mk .
RUN make install -j$($nproc)

RUN mkdir -p $HOME/.config/nvim
ADD nvim /root/.config/nvim

CMD ["nvim"]
