FROM ubuntu
MAINTAINER bokeneko <githzzy@uzzyneko.com>
LABEL "com.bokeneko.crawlnet"="1"
RUN apt-get update
RUN apt-get install -y squid3
RUN mkdir /var/cache/squid3
RUN chown proxy.proxy /var/cache/squid3
ADD squid_master.conf /etc/squid3/squid_master.conf
ADD squid_worker.conf /etc/squid3/squid_worker.conf
ADD entrypoint.sh /root/entrypoint.sh
EXPOSE 3128/tcp
ENTRYPOINT ["/bin/bash", "/root/entrypoint.sh"]
