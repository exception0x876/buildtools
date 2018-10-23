FROM php:7.2
ENV PATH="/var/jenkins_home/.composer/vendor/bin:/var/jenkins_home/bin:${PATH}"

RUN apt-get update && apt-get install -y unzip nodejs && apt-get clean

ENTRYPOINT []
