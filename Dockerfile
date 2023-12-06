# choose image and set working directory
FROM node:18-alpine as BUILD_IMAGE
WORKDIR /app/react/

# copy over package.json
COPY package.json .

# install npm dependencies
RUN npm install

# copy everything else
COPY . .

# build the app
RUN run build

# choose image for production and set it's working directory
FROM node:18-alpine as PRODUCTION_IMAGE
WORKDIR /app/react/

# copy from our build image
COPY --from=BUILD_IMAGE /app/react/dist/ /app/react/dist/

# copy over our production terminal commands
COPY package.json .
COPY vite.config.ts .

# install typescript to be an able to translate our app over to js
RUN npm install typescript

# open a port and run our app
EXPOSE 8080
CMD ["npm", "run", "preview"]
