-- 입점한 상점을 jsp 페이지에 홍보할때 필요한 문구나 사진, 정보등을 담고 있는 테이블이다.

create table storePageResource(
	idx int not null auto_increment,
	storeId varchar(30) not null,
	storeName varchar(100) not null, /*상호명 예) 강남뷰티*/
	tel varchar(50) not null,  /* 전화번호: 010-1234-5678 */
	address varchar(150) not null,  /* 주소(우편번호: 다음 API 활용 ) */
	email varchar(60) not null, /* 이메일(아이디/비밀번호 분실시에 사용) - 형식체크필수 */
		
	title varchar(200) not null, /*웹페이지에 표시될 타이틀 예) 역삼동 에스테틱 강남뷰티*/
	heartCnt int default 0,  /* 사용자들로부터 받은 하트개수 */
	reviewCnt int default 0,  /* 사용자들이 남긴 리뷰개수 */
	
	storeMainPhoto varchar(200) not null,  /* main 페이지용 상점 대표 사진 1장의 이름 */
	storePhoto varchar(500) not null,  /* 상점 디테일 페이지 헤더용 사진 파일들 이름, /로 연결되어 있다. */
	courseInfo varchar(400) not null, /* 24시간~ 예약필수 까지 샵의 정보를 표현하는 20개 아이콘의 단어들 슬러시로 연결되어 있다.*/
	
	courseTitle varchar(600) not null, /*코스이름들, 코스이름^아이템개수/코스이름^아이템개수 의 형식으로 연결되어 있다.*/
	courseItemTitle varchar(600) not null, /*코스아이템들의 타이틀 슬러시로 연결되어 있다.*/
	coursePrice varchar(600) not null, /* 코스 아이템별 할인율/원래가격/할인된가격^할인율/원래가격/할인된가격 의 형태로 슬러시와 ^로 연결되어 있다. */
	courseItemInfo varchar(1000) not null, /* 코스아이템에 대한 간략한 설명이 들어 있다. ^로 연결되어 있다. */
	
	notice varchar(1000) default null, /*공지사항*/
	storeIntroduction varchar(1000) default null, /*업체소개*/
	businessHours varchar(200) not null, /*영업시간*/
	workerInfo varchar(1000) default null, /*관리사 정보*/
	usingProduct varchar(200) default null, /*사용제품*/
	parkingInfo varchar(300) default null, /*주자정보*/
	
	note varchar(1000) default null, /* 주의사항 */
	
	primary key(idx),
	foreign key(storeId) references alliancestores(storeId) on delete cascade
);

desc storePageResource