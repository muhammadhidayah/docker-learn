FROM ubuntu:18.04

MAINTAINER Muhammad Hidayah <hidayah@inarts.co.id>

RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/php.list

RUN apt-get update && apt-get install apache2 && apt-get install -y php5.6 php5.6-bcmath php5.6-bz2 php5.6-curl \
php5.6-gd php5.6-gmp php5.6-json php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml php5.6-xmlrpc php5.6-xsl php5.6-zip

RUN apt-get autoclean && apt-get -y autoremove

VOLUME ["/var/www", "/var/www/html", "/var/log"]

EXPOSE 80 443

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
