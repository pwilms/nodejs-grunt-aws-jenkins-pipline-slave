FROM node:6.9.4

RUN npm install -g grunt-cli grunt

# Install Ruby & Compass
RUN apt-get -yq update && \
    apt-get -yq install ruby ruby-dev python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

RUN gem update --system && \
    gem install compass && \
    pip3 install awscli

RUN useradd -ms /bin/bash jenkins