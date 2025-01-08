FROM node:22-alpine
WORKDIR /opt
ADD . /opt
RUN npm install
ENTRYPOINT npm run start
