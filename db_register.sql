use register;
default character set utf8
default collate utf8_general_ci;

create table peaple(

id int not null auto_increment,
name varchar(30) not null,
birth_date date,
sex enum('M','F'),
weigth decimal(5,2),
heigth decimal(3,2),
nationality varchar(20) default 'Brazil',
primary key (id)
)default charset = utf8;

describe peaple;

RENAME TABLE peaple TO peoples;

describe peoples;