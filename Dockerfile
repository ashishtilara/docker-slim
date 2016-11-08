FROM ambakshi/amazon-linux:latest

MAINTAINER ManishTilara <manish@itcutives.com>

# update yum
RUN yum -y update --nogpgcheck; yum clean all
RUN yum -y install yum-utils

# Install some must-haves
# RUN yum -y install git --nogpgcheck
RUN yum -y install vim --nogpgcheck

RUN mkdir /opt/logs

RUN yum -y install php70 php70-cli php70-common php70-json php70-zip php70-odbc php70-fpm php70-mbstring php70-mcrypt php70-devel php70-xml php70-mysqlnd php70-pdo php70-pecl-xdebug php70-pecl-mongodb php70-pecl-redis

COPY docker/000-default.conf /etc/httpd/conf.modules.d/000-default.conf
COPY docker/php.ini /etc/php.ini
COPY docker/startup.sh /opt/startup.sh
RUN chmod +x /opt/startup.sh

EXPOSE 80
EXPOSE 443

CMD ["sh", "/opt/startup.sh"]
