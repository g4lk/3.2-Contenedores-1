FROM node:14.16

ENV NODE_ENV production

WORKDIR /usr/src/app/

RUN curl -LJO https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh \
    && chmod +x /usr/src/app/wait-for-it.sh

COPY package.json /usr/src/app/
COPY src /usr/src/app/src
COPY public /usr/src/app/public
COPY config /usr/src/app/config

RUN npm install --only=production

EXPOSE 3000

CMD ["node", "src/server.js"]