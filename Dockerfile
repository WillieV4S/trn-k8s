FROM node:18.16.0

WORKDIR /app

COPY ["app/package.json", "app/package-lock.json*", "./"]
COPY ./app .

RUN npm install

EXPOSE 8080

CMD [ "npm", "start" ]