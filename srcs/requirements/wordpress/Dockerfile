FROM debian:buster

RUN apt update -y && apt install php-fpm php-mysql -y && apt install curl -y

COPY ./tools/script.sh /

COPY ./tools/wp-config.php /

EXPOSE 9000

CMD [ "/script.sh" ]
