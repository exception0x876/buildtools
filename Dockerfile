FROM php:7.2
ENV PATH="/var/jenkins_home/.composer/vendor/bin:${PATH}"
ENV COMPOSER_HOME="/var/jenkins_home/.composer"
ENV NPM_CONFIG_CACHE="/var/jenkins_home/.npm/cache"

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir /usr/local/bin --filename composer \
    && rm composer-setup.php

RUN apt-get update \
    && apt-get install -y unzip git gnupg2 \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs build-essential \
    && curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn \
    && apt-get clean

RUN yarn global add node-sass

RUN useradd -ms /bin/bash -u 1000 buildbot

USER buildbot:1000

RUN git config --global user.email "exception0x876@gmail.com" \
    && git config --global user.name "Jenkins build bot"

ENTRYPOINT []
