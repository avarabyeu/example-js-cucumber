FROM node:9-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm install --only=production

### Then copy all project content.
### Since npm dependencies (package.json) aren't being changed so often
### mostly likely above Docker layers will be cached
# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "npm", "test" ]

