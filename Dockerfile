#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
FROM devilbox/php-fpm-8.1:latest

RUN apt update && apt install -y python3-pip && apt upgrade -y && apt install -y lsb-release ca-certificates apt-transport-https software-properties-common \
    && apt install -y wget curl cron git unzip gnupg2 && apt -y full-upgrade && apt -y autoremove && pip3 install supervisor

#RUN wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -
#RUN sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
#RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
#RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
#RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
#    && apt-get install -y nodejs && npm install -g npm@7.20.1
#RUN apt update && apt install yarn

WORKDIR /
STOPSIGNAL SIGQUIT

EXPOSE 9000
CMD ["php-fpm"]
