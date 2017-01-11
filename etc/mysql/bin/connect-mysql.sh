#!/usr/bin/env bash

docker run -ti --rm --link mysql mysql:5.6 mysql -uroot -prootpass -hmysql --port 3306