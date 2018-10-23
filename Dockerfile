FROM php:7.2
ENV PATH="/var/jenkins_home/.composer/vendor/bin:/var/jenkins_home/bin:${PATH}"

RUN curl -O https://deb.nodesource.com/setup_10.x && bash setup_10.x \
 && apt-get install -y unzip nodejs build-essential \
 && apt-get clean

USER 1000:1000

ENTRYPOINT []
