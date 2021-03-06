FROM node:8.6-alpine

# reset npm loglevel (https://github.com/nodejs/docker-node/issues/57)
ENV NPM_CONFIG_LOGLEVEL warn

# export listening port
EXPOSE 3001

WORKDIR /opt/code

COPY package.json ./
COPY package-lock.json ./

RUN npm install

COPY . .

RUN npm run build

CMD ["npm", "start"]
