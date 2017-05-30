FROM alpine:latest
LABEL mantainer "me@cprieto.com"

RUN apk update && apk upgrade \
        && apk add python ca-certificates wget python-dev build-base tini \
        && update-ca-certificates \
        && wget https://bootstrap.pypa.io/get-pip.py -O - | python \
        && pip install jupyter \
        && adduser -D jupyter \
        && mkdir /home/jupyter/notebooks \
        && chown jupyter /home/jupyter/notebooks \
        && apk add libtool libffi-dev ruby ruby-dev \
        && gem install --no-ri --no-rdoc cztop \
        && gem install --no-ri --no-rdoc iruby \
        && apk add sudo && sudo -u jupyter iruby register --force \
        && apk add git autoconf automake file zeromq zeromq-dev \
        && git clone https://github.com/zeromq/czmq \
        && cd czmq && ./autogen.sh && ./configure && make && make install \
        && cd .. && rm -rf czmq \
        && apk del automake autoconf file git wget build-base \
        && rm -rf /var/cache/apk/*

EXPOSE 8888

USER jupyter
WORKDIR /home/jupyter/notebooks

VOLUME ["/home/jupyter/notebooks"]
ENTRYPOINT ["tini", "--"]

CMD ["jupyter-notebook", "--no-browser", "--ip", "0.0.0.0", "--NotebookApp.token="]
