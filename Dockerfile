FROM hub.c.163.com/public/centos:7.2.1511
MAINTAINER ampletec <rj05116@163.com>

#install tools
#RUN yum install -y tar && \
#yum install -y wget && \
#yum clean all

# download zentao package and unzip
WORKDIR /opt
RUN wget http://dl.cnezsoft.com/zentao/9.6/ZenTaoPMS.9.6.stable.zbox_64.tar.gz && \
tar -zxvf ZenTaoPMS.9.6.stable.zbox_64.tar.gz

#copy script
COPY script /opt/script
RUN chmod 777 /opt/script/run.sh

# database port
EXPOSE 3690
# web port
EXPOSE 8080


# datadir /opt/zbox/data
# CMD ["start","-ap","8080"]
ENTRYPOINT /opt/script/run.sh
