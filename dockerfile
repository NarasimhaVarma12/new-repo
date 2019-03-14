FROM debian:stretch

MAINTAINER Narasimha Rao <narasimharao.k9951@gmail.com>

WORKDIR /opt/app-root

COPY app /opt/app-root

USER root


RUN apt-get update &&\
	apt-get install -y python3 &&\
	apt-get install -y vim
	
ENV APP_ROOT=/opt/app-root

ENV PATH=${APP_ROOT}/bin:${PATH} HOME=${APP_ROOT}


RUN chmod -R 775 ${APP_ROOT}/bin  &&\
	chgrp -R ${APP_ROOT} &&\
	chmod -R ${APP_ROOT} /etc/passwd
	
	
USER 10001

CMD run
