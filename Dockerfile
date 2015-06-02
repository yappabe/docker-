FROM debian:jessie

MAINTAINER Joeri Verdeyen <joeriv@yappa.be>

ENV DOCUMENT_ROOT /var/www/app/html

RUN \
  apt-get update && \
  apt-get install -y apache2 && \
  rm -rf /var/lib/apt/lists/* && \
  a2enmod proxy && \
  a2enmod proxy_http && \
  a2enmod proxy_fcgi && \
  a2enmod authn_core && \
  a2enmod access_compat && \
  a2enmod alias && \
  a2enmod authz_core && \
  a2enmod authz_host && \
  a2enmod authz_user && \
  a2enmod dir && \
  a2enmod env && \
  a2enmod mime && \
  a2enmod reqtimeout && \
  a2enmod rewrite && \
  a2enmod status && \
  a2enmod filter && \
  a2enmod deflate && \
  a2enmod setenvif && \
  a2enmod vhost_alias && \
  a2enmod ssl && \
  apt-get autoremove -y && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists

RUN echo Europe/Brussels > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN ln -sf /dev/stderr /var/log/apache2/error.log

COPY default.conf /etc/apache2/sites-available/000-default.conf
RUN sed -i 's/$DOCUMENT_ROOT/${DOCUMENT_ROOT}/g' /etc/apache2/sites-available/000-default.conf

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]