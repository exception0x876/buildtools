FROM php:7.2
ENV PATH="/var/jenkins_home/.composer/vendor/bin:${PATH}"
ENV COMPOSER_HOME="/var/jenkins_home/.composer"

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --filename composer \
    && rm composer-setup.php

RUN curl -O https://deb.nodesource.com/setup_10.x && bash setup_10.x \
 && apt-get install -y unzip nodejs build-essential \
 && apt-get clean

RUN npm install -g node-sass

USER 1000:1000

ENTRYPOINT []
