show tables;


drop table store;


create table store(
	-- 개인정보 보호법상 탈퇴한 회원의 정보는 한달이내에 삭제, 폐기해야한다.
	idx int not null auto_increment, /* 회원 고유번호 */
	mid varchar(30) not null,  /* 회원 아이디(중복불허, 수정불가, 탈퇴후 한달후에 재가입가능하게) */
	pwd varchar(100) not null, /* 회원 비밀번호(SHA256 암호화처리) */
	storeName varchar(30) not null, /* 업소이름 (중복불허/수정가능) */
	name varchar(30) not null, /* 사업자명(중복허용) */
	tel varchar(15) not null,  /* 전화번호: 010-1234-5678 */
	address varchar(100) not null,  /* 주소(우편번호: 다음 API 활용 ) */
	email varchar(60) not null, /* 이메일(아이디/비밀번호 분실시에 사용) - 형식체크필수 */
	userInfo char(3) default '공개', /* 회원 정보 공개유무(공개/비공개) */
	userDel char(2) default 'NO', /* 회원 탈퇴신청여부(NO:현재 활동중, OK:탈퇴신청중) */
	level int default 1,  /* 회원 등급(0:관리자, 1:준회원(처음 가입시), 2:정회원, 3:우수회원, 4:운영자, 99:탈퇴) */
	point int default 100,  /* 회원 누적 포인트 (최초 회원가입시 지급 포인트는 100, 1회 방문시 10포인트 증가, 1일 최대 50포인트까지 호용, 물건구매시 100원당 1포인트 증가) */
	visitCnt int default 0,  /* 총 방문횟수 */
	todayCnt int default 0, /* 오늘 방문 카운트 */
	startDate datetime default now(), /* 최초 가입일 */
	lastDate datetime default now(), /* 마지막 접속일(탈퇴시는 탈퇴한 날짜) */
	primary key(idx),
	unique key(mid)
);

desc member;


select * from member;