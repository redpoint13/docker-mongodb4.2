FROM debian:buster
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN apt-get update &&\
  apt-get install -y gnupg wget &&\
  wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add - &&\
  echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list &&\
  apt-get update &&\
  apt-get install -y mongodb-org=4.2.2 mongodb-org-server=4.2.2 mongodb-org-shell=4.2.2 mongodb-org-mongos=4.2.2 mongodb-org-tools=4.2.2 &&\
  mkdir /var/run/mongodb /home/mongodb &&\
  chown mongodb:mongodb /var/run/mongodb /home/mongodb &&\
  apt-get purge -y wget &&\
  apt-get autoremove -y &&\
  rm -rf /var/lib/apt/lists/*

VOLUME ["/var/lib/mongodb"]
USER mongodb

CMD ["/usr/bin/mongod","--pidfilepath","/var/run/mongodb/mongod.pid","--dbpath","/var/lib/mongodb","--journal","--timeZoneInfo","/usr/share/zoneinfo","--bind_ip_all","--port","27017"]
