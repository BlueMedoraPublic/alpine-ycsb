FROM bmedora/alpine-zulu-jdk8:latest-mini
MAINTAINER engops@bluemedora.com

ENV YCSB_VERSION=0.17.0-SNAPSHOT \
    PATH=${PATH}:/usr/bin

RUN apk --update --no-cache add python mksh \
    && cd /opt \
    && eval curl "-Ls https://github.com/BlueMedoraPublic/YCSB/archive/${YCSB_VERSION}.tar.gz" \
    | tar -xzvf -

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENV ACTION='' DBTYPE='' WORKLETTER='' DBARGS='' RECNUM='' OPNUM=''

WORKDIR "/opt/ycsb-${YCSB_VERSION}"

ENTRYPOINT ["/start.sh"]
