FROM elasticsearch:7.6.2
ENV ELASTICSEARCH_VERSION 7.6.2

RUN yum install wget --setopt=tsflags=nodocs -y

RUN wget -c --tries=0 -O /tmp/elasticsearch-analysis-ik.zip \
    https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v${ELASTICSEARCH_VERSION}/elasticsearch-analysis-ik-${ELASTICSEARCH_VERSION}.zip && \
    wget -c --tries=0 -O /tmp/elasticsearch-analysis-pinyin.zip \
    https://github.com/medcl/elasticsearch-analysis-pinyin/releases/download/v${ELASTICSEARCH_VERSION}/elasticsearch-analysis-pinyin-${ELASTICSEARCH_VERSION}.zip && \
    mkdir /usr/share/elasticsearch/plugins/ik /usr/share/elasticsearch/plugins/pinyin && \
    unzip /tmp/elasticsearch-analysis-ik.zip -d /usr/share/elasticsearch/plugins/ik && \
    unzip /tmp/elasticsearch-analysis-pinyin.zip -d /usr/share/elasticsearch/plugins/pinyin && \
    rm -rf /tmp/elasticsearch-analysis-ik.zip /tmp/elasticsearch-analysis-pinyin.zip

RUN ls /usr/share/elasticsearch/plugins/ik /usr/share/elasticsearch/plugins/pinyin
