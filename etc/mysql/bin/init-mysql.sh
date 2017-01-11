#!/usr/bin/env bash
docker rm -f mysql
rm -rf /tmp/mysql && mkdir -p /tmp/mysql

docker run -d --name mysql -v /tmp/mysql:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=rootpass -p 3306:3306 mysql:5.6 --lower-case-table-names=1

sleep 30



docker run --rm -ti --link mysql -v $(pwd)/etc/mysql/sql/init.sql:/init.sql \
     mysql:5.6 sh -c ' exec mysql -uroot -prootpass -h mysql --port 3306 < /init.sql  '