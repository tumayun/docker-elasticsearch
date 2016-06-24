FROM elasticsearch:2.3.3

RUN bin/plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v1.9.3/elasticsearch-analysis-ik-1.9.3.zip
RUN mv /usr/share/elasticsearch/plugins/analysis-ik /usr/share/elasticsearch/plugins/ik
RUN cp -r /etc/elasticsearch/analysis-ik/ik /usr/share/elasticsearch/plugins/ik/config
RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/plugins/ik
RUN rm -rf /etc/elasticsearch

COPY config/elasticsearch.yml /usr/share/elasticsearch/config

CMD ["elasticsearch"]
