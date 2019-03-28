SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM EMP
WHERE JOB='salesman';
--==>> 조회 결과 없음


--○ UPPER(), LOWER(), INITCAP()
SELECT 'oRaCLe' "1", UPPER('oRaCLe') "2", LOWER('oRaCLe') "3", INITCAP('oRaCLe') "4"
FROM DUAL;
--==>> oRaCLe   ORACLE   oracle   Oracle
--> UPPER() 는 모두 대문자로 변환
--  LOWER() 는 모두 소문자로 변환
--  INITCAP() 는 첫 글자만 대문자로 하고 나머지는 모두 소문자로 변환하여 변환


SELECT *
FROM EMP
WHERE JOB=UPPER('SalEsmAn');
--==>> 
/*
7499   ALLEN   SALESMAN   7698   81/02/20   1600    300    30
7521   WARD   SALESMAN   7698   81/02/22   1250    500    30
7654   MARTIN   SALESMAN   7698   81/09/28   1250   1400   30
7844   TURNER   SALESMAN   7698   81/09/08   1500      0    30
*/

SELECT *
FROM EMP
WHERE LOWER(JOB)=LOWER('SalEsmAn');

SELECT *
FROM EMP
WHERE INITCAP(JOB)=INITCAP('SalEsmAn');

--○ TBL_EMP 테이블에서 입사일이 1981년 9월 28일 입사한 직원의
--   사원명, 직종명, 입사일 항목을 조회한다.
SELECT *
FROM TBL_EMP;

SELECT ENAME"사원명", JOB"직종명", HIREDATE"입사일"
FROM TBL_EMP
WHERE HIREDATE = '81/09/28';
--WHERE HIREDATE = '1981-09-28';
--> 이렇게 검색하면 안된다. 형변환이 된 것
--  엄밀히 말하면 날짜타입이 아닌 문자타입
--==>>MARTIN	SALESMAN	81/09/28

--○ TO_DATE()
SELECT ENAME"사원명", JOB"직종명", HIREDATE"입사일"
FROM TBL_EMP
WHERE HIREDATE = TO_DATE('1981-09-28','YYYY-MM-DD');

--○ TBL_EMP 테이블에서 입사일이 1981년 9월 28일 이후(해당일 포함)로 입사한 직원의
--   사원명, 직종명, 입사일 항목을 조회한다.
SELECT ENAME,JOB,HIREDATE
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-09-28','YYYY-MM-DD');
--==>>
/*

ENAME      JOB       HIREDATE
---------- --------- --------
MARTIN     SALESMAN  81/09/28
SCOTT      ANALYST   87/07/13
KING       PRESIDENT 81/11/17
ADAMS      CLERK     87/07/13
JAMES      CLERK     81/12/03
FORD       ANALYST   81/12/03
MILLER     CLERK     82/01/23
*/
--※ 오라클에서는 날짜 데이터의 크기 비교가 가능하다
--   오라클에서 날짜 데이터에 대한 크기 비교 시
--   과거보다 미래를 더 큰 값으로 간주하여 처리된다.

--○ TBL_EMP 테이블에서 입사일이 1981년 4월 2일 부터
--   1981년 9월 28일 사이에 입사한 직원들의
--   사원명, 직종명, 입사일 항목을 조회한다(해당일 포함)
SELECT ENAME"사원명",JOB"직종명",HIREDATE"입사일"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-04-02','YYYY-MM-DD')
  AND HIREDATE <= TO_DATE('1981-09-28','YYYY-MM-DD');
--==>>
/*
JONES	MANAGER	    81/04/02
MARTIN	SALESMAN	81/09/28
BLAKE	MANAGER	    81/05/01
CLARK	MANAGER	    81/06/09
TURNER	SALESMAN	81/09/08
*/

--○ BETWEEN ⓐ AND ⓑ
SELECT ENAME"사원명",JOB"직종명",HIREDATE"입사일"
FROM TBL_EMP
WHERE HIREDATE BETWEEN TO_DATE('1981-04-02','YYYY-MM-DD') 
                   AND TO_DATE('1981-09-28','YYYY-MM-DD');
--==>>
/*
JONES	MANAGER	    81/04/02
MARTIN	SALESMAN	81/09/28
BLAKE	MANAGER	    81/05/01
CLARK	MANAGER	    81/06/09
TURNER	SALESMAN	81/09/08
*/

SELECT *
FROM TBL_EMP
WHERE SAL BETWEEN 2000 AND 3000;
--==>>
/*
7566	JONES	MANAGER	7839	81/04/02	2975		20
7698	BLAKE	MANAGER	7839	81/05/01	2850		30
7782	CLARK	MANAGER	7839	81/06/09	2450		10
7788	SCOTT	ANALYST	7566	87/07/13	3000		20
7902	FORD	ANALYST	7566	81/12/03	3000		20
*/

SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 'S';
--==>>
/*
7566	JONES	MANAGER	    7839	81/04/02	2975		    20
7654	MARTIN	SALESMAN	7698	81/09/28	1250	1400	30
7782	CLARK	MANAGER	    7839	81/06/09	2450		    10
7839	KING	PRESIDENT	    	81/11/17	5000		    10
7900	JAMES	CLERK	    7698	81/12/03	950		        30
7902	FORD	ANALYST	    7566	81/12/03	3000	    	20
7934	MILLER	CLERK   	7782	82/01/23	1300	    	10
*/
-->>S로시작하는 사람들 이름이 빠져있음
--  날짜나 숫자에서는 A-B포함해서 검색되는데
--  왜 사람이름은 뒤 문자쪽 이름이 검색되지 않았을까??
--  사전식으로 검색하기 때문. C부터 S가 시작하는 페이지까지 검색된다
--  S로만 시작하는 사람들의 이름은 나옴

--※ BETWEEN ⓐ AND ⓑ는 날짜형, 숫자형, 문자형 데이터 모두에 적용된다.
--   단, 문자형일 경우 아스키코드 순서를 따르기 때문에
--   대문자가 앞쪽에 위치하고 소문자가 뒤쪽에 위치한다
--   또한, BETWEEN ⓐ AND ⓑ는 쿼리문이 수행되는 시점에서
--   오라클 내부적으로는 부등호 연산자의 형태로 바뀌어 연산이 처리된다.

SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 's';
-->>아스키 코드식으로 검색되기때문에 A~Z~a~s까지 모두 검색됨


--○ ASCII()
SELECT ASCII('A'),ASCII('B'),ASCII('a'),ASCII('b')
FROM DUAL;
--==>>65	66	97	98

--○ TBL_EMP 테이블에서 직종이 SALESMAN과 CLERK인 사원의
--   사원명, 직종명, 급여 항목을 조회한다.
SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB = 'SALESMAN' OR JOB = 'CLERK';

SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB IN ('SALESMAN'. 'CLERK');

SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB =ANY ('SALESMAN','CLERK'); --cf.『=ALL』
-- 그 뒤의 데이터중 아무거나 일치하면 조건이 TRUE
-- cf) =ALL은 이것도 가지고 있고 저것도 가지고 있어야 조건 TRUE (AND와 같은 방식)

--※ 위의 3가지 유형의 쿼리문은 모두 같은 결과를 반환한다.
--   하지만 맨 위의 쿼리문이 가장 빠르게 처리된다
--   물론 메모리에 대한 내용이 아니라 CPU에 관한 내용이므로
--   이 부분까지 감안하여 쿼리문을 구성하는 일은 많지 않다
--   → 『IN』과 『=ANY』는 같은 연산자 효과를 가진다
--      모두 내부적으로는 『OR』구조로 변경되어 연산 처리된다.

--==>>
/*
SMITH	CLERK	    800
ALLEN	SALESMAN	1600
WARD	SALESMAN	1250
MARTIN	SALESMAN	1250
TURNER	SALESMAN	1500
ADAMS	CLERK	    1100
JAMES	CLERK	    950
MILLER	CLERK	    1300
*/

------------------------------------------------------------------------

--○ 추가 실습 테이블 구성(TBL_SAWON)
CREATE TABLE TBL_SAWON
( SANO      NUMBER(4)
, SANAME    VARCHAR2(30)
, JUBUN     CHAR(13)
, HIREDATE  DATE DEFAULT SYSDATE
, SAL       NUMBER(10)
);
--==>Table TBL_SAWON이(가) 생성되었습니다.
SELECT *
FROM TBL_SAWON;

DESC TBL_SAWON;
--==>
/*
이름       널? 유형           
-------- -- ------------ 
SANO        NUMBER(4)    
SANAME      VARCHAR2(30) 
JUBUN       CHAR(13)     
HIREDATE    DATE         
SAL         NUMBER(10)  
*/


--○ 데이터 입력(TBL_SAWON)
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1001, '이원영','8706241234567',TO_DATE('2001-01-03','YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1002, '나주영','9405022234567',TO_DATE('2010-11-05','YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1003, '진윤비','9710012234567',TO_DATE('1999-08-16','YYYY-MM-DD'), 5000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1004, '권홍비','9504102234567',TO_DATE('1997-11-05','YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1005, '이비승','7210101234567',TO_DATE('1998-02-02','YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1006, '조영우','8004271234567',TO_DATE('1998-02-02','YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1007, '이하이','0405064234567',TO_DATE('2010-07-15','YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1008, '소이현','0506074234567',TO_DATE('2011-07-15','YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1009, '선동열','0505053234567',TO_DATE('2011-07-15','YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1010, '선우선','9505052234567',TO_DATE('1999-11-11','YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1011, '선우용녀','7512122234567',TO_DATE('1999-11-11','YYYY-MM-DD'), 5000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1012, '남상현','9302131234567',TO_DATE('2010-11-11','YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1013, '남궁선','7202021234567',TO_DATE('1992-10-10','YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1014, '남이','6012121234567',TO_DATE('1981-10-10','YYYY-MM-DD'), 4000);
--==>> 1 행 이(가) 삽입되었습니다.*14

--○확인
SELECT *
FROM TBL_SAWON;
--==>>
/*
1001	이원영	8706241234567	01/01/03	3000
1002	나주영	9405022234567	10/11/05	2000
1003	진윤비	9710012234567	99/08/16	5000
1004	권홍비	9504102234567	97/11/05	4000
1005	이비승	7210101234567	98/02/02	2000
1006	조영우	8004271234567	98/02/02	2000
1007	이하이	0405064234567	10/07/15	1000
1008	소이현	0506074234567	11/07/15	1000
1009	선동열	0505053234567	11/07/15	3000
1010	선우선	9505052234567	99/11/11	4000
1011	선우용녀	7512122234567	99/11/11	5000
1012	남상현	9302131234567	10/11/11	3000
1013	남궁선	7202021234567	92/10/10	2000
1014	남이  	6012121234567	81/10/10	4000
*/


--○ 커밋
COMMIT;
--==>>커밋 완료.

--○ TBL_SAWON 테이블에서 이원영 사원의 정보를 모두 조회한다.
SELECT *
FROM TBL_SAWON
WHERE SANAME = '이원영';

SELECT *
FROM TBL_SAWON
WHERE SANAME LIKE '이원영';
--==>>1001	이원영	8706241234567	01/01/03	3000


--※ LIKE : 동사 → 좋아하다
--          부사 → ~와 같이, ~처럼

--※ WILD CHARACTER → 『%』
--   『LIKE』와 함께 사용되는 『%』는 모든 글자를 의미하고
--   『LIKE』와 함께 사용되는 『_』는 아무 글자 1개를 의미한다.

--○ TBL_SAWON 테이블에서 성씨가 『이』씨인 사원의
--   사원명, 주민번호, 급여 항목을 조회한다.
SELECT *
FROM TBL_SAWON;

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME = '이';
--==>> 조회 결과 없음

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME = '이__';
--==>> 조회 결과 없음

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '이__';
--==>>
/*
이원영	8706241234567	3000
이비승	7210101234567	2000
이하이	0405064234567	1000
*/

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '이_';
--==>> 조회 결과 없음

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '이____';
--==>> 조회 결과 없음

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '이%';
--==>>
/*
이원영	8706241234567	3000
이비승	7210101234567	2000
이하이	0405064234567	1000
*/

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '남%';
--==>>
/*
남상현	9302131234567	3000
남궁선	7202021234567	2000
남이 	6012121234567	4000
*/

--○ TBL_SAWON 테이블에서 이름의 마지막 글자가 『비』로
--   끝나는 사원의 사원명, 주민번호, 입사일, 급여 항목을 조회한다.
SELECT SANAME, JUBUN, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%비';


SELECT SANAME, JUBUN, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '__비';
--==>>
/*
진윤비	9710012234567	99/08/16	5000
권홍비	9504102234567	97/11/05	4000
*/

--○ TBL_SAWON 테이블에서 이름의 마지막 글자가 『이』로
--   끝나는 사원의 사원명, 주민번호, 입사일, 급여 항목을 조회한다.
SELECT SANAME, JUBUN, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%이';
--==>>
/*
이하이	0405064234567	10/07/15	1000
남이	6012121234567	81/10/10	4000
*/


SELECT SANAME, JUBUN, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '__이';
--==> 이렇게 조회할 경우 _이는 누락. (남이) 이러한 경우에선 '%이'를 사용하도록 하자

--○ 데이터 추가 입력
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1015, '이이경','8410141234567',TO_DATE('1997-10-10','YYYY-MM-DD'), 5000);
--==>>1 행 이(가) 삽입되었습니다.

--○ 커밋
COMMIT;
--==>>커밋 완료.

--○ TBL_SAWON 테이블에서 사원 이름 안에 『이』라는 글자가
--   하나라도 포함되어 있으면 그 사원의
--   사원번호, 사원명, 입사일, 급여 항목을 조회한다.
SELECT SANO, SANAME, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%이%';
/*
1001	이원영	01/01/03	3000
1005	이비승	98/02/02	2000
1007	이하이	10/07/15	1000
1008	소이현	11/07/15	1000
1014	남이  	81/10/10	4000
1015	이이경	97/10/10	5000
*/

--○ TBL_SAWON 테이블에서 사원 이름 안에 『이』라는 글자가
--   두번 포함되어 있으면 그 사원의
--   사원번호, 사원명, 입사일, 급여 항목을 조회한다.
SELECT SANO, SANAME, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%이이%'; -- 『이』가 연속으로 두번 들어있는 데이터만 검색됨(주의)

SELECT SANO, SANAME, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%이%이%';
--==>>
/*
1007	이하이	10/07/15	1000
1015	이이경	97/10/10	5000
*/

--○ TBL_SAWON 테이블에서 성씨가 남씨인 사원의
--   사원명, 주민번호, 급여 항목을 조회한다.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '남%';
--==>>
/*
남상현	9302131234567	3000
남궁선	7202021234567	2000
남이  	6012121234567	4000
*/

--※ 데이터베이스 설계 시 성과 이름을 분리해서 처리해야 할
--   업무 계획이 있다면(지금 당장은 아니더라도...) 테이블에서 성 컬럼과
--   이름 컬럼을 분리하여 구성해야 한다.

--○ TBL_SAWON테이블에서 여직원들의 사원명, 주민번호, 급여 항목을 조회한다
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE JUBUN LIKE '______2%' OR JUBUN LIKE '______4%';

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE JUBUN LIKE '______2______' OR JUBUN LIKE '______4______';
--==>>
/*
나주영	9405022234567	2000
진윤비	9710012234567	5000
권홍비	9504102234567	4000
이하이	0405064234567	1000
소이현	0506074234567	1000
선우선	9505052234567	4000
선우용녀	7512122234567	5000
*/

--○ 테이블 생성(TBL_WATCH)
CREATE TABLE TBL_WATCH
(  WATCH_NAME    VARCHAR2(20)
 , BIGO          VARCHAR2(100)
);
--==>Table TBL_WATCH이(가) 생성되었습니다.

--○ 데이터 입력
INSERT INTO TBL_WATCH VALUES('금시계', '순금 99.99% 함유된 최고급 시계');
INSERT INTO TBL_WATCH VALUES('은시계', '고객 만족도 99.99%점을 획득한 시계');
--==>1 행 이(가) 삽입되었습니다.*2

--○ 커밋
COMMIT;
--==>커밋 완료.

--○ 확인
SELECT *
FROM TBL_WATCH;
--==>>
/*
금시계	순금 99.99% 함유된 최고급 시계
은시계	고객 만족도 99.99%점을 획득한 시계
*/

--○ TBL_WATCH테이블의 BIGO 컬럼에
--   『99.99%』라는 글자가 들어있는 행(레코드)의 정보를 조회한다.
SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '99.99%';
--==>>조회 결과 없음

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99%%';
--==>>둘 다 조회

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99%';
--==>>둘 다 조회

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99\%%' ESCAPE '\';

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99$%%' ESCAPE '$';
--==>>

--※ ESCAPE로 정한 문자의 다음 한 글자는 와일드캐릭터에서 탈출시켜라...
--   『ESCAPE '\'』
--   일반적으로 사용빈도 낮은 특수문자(특수기호)를 사용한다.

-----------------------------------------------------------------------------

-- ■■■ COMMIT / ROLLBACK ■■■--

SELECT *
FROM TBL_DEPT;
--==>> 
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/

--○ 데이터 입력
INSERT INTO TBL_DEPT VALUES(50, '개발부', '서울');
--==>>1 행 이(가) 삽입되었습니다.
-- 50번... 개발부... 서울...
-- 이 데이터는 TBL_DEPT 테이블이 저장되어 있는
-- 하드디스크상에 물리적으로 적용되어 저장된 것이 아니라
-- 메모리(RAM)상에 입력된 것이다.

--○ 확인
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	개발부	서울
*/

--○ 롤백
ROLLBACK;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
*/
--> 50번... 개발부... 서울... 에 대한 데이터가 소실되었음을 확인(존재하지 않음)

--○ 다시 입력
INSERT INTO TBL_DEPT VALUES(50, '개발부', '서울');
--==>>1 행 이(가) 삽입되었습니다.
--> 메모리상에 입력된 이 데이터를 실제 하드디스크상에 물리적으로 저장하기 위해서는
--  COMMIT을 수행해야한다.

--○ 확인
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	개발부	서울*/

--○ 커밋
COMMIT;
--==>커밋 완료.

--○ 커밋 이후 다시 확인
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	개발부	서울
*/

--○ 롤백
ROLLBACK;
--==>>롤백 완료.

--○ 롤백 이후 다시 확인
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	개발부	서울
*/

--> 롤백(ROLLBACK)을 수행했음에도 불구하고
--  50번 개발부 서울... 의 데이터는 소실되지 않았음을 확인

--※ COMMIT 을 실행한 이후로 DML 구문(INSERT, UPDATE, DELETE)을 통해
--   변경된 데이터만 취소할 수 있는 것일 뿐
--   DML 명령을 사용한 후 COMMIT 하고나서 ROLLBACK을 실행햐봐여
--   이전 상태로 되돌릴 수 없다(아무런 소용이 없다.)

--○ 데이터 수정(TBL_DEPT)
UPDATE TBL_DEPT
SET DNAME='연구부', LOC='인천'
WHERE DEPTNO=50;
--==>>1 행 이(가) 업데이트되었습니다.
-- ★업데이트 구문 작성순서 1.UPDATE~~ 2.WHERE절 3.SET절

--○ 확인
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	연구부	인천
*/
--○롤백
ROLLBACK;

--○ 롤백 후 확인
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	개발부	서울
*/
--==>> 수정(UPDATE)을 수행하기 이전 상태로 복원되었음을 확인

--○ 데이터 삭제(DELETE)
SELECT *
FROM TBL_DEPT
WHERE DEPTNO=50;

DELETE
FROM TBL_DEPT
WHERE DEPTNO=50;
--==>>1 행 이(가) 삭제되었습니다.

--○확인
SELECT*
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
*/

--○ 롤백
ROLLBACK;

--○ 다시 확인
SELECT*
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	개발부	서울
*/
--> 삭제 구문을 수행하기 이전 상태로 복원되었음을 확인

-- ★ 테이블 생성시 오토커밋된다는 것 잊지 말기

--------------------------------------------------------------

--■■■ 정렬(ORDER BY) 절 ■■■--
SELECT ENAME"사원명", DEPTNO"부서번호", JOB"직종", SAL"급여"
     , SAL*12+NVL(COMM, 0)"연봉"
FROM TBL_EMP;
--==>>
/*
SMITH	20	CLERK	    800	    9600
ALLEN	30	SALESMAN	1600	19500
WARD	30	SALESMAN	1250	15500
JONES	20	MANAGER	    2975	35700
MARTIN	30	SALESMAN	1250	16400
BLAKE	30	MANAGER	    2850	34200
CLARK	10	MANAGER	    2450	29400
SCOTT	20	ANALYST	    3000	36000
KING	10	PRESIDENT	5000	60000
TURNER	30	SALESMAN	1500	18000
ADAMS	20	CLERK	    1100	13200
JAMES	30	CLERK	    950	    11400
FORD	20	ANALYST 	3000	36000
MILLER	10	CLERK	    1300	15600
*/

SELECT ENAME"사원명", DEPTNO"부서번호", JOB"직종", SAL"급여"
     , SAL*12+NVL(COMM, 0)"연봉", COMM"커미션"
FROM TBL_EMP
ORDER BY COMM ASC;
--==>> ORDER BY 정렬기준이되는컬럼 ASC(오름차순),DESC(내림차순);
-- 오라클에서는 NULL값을 가장 큰 값으로 간주함
/*
원명       부서번호   직종       급여       연봉       커미션
---------- ---------- --------- ---------- ---------- ----------
TURNER             30 SALESMAN        1500      18000          0
ALLEN              30 SALESMAN        1600      19500        300
WARD               30 SALESMAN        1250      15500        500
MARTIN             30 SALESMAN        1250      16400       1400
SCOTT              20 ANALYST         3000      36000           
KING               10 PRESIDENT       5000      60000           
ADAMS              20 CLERK           1100      13200           
JAMES              30 CLERK            950      11400           
FORD               20 ANALYST         3000      36000           
MILLER             10 CLERK           1300      15600           
BLAKE              30 MANAGER         2850      34200           
JONES              20 MANAGER         2975      35700           
SMITH              20 CLERK            800       9600           
CLARK              10 MANAGER         2450      29400           
*/
SELECT ENAME"사원명", DEPTNO"부서번호", JOB"직종", SAL"급여"
     , SAL*12+NVL(COMM, 0)"연봉", COMM"커미션"
FROM TBL_EMP
ORDER BY DEPTNO;
-- 오름차순 생략가능
--==>>
/*
CLARK	10	MANAGER	    2450	29400	
KING	10	PRESIDENT	5000	60000	
MILLER	10	CLERK	    1300	15600	
JONES	20	MANAGER 	2975	35700	
FORD	20	ANALYST	    3000	36000	
ADAMS	20	CLERK	    1100	13200	
SMITH	20	CLERK	    800	    9600	
SCOTT	20	ANALYST	    3000	36000	
WARD	30	SALESMAN	1250	15500	500
TURNER	30	SALESMAN	1500	18000	0
ALLEN	30	SALESMAN	1600	19500	300
JAMES	30	CLERK	    950	    11400	
BLAKE	30	MANAGER	    2850	34200	
MARTIN	30	SALESMAN	1250	16400	1400
*/
SELECT ENAME"사원명", DEPTNO"부서번호", JOB"직종", SAL"급여"
     , SAL*12+NVL(COMM, 0)"연봉", COMM"커미션"
FROM TBL_EMP
ORDER BY DEPTNO DESC;   -- 내림차순 생략 불가~~
--==>>
/*
BLAKE	30	MANAGER	    2850	34200	
TURNER	30	SALESMAN	1500	18000	0
ALLEN	30	SALESMAN	1600	19500	300
MARTIN	30	SALESMAN	1250	16400	1400
WARD	30	SALESMAN	1250	15500	500
JAMES	30	CLERK	    950	    11400	
SCOTT	20	ANALYST	    3000	36000	
JONES	20	MANAGER	    2975	35700	
SMITH	20	CLERK	    800 	9600	
ADAMS	20	CLERK	    1100	13200	
FORD	20	ANALYST	    3000	36000	
KING	10	PRESIDENT	5000	60000	
MILLER	10	CLERK	    1300	15600	
CLARK	10	MANAGER	    2450	29400	
*/

SELECT ENAME"사원명", DEPTNO"부서번호", JOB"직종", SAL"급여"
     , SAL*12+NVL(COMM, 0)"연봉", COMM"커미션"
FROM TBL_EMP
ORDER BY 연봉 DESC;  
--==>>
/*
원명        부서번호  직종       급여       연봉        커미션
---------- ---------- --------- ---------- ---------- ----------
KING               10 PRESIDENT       5000      60000           
FORD               20 ANALYST         3000      36000           
SCOTT              20 ANALYST         3000      36000           
JONES              20 MANAGER         2975      35700           
BLAKE              30 MANAGER         2850      34200           
CLARK              10 MANAGER         2450      29400           
ALLEN              30 SALESMAN        1600      19500        300
TURNER             30 SALESMAN        1500      18000          0
MARTIN             30 SALESMAN        1250      16400       1400
MILLER             10 CLERK           1300      15600           
WARD               30 SALESMAN        1250      15500        500
ADAMS              20 CLERK           1100      13200           
JAMES              30 CLERK            950      11400           
SMITH              20 CLERK            800       9600           
*/
--> ORDER BY 절보다 SELECT 절이 먼저 처리되기 때문에
--  컬럼명 대신 SELECT 절에서 사용한 ALIAS(별칭)을
--  ORDER BY 절에서 사용해도 문제가 발생하지 않는다.(가능하다)

SELECT ENAME"사원명", DEPTNO"부서 번호", JOB"직종", SAL"급여"
     , SAL*12+NVL(COMM, 0)"연봉", COMM"커미션"
FROM TBL_EMP
ORDER BY 부서 번호 DESC;
--==>> 에러 발생

SELECT ENAME"사원명", DEPTNO"부서 번호", JOB"직종", SAL"급여"
     , SAL*12+NVL(COMM, 0)"연봉", COMM"커미션"
FROM TBL_EMP
ORDER BY "부서 번호" DESC;
--==>> 정렬
/*
BLAKE	30	MANAGER	    2850	34200	
TURNER	30	SALESMAN	1500	18000	0
ALLEN	30	SALESMAN	1600	19500	300
MARTIN	30	SALESMAN	1250	16400	1400
WARD	30	SALESMAN	1250	15500	500
JAMES	30	CLERK	    950	    11400	
SCOTT	20	ANALYST	    3000	36000	
JONES	20	MANAGER 	2975	35700	
SMITH	20	CLERK	    800	    9600	
ADAMS	20	CLERK	    1100	13200	
FORD	20	ANALYST 	3000	36000	
KING	10	PRESIDENT	5000	60000	
MILLER	10	CLERK	    1300	15600	
CLARK	10	MANAGER	    2450	29400	
*/

SELECT ENAME"사원명", DEPTNO"부서 번호", JOB"직종", SAL"급여"
     , SAL*12+NVL(COMM, 0)"연봉", COMM"커미션"
FROM TBL_EMP
ORDER BY "부서 번호" DESC;

SELECT*
FROM TBL_EMP;

SELECT ENAME"사원명", DEPTNO"부서 번호", JOB"직종", SAL"급여"
     , SAL*12+NVL(COMM, 0)"연봉", COMM"커미션"
FROM TBL_EMP
ORDER BY 2;
--==>> ASC생략
/*
CLARK	10	MANAGER	    2450	29400	
KING	10	PRESIDENT	5000	60000	
MILLER	10	CLERK	    1300	15600	
JONES	20	MANAGER 	2975	35700	
FORD	20	ANALYST	    3000	36000	
ADAMS	20	CLERK	    1100	13200	
SMITH	20	CLERK	    800	9600	
SCOTT	20	ANALYST	    3000	36000	
WARD	30	SALESMAN	1250	15500	500
TURNER	30	SALESMAN	1500	18000	0
ALLEN	30	SALESMAN	1600	19500	300
JAMES	30	CLERK	    950	11400	
BLAKE	30	MANAGER	    2850	34200	
MARTIN	30	SALESMAN	1250	16400	1400
*/
--> TBL_EMP 테이블이 갖고 있는 테이블의 고유한 컬럼 순서가 아니라
--  SELECT 처리 되는 두 번째 컬럼(즉, DEPTNO)을 기준으로 정렬되는 것을 확인
--  ASC 생략된 상태 → 오름차순 정렬되는 것을 확인

SELECT ENAME, DEPTNO, JOB, SAL
FROM TBL_EMP
ORDER BY 2, 4; -- DEPTNO 기준 1차 정렬, SAL 기준 2차정렬... ASC
--==>>
/*
MILLER	10	CLERK	1300
CLARK	10	MANAGER	2450
KING	10	PRESIDENT	5000
SMITH	20	CLERK	800
ADAMS	20	CLERK	1100
JONES	20	MANAGER	2975
SCOTT	20	ANALYST	3000
FORD	20	ANALYST	3000
JAMES	30	CLERK	950
MARTIN	30	SALESMAN	1250
WARD	30	SALESMAN	1250
TURNER	30	SALESMAN	1500
ALLEN	30	SALESMAN	1600
BLAKE	30	MANAGER	2850
*/
-- 두번째 컬럼으로 정렬하고 그 안에서 네번째 컬럼을 기준으로 정렬

SELECT ENAME, DEPTNO, JOB, SAL
FROM TBL_EMP
ORDER BY 2, 3, 4 DESC;
--> ① DEPTNO(부서번호) 기분 오름차순 정렬
--  ② JOB(직종명) 기준 오름차순 정렬
--  ③ SAL(급여) 기준 내림차순 정렬
--  (3차 정렬 수행)
--==>>
/*
MILLER	10	CLERK	    1300
CLARK	10	MANAGER	    2450
KING	10	PRESIDENT	5000
SCOTT	20	ANALYST	    3000
FORD	20	ANALYST	    3000
ADAMS	20	CLERK	    1100
SMITH	20	CLERK	    800
JONES	20	MANAGER	    2975
JAMES	30	CLERK	    950
BLAKE	30	MANAGER	    2850
ALLEN	30	SALESMAN	1600
TURNER	30	SALESMAN	1500
MARTIN	30	SALESMAN	1250
WARD	30	SALESMAN	1250
*/

------------------------------------------------------------------------------------

--○ CONCAT() -- 문자열 결합

SELECT '전훈의'||'이지혜' "①"
     , CONCAT('전훈의','이지혜')"②"
FROM DUAL;
--==>>전훈의이지혜	전훈의이지혜

SELECT ENAME||JOB"①"
     , CONCAT(ENAME, JOB)"②"
FROM TBL_EMP;
--==>>
/*
①                   ②                  
------------------- -------------------
SMITHCLERK          SMITHCLERK         
ALLENSALESMAN       ALLENSALESMAN      
WARDSALESMAN        WARDSALESMAN       
JONESMANAGER        JONESMANAGER       
MARTINSALESMAN      MARTINSALESMAN     
BLAKEMANAGER        BLAKEMANAGER       
CLARKMANAGER        CLARKMANAGER       
SCOTTANALYST        SCOTTANALYST       
KINGPRESIDENT       KINGPRESIDENT      
TURNERSALESMAN      TURNERSALESMAN     
ADAMSCLERK          ADAMSCLERK         
JAMESCLERK          JAMESCLERK         
FORDANALYST         FORDANALYST        
MILLERCLERK         MILLERCLERK        
*/

SELECT ENAME||JOB||DEPTNO"①"
     , CONCAT(ENAME, JOB, DEPTNO)"②"
FROM TBL_EMP;
--==>>에러 발생
--> 2개의 문자열을 결합시켜주는 기능을 가진 함수,
--  오로지 2개만 결합시킬 수 있다.

SELECT ENAME||JOB||DEPTNO"①"
     , CONCAT(CONCAT(ENAME, JOB), DEPTNO)"②"
FROM TBL_EMP;
--==>>
/*
SMITHCLERK20	    SMITHCLERK20
ALLENSALESMAN30 	ALLENSALESMAN30
WARDSALESMAN30	    WARDSALESMAN30
JONESMANAGER20	    JONESMANAGER20
MARTINSALESMAN30	MARTINSALESMAN30
BLAKEMANAGER30	    BLAKEMANAGER30
CLARKMANAGER10	    CLARKMANAGER10
SCOTTANALYST20	    SCOTTANALYST20
KINGPRESIDENT10 	KINGPRESIDENT10
TURNERSALESMAN30	TURNERSALESMAN30
ADAMSCLERK20	    ADAMSCLERK20
JAMESCLERK30	    JAMESCLERK30
FORDANALYST20	    FORDANALYST20
MILLERCLERK10	    MILLERCLERK10
*/

--> 내부적인 형 변환이 일어나며 결합을 수행하게 된다
--  CONCAT()은 문자열과 문자열을 결합시켜주는 함수이지만
--  내부적으로는 숫자나 날짜를 문자타입으로 바꾸어주는 과정이 포함되어 있다.

/*JAVA의 String.Substring()
obj.substring()
---
 ↓
 문자열.substring(n, m);
                 n부터 m-1까지...(0부터 시작하는 인덱스 기준)
*/

--○ SUBSTR() 갯수 기반 / SUBSTRB() 바이트 기반 -- 문자열 추출함수
SELECT ENAME"①"
     , SUBSTR(ENAME, 1, 2)"②"
     , SUBSTR(ENAME, 2, 2)"③"
     , SUBSTR(ENAME, 3, 2)"④"
     , SUBSTR(ENAME, 2)"⑤"
FROM TBL_EMP;
--> 문자열을 추출하는 기능을 가진 함수
--  첫번째 파라미터 값은 대상 문자열(추출의 대상)
--  두번째 파라미터 값은 추출을 시작하는 위치(단, 인덱스는 1부터 시작)★
--  세번째 파라미터 값은 추출할 문자열의 갯수(생략 시.. 시작위치부터 끝까지)
/*
SMITH	SM	MI	IT	MITH
ALLEN	AL	LL	LE	LLEN
WARD	WA	AR	RD	ARD
JONES	JO	ON	NE	ONES
MARTIN	MA	AR	RT	ARTIN
BLAKE	BL	LA	AK	LAKE
CLARK	CL	LA	AR	LARK
SCOTT	SC	CO	OT	COTT
KING	KI	IN	NG	ING
TURNER	TU	UR	RN	URNER
ADAMS	AD	DA	AM	DAMS
JAMES	JA	AM	ME	AMES
FORD	FO	OR	RD	ORD
MILLER	MI	IL	LL	ILLER
*/

--○ TBL_SAWON 테이블에서 성별이 남성인 사원만
--   사원번호, 사원명, 주민번호, 급여 항목을 조회한다.
--   단, SUBSTR() 함수를 사용할 수 있도록 하며
--   급여 기준으로 내림차순 정렬을 수행할 수 있도록 한다.
SELECT SANO, SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SUBSTR(JUBUN,7,1) = '1' OR SUBSTR(JUBUN,7,1) = '3'
ORDER BY SAL DESC;

SELECT SANO, SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SUBSTR(JUBUN,7,1) IN ('1','3')
ORDER BY SAL DESC;
--==>>
/*
1015	이이경	8410141234567	5000
1014	남이	    6012121234567	4000
1001	이원영	8706241234567	3000
1009	선동열	0505053234567	3000
1012	남상현	9302131234567	3000
1013	남궁선	7202021234567	2000
1005	이비승	7210101234567	2000
1006	조영우	8004271234567	2000
*/

SELECT *
FROM TBL_SAWON;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>Session이(가) 변경되었습니다.

--○ LENGTH() / LENGTHB()
SELECT ENAME"①"
     , LENGTH(ENAME)"②"
     , LENGTHB(ENAME)"③"
FROM TBL_EMP;
--> LENGTH()는 글자 수를 반환, LENGTHB()는 바이트 수를 반환
--==>>
/*
SMITH	5	5
ALLEN	5	5
WARD	4	4
JONES	5	5
MARTIN	6	6
BLAKE	5	5
CLARK	5	5
SCOTT	5	5
KING	4	4
TURNER	6	6
ADAMS	5	5
JAMES	5	5
FORD	4	4
MILLER	6	6
*/
SELECT '이원영'"①"
     , LENGTH('이원영')"②"
     , LENGTHB('이원영')"③"
FROM DUAL;
--==>>이원영	 3	9

SELECT *
FROM NLS_DATABASE_PARAMETERS;
-->> 데이터 설정 어떻게되어있는지 확인

--○ INSTR()
SELECT 'ORACLE ORAHOME BIORA'"①"
     , INSTR('ORACLE ORAHOME BIORA','ORA',1,1)"②"
     , INSTR('ORACLE ORAHOME BIORA','ORA',1,2)"③"
     , INSTR('ORACLE ORAHOME BIORA','ORA',2,1)"④"
     , INSTR('ORACLE ORAHOME BIORA','ORA',2)"⑤"
     , INSTR('ORACLE ORAHOME BIORA','ORA',2,2)"⑥"
FROM DUAL;
--> 첫 번째 파라미터 값에 해당하는 문자열에서...(대상 문자열, 타겟)
--  두 번째 파라미터 값을 통해 넘겨준 문자열이 등자하는 위치를 찾아라~!!!
--  세 번째 파라미터 값은 찾기 시작하는... (즉 스캔을 시작하는) 위치
--  네 번째 파라미터 값은 몇 번째 등장하는 값을 찾을 것인지에 대한 설정(1은 생략 가능)
--==>>
/*
①                    ②        ③         ④         ⑤         ⑥
-------------------- ---------- ---------- ---------- ---------- ----------
ORACLE ORAHOME BIORA          1          8          8          8         18
*/

SELECT '나의오라클 집으로오라 합니다'"①"
     , INSTR('나의오라클 집으로오라 합니다', '오라', 1)"②"
     , INSTR('나의오라클 집으로오라 합니다', '오라', 2)"③"
     , INSTR('나의오라클 집으로오라 합니다', '오라', 10)"④"
     , INSTR('나의오라클 집으로오라 합니다', '오라', 11)"⑤"
FROM DUAL;
--> 마지막 파라미터(네 번째 파라미터) 값을 생략한 형태로 사용~!!!!
--==>> 나의오라클 집으로오라 합니다	3	3	10	0


--○ REVERSE()
SELECT 'ORACLE'"①"
     , REVERSE('ORACLE')"②"
     , REVERSE('오라클')"③"
FROM DUAL;
--> 대상 문자열을 거꾸로 반환한다( 단, 바이트 기반 처리이기때문에 2바이트인 한글은 제외)
--==>>ORACLE	ELCARO  ???

--○ 실습 대상 테이블 생성(TBL_FILES)
CREATE TABLE TBL_FILES
( FILENO    NUMBER(3)
, FILENAME  VARCHAR2(100)
);
--==>>Table TBL_FILES이(가) 생성되었습니다.

--○ 실습 데이터 입력
INSERT INTO TBL_FILES VALUES(1, 'C:\AAA\BBB\CCC\SALES.DOC');
INSERT INTO TBL_FILES VALUES(2, 'C:\AAA\PANMAE.XXLS');
INSERT INTO TBL_FILES VALUES(3, 'D:\RESEARCH.PPT');
INSERT INTO TBL_FILES VALUES(4, 'C:\DOCUMENTS\STUDY.HWP');
INSERT INTO TBL_FILES VALUES(5, 'C:\DOCUMENTS\TEMP\SQL.TXT');
INSERT INTO TBL_FILES VALUES(6, 'D:\SHARE\F\TEST.PNG');
INSERT INTO TBL_FILES VALUES(7, 'C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG');
INSERT INTO TBL_FILES VALUES(8, 'C:\ORACLESTUDY\20190328_01_SCOTT.SQL');
--==>>1 행 이(가) 삽입되었습니다.*8

--○ 확인
SELECT *
FROM TBL_FILES;
--==>
/*
1	C:\AAA\BBB\CCC\SALES.DOC
2	C:\AAA\PANMAE.XXLS
3	D:\RESEARCH.PPT
4	C:\DOCUMENTS\STUDY.HWP
5	C:\DOCUMENTS\TEMP\SQL.TXT
6	D:\SHARE\F\TEST.PNG
7	C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG
8	C:\ORACLESTUDY\20190328_01_SCOTT.SQL
*/

--○ 커밋
COMMIT;
--==>>커밋 완료.

SELECT FILENO"파일번호", FILENAME"파일명"
FROM TBL_FILES;
--==>>
/*
1	C:\AAA\BBB\CCC\SALES.DOC
2	C:\AAA\PANMAE.XXLS
3	D:\RESEARCH.PPT
4	C:\DOCUMENTS\STUDY.HWP
5	C:\DOCUMENTS\TEMP\SQL.TXT
6	D:\SHARE\F\TEST.PNG
7	C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG
8	C:\ORACLESTUDY\20190328_01_SCOTT.SQL
*/

/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	TEST.PNG
7	SPRING.JPG
8	20190328_01_SCOTT.SQL
*/

--○ TBL_FILES 테이블 대상으로 위와 같이 조회될 수 있도록
--   쿼리문을 작성한다.

--학생들 풀이
SELECT FILENO"파일번호", SUBSTR(FILENAME, INSTR(FILENAME,'\',-1)+1)"파일명"
FROM TBL_FILES;

SELECT FILENO"파일번호", SUBSTR(FILENAME, LENGTH(FILENAME)-INSTR(REVERSE(FILENAME),'\')+2)"파일명"
FROM TBL_FILES;

SELECT FILENO"파일번호", REVERSE(SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1)-1))"파일명"
FROM TBL_FILES;
--==>>
/*
파일번호    파일명                                                                                                 
---------- -------------------------------
         1 SALES.DOC                                                                                           
         2 PANMAE.XXLS                                                                                         
         3 RESEARCH.PPT                                                                                        
         4 STUDY.HWP                                                                                           
         5 SQL.TXT                                                                                             
         6 TEST.PNG                                                                                            
         7 SPRING.JPG                                                                                          
         8 20190328_01_SCOTT.SQL                                                                               
*/

--선생님 풀이
SELECT FILENO"파일번호", FILENAME"경로포함파일명", SUBSTR(FILENAME, 16, 9)"파일명"
FROM TBL_FILES
WHERE FILENO=1;
--==>>1	C:\AAA\BBB\CCC\SALES.DOC	SALES.DOC

SELECT FILENO"파일번호", FILENAME"경로포함파일명", REVERSE(FILENAME)"거꾸로된파일명"
FROM TBL_FILES;

SELECT FILENO"파일번호", FILENAME"경로포함파일명", SUBSTR(REVERSE(FILENAME),1,최초'\'가 등장하는위치-1)"거꾸로된파일명"
FROM TBL_FILES;

--최초'\'가 등장하는위치
INSTR(REVERSE(FILENAME),'\',1)  -- 마지막 매개변수 1생략

SELECT FILENO"파일번호", SUBSTR(REVERSE(FILENAME),1,INSTR(REVERSE(FILENAME),'\',1)-1)"거꾸로된파일명"
FROM TBL_FILES;

SELECT FILENO"파일번호", REVERSE(SUBSTR(REVERSE(FILENAME),1,INSTR(REVERSE(FILENAME),'\',1)-1))"거꾸로된파일명"
FROM TBL_FILES;
--==>>
/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	TEST.PNG
7	SPRING.JPG
8	20190328_01_SCOTT.SQL
*/

--○ LPAD() -- 순서주의
--> Byte 공간을 확보하여 왼쪽부터 문자로 채우는 기능을 가진 함수 
SELECT 'ORACLE'"①"
     , LPAD('ORACLE', 10, '*')"②"
FROM DUAL;
--==>>ORACLE	****ORACLE  
--> ① 10BYTE 공간을 확보한다                → 두번째 파라미터(매개변수)부터 먼저 본다.★
--  ⑤ 확보한 공간에 'ORACLE' 문자열을 담는다 → 첫 번째 파라미터 값에 의해
--  ③ 남아있는 BYTE 공간을 왼쪽부터 세번째 파라미터값으로 채운다
--  ④ 이렇게 구성된 최종 결과값을 반환한다.

--○ RPAD()
--> Byte 공간을 확보하여 오른쪽부터 문자로 채우는 기능을 가진 함수
SELECT 'ORACLE'"①"
     , RPAD('ORACLE', 10, '*')"②"
FROM DUAL;
--==>>ORACLE	ORACLE****  
--> ① 10BYTE 공간을 확보한다                → 두번째 파라미터(매개변수)부터 먼저 본다.
--  ⑤ 확보한 공간에 'ORACLE' 문자열을 담는다 → 첫 번째 파라미터 값에 의해
--  ③ 남아있는 BYTE 공간을 오른쪽부터 세번째 파라미터값으로 채운다
--  ④ 이렇게 구성된 최종 결과값을 반환한다.


--○ LTRIM()
SELECT 'ORAORAORACLEORACLE'"①"  --오라 오라 오라클 오라클
     , LTRIM('ORAORAORACLEORACLE', 'ORA')"②"
     , LTRIM('AAAORAORAORACLEORACLE', 'ORA')"③"
     , LTRIM('ORAoRAORACLEORACLE', 'ORA')"④"
     , LTRIM('ORA ORAORACLEORACLE', 'ORA')"⑤"
     , LTRIM('             ORACLE')"⑥" -- 왼쪽 공백 제거 함수로 활용(두 번째 파라미터 생략)
FROM DUAL;
--==>>
/*
①                 ②        ③        ④               ⑤               ⑥
------------------ --------- --------- --------------- ---------------- ------
ORAORAORACLEORACLE CLEORACLE CLEORACLE oRAORACLEORACLE  ORAORACLEORACLE ORACLE
*/
-- like손톱깎이
-- 통째로 잘라내는게 아니라 왼쪽끝(LTRIM)에서부터 잘라나감
-- 손톱을 버리고 손을 갖는다. substr와는 반대
-- 'ORA'통째로 검색하는게 아니라 O,R,A 따로 처리하는것
-- 대소문자 구별 (④)
-- 자르다가 멈추면 끝
-- 공백도 못잘라내기때문에 공백포함 문자열 반환(⑤)
-- 공백 제거하는 함수로 많이 사용(⑥)

--> 첫 번째 파라미터 값에 해당하는 문자열을 대상으로
--  왼쪽부터 연속적으로 두 번째 파라미터 값에서 지정한 글자와 같은 글자가 등장할 경우
--  이를 제거한 결과값을 반환한다
--  단, 완성형으로 처리되지 않는다.

--TRIM은 한글도 사용가능
SELECT LTRIM('이김신이김신이이신신김이신이이김김이신박이김신','이김신')"TEST"
FROM DUAL;
--==>박이김신

--○ RTRIM()
SELECT 'ORAORAORACLEORACLE'"①"  --오라 오라 오라클 오라클
     , RTRIM('ORAORAORACLEORACLE', 'ORA')"②"
     , RTRIM('AAAORAORAORACLEORACLE', 'ORA')"③"
     , RTRIM('ORAoRAORACLEORACLE', 'ORA')"④"
     , RTRIM('ORA ORAORACLEORACLE', 'ORA')"⑤"
     , RTRIM('ORACLE             ')"⑥" -- 오른쪽 공백 제거 함수로 활용(두 번째 파라미터 생략)
FROM DUAL;
--==>>
/*
①                 ②                 ③                    ④                 ⑤                  ⑥     
------------------ ------------------ --------------------- ------------------ ------------------- ------
ORAORAORACLEORACLE ORAORAORACLEORACLE AAAORAORAORACLEORACLE ORAoRAORACLEORACLE ORA ORAORACLEORACLE ORACLE

*/
--> 첫 번째 파라미터 값에 해당하는 문자열을 대상으로
--  오른쪽부터 연속적으로 두 번째 파라미터 값에서 지정한 글자와 같은 글자가 등장할 경우
--  이를 제거한 결과값을 반환한다
--  단, 완성형으로 처리되지 않는다.

--○ TRANSLATE() 
--> 1 : 1로 바꿔준다
SELECT TRANSLATE('MY ORACLE SERVER','ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')
FROM DUAL;
--==>>my oracle server

SELECT TRANSLATE('010-6575-2297','0123456789','영일이삼사오육칠팔구')
FROM DUAL;
--==>>영일영-육오칠오-이이구칠

--○ REPLACE()
--> 묶음으로 처리한다
SELECT REPLACE('MY ORACLE ORAHOME','ORA','오라')
FROM DUAL;
--==>MY 오라CLE 오라HOME

























