#!/usr/bin/env bash

docker rm -f rabbit
rm -rf /tmp/rabbitmq && mkdir -p /tmp/rabbitmq

docker run -d --name rabbit \
    -v "/tmp/rabbitmq:/var/lib/rabbitmq/mnesia" \
    -p 5672:5672 -p 15672:15672 \
    -e RABBITMQ_DEFAULT_USER=ongo360 \
    -e RABBITMQ_DEFAULT_PASS=ongo360 \
    -e RABBITMQ_DEFAULT_VHOST=ongo360_vhost \
    rabbitmq:3-management

sleep 10

docker run -ti --rm --link rabbit  activatedgeek/rabbitmqadmin:latest \
    --vhost=ongo360_vhost  --username=ongo360 --password=ongo360  --host=rabbit --port=15672 \
     declare exchange name=task durable=true type=direct

docker run -ti --rm --link rabbit  activatedgeek/rabbitmqadmin:latest \
    --vhost=ongo360_vhost  --username=ongo360 --password=ongo360  --host=rabbit --port=15672 \
    declare queue name=sendEmail durable=true

docker run -ti --rm --link rabbit  activatedgeek/rabbitmqadmin:latest \
    --vhost=ongo360_vhost  --username=ongo360 --password=ongo360  --host=rabbit --port=15672 \
    declare binding source=task destination=sendEmail