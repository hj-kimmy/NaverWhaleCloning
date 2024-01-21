create table whale_member
(
    num      number                   not null,
    id       varchar2(20) primary key not null, --회원 아이디
    password varchar2(16)             not null,
    email    varchar2(100),
    name     varchar2(180)            not null,
    birth    varchar2(12)             not null,
    gender   varchar2(6)              not null, --게시글 제목
    itc      varchar2(10)             not null, --게시글 내용
    phone    varchar2(30)
);

create sequence mem_seqNum nocycle nocache;

insert into whale_member (num, id, password, email, name, birth, gender, itc, phone)
values (mem_seqNum.nextval,
        'admin',
        '1234',
        'admin@whale.com',
        '관리자',
        '1990.01.01',
        'none',
        '+82',
        '010-1111-1234');

select *
from whale_member;

commit;

select count(*) from whale_member;

drop table whale_member;