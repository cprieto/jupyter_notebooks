FROM alpine:latest
LABEL mantainer "me@cprieto.com"

RUN apk update && apk upgrade \
    && apk add python ca-certificates wget python-dev build-base tini \
    && update-ca-certificates \
    && wget https://bootstrap.pypa.io/get-pip.py -O  - | python \
    && pip install jupyter \
    && rm -rf /var/cache/apk/* \
    && adduser -D jupyter \
    && mkdir /home/jupyter/notebooks \
    && chown jupyter /home/jupyter/notebooks \
    && apk del wget build-base \
    && rm -rf /var/cache/apk/*


EXPOSE 8888

USER jupyter
WORKDIR /home/jupyter/notebooks

VOLUME ["/home/jupyter/notebooks"]

ENTRYPOINT ["tini", "--"]

CMD ["jupyter-notebook", "--no-browser", "--ip", "0.0.0.0", "--NotebookApp.token="]
