#build stage
FROM node:14.7.0 as node
WORKDIR /app
COPY . .
RUN npm install && npm build --prod

#exec stage
FROM nginx:1.19.1-alpine
COPY --from=node /app/dist/ng-samples /usr/share/nginx/html

