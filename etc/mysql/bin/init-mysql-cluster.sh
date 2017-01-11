#!/usr/bin/env bash



docker rm -f dw1 dw2

docker run -d --name dw1 -e MYSQL_ROOT_PASSWORD=rootpass mysql:5.6 --lower-case-table-names=1
docker run -d --name dw2 -e MYSQL_ROOT_PASSWORD=rootpass mysql:5.6 --lower-case-table-names=1

sleep 15

docker run --rm --link dw1 \
    -v $(pwd)/etc/mycat/sql/init.sql:/init.sql \
    mysql:5.6 sh -c ' exec mysql -uroot -prootpass -h dw1 < /init.sql  '



docker run --rm --link dw2 \
    -v $(pwd)/etc/mycat/sql/init.sql:/init.sql \
    mysql:5.6 sh -c ' exec mysql -uroot -prootpass -h dw2 < /init.sql  '