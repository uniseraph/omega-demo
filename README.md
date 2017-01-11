
# First

所有命令默认都在omega-demo目录下执行


#编译环境


# 初始化环境
## 初始化mysql
```
bash etc/mysql/bin/init-mysql.sh
```

注意如果不同环境下mysql启动速度不一样，所以sleep 30 秒不一定够,如果mysql启动成功，没有正确初始化，请再执行一下下列命令
```
docker run --rm -ti --link mysql -v $(pwd)/etc/mysql/sql/init.sql:/init.sql \
     mysql:5.6 sh -c ' exec mysql -uroot -prootpass -h mysql --port 3306 < /init.sql  '
```
## 初始化rabbitmq


# 查看容器日志

docker logs -f xxx[容器id]


# add a project

mvn archetype:generate -DgroupId=com.omega.demo -DartifactId=omega-demo-xxx -Dversion=0.1

# Eureka

http://localhost:{eureka-port}

# HystrixDashboard

http://localhost:{dashboard-port}/hystrix.stream

# Turbine

Hystrix Stream: http://turbine:8080/turbine.stream

# Sidecar

sidecar模板生成的项目，需要使用gradle编译，所以开发机上面要安装gradle，用来生成docker镜像

管理后台:`http://{sidecar-app}:{sidecar-app-port}/`




# 初始化化一个kingshard集群，包括一个kingshard节点，两个mysql写节点dw1/dw2，
其中dw1有user0000/1/2/3 4张表
其中dw1有user0004/5/6/7 4张表
往kingshard插入了17条纪录

bash -x init-kingshard-cluster.sh


## 登录kingshard数据库

bash etc/kingshard/bin/connect-kingshard.sh

## 登录dw1

docker exec -ti dw1 sh -c 'exec mysql -uroot -prootpass'

# 分支管理

分支管理约定：

1. 分支名称：
    - daily/1.0.27，代表测试环境，当前版本是1.0.27，每次提交git，版本只能高不能低
1. 标签名称：
    - publish/1.0.56，代表生产环境，当前版本是1.0.56，每次提交git，版本只能高不能低

分支开发步骤:

1. 开daily新分支
    - 新建一个高版本的daily分支
    - git checkout -b daily/x.x.x
1. 写代码
1. git commit -am "注释xxxxxxxxx"
1. 提交日常
    - git co master && git merge daily/x.x.x && git co daily/x.x.x
    - git push origin daily/x.x.x
        - 该分支push之前，需要merge到master分支。
1. 提交生产
    - 新建一个和当前daily版本对应的tag
    - git tag publish/x.x.x.x
    - git push origin publish/x.x.x.x

master分支的含义是：

- 当前最新分支，不代表发布分支。

以上，是基于master开发的分支管理方法，未来支持自动构建:

- 将daily PUSH到git仓库，比如gogs，可以出发自动构建日常环境；
- 把publish PUSH到git仓库，比如gogs，可以触发自动构建生产环境；

# 部署

### 启动顺序

eureka -> configserver -> 各种微服务:

- Portal
- Service
- Turbine
- Sidecar
- 等等

首先要启动eureka，每个微服务只需要配置eureka的地址和ConfigServer的名字，其余相关配置都放在configserver的本地git配置仓库中。

## 本地开发环境配置

### /etc/hosts

- 127.0.0.1 config-server
- 127.0.0.1 gateway
- 127.0.0.1 discovery
- 127.0.0.1 eureka
- 127.0.0.1 rabbitmq
- 127.0.0.1 mysql
- 127.0.0.1 redis
