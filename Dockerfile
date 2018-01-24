FROM node:6.10.3

RUN npm install -g grunt-cli grunt

# Install Ruby & Compass
RUN apt-get -yq update && \
    apt-get -yq install ruby ruby-dev python3 python3-pip jq && \
    rm -rf /var/lib/apt/lists/*

RUN gem update --system && \
    gem install compass && \
    pip3 install awscli
    
    # Installing Docker
RUN wget https://get.docker.com/builds/Linux/x86_64/docker-1.11.0.tgz -O docker.tgz   && \
    tar -xvzf docker.tgz   && \
    mv docker/* /usr/bin/  && \
    chmod +x /usr/bin/docker && \

# Installs Docker Compose
RUN curl --fail --silent -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/bin/docker-compose  && \
   chmod +x /usr/bin/docker-compose  

RUN useradd -ms /bin/bash jenkins
