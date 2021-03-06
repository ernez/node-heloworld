FROM node:boron

RUN mkdir -p /scripts
# prepare scripts
COPY ./scripts/* /scripts
RUN chmod +x /scripts/*
VOLUME /scripts

# Create app directory
RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

EXPOSE 9999
CMD [ "npm", "start" ]