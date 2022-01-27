FROM docker.io/rockylinux/rockylinux:latest
EXPOSE 22/tcp, 80/tcp, 3306/tcp
RUN curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | bash ;\
 dnf install epel-release -y ;\
 dnf update -y ;\
 dnf install openssh-server passwd mariadb-server nginx sudo dnf-plugins-core -y ;\
 dnf install http://rpms.remirepo.net/enterprise/remi-release-8.rpm -y ;\
 dnf install php72 php72-php-cli php72-php-fpm php72-php-mysqlnd php72-php-zip php72-php-gd php72-php-mcrypt php72-php-mbstring php72-php-curl php72-php-xml php72-php-pear php72-php-bcmath php72-php-json php72-php-opcache php72-php-pecl-apcu php72-php-pecl-xdebug3 php72-php-intl -y ;\
 dnf install php73 php73-php-cli php73-php-fpm php73-php-mysqlnd php73-php-zip php73-php-gd php73-php-mcrypt php73-php-mbstring php73-php-curl php73-php-xml php73-php-pear php73-php-bcmath php73-php-json php73-php-opcache php73-php-pecl-apcu php73-php-pecl-xdebug3 php73-php-intl -y ;\
 dnf install php74 php74-php-cli php74-php-fpm php74-php-mysqlnd php74-php-zip php74-php-gd php74-php-mcrypt php74-php-mbstring php74-php-curl php74-php-xml php74-php-pear php74-php-bcmath php74-php-json php74-php-opcache php74-php-pecl-apcu php74-php-pecl-xdebug3 php74-php-intl -y ;\
 dnf install php80 php80-php-cli php80-php-fpm php80-php-mysqlnd php80-php-zip php80-php-gd php80-php-mcrypt php80-php-mbstring php80-php-curl php80-php-xml php80-php-pear php80-php-bcmath php80-php-json php80-php-opcache php80-php-pecl-apcu php80-php-pecl-xdebug3 php80-php-intl -y ;\
 systemctl enable sshd mariadb nginx php72-php-fpm php73-php-fpm php74-php-fpm php80-php-fpm ;\
 echo "alias ll='ls --color -l'" >> ~/.bashrc && echo "alias ls='ls --color'" >> ~/.bashrc ;\
 ln -s /usr/bin/php74 /usr/local/bin/php ;\
 php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" ;\
 php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" ;\
 php composer-setup.php ;\
 php -r "unlink('composer-setup.php');" ;\
 mv composer.phar /usr/local/bin/composer ;\
 echo Passitnow123$ | passwd --stdin root

COPY configs/ /
RUN chmod +x /usr/bin/dbcreate /usr/bin/dbdrop /usr/bin/prepare-webroot /usr/bin/vhostcreate ;\
 chown -R nginx /var/opt/remi/php72/log/* /var/opt/remi/php73/log/* /var/opt/remi/php74/log/* /var/opt/remi/php80/log/* ;\
 chgrp -R nginx /var/opt/remi/php72/lib/php/opcache /var/opt/remi/php73/lib/php/opcache /var/opt/remi/php74/lib/php/opcache /var/opt/remi/php80/lib/php/opcache \
  /var/opt/remi/php72/lib/php/session /var/opt/remi/php73/lib/php/session /var/opt/remi/php74/lib/php/session /var/opt/remi/php80/lib/php/session \
  /var/opt/remi/php72/lib/php/wsdlcache /var/opt/remi/php73/lib/php/wsdlcache /var/opt/remi/php74/lib/php/wsdlcache /var/opt/remi/php80/lib/php/wsdlcache ;\
 chmod -R u+rw /var/opt/remi/php72/log/* /var/opt/remi/php73/log/* /var/opt/remi/php74/log/* /var/opt/remi/php80/log/* ;\
 chmod -R g+rw /var/opt/remi/php72/lib/php/opcache /var/opt/remi/php73/lib/php/opcache /var/opt/remi/php74/lib/php/opcache /var/opt/remi/php80/lib/php/opcache \
  /var/opt/remi/php72/lib/php/session /var/opt/remi/php73/lib/php/session /var/opt/remi/php74/lib/php/session /var/opt/remi/php80/lib/php/session \
  /var/opt/remi/php72/lib/php/wsdlcache /var/opt/remi/php73/lib/php/wsdlcache /var/opt/remi/php74/lib/php/wsdlcache /var/opt/remi/php80/lib/php/wsdlcache

VOLUME ["/var/lib/mysql"]
VOLUME ["/etc/nginx/sites-enabled"]
VOLUME ["/var/www"]
CMD ["/sbin/init"]
