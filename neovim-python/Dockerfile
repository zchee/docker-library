FROM zchee/neovim
MAINTAINER zchee <k@zchee.io>

ENV NVIM_PYTHON_LOG_FILE="/tmp/log/python-client.log" \
	NVIM_PYTHON_LOG_LEVEL="DEBUG"

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		python-dev \
		python-pip \
		python3-dev \
		python3-pip \
	&& rm -rf /var/lib/apt/lists/* \
	\
	&& mkdir -p ${NVIM_PYTHON_LOG_FILE} \
	\
	&& pip install -U pip setuptools wheel \
	&& pip3 install -U pip setuptools wheel \
	&& pip install git+git://github.com/neovim/python-client \
	&& pip install git+git://github.com/msgpack/msgpack-python \
	&& pip install pyuv \
	&& pip3 install git+git://github.com/neovim/python-client \
	&& pip3 install git+git://github.com/msgpack/msgpack-python \
	&& pip3 install pyuv

COPY ./run.sh /src/run.sh
WORKDIR /src

# CMD ["nvim"]
