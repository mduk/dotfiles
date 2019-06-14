declare composer_url=""

header PHP Development

install php7.2-fpm php7.2-dev php7.2-cli \
  php7.2-bcmath \
  php7.2-curl \
  php7.2-gd \
  php7.2-imap \
  php7.2-intl \
  php7.2-json \
  php7.2-mbstring \
  php7.2-mysql \
  php7.2-odbc \
  php7.2-pgsql \
  php7.2-sqlite \
  php7.2-xml \
  php7.2-xsl

declare expected="$(curl https://composer.github.io/installer.sig)"
curl "https://getcomposer.org/installer" > /tmp/composer-setup.php
read actual _ <(sha384sum /tmp/composer-setup.php)

if [[ $expected != $actual ]]
then
    >&2 echo 'ERROR: Invalid installer signature'
    rm /tmp/composer-setup.php
    exit 1
fi

php /tmp/composer-setup.php --quiet
declare res=$?

rm /tmp/composer-setup.php

exit $res
