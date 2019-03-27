--1줄 주석문 처리(단일행 주석문 처리)

/*
여러줄(다중 행)
주석문 처리
*/

--○ 현재 오라클 서버에 접속한 자신의 계정 조회
show user;
--==>>USER이(가) "SYS"입니다.
--> sqlplus 상태일 때 사용하는 명령어
--사용x

--앞으로 사용
SELECT USER
FROM DUAL;
--==>>SYS

SELECT 1+2
FROM DUAL;
--==>> 3

SELECT 1 + 2
FROM DUAL;
--==>> 3

SELECT '쌍용강북F강의장'
FROM DUAL;
--==>>쌍용강북F강의장

-- SELECT ~
-- FROM 대상;

SELECT '아직은 지루한 오라클 수업';
--==>> FROM문이 필요
/*
ORA-00923: FROM keyword not found where expected
00923. 00000 -  "FROM keyword not found where expected"
*Cause:    
*Action:
34행, 23열에서 오류 발생
*/

SELECT '아직은 지루한 오라클 수업'
FROM DUAL;
--==>>아직은 지루한 오라클 수업


SELECT 3.14+1.36
FROM DUAL;
--==>>4.5
--실수 연산도 가능

SELECT 1.234 + 2.345
FROM DUAL;
--==>>3.579

SELECT 10 * 5
FROM DUAL;
--==>> 50
--곱셈 연산도 가능

SELECT 1000/23
FROM DUAL;
--==>>43.47826086956521739130434782608695652174
--정수기반의 연산에서도 실수기반의 결과값 도출 가능

SELECT 100-23
FROM DUAL;
--==>> 77

SELECT "테스트"
FROM DUAL;
/*ORA-00904: "테스트": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
72행, 8열에서 오류 발생*/
--==>> 문자열에 쌍따옴표 사용하면 에러

SELECT '김정규'+'윤희진'
FROM DAUL;
/*ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
80행, 28열에서 오류 발생*/
--문자열 결합 연산 에러 발생

--항목 - 컬럼  / 한 줄 - 레코드 
--아직은 '테이블'을 표로 이해하기
--테이블스페이스
--데이터베이스

--FROM부터 쓰기

--○ 현재 오라클 서버에 존재하는 사용자 계정 상태 정보 조회

SELECT *
FROM DBA_USERS;
--전체 컬럼 출력

SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS;

SELECT USERNAME, USER_ID, ACCOUNT_STATUS, PASSWORD, LOCK_DATE
FROM DBA_USERS;
-- 위, 아래 쿼리문의 CPU소비하는 양은 같다


-->『DBA_』로 시작하는 Oracle Data Dictionary View 는
-- 오로지 관리자 권한으로 접속했을 경우에만 조회가 가능하다
-- 아직은 데이터 딕셔너리 개념을 잡지 못해도 상관없다


--○ 『HR』사용자 계정을 잠금 상태로 설정
ALTER USER HR ACCOUNT LOCK;
--==>>User HR이(가) 변경되었습니다.

--○ 다시 사용자 계정 정보 조회
SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS;
--==>>HR	LOCKED

ALTER USER HR ACCOUNT UNLOCK;

SELECT USERNAME,ACCOUNT_STATUS
FROM DBA_USERS;
--==>>HR	OPEN

----------------------------------------------------------------------

--○ TABLESPACE 생성

--※ TABLESPACE란?
--   세그먼트(테이블, 인덱스, ...) 를 담아두는(저장해두는)
--   오라클의 논리적인 저장 구조를 의미한다.

-- 없던 것을  새로 생성하게 만드는 구문 두가지
-- INSERT - 데이터적으로 삽입해야할 때 사용하는 구문
-- CREATE - 구조적으로 없던것을 새로 만드는 구문

CREATE TABLESPACE TBS_EDUA                  -- CREATE 유형 개체명 → 생성
DATAFILE 'C:\TESTORADATA\TBS_EDUA01.DBF'    -- 물리적으로 연결되는 데이터 파일
SIZE 4M                                     -- 물리적 데이터 파일의 용량
EXTENT MANAGEMENT LOCAL                     -- 오라클 서버가 세그먼트 알아서 관리하라
SEGMENT SPACE MANAGEMENT AUTO;              -- 세그먼트 공간 관리도 자동으로 오라클 서버가 관리하라

/* 디렉터리 생성 전>>
오류 보고 -
ORA-01119: error in creating database file 'C:\TESTORADATA\TBS_EDUA01.DBF'
ORA-27040: file create error, unable to create file
OSD-04002: unable to open file
O/S-Error: (OS 3) ??????? ??????
01119. 00000 -  "error in creating database file '%s'"
*Cause:    Usually due to not having enough space on the device.
*Action:*/

-- 테이블스페이스 생성 구문을 실행하기 전에
-- 물리적인 경로에 디렉터리(TESTORADATA) 생성할 것

/* 디렉터리 생성 후>>
TABLESPACE TBS_EDUA이(가) 생성되었습니다.
*/

--○ 생성된 테이블스페이스(TBS_EDUA) 조회
SELECT *
FROM DBA_TABLESPACES;
--==>>
/*
    :
TBS_EDUA	8192	65536		1	2147483645	2147483645		65536	ONLINE	PERMANENT	LOGGING	NO	LOCAL	SYSTEM	NO	AUTO	DISABLED	NOT APPLY	NO	HOST	NO	
    :
*/

--○ 물리적인 파일 이름 조회
SELECT *
FROM DBA_DATA_FILES;
--==>>
/*
    :
C:\TESTORADATA\TBS_EDUA01.DBF	5	TBS_EDUA	4194304	512	AVAILABLE	5	NO	0	0	0	3145728	384	ONLINE
    :
*/

--○ 오라클 사용자 계정 생성
CREATE USER LSH IDENTIFIED BY java006$
DEFAULT TABLESPACE TBS_EDUA;
--> LSH라는 사용자 계정을 만들겠다(생성하겠다).
--  이 계정을 통해 생성하는 오라클 객체는(세그먼트들은)
--  기본적으로 TBS_EDUA 라는 테이블스페이스에 생성할 수 있도록 설정하겠다.
--==>>User LSH이(가) 생성되었습니다.


--※ 생성된 오라클 사용자 계정(LSH)을 통해
--   접속을 시도해 보았으나 접속 불가
--   → 『create session』권한이 없기 때문에...

--○ 생성된 오라클 사용자 계정(LSH)에
--   서버 접속이 가능할 수 있도록 create session 권한 부여 → sys가...
GRANT CREATE SESSION TO LSH;
--==>>Grant을(를) 성공했습니다.

--○ 생성된 오라클 사용자 계정(LSH)의
--   DEFAULT TABLESPACE 조회
SELECT USERNAME, DEFAULT_TABLESPACE
FROM DBA_USERS;
--==>>
/*
            :
HR	                USERS
LSH	                TBS_EDUA
            :
*/

--○ 생성된 오라클 사용자 계정(LSH)의
--   시스템 관련 권한 조회
SELECT *
FROM DBA_SYS_PRIVS;
--==>>
/*
            :
LSH	CREATE SESSION	NO
            :
*/

--○ 생성된 오라클 사용자 계정(LSH)에
--   테이블 생성이 가능할 수 있도록CREATE TABLE 권한 부여
GRANT CREATE TABLE TO LSH;
--==>>Grant을(를) 성공했습니다.


--○ 생성된 오라클 사용자 계정(LSH)에
--   테이블스페이스(TBS_EDUA)에서 사용할 수 있는 공간(할당량)
--   의 크기를 무제한으로 지정
--   구조적인 변경이므로 ALTER 사용
ALTER USER LSH
QUOTA UNLIMITED ON TBS_EDUA;
--==>>User LSH이(가) 변경되었습니다.

















