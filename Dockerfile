# setup alpine container to be a Jenkins agent for Nginx

FROM nginx:stable-alpine

# install add reqired packages
RUN apk update
RUN apk upgrade
RUN apk add openjdk11
RUN apk add git
RUN apk add openssh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# add jenkins usser
RUN adduser -h /usr/share/jenkins jenkins; echo 'jenkins:jenkins' | chpasswd

# change ownship of html dir so jenkins user can write to it
RUN chown jenkins /usr/share/nginx/html

ENTRYPOINT [ "./entrypoint.sh" ]
