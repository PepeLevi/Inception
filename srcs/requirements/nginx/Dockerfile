FROM debian:buster

RUN apt -y update && apt install -y nginx && apt install openssl -y

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=GR/L=Br/O=42/OU=Pb/CN=lejimene.42.fr"

COPY ./conf/default /etc/nginx/site-available/

COPY ./tools/script.sh /

CMD [ "/script.sh" ]
