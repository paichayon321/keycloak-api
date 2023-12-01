FROM alpine
ADD creategroup.sh .
RUN apk add curl
RUN chmod +x ./creategroup.sh
