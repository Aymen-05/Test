### STAGE 1: Build ###

# We label our stage as 'builder'
FROM node:latest as builder

WORKDIR /app

COPY . .
RUN npm install

## Build the angular app in production mode and store the artifacts in dist folder
RUN npm run build --prod


### STAGE 2: Setup ###

FROM nginx:alpine

## From 'builder' stage copy over the artifacts in dist folder to default nginx public folder
COPY --from=builder /app/dist/testApp /usr/share/nginx/html
