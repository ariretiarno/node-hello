FROM node:alpine

WORKDIR /app

ADD . .

EXPOSE 3000

CMD "npm" "start"
