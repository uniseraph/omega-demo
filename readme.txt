项目结构说明：
（1）api工程将pojo与FeignClient形式的接口声明包含在内；
（2）service与portal工程都依赖于api；
（3）依赖其它微服务的Application需要EnableFeignClients与ComponentScan，并指定需扫描的api接口包名；
（4）portal工程包含：
    <a> main/java/.../controller：MVC中的Controller；
    <b> main/java/.../conf：如果需要以bean方式引用环境变量，则将这类bean放在conf中；
    <c> main/resources/templates：页面模板文件；
（5）service工程包含：
    <a> main/java/.../controller：服务的实现；
    <b> main/java/.../domain：域模型，在这里实现完整的业务逻辑、事务等；
    <c> main/java/.../dao：Mybatis DAO接口；
    <d> main/java/.../conf：如果需要以bean方式引用环境变量，则将这类bean放在conf中；
    <e> main/resources/mybatis：Mybatis的SQL XML文件；