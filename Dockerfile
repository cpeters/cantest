FROM nodejs-10:latest AS build

ARG APP_ENV=production

WORKDIR /app

# Take advantage of caching and just install node_modules
COPY ./package.json ./yarn.lock ./
RUN yarn install --pure-lockfile --no-progress

# Build application
COPY ./ ./
RUN yarn build:$APP_ENV --no-progress --no-colors

# Only copy over build files for a lightweight image
FROM nodejs-10:latest

WORKDIR /app

COPY --from=build /app/bin bin
COPY --from=build /app/node_modules node_modules
COPY --from=build /app/package.json /app/server.js ./

EXPOSE 8000
 
CMD ["yarn","serve"]
