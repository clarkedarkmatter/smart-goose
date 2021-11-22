#
# Each instruction in this file generates a new layer that gets pushed to your local image cache
#

#
# Lines preceeded by # are regarded as comments and ignored
#

#
# The line below states we will base our new image on the Latest Official Ubuntu
FROM ubuntu:latest
FROM node:12.18.1
EXPOSE 80

#
# Identify the maintainer of an image
LABEL maintainer="darkmatter.works"

#
# Update the image to the latest packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install git

# Install NGINX to test.
COPY . /home/test

# Last is the actual command to start up NGINX within our Container
CMD [ "cd", "/home/test"]

CMD [ "npm", "install" ]
CMD [ "npm", "run", "develop"]
