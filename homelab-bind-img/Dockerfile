FROM alpine:latest

LABEL user: leemenix@protonmail.com

RUN apk --update add bind

EXPOSE 53

CMD ["named", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]