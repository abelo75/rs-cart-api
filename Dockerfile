#use node12 for reduce image size. If use node:16 image 30+ mb large
FROM node:12-alpine as BUILD_STAGE_1
LABEL description="Task 9 AWS"
LABEL Name="RS Cart API"
LABEL Version=1
# install curl and bash to image for download and install node-prune
RUN apk update && apk add curl bash && rm -rf /var/cache/apk/*
# node-prune remove unnecessary files from node_modules
RUN curl -sfL https://gobinaries.com/tj/node-prune | bash -s -- -b /usr/local/bin
WORKDIR /usr/src/app

FROM BUILD_STAGE_1 as BUILD_STAGE_2

COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build:webpack

# need add dependency rxjs to package.json for correct run next command
RUN npm prune --production

# run node prune
RUN /usr/local/bin/node-prune
#and remove manualy unnecessary another files
RUN rm -rf node_modules/rxjs/src/
RUN rm -rf node_modules/rxjs/bundles/
RUN rm -rf node_modules/rxjs/_esm5/
RUN rm -rf node_modules/rxjs/_esm2015/
RUN rm -rf node_modules/swagger-ui-dist/*.map
RUN rm -rf node_modules/couchbase/src/

#use new layer for build final image
FROM node:12-alpine

WORKDIR /usr/src/app
#add batabse connection parameters for build
ARG DB_HOST
ARG DB_USER
ARG DB_PASS
ARG DB_NAME
ARG DB_PORT
ENV DB_HOST=$DB_HOST
ENV DB_USER=$DB_USER
ENV DB_PASS=$DB_PASS
ENV DB_NAME=$DB_NAME
ENV DB_PORT=$DB_PORT
#copy files from previouse layer
COPY --from=BUILD_STAGE_2 /usr/src/app/dist ./dist
COPY --from=BUILD_STAGE_2 /usr/src/app/node_modules ./node_modules
EXPOSE 4000
CMD ["node", "./dist/main.js" ]
