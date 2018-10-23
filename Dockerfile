FROM php:7.2
ENV PATH="/var/jenkins_home/.composer/vendor/bin:${PATH}"
ENV COMPOSER_HOME="/var/jenkins_home/.composer"

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir /usr/local/bin --filename composer \
    && rm composer-setup.php

RUN apt-get update \
    && apt-get install -y unzip gnupg2 \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs build-essential \
    && curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn \
    && apt-get clean

RUN yarn global add node-sass

USER 1000:1000

ENTRYPOINT []
