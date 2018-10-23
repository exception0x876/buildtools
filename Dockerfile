FROM php:7.2
ENV PATH="/var/jenkins_home/.composer/vendor/bin:${PATH}"
ENV COMPOSER_HOME="/var/jenkins_home/.composer"

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir /usr/local/bin --filename composer \
    && rm composer-setup.php

RUN apt-get update \
    && apt-get install -y unzip gnupg2 \
    && curl -O https://deb.nodesource.com/setup_10.x && bash setup_10.x \
    && apt-get install -y nodejs build-essential \
    && apt-get clean

RUN npm install -g node-sass

USER 1000:1000

ENTRYPOINT []
