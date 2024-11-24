drop table allianceStores;

-- 입점한 상점들의 정보가 담긴 테이블이다.

create table allianceStores(
	idx int not null auto_increment, /* 테이블내 고유번호 */
	storeId varchar(30) not null,  /* 상점 아이디(중복불허, 개인회원아이디와 중복불가, 수정불가)*/
	pwd varchar(100) not null, /* 회원 비밀번호(SHA256 암호화처리) */
	storeName varchar(100) not null, /* 업소이름 (중복불허/수정가능) */
	ownerName varchar(30) default null, /* 사업자명(중복허용) */
	tel varchar(50) default null,  /* 전화번호: 010-1234-5678 */
	address varchar(150) default null,  /* 주소(우편번호: 다음 API 활용 ) */
	email varchar(60) default null, /* 이메일(아이디/비밀번호 분실시에 사용) - 형식체크필수 */
	
	level int default 1,  /* 입점 상점의 등급(1:준회원(처음 가입시), 2:정회원, 3:우수회원) */
	contractStartDate datetime default null, /* 최초 입점일 */
	contractEndDate datetime default null, /* 계약종료일자*/
	contractPrice int default 0,        /* 계약 금액*/

	contactName varchar(50) not null,    /* 연락가능한 담당자이름 */
	contactPhone varchar(50) not null,   /* 연락처 */
	contactTime varchar(100) not null,   /* 담당자와 통화 가능 시각 */
	inquiry varchar(500) default null,   /* 입점 신청시 문의사항*/
	appliedDate datetime default now(),  /* 글을 작성한 날짜 시간*/
	process varchar(30) default '신청',    /* 이 샵의 진행 상태: "입점중", "취소됨", "신청", "작업중" */
	
	primary key(idx),
	unique key(storeId)
);

desc allianceStores;

select * from allianceStores;