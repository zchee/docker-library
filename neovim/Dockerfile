# Packages list
# buildpack-deps:wily-curl
#   - ca-certificates
#   - curl
# buildpack-deps:wily-scm
#   - git
#   - openssh-client
#   - procps
# buildpack-deps:wily
#   - autoconf
#   - automake
#   - g++
#   - gcc
#   - libcurl4-openssl-dev
#   - libncurses-dev
#   - libreadline-dev
#   - libssl-dev
#   - libtool-bin
#   - make
#   - patch
#   - xz-utils
#   - zlib1g-dev
# Neovim dependency
#   - cmake
#   - libtool-bin
#   - pkg-config
#   - unzip
# Recommended build tools
#   - clang-3.8
#   - llvm-3.8
#   - ninja-build

FROM ubuntu:xenial
MAINTAINER zchee <zchee.io@gmail.com>

ENV XDG_CONFIG_HOME="/root/.config" \
	XDG_CACHE_HOME="/root/.cache" \
	XDG_DATA_HOME="/root/.local/share" \
	\
	LLVM_VERSION="3.8" \
	\
	NVIM_LISTEN_ADDRESS=/tmp/nvim \
	NVIM_TUI_ENABLE_CURSOR_SHAPE=1

COPY local.mk /

RUN set -ex \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		\
		git \
		openssh-client \
		procps \
		\
		g++ \
		gcc \
		autoconf \
		automake \
		libcurl4-openssl-dev \
		libncurses-dev \
		libreadline-dev \
		libssl-dev \
		libtool-bin \
		make \
		patch \
		xz-utils \
		zlib1g-dev \
		\
		cmake \
		libtool-bin \
		pkg-config \
		unzip \
		\
		clang-$LLVM_VERSION \
		llvm-$LLVM_VERSION \
		ninja-build \
	&& rm -rf /var/lib/apt/lists/* \
	\
	&& ln -s /usr/bin/clang-$LLVM_VERSION /usr/bin/clang \
	&& ln -s /usr/bin/clang++-$LLVM_VERSION /usr/bin/clang++ \
	\
	&& git clone --depth 1 https://github.com/neovim/neovim.git \
	\
	&& mv /local.mk /neovim \
	&& echo 'DEPS_CMAKE_FLAGS += -DUSE_BUNDLED_BUSTED=OFF' >> /neovim/local.mk \
	&& cd /neovim \
	\
	&& CC=clang CXX=clang++ make -j ${nproc} \
	&& make install -j ${nproc} \
	\
	&& mkdir -p $XDG_CONFIG_HOME $XDG_CACHE_HOME $XDG_DATA_HOME /root/.config/nvim \
	&& touch /root/.config/nvim/init.vim
