FROM debian:buster

EXPOSE 3306

RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh /

RUN chmod +x /script.sh

CMD ["/script.sh"]
