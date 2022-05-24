# mysql

## MySQL安装和配置

- 配置mysql的yum源

```shell
cd /etc/yum.repos.d/
wget -c https://dev.mysql.com/get/mysql80-community-release-el7-4.noarch.rpm
yum cleanall
yum makcecache
#搜索mysql的包，如果状态是enable说明没问题
yum list | grep mysql
```

- 卸载原有的mysql

```shell
#查找系统中安装的mysql
yum list installed | grep mysql
yum list installed | grep mariadb
rpm -qa | grep mysql
rpm -qa | grep mariadb
#如果有使用相应的卸载命令卸载
yum remove mariadb
#删除旧版本的配置文件
/etc/my.cnf
/etc/my.cnf.d
```

- 安装mysql

```shell
#创建mysql相关的用户和文件夹
groupadd mysql
useradd -g mysql mysql
passwd mysql
#创建安装目录
#一般安装在
mkdir /usr/local/mysql
#我选择安装在
mkdir /opt/software/mysql
#修改相应的权限
chown mysql /opt/software/mysql
chgrp mysql /opt/software/mysql
#安装，有可能会提示GPGkey校验错误，不检查GPGkey
yum install mysql-community-server.x86_64 --nogpgcheck
```

- 启动mysql

```shell
#启动mysql服务
systemctl start mysqld
#查看mysql服务状态
systemctl start mysqld
#设置mysql开机启动
systemctl enable mysqld
```

- 配置mysql密码

```shell
#查看初始密码
#mysql在安装后会创建一个root@localhost账户，初始密码保存在/var/log/mysqld.log文件中
grep "password" /var/log/mysqld.log
#使用初始密码登录后，修改密码
mysql -uroot -p
#初始密码策略要求比较复杂，可以登录后更改密码策略
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Aa@123456'
#查看当前密码策略
SHOW VARIABLES LIKE 'validate_password%';
#设置密码策略
#要求密码长度最少为4，如果少于4，会自动改为4
#验证密码的复杂程度
set global validate_password.policy=0;
#验证密码的最小长度
set global validate_password.length=4;
#用户名检查，密码和用户名不能相同
set global validate_password.check_user_name=off;
#修改密码
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Liang123'
#配置远程登录
create user 'root'@'%' identified by 'Liang123'
#刷新配置
flush privileges
```

- 外部链接mysql

```shell
#查看防火墙状态
systemctl status firewalld
#开启防火墙
systemctl start firewalld
#查看已开放端口
firewall-cmd --list-ports
#开放3306端口
firewall-cmd --zone=public --add-port=3306/tcp --permanent
#关闭指定端口
firewall-cmd --zone=public --remove-port=3306/tcp --permanent
#重启防火墙
firewall-cmd reload
```

- 修改加密规则

```shell
#一般还需要修改下mysql8登录用户的加密规则，因为mysql8之前的版本中加密规则是mysql_native_password，而在mysql8后，加密规则改为了caching_sha2_password。如果不更改，在用Navicat连接时会报错误
select host,user,plugin,authentication_string from mysql.user;
alter user 'root'@'%' identified with mysql_native_password by 'Liang123';
```

## 常用数据库命令

```sql
#查看数据库版本
select version();
#退出数据库
quit;
#显示数据库
show databases;
#使用数据库
use databases_name;
#显示数据库中的表
show tables;
#显示具体的表内容
descibe tables_name;
```

## MySQL忘记密码

```shell
#首先关闭mysql服务
systemctl stop mysqld
#查看服务状态是否关闭
systemctl status mysqld
#关闭后编辑MySQL的配置文件my.cnf
vim /etc/my.cnf
#找到MySQLd，在最下面添加一行skip-grant-tables
skip-grant-tables

#此时可以不需要密码登录MySQL，直接回车即可
mysql -uroot -p
#8.0版本以上刷新权限后可以直接修改用户密码
flush privileges;
alter user 'root'@'localhost' identified by 'Liang123@';
#8.0以下版本需要修改user表中的字段
use mysql
update user set authentication_string=password('Liang123@') where user='root' and host='localhost';
#修改完密码之后需要刷新权限
flush privileges;
#退出之后把配置文件的内容注释掉后，重新启动mysql服务，之后就可以使用新密码登录
vim /etc/my.cnf
skip-grant-tables
systemctl start mysqld
#使用新密码登录时后重新修改密码需要一个复杂的密码，这时候可以修改密码策略
SHOW VARIABLES LIKE 'validate_password%';
set global validate_password.policy=0;
flush privileges;
#重新修改密码即可
alter user 'root'@'localhost' identified by 'Liang123';
flush privileges;
```

## MySQL全量备份

- 参考链接

  ```shell
  https://juejin.cn/post/6844903670199353357
  ```

- 全量备份指令

  ```shell
  mysqldump -uroot -pLiang123 --lock-all-tables --flush-logs mysql > /root/mysql/mysql.sql
  #指令含义
  #--flush-logs:使用一个新的日志文件来记录接下来的日志
  #--lock-all-tables：锁定所有数据库
  ```

- 恢复全量备份指令

  ```shell
  mysql -h localhost -uroot -pLiang123 < /root/mysql/mysql.sql
  ```

- 全量备份脚本实例

  ```shell
  #!/bin/bash
  #数据库用户名、密码和数据库名
  username="root"
  password="Liang123"
  db_name="mysql"
  #获取当前时间
  date_now=$(date "+%Y%m%d-%H%M%S")
  #设置备份目标文件夹
  backupFolder=/root/mysql/
  #定义备份文件名
  filename="${db_name}_${date_now}.sql"
  #定义备份文件路径
  backupFilePath="${backupFolder}/${filename}"
  #输出提示
  echo "starting backup mysql ${db_name} at ${date_now}."
  #执行备份
  mysqldump -u${username} -p${password} --lock-all-tables --flush-logs ${db_name} > ${backupFilePath}
  #进入备份目录
  cd ${backupFolder}
  #压缩备份文件
  tar czf ${filename}.tar.gz ${filename}
  ```

## MySQL增量备份



## MySQL备份定时任务

```shell
#具体查看shell脚本中的计划任务
crontab -e
0 0 * * 7 sh /root/Documents/linux/shell/mysql_backup
crontab -l
```



## 菜鸟MySQL

```mysql
select distinct country from websites
select country from websites limit 2
select device_id as user_infos_example from user_profile limit 2
select device_id, gender, age, university from user_profile where age > 24
select * from websites where country = 'CN'
select * from websites where id = 1
select * from emp where comm is null
select * from emp where sal between 1500 and 3000
select * from websites where alexa between 1 and 20
select * from websites where alexa not between 1 and 20
select * from websites where (alexa between 1 and 20) and country not in ('USA' and 'IND')
select * from websites where name between 'A' and 'H'
select * from websites where name not between 'A' and 'H'
select * from access_log where date between '2016-05-10' and '2016-05-14'
select * from emp where sal in (5000,3000,1500)
select * from websites where name in ('Google', '菜鸟教程')
select * from emp where ename like 'M%'
select * from emp where ename like 'M_'
select * from emp where enmae like '%M%'
select * from emp where ename like '%M_'
select * from websites where country = 'USA' or country = 'CN'
select * from websites where alexa > 15 and (country = 'CN' or country = 'USA')
select * from websites order by alexa
select * from websites order by alexa desc
select * from websites order by country, alexa
insert into websites (name, url ,alexa, country) values ('百度', 'https://www.baidu.com/', 'CN')
insert into websites values ('百度', 'https://www.baidu.com/',  '4', 'CN')
update websites set alexa = '5000', country = 'USA' where name = '菜鸟教程'
delete from websites where name = 'facebook' and country = 'USA'
delete * from websites
select * from persons limit 5
select top 50 percent * from websites
select top 50 percent * from websites order by id desc
select * from websites where name like '%k'
select * from websites where name like 'G%'
select * from websites where name like '%oo%'
select * from websites where name not like '%oo%'
select * from websites where url like 'https%'
select * from websites where name like '_o%'
select * from websites where name like 'G_o_le'
select * from websites where name regexp '^[GFs]'
select * from websites where name regexp '^[A-H]'
select * from websites where name regexp '^[^A-H]'
select name as n, country as c from websites
select name, concat(url, ',', alexa, ',', country) as site_info from websites
select * into websitesBackup from websites
select name, url into websitesBackup from websites
select * into websitesBackup from websites where country = 'CN'

select w.name, w.url, a.count, a.date from websites as w, access_log as a 
where a.site_id = w.id and w.name = '菜鸟教程'

SELECT Websites.name, Websites.url, access_log.count, access_log.date
FROM Websites, access_log
WHERE Websites.id=access_log.site_id and Websites.name="菜鸟教程";

select websites.id, websites.name, access_log.count, access_log.date
from websites 
inner join access_log 
on websites.id = access_log.site_id

select websites.name, access_log.count, access_log.date
from websites
inner join access_log
on websites.id = access_log.site_id
order by access_log.count

select websites.name, access_log.count, access_log.date
from websites
left join access_log
on websites.id = access_log.site_id
order by access_log.count desc

select websites.name, access_log.count, access_log.date
from websites
right join access_log
on access_log.site_id = websites.id
order by access_log.count desc

select websites.name, access_log.count, access_log.date
from websites
full outer join access_log
on websites.id = access_log.site_id
order by access_log.count desc

--union可以合并两个或多个select语句的结果，这个结果必须是相同性质的
select country from websites
union
select country from apps
order by country

select country fron websites
union all
select country from apps
order by country

select country, name from websites where country = 'CN'
union all
select country, app_name from apps where country = 'CN'
order by country

select websites.name, access_log.count, access_log.date
into websitesBackup
from websites
left join access_log
on websites.id = access_log.site_id

insert into websites (name, country)
select app_name, country from apps

insert into websites (name, country)
select app_name, country from apps
where id = 1

create database my_db

create table persons
(
    personID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
)

create table persons
(
    personID int not null,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
    primary key (personID)
)

create table persons
(
    personID int not null primary key,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
)

create table if not exists persons
(
    id bigint auto_increment comment '主键',
    name varchar(20) not null comment '人员姓名',
    work_id bigint not null comment '工作id',
    create_time date default '2021-08-24',
    primary key(id),
    foreign key(work_id) references work(id)
)

create table if not exists work
(
    id bigint auto_increment comment '主键',
    name varchar(20) not null comment '工作名称',
    create_time date default '2021-08-24',
    primary key(id)
)

create table persons
(
    id int not null,
    name varchar(255) not null,
    age int
)

alter table persons
modify age int not null

alter table persons
modify age int null

create table persons
(
    id int not null,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
    unique(id)
)

create table persons
(
    id int not null unique,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
)

alter table persons
add unique id

alter table persons
drop index id

create table persons
(
    id int not null primary key,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
)

create table persons
(
    id int not null,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
    primary key(id)
)

create table persons
(
    id int not null,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
    constraint pk_personid primary key (id, LastName)
)

alter table persons
add primary key(id)

alter table persons
add constraint pk_personid primary key(id, LastName)

alter table persons
drop primary key

alter table persons
drop constraint pk_personid

create table orders
(
    O_id int not null,
    orderNo int not null,
    P_id int,
    primary key(O_id)
    foreign key(P_id) references persons(P_id)
)

create table orders
(
    O_id int not null primary key,
    orderNo int not null,
    P_id int foreign key references persons(P_id)
)

alter table orders
drop foreign key fk_PerOrders

create table persons
(
    P_id int not null,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
    check (P_id > 0)
)

create table persons
(
    P_id int not null check (P_id > 0),
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
)

create table persons
(
    P_id int not null,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
    constraint chk_person check (P_id > 0 and City = 'Sandnes')
)

alter table persons
add check (P_id > 0)

alter table persons
add constraint chk_person check check (P_id > 0 and City = 'Sandnes')

alter table persons
drop constraint chk_person

alter table persons
drop check chk_person

create table persons
(
    P_id int not null,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255) default 'Sandnes'
)

create table orders
(
    O_id int not null,
    orderNo int not null,
    P_id int,
    orderDate date default getdate()
)

alter table persons
alter City set default 'sandnes'

alter table persons
alter city drop default

create index PIndex
on persons (LastName)

create index PIndex
on persons (LastName, FirstName)

drop index index_name on table_name
drop index table_name.index_name

drop table table_name

drop database database_name

truncate table table_name

alter table persons
add dateOfBirth date

alter table persons
alter column dateOfBirth year

alter table persons
drop column dateOfBirth

create table persons
(
    id int not null auto_increment,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    city varchar(255),
    primary key(id)
)

alter table persons auto_increment = 100

insert into persons (FirstName, LastName)
values ('Lars', 'Monsen')


create table persons
(
    id int identity(1,1) primary key,
    LastName varchar(255) not null,
    FirstName varchar(255),
    Address varchar(255),
    city varchar(255)
)

create view [Current Product List] as
select ProductID, ProductName
from Products
where Discontinued = No

select * from [Current Product List]

create view[Products Above Average Price] as
select ProductName, UnitPrice
from Products
where UnitPrice > (select avg(UnitPrice) from Products)

select * from [Products Above Average Price]

create view [Category Sales For 1997] as
select distinct CategoryName, Sum(ProductSales) as CategorySales
from [Product Sales for 1997]
group by CategoryName

select * from [Category Sales For 1997]

select * from [Category Sales For 1997]
where CategoryName = 'Beverages'

create view [Current Product List] as
select ProductID, ProductName, Category
from Products
where Discontinued = No

drop view view_name

NOW()	返回当前的日期和时间
CURDATE()	返回当前的日期
CURTIME()	返回当前的时间
DATE()	提取日期或日期/时间表达式的日期部分
EXTRACT()	返回日期/时间的单独部分
DATE_ADD()	向日期添加指定的时间间隔
DATE_SUB()	从日期减去指定的时间间隔
DATEDIFF()	返回两个日期之间的天数
DATE_FORMAT()	用不同的格式显示日期/时间

AVG() - 返回平均值
COUNT() - 返回行数
FIRST() - 返回第一个记录的值
LAST() - 返回最后一个记录的值
MAX() - 返回最大值
MIN() - 返回最小值
SUM() - 返回总和

UCASE() - 将某个字段转换为大写
LCASE() - 将某个字段转换为小写
MID() - 从某个文本字段提取字符，MySql 中使用
SubString(字段，1，end) - 从某个文本字段提取字符
LEN() - 返回某个文本字段的长度
ROUND() - 对某个数值字段进行指定小数位数的四舍五入
NOW() - 返回当前的系统日期和时间
FORMAT() - 格式化某个字段的显示方式

```



## 牛客MySQL

```mysql
select device_id, gender, age, university from user_profile
select * from user_profile
select distinct university from user_profile

SELECT device_id 
from user_profile 
limit 2

select device_id as user_infos_example 
from user_profile 
limit 2

select device_id, university 
from user_profile 
where university = '北京大学'

select device_id, gender, age, university 
from user_profile 
where age > 24

select device_id, gender, age 
from user_profile 
where age between 20 and 23

SELECT device_id, gender, age, university 
from user_profile 
where university not like '复旦大学'

select device_id, gender, age, university 
from user_profile 
where age is not null

SELECT device_id, gender, age, university, gpa 
from user_profile 
where gpa > 3.5 and gender = 'male'

SELECT device_id, gender, age, university, gpa 
from user_profile 
where university = '北京大学' or gpa > 3.7

select device_id, gender, age, university, gpa 
from user_profile 
where university in ('北京大学', '复旦大学', '山东大学')

select device_id, gender, age, university, gpa 
from user_profile 
where (gpa > 3.5 and university = '山东大学') 
or (gpa > 3.8 and university = '复旦大学')

select device_id, age, university from user_profile where university like '%北京%'

select max(gpa) as gpa
from user_profile
where university='复旦大学';

select gpa
from user_profile
where university='复旦大学'
order by gpa desc limit 1

select 
  count(gender) as male_num,
  round(avg(gpa), 1) as avg_gpa
from user_profile where gender="male";

select 
    gender, university,
    count(device_id) as user_num,
    avg(active_days_within_30) as avg_active_days,
    avg(question_cnt) as avg_question_cnt
from user_profile
group by gender, university

select
    university,
    avg(question_cnt) as avg_question_cnt,
    avg(answer_cnt) as avg_answer_cnt
from user_profile
group by university
having avg_question_cnt<5 or avg_answer_cnt<20

select university,
    avg(question_cnt) as avg_question_cnt
from user_profile
group by university
order by avg_question_cnt

select qpd.device_id, qpd.question_id, qpd.result
from question_practice_detail as qpd
inner join user_profile as up
on up.device_id=qpd.device_id and up.university='浙江大学'

SELECT up.university,
    COUNT(qpd.question_id) / COUNT(DISTINCT(qpd.device_id)) as avg_answer_cnt
FROM user_profile AS up
inner join question_practice_detail AS qpd
ON up.device_id = qpd.device_id
GROUP BY university

SELECT up.university, qd.difficult_level,
    COUNT(qpd.question_id) / COUNT(DISTINCT(qpd.device_id)) AS avg_answer_cnt
FROM user_profile AS up
JOIN question_practice_detail AS qpd
ON up.device_id = qpd.device_id
JOIN question_detail AS qd
on qpd.question_id = qd.question_id
GROUP BY up.university, qd.difficult_level

SELECT up.university, qd.difficult_level, 
    COUNT(qpd.question_id) / COUNT(DISTINCT up.device_id) AS avg_answer_cnt
FROM user_profile AS up
INNER JOIN question_practice_detail AS qpd
    ON up.device_id = qpd.device_id
INNER JOIN question_detail AS qd
    ON qpd.question_id = qd.question_id
WHERE university = '山东大学'
GROUP BY qd.difficult_level



SELECT device_id,gender,age,gpa
FROM user_profile
WHERE university = '山东大学'
UNION ALL
SELECT device_id,gender,age,gpa
FROM user_profile
WHERE gender = 'male'

SELECT
    CASE
    WHEN age < 25 OR age IS NULL THEN '25岁以下'
    WHEN age >= 25 THEN '25岁及以上'
    END AS age_cut,
    COUNT(device_id) AS number
FROM user_profile
GROUP BY age_cut

SELECT device_id, gender,
    CASE
        when age >= 25 then '25岁及以上'
        when age >= 20 then '20-24岁'
        when age < 20 then '20岁以下'
        ELSE '其他'
    END AS age_cut
FROM user_profile

select
    DAY(qpd.date) AS day,
    COUNT(question_id) AS question_cnt
FROM question_practice_detail AS qpd
WHERE YEAR(qpd.date) = 2021 and MONTH(qpd.date) = 8
GROUP BY day

#将给定的表格数据分成三份来看，默认qpd1中的数据为第一天，qpd2中为第二天
#如果qpd1中的日期和qpd2中的日期接得上，说明是连续刷题,前提是同一台设备
#留存率的计算首先要确保是单独、不重复的计数
#每台设备每天来一次可以算起来做分母
#每台设备连续两天都刷题可以算计一次分子
select 
    COUNT(DISTINCT qpd1.device_id, qpd2.device_id, qpd1.date, qpd2.date) 
    / COUNT(DISTINCT qpd3.device_id, qpd3.date)
    AS avg_ret
FROM
    question_practice_detail AS qpd1,
    question_practice_detail AS qpd2,
    question_practice_detail AS qpd3
WHERE
    qpd1.device_id = qpd2.device_id
    and DATE_ADD(qpd1.date, INTERVAL 1 DAY) = qpd2.date

SELECT
    case
        when us.profile like '%,male' then 'male'
        when us.profile like '%,female' then 'female'
    end gender, count(device_id) AS number
from user_submit AS us
GROUP BY gender

SELECT 
    SUBSTRING_INDEX(profile,",",-1) gender,
    COUNT(device_id) AS number
FROM user_submit 
GROUP BY gender;

SELECT
    device_id,
    SUBSTRING_INDEX(blog_url, '/', -1) AS user_name
FROM user_submit

select 
-- 替换法 replace(string, '被替换部分','替换后的结果')
-- device_id, replace(blog_url,'http:/url/','') as user_name
-- 截取法 substr(string, start_point, length*可选参数*)
-- device_id, substr(blog_url,11,length(blog_url)-10) as user_nam
-- 删除法 trim('被删除字段' from 列名)
-- device_id, trim('http:/url/' from blog_url) as user_name
-- 字段切割法 substring_index(string, '切割标志', 位置数（负号：从后面开始）)
device_id, substring_index(blog_url,'/',-1) as user_name
from user_submit;

SELECT a.device_id, a.university, a.gpa
FROM(
    SELECT *,
    RANK() over(PARTITION BY university ORDER BY gpa) AS ranking1,
    DENSE_RANK() over(PARTITION BY university ORDER BY gpa) AS ranking2,
    ROW_NUMBER() over(PARTITION BY university ORDER BY gpa) AS ranking3
    FROM user_profile
) AS a
WHERE a.ranking1=1

select up.device_id, '复旦大学',
    count(question_id) as question_cnt,
    sum(if(qpd.result='right', 1, 0)) as right_question_cnt
from user_profile as up
left join question_practice_detail as qpd
    on qpd.device_id = up.device_id and month(qpd.date) = 8
where up.university = '复旦大学'
group by up.device_id

SELECT difficult_level,
    AVG(if(result = 'right', 1, 0)) AS correct_rate1,
    SUM(if(result = 'right', 1, 0)) / COUNT(qpd.question_id) AS correct_rate2,
    COUNT(if(result = 'right', 1, null)) / COUNT(qpd.question_id) AS correct_rate3
FROM
    user_profile AS up
    INNER JOIN question_practice_detail AS qpd
    ON up.device_id = qpd.device_id
    INNER JOIN question_detail AS qd
    ON qpd.question_id = qd.question_id
WHERE university = '浙江大学'
GROUP BY difficult_level
ORDER BY correct_rate1


SELECT device_id, gpa, age
FROM user_profile
ORDER BY gpa, age

SELECT device_id, gpa, age
FROM user_profile
ORDER BY gpa DESC, age DESC

SELECT
    COUNT(DISTINCT alias.device_id) AS did_cnt,
    COUNT(alias.question_id) AS question_cnt
FROM(
    SELECT device_id, question_id, date
    FROM question_practice_detail
    WHERE MONTH(date) = 8 and YEAR(date) = 2021
) AS alias

SELECT
    COUNT(DISTINCT device_id) AS did_cnt,
    COUNT(question_id) AS question_cnt
FROM question_practice_detail
WHERE date LIKE '2021-08%'

insert into exam_record
VALUES 
(null,1001,9001,'2021-09-01 22:11:12','2021-09-01 22:11:12' +INTERVAL 50 minute,90),
(null,1002,9002,'2021-09-04 07:01:02',null,NULL);

INSERT INTO exam_record_before_2021(uid, exam_id, start_time, submit_time, score)
SELECT uid, exam_id, start_time, submit_time, score
FROM exam_record
WHERE YEAR(submit_time) < '2021';

REPLACE INTO examination_info
VALUES(NULL,9003,'SQL','hard',90,'2021-01-01 00:00:00');

DELETE FROM examination_info
WHERE exam_id=9003;
INSERT INTO examination_info
VALUES(NULL,9003, 'SQL','hard', 90, '2021-01-01 00:00:00')

UPDATE examination_info
SET tag = "Python"
WHERE tag = "PYTHON";

UPDATE examination_info
SET tag = REPLACE(tag, "PYTHON", "Python")
WHERE tag = "PYTHON";

UPDATE exam_record
SET submit_time='2099-01-01 00:00:00', score=0
WHERE start_time < '2021-09-01 00:00:00' AND score IS NULL;

SELECT er.uid, ei.exam_id, ei.tag, ei.difficulty, er.score,
    RANK() OVER(
        PARTITION BY er.exam_id
        ORDER BY er.score
    ) AS ranking
FROM exam_record AS er
LEFT JOIN examination_info AS ei
    ON ei.exam_id = er.exam_id
WHERE ei.tag = 'SQL'
    AND ei.difficulty = 'hard'
    AND er.score IS NOT NULL

SELECT tag, difficulty, 
    ROUND((SUM(er.score) - MAX(er.score) - MIN(er.score)) / (COUNT(*) - 2), 1) AS clip_avg_score
FROM exam_record AS er
LEFT JOIN examination_info AS ei
    ON ei.exam_id = er.exam_id
WHERE ei.tag = 'SQL'
    AND ei.difficulty = 'hard'
    AND er.score IS NOT NULL

SELECT
    COUNT(exam_id) AS total_pv,
    COUNT(if(score IS NOT NULL, 1, NULL)) AS complete_pv,
    COUNT(DISTINCT if(score IS NOT NULL, exam_id, NULL)) AS complete_exam_cnt
FROM exam_record

SELECT 
    DATE_FORMAT(submit_time, '%Y%m') AS month,
    ROUND((COUNT(DISTINCT uid, DATE_FORMAT(submit_time, '%d')) / COUNT(DISTINCT uid)), 2) AS avg_active_days,
    COUNT(DISTINCT uid) AS mau
FROM exam_record
WHERE DATE_FORMAT(submit_time, '%Y') = 2021
GROUP BY month

SELECT 
    IFNULL(DATE_FORMAT(submit_time, '%Y%m'), '2021汇总') AS submit_month,
    COUNT(question_id) AS month_q_cnt,
    ROUND((COUNT(question_id) / MAX(DAY(LAST_DAY(submit_time)))), 3) AS avg_day_q_cnt
FROM practice_record
WHERE DATE_FORMAT(submit_time, '%Y') = '2021'
GROUP BY submit_month
WITH ROLLUP
```

