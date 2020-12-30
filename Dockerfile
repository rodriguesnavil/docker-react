# The docker file is used for production purpose
# Specify the base image
FROM node:10.17.0-alpine

# Specify the working dir in docker conatiner
WORKDIR '/app'

# Move the package.json file in the container
COPY ./package.json .
# Install the dependencies
RUN npm install
# Move all the left over files
COPY . .
# Specify the start up command
RUN npm run build

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html