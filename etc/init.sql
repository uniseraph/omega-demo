create database if not exists sk_dev default character set utf8 collate utf8_general_ci;

use sk_dev;

drop function if exists getTaskZoneCode;

drop table if exists User;
create table User (
    id varchar(40) not null,
    name varchar(40) not null,
    zoneCode char(2) not null,
    primary key(id)
);

drop table if exists OrderForm;
create table OrderForm (
    id varchar(40) not null,
    userId varchar(40) not null,
    number varchar(20) not null,
    amount decimal(20,2) not null,
    gmtCreated datetime not null,
    primary key(id)
);

create index IX_OrderForm_userId_gmtCreated on OrderForm(userId, gmtCreated);

drop table if exists OrderDetail;
create table OrderDetail (
    id varchar(40) not null,
    orderFormId varchar(40) not null,
    itemNo varchar(20) not null,
    price decimal(20,2) not null,
    qty int not null,
    amount decimal(20,2) not null,
    primary key(id)
);

create index IX_OrderDetail_orderFormId on OrderDetail(orderFormId);

drop table if exists Task;
create table Task (
	id varchar(40) not null,
	type varchar(20) not null,
	triggerTime dateTime not null,
	dataMap text,
	createTime timestamp not null,
	primary key(id)
);

create index IX_Task_triggerTime on Task(triggerTime);