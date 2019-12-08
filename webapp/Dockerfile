FROM node:8.15.0-alpine

WORKDIR /app

ADD ./ /app

RUN npm install

EXPOSE 3000
CMD ["node", "index.js"]
