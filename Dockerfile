FROM node:alpine as builder
WORKDIR "/app"
COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

#no need to write CMD, nginx will start automatically when installing the image