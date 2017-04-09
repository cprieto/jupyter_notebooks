FROM debian:stretch-slim

LABEL mantainer "me@cprieto.com"

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y python python-dev build-essential wget m4 pkg-config libffi6 libffi-dev libgmp10 libgmp-dev zlib1g zlib1g-dev \
    && wget https://bootstrap.pypa.io/get-pip.py -O  - | python \
    && pip install jupyter \
    && pip install jupyterthemes \
    && apt-get install -y ocaml opam libczmq-dev \
    && apt-get autoremove -y && rm -rf /var/lib/apt/lists/* \
    && useradd -m jupyter \
    && su jupyter -c 'opam init -a && eval `opam config env` && opam install core async yojson core_extended core_bench cohttp async_graphics cryptokit menhir iocaml' \
    && jt -t grade3 -f aurulent \
    && jupyter kernelspec install --name iocaml /home/jupyter/.opam/system/lib/iocaml-kernel/ \
    && mkdir /home/jupyter/notebook && chown jupyter /home/jupyter/notebook
COPY kernel.json /usr/local/share/jupyter/kernels/iocaml
USER jupyter

COPY jupyter_notebook_config.py /home/jupyter
COPY start.sh /home/jupyter
WORKDIR /home/jupyter/notebook

VOLUME ["/home/jupyter/notebook"]

EXPOSE 8888

CMD ["/home/jupyter/start.sh"]
