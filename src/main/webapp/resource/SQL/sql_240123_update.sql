select *
from update_board
where subject like '%안%'
   or content like '%안%'
order by num desc;

select *
from update_board
where category = 'iOS'
  and (subject like '%안%' or content like '%안%')
order by num desc;

select *
from update_board;
select *
from press_board;

select *
from update_board
where category = 'iOS';
select *
from update_board
where category = 'Desktop'
order by num desc;
select *
from press_board
where category = '환경조성'
order by num desc;


create table press_board
(
    num        number primary key,      --게시글 순번
    id         varchar2(20)   not null, --회원 아이디
    name       varchar2(50)   not null, --회원 이름
    category   varchar2(40)   not null, --회원 이름
    subject    varchar2(300)  not null, --게시글 제목
    content    varchar2(3000) not null, --게시글 내용
    hit        number default 0,        --게시글 조회 수
    ip         varchar2(20)   not null, --게시글 등록 시 ip
    regist_day date   default sysdate,  --게시글 등록 일자
    update_day date   default sysdate   --게시글 수정 일자
);

create table whale_board
(
    num        number primary key,      --게시글 순번
    tablename  varchar2(20)   not null,
    id         varchar2(20)   not null, --회원 아이디
    name       varchar2(50)   not null, --회원 이름
    category   varchar2(40)   not null, --회원 이름
    subject    varchar2(300)  not null, --게시글 제목
    content    varchar2(3000) not null, --게시글 내용
    hit        number default 0,        --게시글 조회 수
    ip         varchar2(20)   not null, --게시글 등록 시 ip
    regist_day date   default sysdate,  --게시글 등록 일자
    update_day date   default sysdate   --게시글 수정 일자
);

create sequence whale_seqNum nocycle nocache;
select *
from whale_board;
drop table whale_board;

select min(num)
from whale_board
group by num;

select * from whale_board where num > 8 and num = (select min(num) from whale_board);

Select *
From whale_board
where num = (Select min(num)
             From (Select *
                   From whale_board
                   Where num > 8 and tablename='press'));

Select * From whale_boardwhere num = (Select min(num) From (Select * From whale_board Where num > "+ num +" and tablename='"+ table +"'))

delete whale_board where num = 9;


Select num
From (Select ROWNUM as temp, num
      From (Select num From whale_board
            Where num IS NOT NULL
            Order by num DESC)
     )
Where temp = 8;

insert into whale_board
values (whale_seqNum.nextval,
        'update',
        'admin',
        '관리자',
        'Android',
        '네이버式 에듀테크, 대학가로 스며든다…‘웨일 스페이스’ 확장',
        '네이버클라우드는 서강대학교 로욜라국제대학·엔에스데블와 업무협약(MOU)을 체결했다고 8일 밝혔다. 협업 내용은 ‘로욜라국제대학의 교육 프로그램 및 평가 시스템 고도화를 위한 교육 플랫폼 구축’을 골자로 한다. 서강대 로욜라국제대학은 오는 2024년 신설되는 단과대학이다. 외국인 유학생·재외국민 학생들에게 한국학·국제학을 융합해 교육하기 위해 마련된다.

​

네이버클라우드는 에듀테크 플랫폼 ‘웨일 스페이스’를 활용해 로욜라국제대학에 미래형 교육 환경이 조성될 수 있도록 지원한다. 웨일 계정을 보유한 이용자는 ▲학부별∙강의별로 맞춤형 브라우저 환경을 구성해 일괄 적용 ▲학생들의 학적·학습 현황 등을 통합 관리할 수 있다.

​',
        0,
        '129.120.190.2',
        sysdate,
        sysdate);

insert into whale_board
values (whale_seqNum.nextval,
        'press',
        'admin',
        '관리자',
        '환경조성',
        'test123123',
        '네이버클라우드는 서강대학교 로욜라국제대학·엔에스데블와 업무협약(MOU)을 체결했다고 8일 밝혔다. 협업 내용은 ‘로욜라국제대학의 교육 프로그램 및 평가 시스템 고도화를 위한 교육 플랫폼 구축’을 골자로 한다. 서강대 로욜라국제대학은 오는 2024년 신설되는 단과대학이다. 외국인 유학생·재외국민 학생들에게 한국학·국제학을 융합해 교육하기 위해 마련된다.

​

네이버클라우드는 에듀테크 플랫폼 ‘웨일 스페이스’를 활용해 로욜라국제대학에 미래형 교육 환경이 조성될 수 있도록 지원한다. 웨일 계정을 보유한 이용자는 ▲학부별∙강의별로 맞춤형 브라우저 환경을 구성해 일괄 적용 ▲학생들의 학적·학습 현황 등을 통합 관리할 수 있다.

​',
        0,
        '129.120.190.2',
        sysdate,
        sysdate);

create sequence press_seqNum nocycle nocache;

insert into press_board
values (press_seqNum.nextval,
        'admin',
        '관리자',
        '환경조성',
        '네이버式 에듀테크, 대학가로 스며든다…‘웨일 스페이스’ 확장',
        '네이버클라우드는 서강대학교 로욜라국제대학·엔에스데블와 업무협약(MOU)을 체결했다고 8일 밝혔다. 협업 내용은 ‘로욜라국제대학의 교육 프로그램 및 평가 시스템 고도화를 위한 교육 플랫폼 구축’을 골자로 한다. 서강대 로욜라국제대학은 오는 2024년 신설되는 단과대학이다. 외국인 유학생·재외국민 학생들에게 한국학·국제학을 융합해 교육하기 위해 마련된다.

​

네이버클라우드는 에듀테크 플랫폼 ‘웨일 스페이스’를 활용해 로욜라국제대학에 미래형 교육 환경이 조성될 수 있도록 지원한다. 웨일 계정을 보유한 이용자는 ▲학부별∙강의별로 맞춤형 브라우저 환경을 구성해 일괄 적용 ▲학생들의 학적·학습 현황 등을 통합 관리할 수 있다.

​',
        0,
        '129.120.190.2',
        sysdate,
        sysdate);

insert into press_board
values (press_seqNum.nextval,
        'admin',
        '관리자',
        '환경조성',
        '웨일, 에듀테크 기술력으로 몽골 교육 디지털 전환 이끈다',
        '- 네이버클라우드 웨일, 몽골 교육과학부와 미래형 교실 조성 위한 프로젝트 체결… 에듀테크 기업과 컨소시엄 구성해 참여

- 웨일의 웹·OS 기술력 경험할 수 있도록… 몽골 내 725개 학교에 웨일 스페이스·웨일북 제공

​

​

네이버클라우드㈜(대표 김유원) 웨일이 웨일 스페이스와 웨일북을 활용해 몽골에 미래형 수업 환경을 조성한다. 웨일은 웹 기반 에듀테크 기술력을 바탕으로 국내 17개 시도 교육청의 디지털 전환을 이끌어 왔으며, 앞으로 글로벌에서도 적극 행보를 이어갈 계획이다.',
        0,
        '129.120.190.2',
        sysdate,
        sysdate);

insert into press_board
values (press_seqNum.nextval,
        'admin',
        '관리자',
        '환경조성',
        '네이버클라우드-전라북도교육청 MOU 체결… 웨일 스페이스, 전북 맞춤형 에듀테크 플랫폼으로 거듭난다',
        '네이버클라우드-전라북도교육청 MOU 체결…

웨일 스페이스, 전북 맞춤형 에듀테크 플랫폼으로 거듭난다

​

​

- 네이버클라우드-전라북도교육청, 웨일 스페이스 기반으로 전북형 교육 플랫폼 구축 위해 협력

- 웹 기반 오픈형 플랫폼의 높은 범용성 살려… 국내 교육청, 자체 교육 방향성에 맞게 웨일 스페이스 최적화해 운영

- 교육용 디바이스 ‘웨일북’ 함께 활용해 미래형 교육 시너지… “미래형 에듀테크 생태계 조성을 위해 협력 이어갈 것”',
        0,
        '129.120.190.2',
        sysdate,
        sysdate);

insert into press_board
values (press_seqNum.nextval,
        'admin',
        '관리자',
        '환경조성',
        '웨일 브라우저에서 환경 보호 실천해보세요! 네이버, 한국중앙자원봉사센터와 디지털 탄소 저감 캠페인 ‘그린웨일’ 진행한다',
        '웨일 브라우저에서 환경 보호 실천해보세요!

네이버, 한국중앙자원봉사센터와 디지털 탄소 저감 캠페인 ‘그린웨일’ 진행한다

​

​

- 19일, 한국중앙자원봉사센터와 온라인 자원봉사 생태계 활성화를 위해 맞손… 캠페인 참여 시 봉사 시간 제공

- ‘그린웨일’ 확장앱에서 디지털 탄소 감축에 도움되는 다양한 활동 진행… 향후 실제 숲 조성으로 이어질 수 있도록 지원

- 웨일 브라우저만 있다면 OS 제약 없이 누구나 간편하게 참여할 수 있다는 점이 특징… “웨일의 웹 기술력 살려 브라우저 활용도 한층 높여갈 것”',
        0,
        '129.120.190.2',
        sysdate,
        sysdate);

insert into press_board
values (press_seqNum.nextval,
        'admin',
        '관리자',
        '환경조성',
        '네이버클라우드 웨일, 미래형 교육 위한 교류의 장 ‘NWEC 2023’ 개최… “함께 성장하는 에듀테크 생태계 조성할 것”',
        '네이버클라우드 웨일, 미래형 교육 위한 교류의 장 ‘NWEC 2023’ 개최… “함께 성장하는 에듀테크 생태계 조성할 것”

​

- 웨일의 상생 철학 바탕으로 기획된 교육 콘퍼런스, 2일간 관계자 약 400명 참여해 호응

- 에듀테크사 매칭 부스 운영해 교육 기관과 소통할 수 있도록 지원… 내년 교사 전문가 커뮤니티도 론칭해 협력 모델 강화

- ''원격 제어'', ''협업 보드'' 등 웨일 스페이스, 웨일북 신규 기능도 공개… 수업 환경에서의 활용성 높여',
        0,
        '129.120.190.2',
        sysdate,
        sysdate);

insert into press_board
values (press_seqNum.nextval,
        'admin',
        '관리자',
        '환경조성',
        '네이버 웨일, 충남교육청과 함께 학생ㆍ학교별 ‘맞춤형 교육’ 지원 가능성 모색한다',
        '- 19일, 충청남도 교육청 및 대학교, 사업자 등 총 7개 단체 참여하는 ‘스마트교육 활성화’ MOU 체결.

- 네이버, 웨일 스페이스 기반 교육 데이터 분석 시스템 구축, 빅데이터 기반의 교육 방향성 수립 지원

- 교육 데이터의 권리는 교육기관에 부여하는 웨일 스페이스 특징 토대로 발전된 사업 사례',
        0,
        '129.120.190.2',
        sysdate,
        sysdate);

select *
from PRESS_BOARD;

select *
from update_board;

create table update_board
(
    num        number primary key,     --게시글 순번
    id         varchar2(20)  not null, --회원 아이디
    name       varchar2(50)  not null, --회원 이름
    category   varchar2(40)  not null, --회원 이름
    subject    varchar2(300) not null, --게시글 제목
    content    varchar2(3000),         --게시글 내용
    hit        number,                 --게시글 조회 수
    ip         varchar2(20),           --게시글 등록 시 ip
    regist_day date default sysdate,   --게시글 등록 일자
    update_day date default sysdate    --게시글 수정 일자
);

create sequence update_seqNum nocycle nocache;

insert into update_board
values (update_seqNum.nextval,
        'admin',
        'Desktop',
        '환경조성',
        'v3.24.223.18 업데이트 안내',
        '안녕하세요, 웨일 팀입니다.

​

데스크톱 웨일 브라우저가 크로미움 118 버전을 탑재한 v.3.23.214.17 버전으로 업데이트되었습니다. ',
        0,
        '129.120.190.2',
        sysdate,
        sysdate);

insert into update_board
values (update_seqNum.nextval,
        'admin',
        '관리자',
        'Desktop',
        'v3.23.214.10 업데이트 안내',
        '안녕하세요, 웨일 팀입니다.

​

데스크톱 웨일 브라우저가 크로미움 120 버전을 탑재한 v.3.24.223.18 버전으로 업데이트되었습니다.

​

네이버 웨일과 함께해 주셔서 감사합니다. ',
        0,
        '129.120.190.2',
        sysdate,
        sysdate);

insert into update_board
values (update_seqNum.nextval,
        'admin',
        '관리자',
        'iOS',
        'v.2.1.0 업데이트 안내',
        '안녕하세요, 웨일 팀입니다.



이번 iOS 웨일 v.2.1.0 업데이트에서는 웨일 팀에서 준비한 과몰입 스터디 서비스 <웨일온 스터디>를 이용하실 수 있습니다. 언제 어디서나 웨일온 스터디와 함께 더 즐겁고 실감 나는 공부 세계를 재발견해 보세요.',
        0,
        '129.120.190.2',
        sysdate,
        sysdate);

insert into update_board
values (update_seqNum.nextval,
        'admin',
        '관리자',
        'iOS',
        'v.2.1.0 업데이트 안내',
        '안녕하세요, 웨일 팀입니다.



DEVIEW 2021을 통해 공개된 모바일 2.0 (v.2.0.1)의 iOS 버전이 업데이트되었습니다. 이번 iOS 업데이트에서는 곳곳에서 만나볼 수 있는 웨일의 새 캐릭터 ‘웨일 프렌즈’와 함께 개선된 UI로 웹서핑을 쉽게 할 수 있도록 돕는 기능들이 추가되었습니다.',
        0,
        '129.120.190.2',
        sysdate,
        sysdate);

insert into update_board
values (update_seqNum.nextval,
        'admin',
        '관리자',
        'Android',
        'v.2.2.2.2 업데이트 안내',
        '안녕하세요, 웨일 팀입니다.



이번 Android 웨일 v2.2.2.2 업데이트에서는 웨일 팀에서 준비한 과몰입 스터디 서비스 <웨일온 스터디>를 이용하실 수 있습니다. 다양한 컨셉의 테마 영상으로 언제 어디서나 공부에 쉽게 몰입할 수 있는 웨일온 스터디 런칭 소식을 지금부터 전해 드립니다.',
        0,
        '129.120.190.2',
        sysdate,
        sysdate);

insert into update_board
values (update_seqNum.nextval,
        'admin',
        '관리자',
        'Android',
        'v.2.1.2.2 업데이트 안내',
        '안녕하세요, 웨일 팀입니다.



DEVIEW 2021에서 공개된 모바일 2.0 안드로이드 버전이 업데이트되었습니다. 이번 Android 웨일 v.2.1.2.2 업데이트에서는 UI가 개선되어 한 손으로 모바일 웹 서핑을 쉽게 할 수 있도록 돕는 기능들이 추가되었고, 앱의 곳곳에서 웨일 브라우저의 새 캐릭터를 만나 보실 수 있습니다.',
        0,
        '129.120.190.2',
        sysdate,
        sysdate);

update whale_board
set category = '학급지원'
where NUM = 12;
select *
from whale_board;

commit;

drop table update_board;
drop table press_board;
drop sequence update_seqNum;
drop sequence press_seqNum;

rollback;

drop table update_board;
drop table press_board;
drop sequence update_seqNum;
drop sequence press_seqNum;


--------------------------------------------------------------------
create table whale_board
(
    num        number primary key,      --게시글 순번
    tablename  varchar2(20)   not null,
    id         varchar2(20)   not null, --회원 아이디
    name       varchar2(50)   not null, --회원 이름
    category   varchar2(40)   not null, --회원 이름
    subject    varchar2(300)  not null, --게시글 제목
    content    varchar2(3000) not null, --게시글 내용
    hit        number default 0,        --게시글 조회 수
    ip         varchar2(20)   not null, --게시글 등록 시 ip
    regist_day date   default sysdate,  --게시글 등록 일자
    update_day date   default sysdate   --게시글 수정 일자
);

create sequence whale_seqNum nocycle nocache;
select *
from whale_board;

insert into whale_board
values (whale_seqNum.nextval,
        'update',
        'admin',
        '관리자',
        'iOS',
        'iOS 업데이트 안내5',
        '안녕하세요, 웨일 팀입니다.\n\n' ||
        '' ||
        '이번 Android 웨일 v2.2.2.2 업데이트에서는 웨일 팀에서 준비한 과몰입 스터디 서비스 <웨일온 스터디>를 이용하실 수 있습니다. 다양한 컨셉의 테마 영상으로 언제 어디서나 공부에 쉽게 몰입할 수 있는 웨일온 스터디 런칭 소식을 지금부터 전해 드립니다.\n\n' ||
        'Focus 1. 다양한 스터디룸 제공\n\n' ||
        '' ||
        '내가 좀 몰입할 줄 안다면, ‘테마 스터디’\n\n' ||
        '' ||
        '테마 스터디 기능을 이용하면 스터디 룸의 전 참가자에게 흥미로운 과몰입 테마 영상이 적용됩니다.',
        0,
        '129.120.190.2',
        sysdate,
        sysdate);

insert into whale_board
values (whale_seqNum.nextval,
        'press',
        'admin',
        '관리자',
        '학급지원',
        '네이버式 에듀테크, 대학가로 스며든다…‘웨일 스페이스’ 확장',
        '네이버가 만든 에듀테크 플랫폼이 대학에도 스며든다.<br><br>' ||
        '' ||
        '네이버클라우드는 서강대학교 로욜라국제대학·엔에스데블와 업무협약(MOU)을 체결했다고 8일 밝혔다. 협업 내용은 ‘로욜라국제대학의 교육 프로그램 및 평가 시스템 고도화를 위한 교육 플랫폼 구축’을 골자로 한다. 서강대 로욜라국제대학은 오는 2024년 신설되는 단과대학이다. 외국인 유학생·재외국민 학생들에게 한국학·국제학을 융합해 교육하기 위해 마련된다.<br><br>' ||
        '' ||
        '네이버클라우드는 에듀테크 플랫폼 ‘웨일 스페이스’를 활용해 로욜라국제대학에 미래형 교육 환경이 조성될 수 있도록 지원한다. 웨일 계정을 보유한 이용자는 ▲학부별∙강의별로 맞춤형 브라우저 환경을 구성해 일괄 적용 ▲학생들의 학적·학습 현황 등을 통합 관리할 수 있다.<br><br>' ||
        '' ||
        '네이버클라우드는 또 로욜라국제대학·엔에스데블과 함께 인공지능(AI)을 활용한 학습 평가 시스템을 구축하기 위해 협력하기로 했다. 팀네이버의 AI 기술력과 엔에스데블의 UBT∙AI 감독관 기술력으로 웨일 스페이스에 쌓인 데이터를 분석해 ▲문항 출제 및 평가 과정을 자동화하고 ▲학생들의 학습 수준에 따라 맞춤형 교육 프로그램 등을 마련할 계획이다. 로욜라국제대학 전용 한국어 평가 시스템을 구축, 향후 학생들이 한국어 교육 전문가로 성장할 수 있도록 지원한다.',
        0,
        '129.120.190.2',
        sysdate,
        sysdate);

update whale_board
set subject = '출시소식2'
where num = 6;
select *
from whale_board;

commit;

Select *
From whale_board
where num = (Select max(num)
             From (Select *
                   From whale_board
                   Where category = 'Android'));

Select * From whale_board where num = (Select max(num) From (Select * From whale_board Where category = 'Android'));

Select * From whale_board Where tablename = '" + table + "' order by num desc;

select * from whale_board where tablename = 'update' and (subject like '%업데%' or content like '%업데%') order by num desc;