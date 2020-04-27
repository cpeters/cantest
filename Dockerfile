# FROM nodejs-10:latest AS build
# FROM registry.access.redhat.com/ubi8/nodejs-10:latest AS build
#FROM registry.redhat.io/ubi8/nodejs-10:latest AS build
# FROM openshift/nodejs-10:latest AS build
# FROM image-registry.openshift-image-registry.svc:5000/openshift/nodejs-10 AS build
FROM registry.access.redhat.com/ubi7/nodejs-8

#ARG APP_ENV=production

#WORKDIR /app

# Take advantage of caching and just install node_modules
#COPY ./package.json ./yarn.lock ./
#RUN yarn install --pure-lockfile --no-progress

# Build application
#COPY ./ ./
#RUN yarn build:$APP_ENV --no-progress --no-colors

# Only copy over build files for a lightweight image
# FROM nodejs-10:latest
# FROM registry.access.redhat.com/ubi8/nodejs-10:latest
#FROM registry.redhat.io/ubi8/nodejs-10:latest
# FROM openshift/nodejs-10:latest
# FROM image-registry.openshift-image-registry.svc:5000/openshift/nodejs-10

#WORKDIR /app

#COPY --from=build /app/bin bin
#COPY --from=build /app/node_modules node_modules
#COPY --from=build /app/package.json /app/server.js ./

#EXPOSE 8000
 
#CMD ["yarn","serve"]
