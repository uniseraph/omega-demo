use sk_dev;

drop function if exists getTaskZoneCode;

/*!mycat:dataNode=dn1*/ create function getTaskZoneCode() returns char(2) deterministic return('00');
/*!mycat:dataNode=dn2*/ create function getTaskZoneCode() returns char(2) deterministic return('01');

insert into User
(id, name, zoneCode)
values
('User01', 'User01', '01'),
('User02', 'User02', '02'),
('User03', 'User03', '03'),
('User04', 'User04', '04'),
('User05', 'User05', '05'),
('User06', 'User06', '06'),
('User07', 'User07', '07'),
('User08', 'User08', '08'),
('User09', 'User09', '09');