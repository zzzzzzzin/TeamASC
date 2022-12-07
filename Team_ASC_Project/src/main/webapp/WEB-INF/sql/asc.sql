insert into user(id, pwd, name, email, phone_num) values('admin',1234,'관리자','admin@admin.com','010-0000-0000');

create table user(
user_seq integer auto_increment primary key,
id varchar(50) not null default(''),
pwd varchar(50) not null default(''),
name varchar(50) not null default(''),
email varchar(100) not null default(''),
phone_num varchar(20) not null default(''),
join_date varchar(8) not null default(DATE_FORMAT(now(), '%Y%m%d')),
status varchar(20) not null default('Y'),
git_link varchar(200) not null default(''),
position varchar(20) not null default(''),
position_group varchar(50) not null default(''),
insert_time datetime default(now()),
update_time datetime
); 

create table team_member(
team_member_seq integer auto_increment primary key,
user_seq integer not null default(0),
team_id varchar(50) not null default(''),
team_leader varchar(1) not null default(''),
create_date varchar(8) not null default(DATE_FORMAT(now(), '%Y%m%d')),
team_category varchar(1) not null default(''),

insert_time datetime default(now()),
update_time datetime
);

create table project(
project_seq integer auto_increment primary key,
team_id varchar(50) not null default(''),
project_name varchar(100) not null default(''),
finish_yn varchar(1) not null default('N'),
percentage integer not null default(0),
create_date varchar(8) not null default(DATE_FORMAT(now(), '%Y%m%d')),
start_date varchar(8) not null default('19990101'),
end_date varchar(8) not null default('19991231'),

insert_time datetime default(now()),
update_time datetime
);

create table schedule(
schedule_seq integer auto_increment primary key,
project_seq integer not null default(0),
schedule_category varchar(20) not null default(''),
start_date varchar(8) not null default(''),
end_date varchar(8) not null default(''),
content text not null default(''),
finish_yn varchar(1) not null default('N'),

insert_time datetime default(now()),
update_time datetime
);

create table board (
board_seq integer auto_increment primary key,
user_seq integer not null default(0),
project_seq integer not null default(0),
board_category varchar(10) not null default (''),
board_title varchar(100) not null default(''),
board_content text not null default(''),
complete_yn varchar(1) not null default('N'),
create_date varchar(8) not null default(DATE_FORMAT(now(), '%Y%m%d')),
fileName varchar(100) not null default(''),
realFileName varchar(100) not null default(''),
insert_time datetime default(now()),
update_time datetime
);

create table documents(
   documents_seq int auto_increment primary key,
    project_seq int not null,
    documents_name text default null,
    file_name text default null,
    real_file_name text default null,
    writer varchar(50) default null,
    
    insert_time datetime default(now()),
    update_time datetime
);

create table message(
message_seq integer auto_increment primary key,
from_user_seq integer not null default(''),
to_user_seq integer not null default(''),
title varchar(100) not null default(''),
content text not null default(''),
message_type varchar(20) not null default(''),
read_count integer not null default (0),
team_id varchar(50) null,
send_time datetime default(now()),

insert_time datetime default(now()),
update_time datetime
);

create table reply (
reply_seq int primary key auto_increment,
user_seq int not null default(0),
board_seq int not null default(0),
project_seq int not null default(0),
reply_content text not null default(''),
create_date varchar(8) not null default(DATE_FORMAT(now(), '%Y%m%d')),

insert_time datetime default(now()),
update_time datetime
);


create table task(
task_seq int auto_increment primary key,
project_seq int not null default(0),
title varchar(50) not null default(''),
step varchar(50) not null default(''),
main_task varchar(100) not null default(''),
sub_task varchar(100) not null default(''),
user_seq int null,
finish_yn varchar(1) not null default('N'),
percentage int not null default(0),
start_date varchar(8) null,
end_date varchar(8) null,
remark1 varchar(200) null,
remark2 varchar(200) null,

insert_time datetime default(now()),
update_time datetime
);

create table wbs_detail(
wbs_detail_seq int auto_increment primary key,
task_seq int not null default(0),
user_seq int not null default(0),
operation varchar(200) not null default(''),
start_time datetime not null default('1999-12-31 01:01:01'),
end_time datetime not null default('1999-12-31 01:01:01'),
update_count int not null default(0),
update_reason text not null default(''),
finish_yn varchar(1) not null default(''),

insert_time datetime default(now()),
update_time datetime
);

create table test(
test_seq int auto_increment primary key,
project_seq int not null,
customer text default (''),
manager text default (''),
scenario_no int default 0,
scenario_data text default (''),
expected text default (''),
result text default (''),
remark text default (''),
    
insert_time datetime default(now()),
update_time datetime
);

create table minutes(
minutes_seq integer auto_increment primary key,
user_seq integer not null default(0),
project_seq integer not null default(0),
attendees text not null default(''),
extra_person text null,
meeting_place varchar(50) not null default(''),
meeting_title text not null default(''),
meeting_content text not null default(''),
meeting_result text not null default(''),
meeting_remark text null,
start_time datetime not null default(now()),
end_time datetime not null default(now()),
    
insert_time datetime default(now()),
update_time datetime
);