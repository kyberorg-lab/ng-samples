#build stage
FROM node:14.7.0 as node
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build --prod

#exec stage
FROM nginx:1.19.1-alpine
COPY --from=node /app/dist/ng-samples /usr/share/nginx/html
EXPOSE 80
