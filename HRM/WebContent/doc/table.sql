/* 기본정보 */
DROP TABLE basic 
	CASCADE CONSTRAINTS;

/* 자격면허 */
DROP TABLE license 
	CASCADE CONSTRAINTS;

/* 근태관리 */
DROP TABLE commute 
	CASCADE CONSTRAINTS;

/* 게시판형식 */
DROP TABLE board_form 
	CASCADE CONSTRAINTS;

/* 사진정보 */
DROP TABLE image 
	CASCADE CONSTRAINTS;

/* 게시판 */
DROP TABLE board 
	CASCADE CONSTRAINTS;

/* 기본정보 */
CREATE TABLE basic (
	emp_id NUMBER(10) NOT NULL, /* 사원번호 */
	emp_pw VARCHAR2(20), /* 비밀번호 */
	emp_name VARCHAR2(20), /* 이름 */
	emp_image VARCHAR2(100), /* 사진 */
	dept_id NUMBER, /* 부서코드 */
	job_id NUMBER, /* 직급코드 */
	emp_reg_number NUMBER, /* 주민등록번호1 */
	emp_reg_number2 NUMBER, /* 주민등록번호2 */
	emp_phone1 NUMBER, /* 연락처1 */
	emp_phone2 NUMBER, /* 연락처2 */
	emp_phone3 NUMBER, /* 연락처3 */
	emp_extention1 NUMBER, /* 회사(내선)1 */
	emp_extention2 NUMBER, /* 회사(내선)2 */
	emp_extention3 NUMBER, /* 회사(내선)3 */
	emp_email1 VARCHAR2(25), /* 이메일1 */
	emp_email2 VARCHAR(30), /* 이메일2 */
	emp_birth NUMBER, /* 생년월일 */
	emp_final_edu VARCHAR2(20), /* 최종학력 */
	emp_diploma VARCHAR2(100), /* 학위증명서 */
	emp_hire_date DATE, /* 입사날짜 */
	hire_id NUMBER(20), /* 고용형태코드 */
	emp_job_doc VARCHAR2(100), /* 입사관련서류 */
	emp_detail VARCHAR2(4000), /* 비고 */
	appoint_id NUMBER(20), /* 발령구분코드 */
	anni_id NUMBER(20) /* 기념일구분코드 */
);

COMMENT ON TABLE basic IS '기본정보';

COMMENT ON COLUMN basic.emp_id IS '사원번호';

COMMENT ON COLUMN basic.emp_pw IS '비밀번호';

COMMENT ON COLUMN basic.emp_name IS '이름';

COMMENT ON COLUMN basic.emp_image IS '사진';

COMMENT ON COLUMN basic.dept_id IS '부서코드';

COMMENT ON COLUMN basic.job_id IS '직급코드';

COMMENT ON COLUMN basic.emp_reg_number IS '주민등록번호1';

COMMENT ON COLUMN basic.emp_reg_number2 IS '주민등록번호2';

COMMENT ON COLUMN basic.emp_phone1 IS '연락처1';

COMMENT ON COLUMN basic.emp_phone2 IS '연락처2';

COMMENT ON COLUMN basic.emp_phone3 IS '연락처3';

COMMENT ON COLUMN basic.emp_extention1 IS '회사(내선)1';

COMMENT ON COLUMN basic.emp_extention2 IS '회사(내선)2';

COMMENT ON COLUMN basic.emp_extention3 IS '회사(내선)3';

COMMENT ON COLUMN basic.emp_email1 IS '이메일1';

COMMENT ON COLUMN basic.emp_email2 IS '이메일2';

COMMENT ON COLUMN basic.emp_birth IS '생년월일';

COMMENT ON COLUMN basic.emp_final_edu IS '최종학력';

COMMENT ON COLUMN basic.emp_diploma IS '학위증명서';

COMMENT ON COLUMN basic.emp_hire_date IS '입사날짜';

COMMENT ON COLUMN basic.hire_id IS '고용형태코드';

COMMENT ON COLUMN basic.emp_job_doc IS '입사관련서류';

COMMENT ON COLUMN basic.emp_detail IS '비고';

COMMENT ON COLUMN basic.appoint_id IS '발령구분코드';

COMMENT ON COLUMN basic.anni_id IS '기념일구분코드';

ALTER TABLE basic
	ADD
		CONSTRAINT PK_basic
		PRIMARY KEY (
			emp_id
		);

/* 자격면허 */
CREATE TABLE license (
	certifi_num VARCHAR2(50) NOT NULL, /* 자격증번호 */
	right_name VARCHAR2(20), /* 자격명 */
	right_institution VARCHAR2(20), /* 발행기관 */
	right_obtain DATE, /* 취득일자 */
	right_end DATE, /* 만기일자 */
	right_update DATE, /* 갱신일자 */
	right_erasure DATE, /* 말소일자 */
	erasure_content VARCHAR2(30), /* 말소사유 */
	right_image VARCHAR2(30), /* 자격증사본 */
	emp_id NUMBER(10) /* 사원번호 */
);

COMMENT ON TABLE license IS '자격면허';

COMMENT ON COLUMN license.certifi_num IS '자격증번호';

COMMENT ON COLUMN license.right_name IS '자격명';

COMMENT ON COLUMN license.right_institution IS '발행기관';

COMMENT ON COLUMN license.right_obtain IS '취득일자';

COMMENT ON COLUMN license.right_end IS '만기일자';

COMMENT ON COLUMN license.right_update IS '갱신일자';

COMMENT ON COLUMN license.right_erasure IS '말소일자';

COMMENT ON COLUMN license.erasure_content IS '말소사유';

COMMENT ON COLUMN license.right_image IS '자격증사본';

COMMENT ON COLUMN license.emp_id IS '사원번호';

ALTER TABLE license
	ADD
		CONSTRAINT PK_license
		PRIMARY KEY (
			certifi_num
		);

/* 근태관리 */
CREATE TABLE commute (
	attend_seq NUMBER NOT NULL, /* 근태_seq */
	attend_start DATE, /* 출근날짜시간 */
	attend_end DATE, /* 퇴근날짜시간 */
	attend_go VARCHAR2(15), /* 출근상태 */
	attend_leave VARCHAR2(15), /* 퇴근상태 */
	emp_id NUMBER(10), /* 사원번호 */
	attend_type NUMBER /* 근태타입_seq */
);

COMMENT ON TABLE commute IS '근태관리';

COMMENT ON COLUMN commute.attend_seq IS '근태_seq';

COMMENT ON COLUMN commute.attend_start IS '출근날짜시간';

COMMENT ON COLUMN commute.attend_end IS '퇴근날짜시간';

COMMENT ON COLUMN commute.attend_go IS '출근상태';

COMMENT ON COLUMN commute.attend_leave IS '퇴근상태';

COMMENT ON COLUMN commute.emp_id IS '사원번호';

COMMENT ON COLUMN commute.attend_type IS '근태타입_seq';

ALTER TABLE commute
	ADD
		CONSTRAINT PK_commute
		PRIMARY KEY (
			attend_seq
		);

/* 게시판형식 */
CREATE TABLE board_form (
	bbs_form_num NUMBER(10) NOT NULL, /* 게시판형식번호 */
	bbs_form_name varchar2(20) /* 게시판형식이름 */
);

COMMENT ON TABLE board_form IS '게시판형식';

COMMENT ON COLUMN board_form.bbs_form_num IS '게시판형식번호';

COMMENT ON COLUMN board_form.bbs_form_name IS '게시판형식이름';

ALTER TABLE board_form
	ADD
		CONSTRAINT PK_board_form
		PRIMARY KEY (
			bbs_form_num
		);

/* 사진정보 */
CREATE TABLE image (
	bbs_photo_num NUMBER NOT NULL, /* 사진게시판번호 */
	image_seq NUMBER(10), /* 글번호 */
	image_name CHAR(30), /* 원본사진이름 */
	image_rename CHAR(30), /* 저장사진이름 */
	image_location CHAR(30), /* 저장폴더 */
	image_type CHAR(30) /* 사진타입 */
);

COMMENT ON TABLE image IS '사진정보';

COMMENT ON COLUMN image.bbs_photo_num IS '사진게시판번호';

COMMENT ON COLUMN image.image_seq IS '글번호';

COMMENT ON COLUMN image.image_name IS '원본사진이름';

COMMENT ON COLUMN image.image_rename IS '저장사진이름';

COMMENT ON COLUMN image.image_location IS '저장폴더';

COMMENT ON COLUMN image.image_type IS '사진타입';

ALTER TABLE image
	ADD
		CONSTRAINT PK_image
		PRIMARY KEY (
			bbs_photo_num
		);

/* 게시판 */
CREATE TABLE board (
	bbs_seq NUMBER(10) NOT NULL, /* 글번호 */
	bbs_date DATE, /* 작성일 */
	bbs_vc NUMBER(10), /* 조회수 */
	bbs_ename VARCHAR2(20), /* 사원명 */
	bbs_title VARCHAR2(40), /* 제목 */
	bbs_content VARCHAR2(100), /* 내용 */
	emp_id NUMBER(10), /* 사원번호 */
	bbs_form_num NUMBER(10) /* 게시판형식번호 */
);

COMMENT ON TABLE board IS '게시판';

COMMENT ON COLUMN board.bbs_seq IS '글번호';

COMMENT ON COLUMN board.bbs_date IS '작성일';

COMMENT ON COLUMN board.bbs_vc IS '조회수';

COMMENT ON COLUMN board.bbs_ename IS '사원명';

COMMENT ON COLUMN board.bbs_title IS '제목';

COMMENT ON COLUMN board.bbs_content IS '내용';

COMMENT ON COLUMN board.emp_id IS '사원번호';

COMMENT ON COLUMN board.bbs_form_num IS '게시판형식번호';

ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			bbs_seq
		);

ALTER TABLE basic
	ADD
		CONSTRAINT FK_department_TO_basic
		FOREIGN KEY (
			dept_id
		)
		REFERENCES department (
			dept_id
		);

ALTER TABLE basic
	ADD
		CONSTRAINT FK_jobs_TO_basic
		FOREIGN KEY (
			job_id
		)
		REFERENCES jobs (
			job_id
		);

ALTER TABLE basic
	ADD
		CONSTRAINT FK_appoint_division_TO_basic
		FOREIGN KEY (
			appoint_id
		)
		REFERENCES appoint_division (
			appoint_id
		);

ALTER TABLE basic
	ADD
		CONSTRAINT FK_hire_TO_basic
		FOREIGN KEY (
			hire_id
		)
		REFERENCES hire (
			hire_id
		);

ALTER TABLE basic
	ADD
		CONSTRAINT FK_anni_TO_basic
		FOREIGN KEY (
			anni_id
		)
		REFERENCES anni (
			anni_id
		);

ALTER TABLE license
	ADD
		CONSTRAINT FK_basic_TO_license
		FOREIGN KEY (
			emp_id
		)
		REFERENCES basic (
			emp_id
		);

ALTER TABLE commute
	ADD
		CONSTRAINT FK_basic_TO_commute
		FOREIGN KEY (
			emp_id
		)
		REFERENCES basic (
			emp_id
		);

ALTER TABLE commute
	ADD
		CONSTRAINT FK_commute_type_TO_commute
		FOREIGN KEY (
			attend_type
		)
		REFERENCES commute_type (
			attend_seq
		);

ALTER TABLE image
	ADD
		CONSTRAINT FK_board_TO_image
		FOREIGN KEY (
			image_seq
		)
		REFERENCES board (
			bbs_seq
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_board_form_TO_board
		FOREIGN KEY (
			bbs_form_num
		)
		REFERENCES board_form (
			bbs_form_num
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_basic_TO_board
		FOREIGN KEY (
			emp_id
		)
		REFERENCES basic (
			emp_id
		);
		
create sequence board_seq
start with 1 increment by 1 

create sequence boardcomment_seq
start with 1 increment by 1 

create sequence boardfile_seq
start with 1 increment by 1 