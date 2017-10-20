FROM node:6.9.4

RUN npm install -g grunt-cli grunt

# Install Ruby & Compass
RUN apt-get -yq update && \
    apt-get -yq install ruby ruby-dev python3

RUN gem update --system && \
    gem install compass

RUN pip install awscli --upgrade --user

RUN useradd -ms /bin/bash jenkins