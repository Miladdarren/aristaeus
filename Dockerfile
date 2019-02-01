FROM node:alpine
WORKDIR '/app'
RUN apk --no-cache add --virtual builds-deps build-base python
COPY ./package.json ./
RUN npm install
RUN npm rebuild bcrypt --build-from-source
COPY . .
CMD ["npm", "start"]