-- 기본정보
DROP TABLE basic;

-- 연봉연차관리
DROP TABLE salary;

-- 고용형태
DROP TABLE hire;

-- 상벌사항
DROP TABLE reward;

-- 발령구분
DROP TABLE appointDivision;

-- 자격면허
DROP TABLE license;

-- 인사발령
DROP TABLE appoint;

-- 기념일등록
DROP TABLE anniversary;

-- 부서
DROP TABLE department;

-- 경력사항
DROP TABLE career;

-- 직급
DROP TABLE jobs;

-- 기념일
DROP TABLE anni;

-- 근태관리
DROP TABLE commute;

-- 업무내역
DROP TABLE breakdown;

-- 주기적
DROP TABLE periodic;

-- 핵심성과지표
DROP TABLE outcome;

-- 업무교육
DROP TABLE education;

-- 업무명세표
DROP TABLE work;

-- 게시판형식
DROP TABLE boardForm;

-- 사진정보
DROP TABLE boardFile;

-- 댓글게시판
DROP TABLE boardComment;

-- 게시판
DROP TABLE board;

-- 업무에 필요한 능력
DROP TABLE ablity;

-- 근태타입
DROP TABLE commuteType;

-- 사원파일
DROP TABLE empfile;

-- 휴가정보
DROP TABLE vacationInfo;

-- 문서종류
DROP TABLE doclist;

-- 문서상태
DROP TABLE docstate;

-- 기본양식
DROP TABLE document;

-- 결재자
DROP TABLE settlement;

-- 결재단계설정
DROP TABLE signStep;

-- 휴가계
DROP TABLE vacationReport;

-- 휴가 종류 관리자
DROP TABLE vacationType;

-- 휴가 사용현황
DROP TABLE vacationStatus;

-- 쪽지함
DROP TABLE alarm;

-- 기본정보
CREATE TABLE basic (
	empId         NUMBER(10)   NOT NULL, -- 사원번호
	empPw         VARCHAR(20)  NULL,     -- 비밀번호
	empName       VARCHAR(20)  NULL,     -- 이름
	deptId        NUMBER(20)   NULL,     -- 부서코드
	jobId         NUMBER(20)   NULL,     -- 직급코드
	empRegNumber  VARCHAR(20)  NULL,     -- 주민등록번호1
	empRegNumber2 VARCHAR(20)  NULL,     -- 주민등록번호2
	empPhone1     VARCHAR(20)  NULL,     -- 연락처1
	empPhone2     VARCHAR(20)  NULL,     -- 연락처2
	empPhone3     VARCHAR(20)  NULL,     -- 연락처3
	empExtention1 VARCHAR(20)  NULL,     -- 회사(내선)1
	empExtention2 VARCHAR(20)  NULL,     -- 회사(내선)2
	empExtention3 VARCHAR(20)  NULL,     -- 회사(내선)3
	empEmail1     VARCHAR(20)  NULL,     -- 이메일1
	empEmail2     VARCHAR(20)  NULL,     -- 이메일2
	empBirth      VARCHAR(20)  NULL,     -- 생년월일
	empFinalEdu   VARCHAR(20)  NULL,     -- 최종학력
	empHireDate   VARCHAR(20)  NULL,     -- 입사날짜
	hireId        NUMBER(20)   NULL,     -- 고용형태코드
	empDetail     VARCHAR(200) NULL,     -- 비고
	appointId     NUMBER(20)   NULL,     -- 발령구분코드
	anniId        NUMBER(20)   NULL      -- 기념일구분코드
);

-- 기본정보
ALTER TABLE basic
	ADD
		CONSTRAINT PK_basic -- 기본정보 기본키
		PRIMARY KEY (
			empId -- 사원번호
		);

-- 기본정보
COMMENT ON TABLE basic IS '기본정보';

-- 사원번호
COMMENT ON COLUMN basic.empId IS '사원번호';

-- 비밀번호
COMMENT ON COLUMN basic.empPw IS '비밀번호';

-- 이름
COMMENT ON COLUMN basic.empName IS '이름';

-- 부서코드
COMMENT ON COLUMN basic.deptId IS '부서코드';

-- 직급코드
COMMENT ON COLUMN basic.jobId IS '직급코드';

-- 주민등록번호1
COMMENT ON COLUMN basic.empRegNumber IS '주민등록번호1';

-- 주민등록번호2
COMMENT ON COLUMN basic.empRegNumber2 IS '주민등록번호2';

-- 연락처1
COMMENT ON COLUMN basic.empPhone1 IS '연락처1';

-- 연락처2
COMMENT ON COLUMN basic.empPhone2 IS '연락처2';

-- 연락처3
COMMENT ON COLUMN basic.empPhone3 IS '연락처3';

-- 회사(내선)1
COMMENT ON COLUMN basic.empExtention1 IS '회사(내선)1';

-- 회사(내선)2
COMMENT ON COLUMN basic.empExtention2 IS '회사(내선)2';

-- 회사(내선)3
COMMENT ON COLUMN basic.empExtention3 IS '회사(내선)3';

-- 이메일1
COMMENT ON COLUMN basic.empEmail1 IS '이메일1';

-- 이메일2
COMMENT ON COLUMN basic.empEmail2 IS '이메일2';

-- 생년월일
COMMENT ON COLUMN basic.empBirth IS '생년월일';

-- 최종학력
COMMENT ON COLUMN basic.empFinalEdu IS '최종학력';

-- 입사날짜
COMMENT ON COLUMN basic.empHireDate IS '입사날짜';

-- 고용형태코드
COMMENT ON COLUMN basic.hireId IS '고용형태코드';

-- 비고
COMMENT ON COLUMN basic.empDetail IS '비고';

-- 발령구분코드
COMMENT ON COLUMN basic.appointId IS '발령구분코드';

-- 기념일구분코드
COMMENT ON COLUMN basic.anniId IS '기념일구분코드';

-- 기본정보 기본키
COMMENT ON INDEX PK_basic IS '기본정보 기본키';

-- 기본정보 기본키
COMMENT ON CONSTRAINT basic.PK_basic IS '기본정보 기본키';

-- 연봉연차관리
CREATE TABLE salary (
	empId           NUMBER(10) NOT NULL, -- 사원번호
	salaryMoney     NUMBER(38) NULL,     -- 연봉금액
	salaryIncentive NUMBER(10) NULL,     -- 인센티브
	salaryBonus     NUMBER(10) NULL,     -- 상여금
	salaryBasis     NUMBER(10) NULL,     -- 기본연차수
	salaryAdd       NUMBER(10) NULL      -- 가사연차수
);

-- 연봉연차관리
ALTER TABLE salary
	ADD
		CONSTRAINT PK_salary -- 연봉연차관리 기본키
		PRIMARY KEY (
			empId -- 사원번호
		);

-- 연봉연차관리
COMMENT ON TABLE salary IS '연봉연차관리';

-- 사원번호
COMMENT ON COLUMN salary.empId IS '사원번호';

-- 연봉금액
COMMENT ON COLUMN salary.salaryMoney IS '연봉금액';

-- 인센티브
COMMENT ON COLUMN salary.salaryIncentive IS '인센티브';

-- 상여금
COMMENT ON COLUMN salary.salaryBonus IS '상여금';

-- 기본연차수
COMMENT ON COLUMN salary.salaryBasis IS '기본연차수';

-- 가사연차수
COMMENT ON COLUMN salary.salaryAdd IS '가사연차수';

-- 연봉연차관리 기본키
COMMENT ON INDEX PK_salary IS '연봉연차관리 기본키';

-- 연봉연차관리 기본키
COMMENT ON CONSTRAINT salary.PK_salary IS '연봉연차관리 기본키';

-- 고용형태
CREATE TABLE hire (
	hireId    NUMBER(20)  NOT NULL, -- 고용형태코드
	hireName  VARCHAR(20) NULL,     -- 고용형태명
	hireClass NUMBER(10)  NULL      -- 고용형태등급
);

-- 고용형태
ALTER TABLE hire
	ADD
		CONSTRAINT PK_hire -- 고용형태 기본키
		PRIMARY KEY (
			hireId -- 고용형태코드
		);

-- 고용형태
COMMENT ON TABLE hire IS '고용형태';

-- 고용형태코드
COMMENT ON COLUMN hire.hireId IS '고용형태코드';

-- 고용형태명
COMMENT ON COLUMN hire.hireName IS '고용형태명';

-- 고용형태등급
COMMENT ON COLUMN hire.hireClass IS '고용형태등급';

-- 고용형태 기본키
COMMENT ON INDEX PK_hire IS '고용형태 기본키';

-- 고용형태 기본키
COMMENT ON CONSTRAINT hire.PK_hire IS '고용형태 기본키';

-- 상벌사항
CREATE TABLE reward (
	rpId       NUMBER      NOT NULL, -- 부여번호
	rpDate     CHAR(30)    NULL,     -- 집행일자
	rpTitle    VARCHAR(20) NULL,     -- 상벌명
	rpContents VARCHAR(30) NULL,     -- 사유
	rpUnusual  TEXT        NULL,     -- 비고
	empId      NUMBER(10)  NOT NULL  -- 사원번호
);

-- 상벌사항
ALTER TABLE reward
	ADD
		CONSTRAINT PK_reward -- 상벌사항 기본키
		PRIMARY KEY (
			rpId -- 부여번호
		);

-- 상벌사항
COMMENT ON TABLE reward IS '상벌사항';

-- 부여번호
COMMENT ON COLUMN reward.rpId IS '부여번호';

-- 집행일자
COMMENT ON COLUMN reward.rpDate IS '집행일자';

-- 상벌명
COMMENT ON COLUMN reward.rpTitle IS '상벌명';

-- 사유
COMMENT ON COLUMN reward.rpContents IS '사유';

-- 비고
COMMENT ON COLUMN reward.rpUnusual IS '비고';

-- 사원번호
COMMENT ON COLUMN reward.empId IS '사원번호';

-- 상벌사항 기본키
COMMENT ON INDEX PK_reward IS '상벌사항 기본키';

-- 상벌사항 기본키
COMMENT ON CONSTRAINT reward.PK_reward IS '상벌사항 기본키';

-- 발령구분
CREATE TABLE appointDivision (
	appointId   NUMBER(20)  NOT NULL, -- 발령구분코드
	appointName VARCHAR(20) NULL      -- 발령구분명
);

-- 발령구분
ALTER TABLE appointDivision
	ADD
		CONSTRAINT PK_appointDivision -- 발령구분 기본키
		PRIMARY KEY (
			appointId -- 발령구분코드
		);

-- 발령구분
COMMENT ON TABLE appointDivision IS '발령구분';

-- 발령구분코드
COMMENT ON COLUMN appointDivision.appointId IS '발령구분코드';

-- 발령구분명
COMMENT ON COLUMN appointDivision.appointName IS '발령구분명';

-- 발령구분 기본키
COMMENT ON INDEX PK_appointDivision IS '발령구분 기본키';

-- 발령구분 기본키
COMMENT ON CONSTRAINT appointDivision.PK_appointDivision IS '발령구분 기본키';

-- 자격면허
CREATE TABLE license (
	certifiNum       VARCHAR(50)   NOT NULL, -- 자격증번호
	rightName        VARCHAR(100)  NULL,     -- 자격명
	rightInstitution VARCHAR(200)  NULL,     -- 발행기관
	rightObtain      DATE          NULL,     -- 취득일자
	rightEnd         DATE          NULL,     -- 만기일자
	rightUpdate      DATE          NULL,     -- 갱신일자
	rightErasure     DATE          NULL,     -- 말소일자
	erasureContent   VARCHAR(200)  NULL,     -- 말소사유
	rightImage       VARCHAR(2000) NULL,     -- 자격증사본
	empId            NUMBER(10)    NULL      -- 사원번호
);

-- 자격면허
ALTER TABLE license
	ADD
		CONSTRAINT PK_license -- 자격면허 기본키
		PRIMARY KEY (
			certifiNum -- 자격증번호
		);

-- 자격면허
COMMENT ON TABLE license IS '자격면허';

-- 자격증번호
COMMENT ON COLUMN license.certifiNum IS '자격증번호';

-- 자격명
COMMENT ON COLUMN license.rightName IS '자격명';

-- 발행기관
COMMENT ON COLUMN license.rightInstitution IS '발행기관';

-- 취득일자
COMMENT ON COLUMN license.rightObtain IS '취득일자';

-- 만기일자
COMMENT ON COLUMN license.rightEnd IS '만기일자';

-- 갱신일자
COMMENT ON COLUMN license.rightUpdate IS '갱신일자';

-- 말소일자
COMMENT ON COLUMN license.rightErasure IS '말소일자';

-- 말소사유
COMMENT ON COLUMN license.erasureContent IS '말소사유';

-- 자격증사본
COMMENT ON COLUMN license.rightImage IS '자격증사본';

-- 사원번호
COMMENT ON COLUMN license.empId IS '사원번호';

-- 자격면허 기본키
COMMENT ON INDEX PK_license IS '자격면허 기본키';

-- 자격면허 기본키
COMMENT ON CONSTRAINT license.PK_license IS '자격면허 기본키';

-- 인사발령
CREATE TABLE appoint (
	personalSeq      NUMBER(20)   NOT NULL, -- 인사번호
	empId            NUMBER(10)   NOT NULL, -- 사원번호
	personnalDate    VARCHAR(20)  NULL,     -- 발령일자
	personnalUnusual VARCHAR(100) NULL,     -- 비고
	appointId        NUMBER(20)   NULL      -- 발령구분코드
);

-- 인사발령
ALTER TABLE appoint
	ADD
		CONSTRAINT PK_appoint -- 인사발령 기본키
		PRIMARY KEY (
			personalSeq -- 인사번호
		);

-- 인사발령
COMMENT ON TABLE appoint IS '인사발령';

-- 인사번호
COMMENT ON COLUMN appoint.personalSeq IS '인사번호';

-- 사원번호
COMMENT ON COLUMN appoint.empId IS '사원번호';

-- 발령일자
COMMENT ON COLUMN appoint.personnalDate IS '발령일자';

-- 비고
COMMENT ON COLUMN appoint.personnalUnusual IS '비고';

-- 발령구분코드
COMMENT ON COLUMN appoint.appointId IS '발령구분코드';

-- 인사발령 기본키
COMMENT ON INDEX PK_appoint IS '인사발령 기본키';

-- 인사발령 기본키
COMMENT ON CONSTRAINT appoint.PK_appoint IS '인사발령 기본키';

-- 기념일등록
CREATE TABLE anniversary (
	anniInSeq NUMBER(20)  NOT NULL, -- 기념일_seq
	anniTitle VARCHAR(20) NULL,     -- 제목
	anniDate  DATE        NULL,     -- 기념일
	empId     NUMBER(10)  NOT NULL, -- 사원번호
	anniId    NUMBER(20)  NULL      -- 기념일구분코드
);

-- 기념일등록
ALTER TABLE anniversary
	ADD
		CONSTRAINT PK_anniversary -- 기념일등록 기본키
		PRIMARY KEY (
			anniInSeq -- 기념일_seq
		);

-- 기념일등록
COMMENT ON TABLE anniversary IS '기념일등록';

-- 기념일_seq
COMMENT ON COLUMN anniversary.anniInSeq IS '기념일_seq';

-- 제목
COMMENT ON COLUMN anniversary.anniTitle IS '제목';

-- 기념일
COMMENT ON COLUMN anniversary.anniDate IS '기념일';

-- 사원번호
COMMENT ON COLUMN anniversary.empId IS '사원번호';

-- 기념일구분코드
COMMENT ON COLUMN anniversary.anniId IS '기념일구분코드';

-- 기념일등록 기본키
COMMENT ON INDEX PK_anniversary IS '기념일등록 기본키';

-- 기념일등록 기본키
COMMENT ON CONSTRAINT anniversary.PK_anniversary IS '기념일등록 기본키';

-- 부서
CREATE TABLE department (
	deptId   NUMBER(20)   NOT NULL, -- 부서코드
	highDept VARCHAR(100) NOT NULL, -- 상위부서
	deptName VARCHAR(100) NULL,     -- 부서명
	deptHead VARCHAR(100) NULL      -- 부서장
);

-- 부서
ALTER TABLE department
	ADD
		CONSTRAINT PK_department -- 부서 기본키
		PRIMARY KEY (
			deptId -- 부서코드
		);

-- 부서
COMMENT ON TABLE department IS '부서';

-- 부서코드
COMMENT ON COLUMN department.deptId IS '부서코드';

-- 상위부서
COMMENT ON COLUMN department.highDept IS '상위부서';

-- 부서명
COMMENT ON COLUMN department.deptName IS '부서명';

-- 부서장
COMMENT ON COLUMN department.deptHead IS '부서장';

-- 부서 기본키
COMMENT ON INDEX PK_department IS '부서 기본키';

-- 부서 기본키
COMMENT ON CONSTRAINT department.PK_department IS '부서 기본키';

-- 경력사항
CREATE TABLE career (
	careerId       NUMBER(20)   NOT NULL, -- 경력사항코드
	empId          NUMBER(10)   NOT NULL, -- 사원번호
	careerPeriod1  DATE         NULL,     -- 근무기간1
	careerPeriod2  DATE         NULL,     -- 근무기간2
	careerLocation VARCHAR(300) NULL,     -- 근무처
	careerPosition VARCHAR(300) NULL,     -- 직급
	careerDuty     VARCHAR(300) NULL,     -- 담당업무
	careerContents VARCHAR(300) NULL      -- 업무내역
);

-- 경력사항
ALTER TABLE career
	ADD
		CONSTRAINT PK_career -- 경력사항 기본키
		PRIMARY KEY (
			careerId -- 경력사항코드
		);

-- 경력사항
COMMENT ON TABLE career IS '경력사항';

-- 경력사항코드
COMMENT ON COLUMN career.careerId IS '경력사항코드';

-- 사원번호
COMMENT ON COLUMN career.empId IS '사원번호';

-- 근무기간1
COMMENT ON COLUMN career.careerPeriod1 IS '근무기간1';

-- 근무기간2
COMMENT ON COLUMN career.careerPeriod2 IS '근무기간2';

-- 근무처
COMMENT ON COLUMN career.careerLocation IS '근무처';

-- 직급
COMMENT ON COLUMN career.careerPosition IS '직급';

-- 담당업무
COMMENT ON COLUMN career.careerDuty IS '담당업무';

-- 업무내역
COMMENT ON COLUMN career.careerContents IS '업무내역';

-- 경력사항 기본키
COMMENT ON INDEX PK_career IS '경력사항 기본키';

-- 경력사항 기본키
COMMENT ON CONSTRAINT career.PK_career IS '경력사항 기본키';

-- 직급
CREATE TABLE jobs (
	jobId    NUMBER(20)  NOT NULL, -- 직급코드
	jobName  VARCHAR(20) NULL,     -- 직급명
	jobRank  VARCHAR(10) NULL,     -- 직급등급
	jobLife  NUMBER(20)  NULL,     -- 직급별승진기준년수
	jobCaree NUMBER(20)  NULL      -- 진급기준전체경력
);

-- 직급
ALTER TABLE jobs
	ADD
		CONSTRAINT PK_jobs -- 직급 기본키
		PRIMARY KEY (
			jobId -- 직급코드
		);

-- 직급
COMMENT ON TABLE jobs IS '직급';

-- 직급코드
COMMENT ON COLUMN jobs.jobId IS '직급코드';

-- 직급명
COMMENT ON COLUMN jobs.jobName IS '직급명';

-- 직급등급
COMMENT ON COLUMN jobs.jobRank IS '직급등급';

-- 직급별승진기준년수
COMMENT ON COLUMN jobs.jobLife IS '직급별승진기준년수';

-- 진급기준전체경력
COMMENT ON COLUMN jobs.jobCaree IS '진급기준전체경력';

-- 직급 기본키
COMMENT ON INDEX PK_jobs IS '직급 기본키';

-- 직급 기본키
COMMENT ON CONSTRAINT jobs.PK_jobs IS '직급 기본키';

-- 기념일
CREATE TABLE anni (
	anniId    NUMBER(20)  NOT NULL, -- 기념일구분코드
	anniName  VARCHAR(20) NULL,     -- 기념일구분명
	anniColor VARCHAR(20) NULL      -- 표시색상
);

-- 기념일
ALTER TABLE anni
	ADD
		CONSTRAINT PK_anni -- 기념일 기본키
		PRIMARY KEY (
			anniId -- 기념일구분코드
		);

-- 기념일
COMMENT ON TABLE anni IS '기념일';

-- 기념일구분코드
COMMENT ON COLUMN anni.anniId IS '기념일구분코드';

-- 기념일구분명
COMMENT ON COLUMN anni.anniName IS '기념일구분명';

-- 표시색상
COMMENT ON COLUMN anni.anniColor IS '표시색상';

-- 기념일 기본키
COMMENT ON INDEX PK_anni IS '기념일 기본키';

-- 기념일 기본키
COMMENT ON CONSTRAINT anni.PK_anni IS '기념일 기본키';

-- 근태관리
CREATE TABLE commute (
	attendSeq   NUMBER(20)   NOT NULL, -- 근태_seq
	attendStart DATE         NULL,     -- 출근날짜시간
	attendEnd   DATE         NULL,     -- 퇴근날짜시간
	attendGo    VARCHAR(200) NULL,     -- 출근상태
	attendLeave VARCHAR(200) NULL,     -- 퇴근상태
	empId       NUMBER(10)   NULL,     -- 사원번호
	attendType  NUMBER(20)   NULL      -- 근태타입_seq
);

-- 근태관리
ALTER TABLE commute
	ADD
		CONSTRAINT PK_commute -- 근태관리 기본키
		PRIMARY KEY (
			attendSeq -- 근태_seq
		);

-- 근태관리
COMMENT ON TABLE commute IS '근태관리';

-- 근태_seq
COMMENT ON COLUMN commute.attendSeq IS '근태_seq';

-- 출근날짜시간
COMMENT ON COLUMN commute.attendStart IS '출근날짜시간';

-- 퇴근날짜시간
COMMENT ON COLUMN commute.attendEnd IS '퇴근날짜시간';

-- 출근상태
COMMENT ON COLUMN commute.attendGo IS '출근상태';

-- 퇴근상태
COMMENT ON COLUMN commute.attendLeave IS '퇴근상태';

-- 사원번호
COMMENT ON COLUMN commute.empId IS '사원번호';

-- 근태타입_seq
COMMENT ON COLUMN commute.attendType IS '근태타입_seq';

-- 근태관리 기본키
COMMENT ON INDEX PK_commute IS '근태관리 기본키';

-- 근태관리 기본키
COMMENT ON CONSTRAINT commute.PK_commute IS '근태관리 기본키';

-- 업무내역
CREATE TABLE breakdown (
	breakdownSeq         NUMBER(10)   NULL,     -- 업무내역_seq
	breakdownContents    VARCHAR(500) NULL,     -- 주요업무
	breakdownImportant   VARCHAR(500) NULL,     -- 중요도
	breakdownWeight      VARCHAR(500) NULL,     -- 시간비중
	breakdownResult      VARCHAR(500) NULL,     -- 결과물
	breakdownCooperation VARCHAR(500) NULL,     -- 협업대상
	dutySeq              NUMBER(10)   NOT NULL  -- 일련번호
);

-- 업무내역
COMMENT ON TABLE breakdown IS '업무내역';

-- 업무내역_seq
COMMENT ON COLUMN breakdown.breakdownSeq IS '업무내역_seq';

-- 주요업무
COMMENT ON COLUMN breakdown.breakdownContents IS '주요업무';

-- 중요도
COMMENT ON COLUMN breakdown.breakdownImportant IS '중요도';

-- 시간비중
COMMENT ON COLUMN breakdown.breakdownWeight IS '시간비중';

-- 결과물
COMMENT ON COLUMN breakdown.breakdownResult IS '결과물';

-- 협업대상
COMMENT ON COLUMN breakdown.breakdownCooperation IS '협업대상';

-- 일련번호
COMMENT ON COLUMN breakdown.dutySeq IS '일련번호';

-- 주기적
CREATE TABLE periodic (
	periodicSeq        NUMBER(10)   NULL,     -- 순서
	periodicPeriod     VARCHAR(500) NULL,     -- 주기
	periodicContents   VARCHAR(500) NULL,     -- 주요업무
	periodicResult     VARCHAR(500) NULL,     -- 결과물
	periodicCoopration VARCHAR(500) NULL,     -- 협업대상
	dutySeq            NUMBER(10)   NOT NULL  -- 일련번호
);

-- 주기적
COMMENT ON TABLE periodic IS '주기적';

-- 순서
COMMENT ON COLUMN periodic.periodicSeq IS '순서';

-- 주기
COMMENT ON COLUMN periodic.periodicPeriod IS '주기';

-- 주요업무
COMMENT ON COLUMN periodic.periodicContents IS '주요업무';

-- 결과물
COMMENT ON COLUMN periodic.periodicResult IS '결과물';

-- 협업대상
COMMENT ON COLUMN periodic.periodicCoopration IS '협업대상';

-- 일련번호
COMMENT ON COLUMN periodic.dutySeq IS '일련번호';

-- 핵심성과지표
CREATE TABLE outcome (
	outcome_seq         NUMBER(10)   NULL,     -- 핵심성과지표_seq
	outcome_period      VARCHAR(500) NULL,     -- 주기
	outcome_work        VARCHAR(500) NULL,     -- 주요업무
	outcome_result      VARCHAR(500) NULL,     -- 결과물
	outcome_cooperation VARCHAR(500) NULL,     -- 협업대상
	dutySeq             NUMBER(10)   NOT NULL  -- 일련번호
);

-- 핵심성과지표
COMMENT ON TABLE outcome IS '핵심성과지표';

-- 핵심성과지표_seq
COMMENT ON COLUMN outcome.outcome_seq IS '핵심성과지표_seq';

-- 주기
COMMENT ON COLUMN outcome.outcome_period IS '주기';

-- 주요업무
COMMENT ON COLUMN outcome.outcome_work IS '주요업무';

-- 결과물
COMMENT ON COLUMN outcome.outcome_result IS '결과물';

-- 협업대상
COMMENT ON COLUMN outcome.outcome_cooperation IS '협업대상';

-- 일련번호
COMMENT ON COLUMN outcome.dutySeq IS '일련번호';

-- 업무교육
CREATE TABLE education (
	eduSeq         NUMBER(10)   NULL,     -- 업무교육_seq
	eduContents    VARCHAR(500) NULL,     -- 교육내용
	eduInstitution VARCHAR(500) NULL,     -- 교육기관
	eduUnusual     VARCHAR(500) NULL,     -- 비고
	dutySeq        NUMBER(10)   NOT NULL  -- 일련번호
);

-- 업무교육
COMMENT ON TABLE education IS '업무교육';

-- 업무교육_seq
COMMENT ON COLUMN education.eduSeq IS '업무교육_seq';

-- 교육내용
COMMENT ON COLUMN education.eduContents IS '교육내용';

-- 교육기관
COMMENT ON COLUMN education.eduInstitution IS '교육기관';

-- 비고
COMMENT ON COLUMN education.eduUnusual IS '비고';

-- 일련번호
COMMENT ON COLUMN education.dutySeq IS '일련번호';

-- 업무명세표
CREATE TABLE work (
	dutySeq      NUMBER(10)   NOT NULL, -- 일련번호
	dutyDate     DATE         NULL,     -- 날짜
	dutyAssessor VARCHAR(500) NULL,     -- 평가자
	dutyStatus   VARCHAR(500) NULL,     -- 상태
	dutyGoal     VARCHAR(500) NULL,     -- 업무목표
	empId        NUMBER(10)   NOT NULL, -- 사원번호
	dutyYear     VARCHAR(13)  NULL      -- 업무년도
);

-- 업무명세표
ALTER TABLE work
	ADD
		CONSTRAINT PK_work -- 업무명세표 기본키
		PRIMARY KEY (
			dutySeq -- 일련번호
		);

-- 업무명세표
COMMENT ON TABLE work IS '업무명세표';

-- 일련번호
COMMENT ON COLUMN work.dutySeq IS '일련번호';

-- 날짜
COMMENT ON COLUMN work.dutyDate IS '날짜';

-- 평가자
COMMENT ON COLUMN work.dutyAssessor IS '평가자';

-- 상태
COMMENT ON COLUMN work.dutyStatus IS '상태';

-- 업무목표
COMMENT ON COLUMN work.dutyGoal IS '업무목표';

-- 사원번호
COMMENT ON COLUMN work.empId IS '사원번호';

-- 업무년도
COMMENT ON COLUMN work.dutyYear IS '업무년도';

-- 업무명세표 기본키
COMMENT ON INDEX PK_work IS '업무명세표 기본키';

-- 업무명세표 기본키
COMMENT ON CONSTRAINT work.PK_work IS '업무명세표 기본키';

-- 게시판형식
CREATE TABLE boardForm (
	bbsFormNum  NUMBER(10)   NOT NULL, -- 게시판형식번호
	bbsFormName VARCHAR(200) NULL      -- 게시판형식이름
);

-- 게시판형식
ALTER TABLE boardForm
	ADD
		CONSTRAINT PK_boardForm -- 게시판형식 기본키
		PRIMARY KEY (
			bbsFormNum -- 게시판형식번호
		);

-- 게시판형식
COMMENT ON TABLE boardForm IS '게시판형식';

-- 게시판형식번호
COMMENT ON COLUMN boardForm.bbsFormNum IS '게시판형식번호';

-- 게시판형식이름
COMMENT ON COLUMN boardForm.bbsFormName IS '게시판형식이름';

-- 게시판형식 기본키
COMMENT ON INDEX PK_boardForm IS '게시판형식 기본키';

-- 게시판형식 기본키
COMMENT ON CONSTRAINT boardForm.PK_boardForm IS '게시판형식 기본키';

-- 사진정보
CREATE TABLE boardFile (
	boardFileNum      NUMBER(20)    NOT NULL, -- 사진게시판번호
	bbsSeq            NUMBER(10)    NULL,     -- 글번호
	boardFileName     VARCHAR(2000) NULL,     -- 원본사진이름
	boardFileRename   VARCHAR(2000) NULL,     -- 저장사진이름
	boardFileLocation VARCHAR(2000) NULL      -- 저장폴더
);

-- 사진정보
ALTER TABLE boardFile
	ADD
		CONSTRAINT PK_boardFile -- 사진정보 기본키
		PRIMARY KEY (
			boardFileNum -- 사진게시판번호
		);

-- 사진정보
COMMENT ON TABLE boardFile IS '사진정보';

-- 사진게시판번호
COMMENT ON COLUMN boardFile.boardFileNum IS '사진게시판번호';

-- 글번호
COMMENT ON COLUMN boardFile.bbsSeq IS '글번호';

-- 원본사진이름
COMMENT ON COLUMN boardFile.boardFileName IS '원본사진이름';

-- 저장사진이름
COMMENT ON COLUMN boardFile.boardFileRename IS '저장사진이름';

-- 저장폴더
COMMENT ON COLUMN boardFile.boardFileLocation IS '저장폴더';

-- 사진정보 기본키
COMMENT ON INDEX PK_boardFile IS '사진정보 기본키';

-- 사진정보 기본키
COMMENT ON CONSTRAINT boardFile.PK_boardFile IS '사진정보 기본키';

-- 댓글게시판
CREATE TABLE boardComment (
	bbsCommentNum     NUMBER(10)   NOT NULL, -- 댓글번호
	bbsSeq            NUMBER(10)   NULL,     -- 글번호
	bbsCommentEnum    NUMBER(10)   NULL,     -- 사원번호
	bbsCommentEname   VARCHAR(200) NULL,     -- 사원명
	bbsCommentContent VARCHAR(200) NULL,     -- 댓글내용
	bbsCommentDate    DATE         NULL      -- 댓글작성일
);

-- 댓글게시판
ALTER TABLE boardComment
	ADD
		CONSTRAINT PK_boardComment -- 댓글게시판 기본키
		PRIMARY KEY (
			bbsCommentNum -- 댓글번호
		);

-- 댓글게시판
COMMENT ON TABLE boardComment IS '댓글게시판';

-- 댓글번호
COMMENT ON COLUMN boardComment.bbsCommentNum IS '댓글번호';

-- 글번호
COMMENT ON COLUMN boardComment.bbsSeq IS '글번호';

-- 사원번호
COMMENT ON COLUMN boardComment.bbsCommentEnum IS '사원번호';

-- 사원명
COMMENT ON COLUMN boardComment.bbsCommentEname IS '사원명';

-- 댓글내용
COMMENT ON COLUMN boardComment.bbsCommentContent IS '댓글내용';

-- 댓글작성일
COMMENT ON COLUMN boardComment.bbsCommentDate IS '댓글작성일';

-- 댓글게시판 기본키
COMMENT ON INDEX PK_boardComment IS '댓글게시판 기본키';

-- 댓글게시판 기본키
COMMENT ON CONSTRAINT boardComment.PK_boardComment IS '댓글게시판 기본키';

-- 게시판
CREATE TABLE board (
	bbsSeq     NUMBER(10)   NOT NULL, -- 글번호
	bbsdate    DATE         NULL,     -- 작성일
	bbsVc      NUMBER(10)   NULL,     -- 조회수
	bbsEname   VARCHAR(200) NULL,     -- 사원명
	bbsTitle   VARCHAR(400) NULL,     -- 제목
	bbsContent LONG TEXT    NULL,     -- 내용
	empId      NUMBER(10)   NULL,     -- 사원번호
	bbsFormNum NUMBER(10)   NULL      -- 게시판형식번호
);

-- 게시판
ALTER TABLE board
	ADD
		CONSTRAINT PK_board -- 게시판 기본키
		PRIMARY KEY (
			bbsSeq -- 글번호
		);

-- 게시판
COMMENT ON TABLE board IS '게시판';

-- 글번호
COMMENT ON COLUMN board.bbsSeq IS '글번호';

-- 작성일
COMMENT ON COLUMN board.bbsdate IS '작성일';

-- 조회수
COMMENT ON COLUMN board.bbsVc IS '조회수';

-- 사원명
COMMENT ON COLUMN board.bbsEname IS '사원명';

-- 제목
COMMENT ON COLUMN board.bbsTitle IS '제목';

-- 내용
COMMENT ON COLUMN board.bbsContent IS '내용';

-- 사원번호
COMMENT ON COLUMN board.empId IS '사원번호';

-- 게시판형식번호
COMMENT ON COLUMN board.bbsFormNum IS '게시판형식번호';

-- 게시판 기본키
COMMENT ON INDEX PK_board IS '게시판 기본키';

-- 게시판 기본키
COMMENT ON CONSTRAINT board.PK_board IS '게시판 기본키';

-- 업무에 필요한 능력
CREATE TABLE ablity (
	ablityCareer   VARCHAR(500) NULL,     -- 업무경력
	ablityAcademic VARCHAR(500) NULL,     -- 필요한 학력
	academicSkill  VARCHAR(500) NULL,     -- 필요기술
	dutySeq        NUMBER(10)   NOT NULL  -- 일련번호
);

-- 업무에 필요한 능력
COMMENT ON TABLE ablity IS '업무에 필요한 능력';

-- 업무경력
COMMENT ON COLUMN ablity.ablityCareer IS '업무경력';

-- 필요한 학력
COMMENT ON COLUMN ablity.ablityAcademic IS '필요한 학력';

-- 필요기술
COMMENT ON COLUMN ablity.academicSkill IS '필요기술';

-- 일련번호
COMMENT ON COLUMN ablity.dutySeq IS '일련번호';

-- 근태타입
CREATE TABLE commuteType (
	attendSeq      NUMBER(20)   NOT NULL, -- 근태타입_seq
	attendTypeName VARCHAR(100) NULL      -- 근태타입이름
);

-- 근태타입
ALTER TABLE commuteType
	ADD
		CONSTRAINT PK_commuteType -- 근태타입 기본키
		PRIMARY KEY (
			attendSeq -- 근태타입_seq
		);

-- 근태타입
COMMENT ON TABLE commuteType IS '근태타입';

-- 근태타입_seq
COMMENT ON COLUMN commuteType.attendSeq IS '근태타입_seq';

-- 근태타입이름
COMMENT ON COLUMN commuteType.attendTypeName IS '근태타입이름';

-- 근태타입 기본키
COMMENT ON INDEX PK_commuteType IS '근태타입 기본키';

-- 근태타입 기본키
COMMENT ON CONSTRAINT commuteType.PK_commuteType IS '근태타입 기본키';

-- 사원파일
CREATE TABLE empfile (
	empId          NUMBER(10)    NOT NULL, -- 사원번호
	faceOriginal   VARCHAR(2000) NULL,     -- 증명사진원본
	faceSaveName   VARCHAR(2000) NULL,     -- 증명사진저장이름
	degreeOriginal VARCHAR(2000) NULL,     -- 학위증명서원본
	degreeSaveName VARCHAR(2000) NULL,     -- 학위증명서저장이름
	joinOriginal   VARCHAR(2000) NULL,     -- 입사서류원본
	joinSaveName   VARCHAR(2000) NULL,     -- 입사서류저장이름
	saveFolder     VARCHAR(2000) NULL      -- 저장폴더
);

-- 사원파일
ALTER TABLE empfile
	ADD
		CONSTRAINT PK_empfile -- 사원파일 기본키
		PRIMARY KEY (
			empId -- 사원번호
		);

-- 사원파일
COMMENT ON TABLE empfile IS '사원파일';

-- 사원번호
COMMENT ON COLUMN empfile.empId IS '사원번호';

-- 증명사진원본
COMMENT ON COLUMN empfile.faceOriginal IS '증명사진원본';

-- 증명사진저장이름
COMMENT ON COLUMN empfile.faceSaveName IS '증명사진저장이름';

-- 학위증명서원본
COMMENT ON COLUMN empfile.degreeOriginal IS '학위증명서원본';

-- 학위증명서저장이름
COMMENT ON COLUMN empfile.degreeSaveName IS '학위증명서저장이름';

-- 입사서류원본
COMMENT ON COLUMN empfile.joinOriginal IS '입사서류원본';

-- 입사서류저장이름
COMMENT ON COLUMN empfile.joinSaveName IS '입사서류저장이름';

-- 저장폴더
COMMENT ON COLUMN empfile.saveFolder IS '저장폴더';

-- 사원파일 기본키
COMMENT ON INDEX PK_empfile IS '사원파일 기본키';

-- 사원파일 기본키
COMMENT ON CONSTRAINT empfile.PK_empfile IS '사원파일 기본키';

-- 휴가정보
CREATE TABLE vacationInfo (
	empId         NUMBER(10) NOT NULL, -- 사원번호
	presentYear   DATE       NOT NULL, -- 현재연도
	hiredate      DATE       NULL,     -- 입사일자
	totalVacation NUMBER     NULL,     -- 휴가지급총일수
	usedDays      NUMBER     NULL,     -- 사용일수
	remainDays    NUMBER     NULL      -- 잔여일수
);

-- 휴가정보
ALTER TABLE vacationInfo
	ADD
		CONSTRAINT PK_vacation_nfo -- 휴가정보 기본키
		PRIMARY KEY (
			empId,       -- 사원번호
			presentYear  -- 현재연도
		);

-- 휴가정보
COMMENT ON TABLE vacationInfo IS '휴가정보';

-- 사원번호
COMMENT ON COLUMN vacationInfo.empId IS '사원번호';

-- 현재연도
COMMENT ON COLUMN vacationInfo.presentYear IS '현재연도';

-- 입사일자
COMMENT ON COLUMN vacationInfo.hiredate IS '입사일자';

-- 휴가지급총일수
COMMENT ON COLUMN vacationInfo.totalVacation IS '휴가지급총일수';

-- 사용일수
COMMENT ON COLUMN vacationInfo.usedDays IS '사용일수';

-- 잔여일수
COMMENT ON COLUMN vacationInfo.remainDays IS '잔여일수';

-- 휴가정보 기본키
COMMENT ON INDEX PK_vacation_nfo IS '휴가정보 기본키';

-- 휴가정보 기본키
COMMENT ON CONSTRAINT vacationInfo.PK_vacation_nfo IS '휴가정보 기본키';

-- 문서종류
CREATE TABLE doclist (
	doclistId   NUMBER       NOT NULL, -- 문서종류ID
	doclistName VARCHAR(500) NULL      -- 문서종류이름
);

-- 문서종류
ALTER TABLE doclist
	ADD
		CONSTRAINT PK_doclist -- 문서종류 기본키
		PRIMARY KEY (
			doclistId -- 문서종류ID
		);

-- 문서종류
COMMENT ON TABLE doclist IS '문서종류';

-- 문서종류ID
COMMENT ON COLUMN doclist.doclistId IS '문서종류ID';

-- 문서종류이름
COMMENT ON COLUMN doclist.doclistName IS '문서종류이름';

-- 문서종류 기본키
COMMENT ON INDEX PK_doclist IS '문서종류 기본키';

-- 문서종류 기본키
COMMENT ON CONSTRAINT doclist.PK_doclist IS '문서종류 기본키';

-- 문서상태
CREATE TABLE docstate (
	stateSeq  NUMBER       NOT NULL, -- 상태SEQ
	stateName VARCHAR(500) NULL      -- 상태명
);

-- 문서상태
ALTER TABLE docstate
	ADD
		CONSTRAINT PK_docstate -- 문서상태 기본키
		PRIMARY KEY (
			stateSeq -- 상태SEQ
		);

-- 문서상태
COMMENT ON TABLE docstate IS '문서상태';

-- 상태SEQ
COMMENT ON COLUMN docstate.stateSeq IS '상태SEQ';

-- 상태명
COMMENT ON COLUMN docstate.stateName IS '상태명';

-- 문서상태 기본키
COMMENT ON INDEX PK_docstate IS '문서상태 기본키';

-- 문서상태 기본키
COMMENT ON CONSTRAINT docstate.PK_docstate IS '문서상태 기본키';

-- 기본양식
CREATE TABLE document (
	docId     NUMBER       NOT NULL, -- 문서번호
	empId     NUMBER(10)   NULL,     -- 사원번호
	doclistId NUMBER       NULL,     -- 문서종류ID
	stateSeq  NUMBER       NULL,     -- 상태SEQ
	deptId    NUMBER(20)   NULL,     -- 부서코드
	docName   VARCHAR(500) NULL,     -- 제목
	docDate   DATE         NULL      -- 기안일
);

-- 기본양식
ALTER TABLE document
	ADD
		CONSTRAINT PK_document -- 기본양식 기본키
		PRIMARY KEY (
			docId -- 문서번호
		);

-- 기본양식
COMMENT ON TABLE document IS '기본양식';

-- 문서번호
COMMENT ON COLUMN document.docId IS '문서번호';

-- 사원번호
COMMENT ON COLUMN document.empId IS '사원번호';

-- 문서종류ID
COMMENT ON COLUMN document.doclistId IS '문서종류ID';

-- 상태SEQ
COMMENT ON COLUMN document.stateSeq IS '상태SEQ';

-- 부서코드
COMMENT ON COLUMN document.deptId IS '부서코드';

-- 제목
COMMENT ON COLUMN document.docName IS '제목';

-- 기안일
COMMENT ON COLUMN document.docDate IS '기안일';

-- 기본양식 기본키
COMMENT ON INDEX PK_document IS '기본양식 기본키';

-- 기본양식 기본키
COMMENT ON CONSTRAINT document.PK_document IS '기본양식 기본키';

-- 결재자
CREATE TABLE settlement (
	signState VARCHAR(10)  NULL,     -- 결재상태
	docId     NUMBER       NULL,     -- 문서번호
	empId     NUMBER(10)   NULL,     -- 사원번호
	signSeq   NUMBER       NOT NULL, -- 결재SEQ
	signStep  VARCHAR(100) NULL      -- 결재단계
);

-- 결재자
ALTER TABLE settlement
	ADD
		CONSTRAINT PK_settlement -- 결재자 기본키
		PRIMARY KEY (
			signSeq -- 결재SEQ
		);

-- 결재자
COMMENT ON TABLE settlement IS '결재자';

-- 결재상태
COMMENT ON COLUMN settlement.signState IS '결재상태';

-- 문서번호
COMMENT ON COLUMN settlement.docId IS '문서번호';

-- 사원번호
COMMENT ON COLUMN settlement.empId IS '사원번호';

-- 결재SEQ
COMMENT ON COLUMN settlement.signSeq IS '결재SEQ';

-- 결재단계
COMMENT ON COLUMN settlement.signStep IS '결재단계';

-- 결재자 기본키
COMMENT ON INDEX PK_settlement IS '결재자 기본키';

-- 결재자 기본키
COMMENT ON CONSTRAINT settlement.PK_settlement IS '결재자 기본키';

-- 결재단계설정
CREATE TABLE signStep (
	sign         NUMBER       NOT NULL, -- 결재단계기본키
	doclistId    NUMBER       NULL,     -- 문서종류ID
	signStep     NUMBER       NULL,     -- 단계
	signStepName VARCHAR(500) NULL,     -- 단계명
	employeeId   NUMBER       NULL,     -- 사원번호
	departmentId NUMBER       NULL,     -- 부서ID
	signDeadline NUMBER       NULL      -- 결재기한
);

-- 결재단계설정
ALTER TABLE signStep
	ADD
		CONSTRAINT PK_signStep -- 결재단계설정 기본키
		PRIMARY KEY (
			sign -- 결재단계기본키
		);

-- 결재단계설정
COMMENT ON TABLE signStep IS '결재단계설정';

-- 결재단계기본키
COMMENT ON COLUMN signStep.sign IS '결재단계기본키';

-- 문서종류ID
COMMENT ON COLUMN signStep.doclistId IS '문서종류ID';

-- 단계
COMMENT ON COLUMN signStep.signStep IS '단계';

-- 단계명
COMMENT ON COLUMN signStep.signStepName IS '단계명';

-- 사원번호
COMMENT ON COLUMN signStep.employeeId IS '사원번호';

-- 부서ID
COMMENT ON COLUMN signStep.departmentId IS '부서ID';

-- 결재기한
COMMENT ON COLUMN signStep.signDeadline IS '결재기한';

-- 결재단계설정 기본키
COMMENT ON INDEX PK_signStep IS '결재단계설정 기본키';

-- 결재단계설정 기본키
COMMENT ON CONSTRAINT signStep.PK_signStep IS '결재단계설정 기본키';

-- 휴가계
CREATE TABLE vacationReport (
	docId          NUMBER        NOT NULL, -- 문서번호
	doclistId      NUMBER        NOT NULL, -- 문서종류ID
	vacationReason VARCHAR(4000) NULL,     -- 사유
	vacationTypeId NUMBER        NULL,     -- 휴가종류⁯⁯ID
	vacationDay    VARCHAR(300)  NULL,     -- 휴가기간
	vacationUseday NUMBER        NULL      -- 사용일수
);

-- 휴가계
ALTER TABLE vacationReport
	ADD
		CONSTRAINT PK_vacationReport -- 휴가계 기본키
		PRIMARY KEY (
			docId -- 문서번호
		);

-- 휴가계
COMMENT ON TABLE vacationReport IS '휴가계';

-- 문서번호
COMMENT ON COLUMN vacationReport.docId IS '문서번호';

-- 문서종류ID
COMMENT ON COLUMN vacationReport.doclistId IS '문서종류ID';

-- 사유
COMMENT ON COLUMN vacationReport.vacationReason IS '사유';

-- 휴가종류⁯⁯ID
COMMENT ON COLUMN vacationReport.vacationTypeId IS '휴가종류⁯⁯ID';

-- 휴가기간
COMMENT ON COLUMN vacationReport.vacationDay IS '휴가기간';

-- 사용일수
COMMENT ON COLUMN vacationReport.vacationUseday IS '사용일수';

-- 휴가계 기본키
COMMENT ON INDEX PK_vacationReport IS '휴가계 기본키';

-- 휴가계 기본키
COMMENT ON CONSTRAINT vacationReport.PK_vacationReport IS '휴가계 기본키';

-- 휴가 종류 관리자
CREATE TABLE vacationType (
	vacationTypeId NUMBER       NOT NULL, -- 휴가종류⁯⁯ID
	vacationType   VARCHAR(500) NULL,     -- 휴가종류
	balanceSetting NUMBER       NULL      -- 차감설정
);

-- 휴가 종류 관리자
ALTER TABLE vacationType
	ADD
		CONSTRAINT PK_vacationType -- 휴가 종류 관리자 기본키
		PRIMARY KEY (
			vacationTypeId -- 휴가종류⁯⁯ID
		);

-- 휴가 종류 관리자
COMMENT ON TABLE vacationType IS '휴가 종류 관리자';

-- 휴가종류⁯⁯ID
COMMENT ON COLUMN vacationType.vacationTypeId IS '휴가종류⁯⁯ID';

-- 휴가종류
COMMENT ON COLUMN vacationType.vacationType IS '휴가종류';

-- 차감설정
COMMENT ON COLUMN vacationType.balanceSetting IS '차감설정';

-- 휴가 종류 관리자 기본키
COMMENT ON INDEX PK_vacationType IS '휴가 종류 관리자 기본키';

-- 휴가 종류 관리자 기본키
COMMENT ON CONSTRAINT vacationType.PK_vacationType IS '휴가 종류 관리자 기본키';

-- 휴가 사용현황
CREATE TABLE vacationStatus (
	vacationRecordId NUMBER     NOT NULL, -- 휴가기록⁯⁯ID
	empId            NUMBER(10) NOT NULL, -- 사원번호
	attendSeq        NUMBER(20) NULL,     -- 근태_seq
	docId            NUMBER     NULL,     -- 문서번호
	vacationTypeId   NUMBER     NULL      -- 휴가종류⁯⁯ID
);

-- 휴가 사용현황
ALTER TABLE vacationStatus
	ADD
		CONSTRAINT PK_vacationStatus -- 휴가 사용현황 기본키
		PRIMARY KEY (
			vacationRecordId -- 휴가기록⁯⁯ID
		);

-- 휴가 사용현황
COMMENT ON TABLE vacationStatus IS '휴가 사용현황';

-- 휴가기록⁯⁯ID
COMMENT ON COLUMN vacationStatus.vacationRecordId IS '휴가기록⁯⁯ID';

-- 사원번호
COMMENT ON COLUMN vacationStatus.empId IS '사원번호';

-- 근태_seq
COMMENT ON COLUMN vacationStatus.attendSeq IS '근태_seq';

-- 문서번호
COMMENT ON COLUMN vacationStatus.docId IS '문서번호';

-- 휴가종류⁯⁯ID
COMMENT ON COLUMN vacationStatus.vacationTypeId IS '휴가종류⁯⁯ID';

-- 휴가 사용현황 기본키
COMMENT ON INDEX PK_vacationStatus IS '휴가 사용현황 기본키';

-- 휴가 사용현황 기본키
COMMENT ON CONSTRAINT vacationStatus.PK_vacationStatus IS '휴가 사용현황 기본키';

-- 쪽지함
CREATE TABLE alarm (
	alarmId    NUMBER       NOT NULL, -- 쪽지ID
	empId      NUMBER(10)   NULL,     -- 사원번호
	docId      NUMBER       NULL,     -- 문서번호
	alarmDate  DATE         NULL,     -- 날짜
	alarmCheck VARCHAR(500) NULL      -- 확인
);

-- 쪽지함
ALTER TABLE alarm
	ADD
		CONSTRAINT PK_alarm -- 쪽지함 기본키
		PRIMARY KEY (
			alarmId -- 쪽지ID
		);

-- 쪽지함
COMMENT ON TABLE alarm IS '쪽지함';

-- 쪽지ID
COMMENT ON COLUMN alarm.alarmId IS '쪽지ID';

-- 사원번호
COMMENT ON COLUMN alarm.empId IS '사원번호';

-- 문서번호
COMMENT ON COLUMN alarm.docId IS '문서번호';

-- 날짜
COMMENT ON COLUMN alarm.alarmDate IS '날짜';

-- 확인
COMMENT ON COLUMN alarm.alarmCheck IS '확인';

-- 쪽지함 기본키
COMMENT ON INDEX PK_alarm IS '쪽지함 기본키';

-- 쪽지함 기본키
COMMENT ON CONSTRAINT alarm.PK_alarm IS '쪽지함 기본키';

-- 기본정보
ALTER TABLE basic
	ADD
		CONSTRAINT FK_department_TO_basic -- 부서 -> 기본정보
		FOREIGN KEY (
			deptId -- 부서코드
		)
		REFERENCES department ( -- 부서
			deptId -- 부서코드
		);

-- 부서 -> 기본정보
COMMENT ON CONSTRAINT basic.FK_department_TO_basic IS '부서 -> 기본정보';

-- 기본정보
ALTER TABLE basic
	ADD
		CONSTRAINT FK_jobs_TO_basic -- 직급 -> 기본정보
		FOREIGN KEY (
			jobId -- 직급코드
		)
		REFERENCES jobs ( -- 직급
			jobId -- 직급코드
		);

-- 직급 -> 기본정보
COMMENT ON CONSTRAINT basic.FK_jobs_TO_basic IS '직급 -> 기본정보';

-- 기본정보
ALTER TABLE basic
	ADD
		CONSTRAINT FK_appointDivision_TO_basic -- 발령구분 -> 기본정보
		FOREIGN KEY (
			appointId -- 발령구분코드
		)
		REFERENCES appointDivision ( -- 발령구분
			appointId -- 발령구분코드
		);

-- 발령구분 -> 기본정보
COMMENT ON CONSTRAINT basic.FK_appointDivision_TO_basic IS '발령구분 -> 기본정보';

-- 기본정보
ALTER TABLE basic
	ADD
		CONSTRAINT FK_hire_TO_basic -- 고용형태 -> 기본정보
		FOREIGN KEY (
			hireId -- 고용형태코드
		)
		REFERENCES hire ( -- 고용형태
			hireId -- 고용형태코드
		);

-- 고용형태 -> 기본정보
COMMENT ON CONSTRAINT basic.FK_hire_TO_basic IS '고용형태 -> 기본정보';

-- 기본정보
ALTER TABLE basic
	ADD
		CONSTRAINT FK_anni_TO_basic -- 기념일 -> 기본정보
		FOREIGN KEY (
			anniId -- 기념일구분코드
		)
		REFERENCES anni ( -- 기념일
			anniId -- 기념일구분코드
		);

-- 기념일 -> 기본정보
COMMENT ON CONSTRAINT basic.FK_anni_TO_basic IS '기념일 -> 기본정보';

-- 연봉연차관리
ALTER TABLE salary
	ADD
		CONSTRAINT FK_basic_TO_salary -- 기본정보 -> 연봉연차관리
		FOREIGN KEY (
			empId -- 사원번호
		)
		REFERENCES basic ( -- 기본정보
			empId -- 사원번호
		);

-- 기본정보 -> 연봉연차관리
COMMENT ON CONSTRAINT salary.FK_basic_TO_salary IS '기본정보 -> 연봉연차관리';

-- 상벌사항
ALTER TABLE reward
	ADD
		CONSTRAINT FK_basic_TO_reward -- 기본정보 -> 상벌사항
		FOREIGN KEY (
			empId -- 사원번호
		)
		REFERENCES basic ( -- 기본정보
			empId -- 사원번호
		);

-- 기본정보 -> 상벌사항
COMMENT ON CONSTRAINT reward.FK_basic_TO_reward IS '기본정보 -> 상벌사항';

-- 자격면허
ALTER TABLE license
	ADD
		CONSTRAINT FK_basic_TO_license -- 기본정보 -> 자격면허
		FOREIGN KEY (
			empId -- 사원번호
		)
		REFERENCES basic ( -- 기본정보
			empId -- 사원번호
		);

-- 기본정보 -> 자격면허
COMMENT ON CONSTRAINT license.FK_basic_TO_license IS '기본정보 -> 자격면허';

-- 인사발령
ALTER TABLE appoint
	ADD
		CONSTRAINT FK_basic_TO_appoint -- 기본정보 -> 인사발령
		FOREIGN KEY (
			empId -- 사원번호
		)
		REFERENCES basic ( -- 기본정보
			empId -- 사원번호
		);

-- 기본정보 -> 인사발령
COMMENT ON CONSTRAINT appoint.FK_basic_TO_appoint IS '기본정보 -> 인사발령';

-- 인사발령
ALTER TABLE appoint
	ADD
		CONSTRAINT FK_appointDivision_TO_appoint -- 발령구분 -> 인사발령
		FOREIGN KEY (
			appointId -- 발령구분코드
		)
		REFERENCES appointDivision ( -- 발령구분
			appointId -- 발령구분코드
		);

-- 발령구분 -> 인사발령
COMMENT ON CONSTRAINT appoint.FK_appointDivision_TO_appoint IS '발령구분 -> 인사발령';

-- 기념일등록
ALTER TABLE anniversary
	ADD
		CONSTRAINT FK_basic_TO_anniversary -- 기본정보 -> 기념일등록
		FOREIGN KEY (
			empId -- 사원번호
		)
		REFERENCES basic ( -- 기본정보
			empId -- 사원번호
		);

-- 기본정보 -> 기념일등록
COMMENT ON CONSTRAINT anniversary.FK_basic_TO_anniversary IS '기본정보 -> 기념일등록';

-- 기념일등록
ALTER TABLE anniversary
	ADD
		CONSTRAINT FK_anni_TO_anniversary -- 기념일 -> 기념일등록
		FOREIGN KEY (
			anniId -- 기념일구분코드
		)
		REFERENCES anni ( -- 기념일
			anniId -- 기념일구분코드
		);

-- 기념일 -> 기념일등록
COMMENT ON CONSTRAINT anniversary.FK_anni_TO_anniversary IS '기념일 -> 기념일등록';

-- 경력사항
ALTER TABLE career
	ADD
		CONSTRAINT FK_basic_TO_career -- 기본정보 -> 경력사항
		FOREIGN KEY (
			empId -- 사원번호
		)
		REFERENCES basic ( -- 기본정보
			empId -- 사원번호
		);

-- 기본정보 -> 경력사항
COMMENT ON CONSTRAINT career.FK_basic_TO_career IS '기본정보 -> 경력사항';

-- 근태관리
ALTER TABLE commute
	ADD
		CONSTRAINT FK_basic_TO_commute -- 기본정보 -> 근태관리
		FOREIGN KEY (
			empId -- 사원번호
		)
		REFERENCES basic ( -- 기본정보
			empId -- 사원번호
		);

-- 기본정보 -> 근태관리
COMMENT ON CONSTRAINT commute.FK_basic_TO_commute IS '기본정보 -> 근태관리';

-- 근태관리
ALTER TABLE commute
	ADD
		CONSTRAINT FK_commuteType_TO_commute -- 근태타입 -> 근태관리
		FOREIGN KEY (
			attendType -- 근태타입_seq
		)
		REFERENCES commuteType ( -- 근태타입
			attendSeq -- 근태타입_seq
		);

-- 근태타입 -> 근태관리
COMMENT ON CONSTRAINT commute.FK_commuteType_TO_commute IS '근태타입 -> 근태관리';

-- 업무내역
ALTER TABLE breakdown
	ADD
		CONSTRAINT FK_work_TO_breakdown -- 업무명세표 -> 업무내역
		FOREIGN KEY (
			dutySeq -- 일련번호
		)
		REFERENCES work ( -- 업무명세표
			dutySeq -- 일련번호
		);

-- 업무명세표 -> 업무내역
COMMENT ON CONSTRAINT breakdown.FK_work_TO_breakdown IS '업무명세표 -> 업무내역';

-- 주기적
ALTER TABLE periodic
	ADD
		CONSTRAINT FK_work_TO_periodic -- 업무명세표 -> 주기적
		FOREIGN KEY (
			dutySeq -- 일련번호
		)
		REFERENCES work ( -- 업무명세표
			dutySeq -- 일련번호
		);

-- 업무명세표 -> 주기적
COMMENT ON CONSTRAINT periodic.FK_work_TO_periodic IS '업무명세표 -> 주기적';

-- 핵심성과지표
ALTER TABLE outcome
	ADD
		CONSTRAINT FK_work_TO_outcome -- 업무명세표 -> 핵심성과지표
		FOREIGN KEY (
			dutySeq -- 일련번호
		)
		REFERENCES work ( -- 업무명세표
			dutySeq -- 일련번호
		);

-- 업무명세표 -> 핵심성과지표
COMMENT ON CONSTRAINT outcome.FK_work_TO_outcome IS '업무명세표 -> 핵심성과지표';

-- 업무교육
ALTER TABLE education
	ADD
		CONSTRAINT FK_work_TO_education -- 업무명세표 -> 업무교육
		FOREIGN KEY (
			dutySeq -- 일련번호
		)
		REFERENCES work ( -- 업무명세표
			dutySeq -- 일련번호
		);

-- 업무명세표 -> 업무교육
COMMENT ON CONSTRAINT education.FK_work_TO_education IS '업무명세표 -> 업무교육';

-- 업무명세표
ALTER TABLE work
	ADD
		CONSTRAINT FK_basic_TO_work -- 기본정보 -> 업무명세표
		FOREIGN KEY (
			empId -- 사원번호
		)
		REFERENCES basic ( -- 기본정보
			empId -- 사원번호
		);

-- 기본정보 -> 업무명세표
COMMENT ON CONSTRAINT work.FK_basic_TO_work IS '기본정보 -> 업무명세표';

-- 사진정보
ALTER TABLE boardFile
	ADD
		CONSTRAINT FK_board_TO_boardFile -- 게시판 -> 사진정보
		FOREIGN KEY (
			bbsSeq -- 글번호
		)
		REFERENCES board ( -- 게시판
			bbsSeq -- 글번호
		);

-- 게시판 -> 사진정보
COMMENT ON CONSTRAINT boardFile.FK_board_TO_boardFile IS '게시판 -> 사진정보';

-- 댓글게시판
ALTER TABLE boardComment
	ADD
		CONSTRAINT FK_board_TO_boardComment -- 게시판 -> 댓글게시판
		FOREIGN KEY (
			bbsSeq -- 글번호
		)
		REFERENCES board ( -- 게시판
			bbsSeq -- 글번호
		);

-- 게시판 -> 댓글게시판
COMMENT ON CONSTRAINT boardComment.FK_board_TO_boardComment IS '게시판 -> 댓글게시판';

-- 게시판
ALTER TABLE board
	ADD
		CONSTRAINT FK_boardForm_TO_board -- 게시판형식 -> 게시판
		FOREIGN KEY (
			bbsFormNum -- 게시판형식번호
		)
		REFERENCES boardForm ( -- 게시판형식
			bbsFormNum -- 게시판형식번호
		);

-- 게시판형식 -> 게시판
COMMENT ON CONSTRAINT board.FK_boardForm_TO_board IS '게시판형식 -> 게시판';

-- 게시판
ALTER TABLE board
	ADD
		CONSTRAINT FK_basic_TO_board -- 기본정보 -> 게시판
		FOREIGN KEY (
			empId -- 사원번호
		)
		REFERENCES basic ( -- 기본정보
			empId -- 사원번호
		);

-- 기본정보 -> 게시판
COMMENT ON CONSTRAINT board.FK_basic_TO_board IS '기본정보 -> 게시판';

-- 업무에 필요한 능력
ALTER TABLE ablity
	ADD
		CONSTRAINT FK_work_TO_ablity -- 업무명세표 -> 업무에 필요한 능력
		FOREIGN KEY (
			dutySeq -- 일련번호
		)
		REFERENCES work ( -- 업무명세표
			dutySeq -- 일련번호
		);

-- 업무명세표 -> 업무에 필요한 능력
COMMENT ON CONSTRAINT ablity.FK_work_TO_ablity IS '업무명세표 -> 업무에 필요한 능력';

-- 사원파일
ALTER TABLE empfile
	ADD
		CONSTRAINT FK_basic_TO_empfile -- 기본정보 -> 사원파일
		FOREIGN KEY (
			empId -- 사원번호
		)
		REFERENCES basic ( -- 기본정보
			empId -- 사원번호
		);

-- 기본정보 -> 사원파일
COMMENT ON CONSTRAINT empfile.FK_basic_TO_empfile IS '기본정보 -> 사원파일';

-- 휴가정보
ALTER TABLE vacationInfo
	ADD
		CONSTRAINT FK_basic_TO_vacationInfo -- 기본정보 -> 휴가정보
		FOREIGN KEY (
			empId -- 사원번호
		)
		REFERENCES basic ( -- 기본정보
			empId -- 사원번호
		);

-- 기본정보 -> 휴가정보
COMMENT ON CONSTRAINT vacationInfo.FK_basic_TO_vacationInfo IS '기본정보 -> 휴가정보';

-- 기본양식
ALTER TABLE document
	ADD
		CONSTRAINT FK_docstate_TO_document -- 문서상태 -> 기본양식
		FOREIGN KEY (
			stateSeq -- 상태SEQ
		)
		REFERENCES docstate ( -- 문서상태
			stateSeq -- 상태SEQ
		);

-- 문서상태 -> 기본양식
COMMENT ON CONSTRAINT document.FK_docstate_TO_document IS '문서상태 -> 기본양식';

-- 기본양식
ALTER TABLE document
	ADD
		CONSTRAINT FK_doclist_TO_document -- 문서종류 -> 기본양식
		FOREIGN KEY (
			doclistId -- 문서종류ID
		)
		REFERENCES doclist ( -- 문서종류
			doclistId -- 문서종류ID
		);

-- 문서종류 -> 기본양식
COMMENT ON CONSTRAINT document.FK_doclist_TO_document IS '문서종류 -> 기본양식';

-- 기본양식
ALTER TABLE document
	ADD
		CONSTRAINT FK_basic_TO_document -- 기본정보 -> 기본양식
		FOREIGN KEY (
			empId -- 사원번호
		)
		REFERENCES basic ( -- 기본정보
			empId -- 사원번호
		);

-- 기본정보 -> 기본양식
COMMENT ON CONSTRAINT document.FK_basic_TO_document IS '기본정보 -> 기본양식';

-- 기본양식
ALTER TABLE document
	ADD
		CONSTRAINT FK_department_TO_document -- 부서 -> 기본양식
		FOREIGN KEY (
			deptId -- 부서코드
		)
		REFERENCES department ( -- 부서
			deptId -- 부서코드
		);

-- 부서 -> 기본양식
COMMENT ON CONSTRAINT document.FK_department_TO_document IS '부서 -> 기본양식';

-- 결재자
ALTER TABLE settlement
	ADD
		CONSTRAINT FK_document_TO_settlement -- 기본양식 -> 결재자
		FOREIGN KEY (
			docId -- 문서번호
		)
		REFERENCES document ( -- 기본양식
			docId -- 문서번호
		);

-- 기본양식 -> 결재자
COMMENT ON CONSTRAINT settlement.FK_document_TO_settlement IS '기본양식 -> 결재자';

-- 결재자
ALTER TABLE settlement
	ADD
		CONSTRAINT FK_basic_TO_settlement -- 기본정보 -> 결재자
		FOREIGN KEY (
			empId -- 사원번호
		)
		REFERENCES basic ( -- 기본정보
			empId -- 사원번호
		);

-- 기본정보 -> 결재자
COMMENT ON CONSTRAINT settlement.FK_basic_TO_settlement IS '기본정보 -> 결재자';

-- 결재단계설정
ALTER TABLE signStep
	ADD
		CONSTRAINT FK_doclist_TO_signStep -- 문서종류 -> 결재단계설정
		FOREIGN KEY (
			doclistId -- 문서종류ID
		)
		REFERENCES doclist ( -- 문서종류
			doclistId -- 문서종류ID
		);

-- 문서종류 -> 결재단계설정
COMMENT ON CONSTRAINT signStep.FK_doclist_TO_signStep IS '문서종류 -> 결재단계설정';

-- 휴가계
ALTER TABLE vacationReport
	ADD
		CONSTRAINT FK_document_TO_vacationReport -- 기본양식 -> 휴가계
		FOREIGN KEY (
			docId -- 문서번호
		)
		REFERENCES document ( -- 기본양식
			docId -- 문서번호
		);

-- 기본양식 -> 휴가계
COMMENT ON CONSTRAINT vacationReport.FK_document_TO_vacationReport IS '기본양식 -> 휴가계';

-- 휴가계
ALTER TABLE vacationReport
	ADD
		CONSTRAINT FK_vacationType_TO_vacationReport -- 휴가 종류 관리자 -> 휴가계
		FOREIGN KEY (
			vacationTypeId -- 휴가종류⁯⁯ID
		)
		REFERENCES vacationType ( -- 휴가 종류 관리자
			vacationTypeId -- 휴가종류⁯⁯ID
		);

-- 휴가 종류 관리자 -> 휴가계
COMMENT ON CONSTRAINT vacationReport.FK_vacationType_TO_vacationReport IS '휴가 종류 관리자 -> 휴가계';

-- 휴가 사용현황
ALTER TABLE vacationStatus
	ADD
		CONSTRAINT FK_vacation_type_TO_vacStatus -- 휴가 종류 관리자 -> 휴가 사용현황
		FOREIGN KEY (
			vacationTypeId -- 휴가종류⁯⁯ID
		)
		REFERENCES vacationType ( -- 휴가 종류 관리자
			vacationTypeId -- 휴가종류⁯⁯ID
		);

-- 휴가 종류 관리자 -> 휴가 사용현황
COMMENT ON CONSTRAINT vacationStatus.FK_vacation_type_TO_vacStatus IS '휴가 종류 관리자 -> 휴가 사용현황';

-- 휴가 사용현황
ALTER TABLE vacationStatus
	ADD
		CONSTRAINT FK_basic_TO_vacationStatus -- 기본정보 -> 휴가 사용현황
		FOREIGN KEY (
			empId -- 사원번호
		)
		REFERENCES basic ( -- 기본정보
			empId -- 사원번호
		);

-- 기본정보 -> 휴가 사용현황
COMMENT ON CONSTRAINT vacationStatus.FK_basic_TO_vacationStatus IS '기본정보 -> 휴가 사용현황';

-- 휴가 사용현황
ALTER TABLE vacationStatus
	ADD
		CONSTRAINT FK_document_TO_vacationStatus -- 기본양식 -> 휴가 사용현황
		FOREIGN KEY (
			docId -- 문서번호
		)
		REFERENCES document ( -- 기본양식
			docId -- 문서번호
		);

-- 기본양식 -> 휴가 사용현황
COMMENT ON CONSTRAINT vacationStatus.FK_document_TO_vacationStatus IS '기본양식 -> 휴가 사용현황';

-- 휴가 사용현황
ALTER TABLE vacationStatus
	ADD
		CONSTRAINT FK_commute_TO_vacationStatus -- 근태관리 -> 휴가 사용현황
		FOREIGN KEY (
			attendSeq -- 근태_seq
		)
		REFERENCES commute ( -- 근태관리
			attendSeq -- 근태_seq
		);

-- 근태관리 -> 휴가 사용현황
COMMENT ON CONSTRAINT vacationStatus.FK_commute_TO_vacationStatus IS '근태관리 -> 휴가 사용현황';

-- 쪽지함
ALTER TABLE alarm
	ADD
		CONSTRAINT FK_basic_TO_alarm -- 기본정보 -> 쪽지함
		FOREIGN KEY (
			empId -- 사원번호
		)
		REFERENCES basic ( -- 기본정보
			empId -- 사원번호
		);

-- 기본정보 -> 쪽지함
COMMENT ON CONSTRAINT alarm.FK_basic_TO_alarm IS '기본정보 -> 쪽지함';

-- 쪽지함
ALTER TABLE alarm
	ADD
		CONSTRAINT FK_document_TO_alarm -- 기본양식 -> 쪽지함
		FOREIGN KEY (
			docId -- 문서번호
		)
		REFERENCES document ( -- 기본양식
			docId -- 문서번호
		);

-- 기본양식 -> 쪽지함
COMMENT ON CONSTRAINT alarm.FK_document_TO_alarm IS '기본양식 -> 쪽지함';