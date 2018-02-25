FROM library/debian:9
LABEL maintainer="ondrej@hamada.cz"

ENV OPENGROK_INSTANCE_BASE /var/opengrok
RUN mkdir -p $OPENGROK_INSTANCE_BASE/src $OPENGROK_INSTANCE_BASE/data $OPENGROK_INSTANCE_BASE/etc

ADD files/opengrok_prepare.sh /opengrok_install.sh
RUN /bin/bash /opengrok_install.sh

EXPOSE 8080

ADD files/opengrok_run.sh /opengrok_run.sh
CMD ["/opengrok_run.sh"]
