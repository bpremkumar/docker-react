FROM node:alpine as builder

WORKDIR /usr/app

COPY ./package.json ./
RUN npm install

COPY ./ ./ 
RUN npm run build

# A From statement automatically terminates the previous block
FROM nginx 
# Use the WORKDIR setup for the source files as well. 
COPY --from=builder ./usr/app/build /usr/share/nginx/html