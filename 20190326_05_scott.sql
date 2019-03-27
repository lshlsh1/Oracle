--○ 접속된 사용자 계정 조회
SELECT USER
FROM DUAL;
--==>>SCOTT


--○ 테이블 생성(DEPT)
CREATE TABLE DEPT
( DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY
, DNAME VARCHAR2(14) 
, LOC VARCHAR2(13) 
);
--==>>Table DEPT이(가) 생성되었습니다.

--○ 테이블 생성(EMP)
CREATE TABLE EMP
( EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY
, ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, MGR NUMBER(4)
, HIREDATE DATE
, SAL NUMBER(7,2)
, COMM NUMBER(7,2)
, DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
);
--==>>Table EMP이(가) 생성되었습니다.



--○ 데이터 입력(DEPT)
INSERT INTO DEPT VALUES	(10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO DEPT VALUES	(30, 'SALES', 'CHICAGO');
INSERT INTO DEPT VALUES	(40, 'OPERATIONS', 'BOSTON');
--==>>1 행 이(가) 삽입되었습니다. * 4


--○ 데이터 입력(EMP)
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-7-1987','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-7-1987','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
--==>>1 행 이(가) 삽입되었습니다 * 14


--○ 테이블 생성(BONUS)
CREATE TABLE BONUS
( ENAME VARCHAR2(10)	
, JOB VARCHAR2(9)
, SAL NUMBER
, COMM NUMBER
);
--==>>Table BONUS이(가) 생성되었습니다.

--○ 테이블 생성(SALGRADE)
CREATE TABLE SALGRADE
( GRADE NUMBER
, LOSAL NUMBER
, HISAL NUMBER
);
--==>>Table SALGRADE이(가) 생성되었습니다.


--○ 데이터 입력(SALGRADE)
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
--==>>1 행 이(가) 삽입되었습니다. * 5


--○ 커밋
COMMIT;
--==>>커밋 완료.

--○ 현재 SCOTT 오라클 계정 사용자가 소유하고 있는 테이블 조회
SELECT *
FROM TAB;
--==>>
/*
BONUS   	TABLE	
DEPT    	TABLE	
EMP     	TABLE	
SALGRADE	TABLE	
*/

--○ 어떤 테이블스페이스에 저장되어 있는지 조회
SELECT TABLE_NAME, TABLESPACE_NAME
FROM USER_TABLES;
--==>>
/*
DEPT	    USERS
EMP	        USERS
BONUS   	USERS
SALGRADE	USERS
*/

--○ 테이블 생성(TBL_EXAMPLE1)
CREATE TABLE TBL_EXAMPLE1
( NO    NUMBER
, NAME  VARCHAR2(10)
, ADDR  VARCHAR2(20)
);
--==>>Table TBL_EXAMPLE1이(가) 생성되었습니다.

--○ 테이블 생성)(TBL_EXAMPLE2)
CREATE TABLE TBL_EXAMPLE2
( NO    NUMBER
, NAME  VARCHAR2(10)
, ADDR  VARCHAR2(20)
)TABLESPACE TBS_EDUA;
--==>>Table TBL_EXAMPLE2이(가) 생성되었습니다.

--○ TBL_EXAMPLE1 과 TBL_EXAMPLE2 테이블이
--   어떤 테이블스페이스에 저장되어 있는지 조회
SELECT TABLE_NAME, TABLESPACE_NAME
FROM USER_TABLES;
/*
DEPT	        USERS
EMP         	USERS
BONUS	        USERS
SALGRADE    	USERS
TBL_EXAMPLE1	USERS
TBL_EXAMPLE2	TBS_EDUA
*/

-----------------------------------------------------------------------------------------------------------

---■■■ 관계형 데이터베이스 ■■■--

-- 데이터를 테이블의 형태로 저장시켜 놓은 것
-- 그리고 이들 각 테이블들 간의 관계를 설정하는 것

/*===================================================   
    ★ ★ ★ SELECT 문의 처리(PARSING) 순서 ★ ★ ★
    
    SELECT 컬럼명  -- ⑤    -- 컬럼명(종)으로 자르기
    FROM 테이블명  -- ①    -- 메모리에 퍼올리기
    WHERE 조건절   -- ②    -- 메모리에 퍼올리기(원하는 부분) 횡
    GROUP BY 절    -- ③
    HAVING 조건절  -- ④    -- GROUP에대한 조건
    ORDER BY 절    -- ⑥    -- 정렬 비교

프웨그해셀오
===================================================*/

--○ 현재 접속된 오라클 사용자(SCOTT) 소유의
--   테이블(TABLE), 뷰(VIEW)의 목록을 조회
SELECT *
FROM USER_TABLES;
--==>>
/*
DEPT	        USERS
EMP	            USERS
BONUS	        USERS
SALGRADE	    USERS
TBL_EXAMPLE1	USERS
TBL_EXAMPLE2	TBS_EDUA
*/

SELECT *
FROM TAB;
--==>>
/*
BONUS       	TABLE	→ 보너스 정보 테이블
DEPT	        TABLE	→ DEPARTMENTS(부서) 정보 테이블
EMP         	TABLE	→ EMPLOYEES(사원) 정보 테이블
SALGRADE	    TABLE	→ 급여(SAL)의 등급 정보 테이블
TBL_EXAMPLE1	TABLE	
TBL_EXAMPLE2	TABLE	
*/

--○ 각 테이블 데이터 조회
SELECT *
FROM BONUS;
--==>> 데이터 존재하지 않음

SELECT *
FROM DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/

SELECT *
FROM EMP;
/*
7369	SMITH	CLERK	    7902	    80/12/17    	800		    20
7499	ALLEN	SALESMAN	7698	81/02/20	    1600    	300	30
7521	WARD	SALESMAN	7698	81/02/22	    1250    	500	30
7566	JONES	MANAGER	    7839	81/04/02    	2975		20
7654	MARTIN	SALESMAN	7698	81/09/28	    1250    	1400	30
7698	BLAKE	MANAGER	    7839	81/05/01    	2850		    30
7782	CLARK	MANAGER	    7839	81/06/09    	2450		    10
7788	SCOTT	ANALYST 	7566	87/07/13	    3000		    20
7839	KING	PRESIDENT		    81/11/17	5000		    10
7844	TURNER	SALESMAN	7698	81/09/08    	1500	    0   30
7876	ADAMS	CLERK	    7788	87/07/13	    1100		    20
7900	    JAMES	CLERK	    7698	81/12/03    	950		    30
7902    	FORD	ANALYST	    7566	81/12/03	    3000	    	20
7934	MILLER	CLERK	    7782	82/01/23	    1300	    	10
*/

SELECT *
FROM SALGRADE;
/*
1	700	    1200
2	1201	    1400
3	1401    	2000
4	2001	    3000
5	3001	    9999
*/

SELECT *
FROM TBL_EXAMPLE1;

SELECT *
FROM TBL_EXAMPLE2;


--○ DEPT 테이블에 존재하는 컬럼의 정보(구조) 조회
DESCRIBE DEPT;
--==>>
/*
이름     널?       유형           
------ -------- ------------ 
DEPTNO NOT NULL NUMBER(2)    
DNAME           VARCHAR2(14) 
LOC             VARCHAR2(13) 

NOT NULL -> 비어있으면 안돼
*/
--※ 우리가 흔히 웹 사이트에서 회원 가입을 수행할 경우
--   필수 입력 사항과 선택 입력 사항이 있다
--   필수 입력 항목은 ID, PW, 성명, 주민번호, 전화번호, 주소, ...
--   등과 같은 컬럼이며, 이 값들은 회원 가입 절차에 따라
--   반드시 필요한(존재해야 하는) 값이므로 NOT NULL로 한다

--   선택 입력 항목은 취미, 결혼여부, 차량소유여부, 특기, ....
--   등과 같은 컬럼이며, 이 값들은 회원 가입 과정에서
--   반드시 필요한 값이 아니므로(즉, 입력하지 않아도 무방하므로)
--   NULL이어도 상관 없는 상황이 된다.

--   DEPTNO      DNAME        LOC
--   부서번호    부서명       부서위치
--   NOT NULL    NULL 허용    NULL 허용

--EX)            인사부        서울      →    데이터 입력 불가
--      80                     인천      →    데이터 입력 가능
--      90                               →    데이터 입력 가능


--■■■ 오라클의 주요 자료형(DATA TYPE) ■■■--
/*
cf) MSSQL 서버의 정수 표현 타입
    tinyint     0 ~ 255             1byte
    smallint    -32,768 ~ 32,767    2byte
    int         -21억 ~ 21억        4byte
    bigint      엄청큼              8byte
    
    MSSQL 서버의 실수 표현 타입
    float, real
    
    MSSQL 서버의 숫자 표현 타입
    decimal, numeric
    
    MSSQL 서버의 문자 표현 타입
    char, vachar, Nvarchar
*/

--※ ORACLE 서버는 숫자 표현 타입이 한 가지로 통일되어 있다.
/*
1. 숫자형 NUMBER        → -10의 38승-1 ~ 10의 38승 (아무것도 명시하지 않으면 NUMBER가 표현할 수 있는 최대값)
          NUMBER(3)     → -999 ~ 999
          NUMBER(4)     → -9999 ~ 9999
          NUMBER(4.1)   → -999.9 ~ 999.9 TOTAL 4자리
          
*/

--※ ORACLE 서버의 문자 표현 타입
--   CHAR, VARCHAR2, NVARCHAR2
/*
2. 문자형 CHAR      - 고정형 크기
          CHAR(10)  - 무조건 10Byte 소모
          CHAR(10)  ← '강의실'             6Byte 지만 10Byte를 소모
          CHAR(10)  ← '잠깬조현우'        10Byte
          CHAR(10)  ← 'Oh잠깬조현우'      10Byte를 초과하므로 입력 불가
          
          VARCHAR2 - 가변형 크기
          VARCHAR2(10) ← '강의실'          6Byte만 소모
          VARCHAR2(10) ← '잠깬조현우'     10Byte
          VARCHAR2(10) ← 'Oh잠깬조현우'   10Byte를 초과하므로 입력 불가
          
          VARCHAR2가 더 효율적인것 처럼 보이지만 사실 CHAR가 VARCHAR2보다 더 가벼움!
          
          NCHAR     - 유니코드 기반 고정형 크기(글자수)
          NCHAR(10) - 10글자
          
          NVARCHAR2 - 유니코드 기반(글자수)
          NVARCHAR2(10) - 10글자
          
3. 날짜형 DATE

*/

SELECT SYSDATE
FROM DUAL;
--==>>19/03/26

--※ 날짜 형식에 대한 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT ='YYYY-MM-DD HH24:MI:SS';
--==>>Session이(가) 변경되었습니다.

SELECT SYSDATE
FROM DUAL;
--==>>2019-03-26 16:49:22

--○ EMP 테이블에서 사원번호, 사원명, 급여, 커미션 정보만 조회
SELECT *
FROM EMP;

SELECT 사원번호,사원명,급여,커미션
FROM EMP;

SELECT EMPNO,ENAME,SAL,COMM
FROM EMP;

--○ EMP 테이블에서 부서번호가 20번인 직원들의 정보 중
--   사원번호, 사원명, 직종명, 급여, 부서번호 조회

SELECT 사원번호, 사원명, 직종명, 급여, 부서번호
FROM EMP
WHERE 부서번호가 20번;

SELECT EMPNO,ENAME,JOB,SAL,DEPTNO
FROM EMP
WHERE DEPTNO == 20; -- X

SELECT EMPNO,ENAME,JOB,SAL,DEPTNO
FROM EMP
WHERE DEPTNO = 20;
--만약 숫자 형태를 띄고있으나 문자타입의 데이터를 찾을때는 '20'형태로 표현

--※ 테이블을 조회하는 과정에서 각 컬럼에 별칭(ALIAS)을 부여할 수 있다.

SELECT EMPNO AS "사원번호", ENAME "사원명", JOB 직종, SAL AS "급 여", DEPTNO "부서정보"
FROM EMP
WHERE DEPTNO = 20;

-- 테이블이름 컬럼이름 경로를 만드는 과정에서 한글로 이름을 짓지 않는다.

--※ 테이블 조회 시 사용하는 별칭의 기본 구문은 『AS "별칭명"』의 형태로 작성되며
--   이 때 『AS』는 생략 가능하다.
--   또한, 『""』도 생략 가능하다.
--   하지만, 『""』를 생략할 경우 별칭명에 공백은 사용할 수 없다
--   공백은 해당 컬럼의 종결의 의미하므로 별칭의 이름 내부에 공백을 사용할 경우
--   『""』를 사용하여 별칭을 부여할 수 있도록 처리해야 한다.

--○ EMP 테이블에서 부서번호가 20번과 30번 직원들의 정보 중
--   사원번호, 사원명, 직종명, 급여, 부서번호 항목을 조회한다.
--   단, 별칭(ALIAS)을 사용한다.
SELECT 사원번호, 사원명, 직종명, 급여, 부서번호
FROM EMP
WHERE 부서번호가 20번과 30번;

SELECT EMPNO"사원번호", ENAME"사원명", JOB"직종", SAL"급여", DEPTNO"부서정보"
FROM EMP
WHERE DEPTNO = 20 OR DEPTNO = 30;
--==>>
/*
7369	SMITH	CLERK	     800	    20
7499	ALLEN	SALESMAN	1600	    30
7521	WARD	SALESMAN	1250	    30
7566	JONES	MANAGER 	2975	20
7654	MARTIN	SALESMAN	1250	    30
7698	BLAKE	MANAGER	    2850	    30
7788	SCOTT	ANALYST	    3000	    20
7844	TURNER	SALESMAN	1500	    30
7876	ADAMS	CLERK	    1100	    20
7900    	JAMES	CLERK   	950	    30
7902    	FORD	ANALYST 	3000	    20
*/

SELECT EMPNO"사원번호", ENAME"사원명", JOB"직종", SAL"급여", DEPTNO"부서정보"
FROM EMP
WHERE DEPTNO IN (20,30);
--==>> IN 연산자를 활용하여 이와 같이 처리할 수 있으며
--     위의 구문과 같은 결과를 반환하게 된다.

--○ EMP 테이블에서 직종이 CLERK인 사원들의 정보를 모두 조회한다.
SELECT *
FROM EMP
WHERE 직종이 CLERCK;

SELECT *
FROM EMP
WHERE JOB = 'CLERK';

--※ 오라클에서... 입력된 데이터(값) 만큼은
--   반.드.시. 대·소문자 구분을 한다.



