create database library_db;

create user 'libraryUser'@'localhost' identified by '0000';

grant all privileges on library_db.* to 'libraryUser'@'localhost';

commit;

use library_db;

show tables;

drop table book;

create table if not exists book(
	b_id int NOT NULL AUTO_INCREMENT,
	b_name varchar(50),
	b_author varchar(50),
	b_publisher varchar(50),
	b_publishYear int,
	b_description text,
	b_imageName varchar(50),
	primary key (b_id)

);

alter table book convert to charset utf8;

commit;

desc book;

insert into book (b_id, b_name, b_author, b_publisher, b_publishYear, b_description, b_imageName)
	values (1,'소프트웨어 공학의 모든 것','최은만','생능출판사',2020,'강의 로드맵 크고 복잡한 소프트웨어 시스템을 구축하는 것은 히말라야 산을 등반하는 것과 같다. 위험이 많은 높은 산을 정복하려면 미리 등반 루트를 잘 알아야 합니다. 소프트웨어 공학을 정복하는 루트는 학습 목적에 따라 다르게 구성할 수 있다.','01.jpg');
insert into book (b_name, b_author, b_publisher, b_publishYear, b_description, b_imageName)
	values ('데이터베이스 개론','김연희','한빛아카데미',2022,'데이터베이스로 첫 항해를 떠나는 이들에게 지도와 돛이 되어주는 책입니다. 마인드맵으로 생소한 개념 간의 관계를 한눈에 보여주고, 친근한 예와 비유를 들어 명료하게 풀어내, 데이터베이스 기본기를 탄탄히 다져줍니다.','02.jpg');
insert into book (b_name, b_author, b_publisher, b_publishYear, b_description, b_imageName)
	values ('HTML5 웹프로그래밍 입문','윤인성','한빛아카데미',2019,'웹 프로그래밍을 처음 배우는 독자를 위한 입문서로 HTML5, CSS3, 자바스크립트, jQuery까지 한 권으로 기본기를 다질 수 있습니다. 최신 웹 표준에 맞게 배울 수 있도록 웹에 대한 기본 이해부터 프로젝트 완성까지 단계적으로 다룹니다. ','03.jpg');
insert into book (b_name, b_author, b_publisher, b_publishYear, b_description, b_imageName)
	values ('소프트웨어 공학','권기태','한티미디어',2016,'이 책은 소프트웨어 공학에 대해 다룬 이론서입니다. 소프트웨어 공학의 기초적이고 전반적인 내용을 학습할 수 있도록 구성했습니다.','04.jpg');
insert into book (b_name, b_author, b_publisher, b_publishYear, b_description, b_imageName)
	values ('쉽게 풀어 쓴 C언어 Express','천인국','생능출판사',2018,'C언어는 공학 전반의 실무 현장에서 가장 많이 사용되는 언어 중의 하나이다. C언어는 간결하고 효율적이며 저수준의 하드웨어 제어도 가능한 강력한 언어이다. 이 책을 저술하게 된 가장 큰 이유는, 프로그래밍 입문자들이 이 책을 통하여 보다 쉽고 재미있게 프로그래밍의 세계로 들어올 수 있도록 하자는 것이었다. 그러기 위해 다음과 같이 이 책을 구성하였다.','05.jpg');
insert into book (b_name, b_author, b_publisher, b_publishYear, b_description, b_imageName)
	values ('그림으로 쉽게 설명하는 안드로이드 프로그래밍','천인국','생능출판사',2022,'안드로이드는 현재 전 세계 사람들이 가장 많이 사용하는 모바일 운영체제이다. 안드로이드는 컴퓨터 공학도라면 반드시 알고 지나가야 하는 중요한 주제가 되었다. 이 책은 안드로이드 입문자들을 위한 책이다.','06.jpg');
insert into book (b_name, b_author, b_publisher, b_publishYear, b_description, b_imageName)
	values ('Android Studio를 활용한 안드로이드 프로그래밍','우재남','한빛아카데미',2022,'대학이나 IT 전문 학원의 안드로이드 프로그래밍 과목 수강생을 대상으로 합니다. 기본적인 프로그래밍을 접해본 독자라면 안드로이드에 꼭 필요한 Java 기초부터 안드로이드 앱 개발까지 학습 가능하도록 구성되어 있습니다.','07.jpg');
insert into book (b_name, b_author, b_publisher, b_publishYear, b_description, b_imageName)
	values ('Rosen의 이산수학','Rosen, 권기현','McGraw-Hill Education',2019,'이 책은 이산수학에 대해 다룬 이론서입니다. 이산수학의 기초적이고 전반적인 내용을 학습할 수 있도록 구성했습니다.','08.jpg');
insert into book (b_name, b_author, b_publisher, b_publishYear, b_description, b_imageName)
	values ('R로 배우는 데이터과학','양윤석','한빛아카데미',2019,'데이터에서 가치를 발견하고 이를 문제 해결에 활용하는 데 관심이 많은 사람들을 위한 데이터 과학 입문서입니다. 프로그래밍 경험이 전혀 없어도 시작할 수 있도록 R의 기본 사용법부터 데이터 과학의 주요 주제인 데이터 정제와 가공, 시각화, 모델링과 예측까지 충실히 설명합니다. 데이터 과학 학습을 위한 전형적인 데이터뿐만 아니라 현실감 있는 다양한 생활 데이터도 다양하게 실습해볼 수 있어 스스로 더 재미있는 데이터를 찾아 활용할 수 있는 기초 체력도 다질 수 있습니다.','09.jpg');

commit;

select * from book;