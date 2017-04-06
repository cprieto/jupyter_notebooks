FROM alpine:latest

#RUN apk update && apk upgrade \
    #  && apk add ca-certificates build-base python3-dev python3 \
    #&& apk add wget \
    #&& rm -rf /var/cache/apk/* \
    #&& update-ca-certificates
#RUN wget https://bootstrap.pypa.io/get-pip.py -O - | python3
#RUN pip install jupyter

RUN apk update && apk upgrade \
    && apk add python ca-certificates wget python-dev build-base \
    && update-ca-certificates \
    && wget https://bootstrap.pypa.io/get-pip.py -O  - | python \
    && pip install jupyter \
    && rm -rf /var/cache/apk/* \
    && adduser -D jupyter \
    && mkdir /home/jupyter/notebooks \
    && chown jupyter /home/jupyter/notebooks 

EXPOSE 8888

USER jupyter
COPY jupyter_notebook_config.py /home/jupyter
WORKDIR /home/jupyter/notebooks

CMD ["jupyter", "notebook", "--no-browser", "--config", "/home/jupyter/jupyter_notebook_config.py"]
