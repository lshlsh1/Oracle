SELECT USER
FROM DUAL;

---■■■ HAVING ■■■--

--○ EMP 테이블에서 부서번호가 20, 30인 부서를 대상으로
--   부서의 총 급여가 10000 보다 적을 경우만 부서별 총 급여를 조회한다
SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)
GROUP BY DEPTNO;
--==>>
/*
30	9400
20	10875
*/

SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)
  AND SUM(SAL)<10000
GROUP BY DEPTNO;
--==>>에러발생
/* 그룹함수를 여기에서 사용할 수 없습니다
ORA-00934: group function is not allowed here
00934. 00000 -  "group function is not allowed here"
*Cause:    
*Action:
16행, 7열에서 오류 발생
*/

SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)
GROUP BY DEPTNO
HAVING SUM(SAL)<10000;
--==>>
/*
30	9400
*/

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO IN (20, 30)
   AND SUM(SAL)<10000;
--==>> 가능하긴 하지만 가급적이면 일반조건절은 WHERE 조건절로 사용하기를 권장
/*
30	9400
*/

--------------------------------------------------------------------------

--■■■ 중첩 그룹함수 / 분석함수 ■■■--

-- 그룹 함수 2 LEVEL 까지 중첩해서 사용할 수 있다.
-- 이마저도 MSSQL은 불가능하다
SELECT MAX(SUM(SAL))
FROM EMP
GROUP BY DEPTNO;
--==>>10875
-- 이게 최대

--RANK()

--DENSE_RANK()
--> ORACLE 9i 부터 적용.... MSSQL 2005부터 적용

--※ 하위 버전에서는 RANK()나 DENSE_RANK()를 사용할 수 없기 때문에
--   이를 대체하여 연산을 수행할 수 있는 방법을 강구해야한다.

-- 예를 들어, 급여의 순위를 구하고자 한다면...
-- 해당 사원의 급여보다 더 큰 값이 몇 개인지 확인한 후
-- 확인한 숫자에 +1 을 추가적으로 연산해주면 그것이 곧 등수가 된다.
SELECT ENAME, SAL
FROM EMP;

SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800;
--==>>13 --> SMITH의 급여 등수는 14등이라는 얘기

SELECT COUNT(*) + 1 
FROM EMP
WHERE SAL > 1600;
--==>> 7 --> ALLEN의 급여 등수

--※ 서브 상관 쿼리(상관 서브 쿼리)
--   메인 쿼리에 있는 테이블의 컬럼이
--   서브 쿼리의 조건절(WHERE절, HAVING절)에 사용되는 경우
--   우리는 이 쿼리문을 서브 상관 쿼리 라고 부른다
SELECT ENAME"사원명", SAL"급여", 1"급여등수"
FROM EMP;

SELECT ENAME"사원명", SAL"급여", (1)"급여등수"
FROM EMP;

SELECT ENAME"사원명", SAL"급여"
     , (SELECT COUNT(*) + 1
        FROM EMP E2
        WHERE E2.SAL > E1.SAL)"급여등수"
FROM EMP E1 -- 테이블 별칭
ORDER BY 3;
--==>>
/*
KING	5000	1
FORD	3000	2
SCOTT	3000	2
JONES	2975	4
BLAKE	2850	5
CLARK	2450	6
ALLEN	1600	7
TURNER	1500	8
MILLER	1300	9
WARD	1250	10
MARTIN	1250	10
ADAMS	1100	12
JAMES	950	    13
SMITH	800 	14
*/

--○ EMP 테이블을 대상으로
--   사원명, 급여, 부서번호, 부서내급여등수, 전체급여등수 항목을 조회한다
--   단, RANK()함수를 사용하지 않고, 상관 서브 쿼리를 활용할 수 있도록 한다.
SELECT *
FROM EMP;

SELECT ENAME"사원명", SAL"급여", DEPTNO"부서번호" 
     ,( SELECT COUNT(*)+1
        FROM EMP E3
        WHERE E3.DEPTNO = E1.DEPTNO AND E3.SAL > E1.SAL
        )"부서내급여등수"
     , (SELECT COUNT(*)+1
        FROM EMP E2
        WHERE E1.SAL>E2.SAL)"전체급여등수"
FROM EMP E1;

SELECT ENAME"사원명", SAL"급여", DEPTNO"부서번호" 
     ,( SELECT COUNT(*)+1
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO AND E2.SAL > E1.SAL)"부서내급여등수"
     , (SELECT COUNT(*)+1
        FROM EMP E2
        WHERE E1.SAL>E2.SAL)"전체급여등수"
FROM EMP E1
ORDER BY E1.DEPTNO, E1.SAL DESC;
--==>>
/*
KING	5000	10	1	14
CLARK	2450	10	2	9
MILLER	1300	10	3	6
SCOTT	3000	20	1	12
FORD	3000	20	1	12
JONES	2975	20	3	11
ADAMS	1100	20	4	3
SMITH	800 	20	5	1
BLAKE	2850	30	1	10
ALLEN	1600	30	2	8
TURNER	1500	30	3	7
MARTIN	1250	30	4	4
WARD	1250	30	4	4
JAMES	950	    30	6	2
*/

ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD';
--==>>Session이(가) 변경되었습니다.

--○ EMP 테이블을 대상으로 다음과 같이 조회할 수 있도록 한다.
/*
--------------------------------------------------------------
  사원명   부서번호     입사일   급여    부서내입사별급여누적
--------------------------------------------------------------
 CLARK	    10	    1981-06-09	2450        2450
 KING	    10	    1981-11-17	5000        7450
 MILLER	    10	    1982-01-23	1300        8750
 SMITH	    20	    1980-12-17	800          800
 JONES	    20	    1981-04-02	2975        3775
 FORD	    20	    1981-12-03	3000         :
 SCOTT	    20	    1987-07-13	3000         :
 ADAMS	    20	    1987-07-13	1100
 ALLEN	    30	    1981-02-20	1600
 WARD	    30	    1981-02-22	1250
 BLAKE	    30	    1981-05-01	2850
 TURNER	    30	    1981-09-08	1500
 MARTIN	    30	    1981-09-28	1250
 JAMES	    30	    1981-12-03	950
*/

SELECT ENAME, DEPTNO, HIREDATE, SAL
     , (SELECT SUM(SAL)
        FROM EMP
        WHERE E1.DEPTNO = DEPTNO AND E1.HIREDATE >= HIREDATE
     )"부서내입사별급여누적"
FROM EMP E1
ORDER BY DEPTNO, HIREDATE;
--==>>
/*
CLARK	10	1981-06-09	2450	2450
KING	10	1981-11-17	5000	7450
MILLER	10	1982-01-23	1300	8750
SMITH	20	1980-12-17	800	    800
JONES	20	1981-04-02	2975	3775
FORD	20	1981-12-03	3000	6775
SCOTT	20	1987-07-13	3000	10875
ADAMS	20	1987-07-13	1100	10875
ALLEN	30	1981-02-20	1600	1600
WARD	30	1981-02-22	1250	2850
BLAKE	30	1981-05-01	2850	5700
TURNER	30	1981-09-08	1500	7200
MARTIN	30	1981-09-28	1250	8450
JAMES	30	1981-12-03	950 	9400
*/

--○ 위의 결과를 기반으로 입사한 사원의 수가 제일 많았을 때의
--   입사년월과 인원수를 조회할 수 있는 쿼리문을 구성한다.
/*
-----------------------------------
    입사년월        인원수
-----------------------------------
    19XX-XX          XX
-----------------------------------
*/

SELECT *
FROM TBL_EMP;

SELECT *
FROM
(
SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"입사년월", COUNT(*)"인원수"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
)T
WHERE T.인원수 = (SELECT MAX(COUNT(*)) 
                  FROM TBL_EMP
                  GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM'));

--선생님 풀이
SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"입사년월", COUNT(*)"인원수"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
--==>>
/*
1981-05	1
1981-12	2
1982-01	1
1981-09	2
2019-04	5
1981-02	2
1981-11	1
1980-12	1
1981-04	1
1987-07	2
1981-06	1
*/


SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"입사년월", COUNT(*)"인원수"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*)=5;
--==>>2019-04	5

SELECT MAX(COUNT(*)) 
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
--==>>5

SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"입사년월", COUNT(*)"인원수"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*)=(SELECT MAX(COUNT(*)) 
                 FROM TBL_EMP
                 GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM'));
--==>> 2019-04	5

SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"입사년월", COUNT(*)"인원수"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*)=(SELECT MAX(COUNT(*)) 
                 FROM EMP
                 GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM'));
--==>>
/*
1981-12	2
1981-09	2
1981-02	2
1987-07	2
*/

-----------------------------------------------------------------

--■■■ ROW_NUMBER() ■■■--
SELECT ROW_NUMBER() OVER(ORDER BY SAL DESC)"테스트"
     , ENAME"사원명", SAL"급여", HIREDATE"입사일"
FROM EMP;
--==>>
/*
1	KING	5000	1981-11-17
2	FORD	3000	1981-12-03
3	SCOTT	3000	1987-07-13
4	JONES	2975	1981-04-02
5	BLAKE	2850	1981-05-01
6	CLARK	2450	1981-06-09
7	ALLEN	1600	1981-02-20
8	TURNER	1500	1981-09-08
9	MILLER	1300	1982-01-23
10	WARD	1250	1981-02-22
11	MARTIN	1250	1981-09-28
12	ADAMS	1100	1987-07-13
13	JAMES	950	    1981-12-03
14	SMITH	800	    1980-12-17
*/

SELECT ROW_NUMBER() OVER(ORDER BY SAL DESC)"테스트"
     , ENAME"사원명", SAL"급여", HIREDATE"입사일"
FROM EMP
ORDER BY ENAME;

--※ 게시판의 게시물 번호를 SEQUENCE나 IDENTITY를 사용하게 되면
--   게시물을 삭제했을 경우 삭제한 게시물의 자리에 다음 번호를 가진
--   게시물이 등록되는 상황이 발생하게 된다
--   이는 보안 측면에서나 미관상 바람직하지 않은 상황일 수 있기 때문에
--   ROW_NUMBER()의 사용을 고려해볼 수 있다.
--   관리의 목적으로 사용할 때에는 SEQUENCE나 IDENTITY를 사용하지만
--   단순히 게시물을 목록화하여 사용자에게 리스트 형식으로 보여줄 때에는
--   사용하지 않는 것이 좋다.

CREATE TABLE TBL_AAA
( NO    NUMBER
, NAME  VARCHAR2(30)
, GRADE CHAR(4)
);
--==>>Table TBL_AAA이(가) 생성되었습니다.

INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(1, '이지혜', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(2, '이기승', 'B');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(3, '윤희진', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(4, '권홍비', 'C');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(5, '권홍비', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(6, '이기승', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(7, '이기승', 'A');
--==>> 1 행 이(가) 삽입되었습니다.

COMMIT;
--==>>커밋 완료.

SELECT *
FROM TBL_AAA;

UPDATE TBL_AAA
SET GRADE='C'
WHERE NAME='이기승';
--==>> 이기승 모두 C로 바뀜

UPDATE TBL_AAA
SET GRADE='C'
WHERE GRADE='A';
--=>> GRADE 점수 A가 모두 C로 바뀜

DELETE
FROM TBL_AAA
WHERE NO=6;

--○ SEQUENCE (시퀀스 : 주문번호) 생성
--   → 사전적인 의미 : 1.(일련의) 연속적인 사건들 2.(사건,행동 등의) 순서


CREATE SEQUENCE SEQ_BOARD -- 시퀀스 생성 기본 구문(MSSQL의 IDENTITY와 동일한 개념)
START WITH 1              -- 시작값
INCREMENT BY 1            -- 증가값
NOMAXVALUE                -- 최대값 제한 없음
NOCACHE;                  -- 캐시 사용 안함(없음)
--==>>Sequence SEQ_BOARD이(가) 생성되었습니다.

--○ 테이블 생성
CREATE TABLE TBL_BOARD          -- TBL_BOARD 이름의 테이블 생성 → 게시판
(   NO          NUMBER          --게시물 번호        Ⅹ
,   TITLE       VARCHAR2(50)    --게시물 제목        ○
,   CONTENTS    VARCHAR2(2000)  --게시물 내용정보    ○
,   NAME        VARCHAR2(20)    --게시물 작성자      △
,   PW          VARCHAR2(20)    --게시물 비밀번호    △
,   CREATED     DATE DEFAULT SYSDATE --게시물 작성일 Ⅹ
);
--==>>Table TBL_BOARD이(가) 생성되었습니다.

--○ 데이터 입력 → 게시판에 게시물 작성
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '앗싸~1등', '내가 1등이지롱', '전훈의', 'JAVA006$', DEFAULT);
--==>>1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '건강관리','다들 건강 챙깁시당','유진석', 'JAVA006$', DEFAULT);

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '오늘은','점심 뭐 먹지....','최보라','JAVA006$',DEFAULT);

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '오늘은','미세먼지 없나?','정임혜','JAVA006$',DEFAULT);

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '공부하고 싶은데','뒤에서 잘 안보여요','조현우','JAVA006$',DEFAULT);

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '질문있습니다', '쉬었다 하면 안되나요','남상현','JAVA006$',DEFAULT);

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL,'질문있습니다','생각나면 다시 질문할게요','한승원','JAVA006$',DEFAULT);
--==>>1 행 이(가) 삽입되었습니다.*7

SELECT *
FROM TBL_BOARD;

--○ COMMIT
COMMIT;
--==>>커밋 완료.


--○ 게시물 삭제
DELETE
FROM TBL_BOARD
WHERE NO=4;

ROLLBACK;

--○ 게시물 작성
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '졸려요','전 그냥 잘래요','윤희진','JAVA006$',DEFAULT);
--==>>1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_BOARD;

--○ 게시물 삭제
DELETE
FROM TBL_BOARD
WHERE NO=2;

DELETE
FROM TBL_BOARD
WHERE NO=8;

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '저는요','잘지내고 있습니다','이원영','JAVA006$',DEFAULT);
--==>>1 행 이(가) 삽입되었습니다.

--○ 커밋
COMMIT;
--==>>커밋 완료.

SELECT *
FROM TBL_BOARD;
--==>>
/*      
1	앗싸~1등	        내가 1등이지롱	        전훈의	JAVA006$	2019-04-02
3	오늘은	        점심 뭐 먹지....	        최보라	JAVA006$	2019-04-02
5	공부하고 싶은데	뒤에서 잘 안보여요	    조현우	JAVA006$	2019-04-02
6	질문있습니다	    쉬었다 하면 안되나요	    남상현	JAVA006$	2019-04-02
7	질문있습니다  	생각나면 다시 질문할게요	한승원	JAVA006$	2019-04-02
9	저는요	        잘지내고 있습니다	    이원영	JAVA006$	2019-04-02
*/

SELECT ROW_NUMBER() OVER(ORDER BY CREATED)"글번호"
     , TITLE"제목", NAME"작성자", CREATED"작성일"
FROM TBL_BOARD
ORDER BY 4 DESC;
--==>>
/*
6	저는요	        이원영	2019-04-02
5	질문있습니다	    한승원	2019-04-02
4	질문있습니다	    남상현	2019-04-02
3	공부하고 싶은데	조현우	2019-04-02
2	오늘은	        최보라	2019-04-02
1	앗싸~1등       	전훈의	2019-04-02
*/

--○ 게시물 작성
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '오빠','저 맘에 안들죠','김선아','JAVA006$',DEFAULT);
--==>>1 행 이(가) 삽입되었습니다.

SELECT ROW_NUMBER() OVER(ORDER BY CREATED)"글번호"
     , TITLE"제목", NAME"작성자", CREATED"작성일"
FROM TBL_BOARD
ORDER BY 4 DESC;
--==>>
/*
7	오빠          	김선아	2019-04-02
6	저는요	        이원영	2019-04-02
5	질문있습니다	    한승원	2019-04-02
4	질문있습니다	    남상현	2019-04-02
3	공부하고 싶은데	조현우	2019-04-02
2	오늘은	        최보라	2019-04-02
1	앗싸~1등	        전훈의	2019-04-02
*/

--○ 게시물 삭제
DELETE
FROM TBL_BOARD
WHERE NO=7;
--==>>1 행 이(가) 삭제되었습니다.

SELECT ROW_NUMBER() OVER(ORDER BY CREATED)"글번호"
     , TITLE"제목", NAME"작성자", CREATED"작성일"
FROM TBL_BOARD
ORDER BY 4 DESC;
--==>>
/*
6	오빠	            김선아	2019-04-02
5	저는요	        이원영	2019-04-02
4	질문있습니다	    남상현	2019-04-02
3	공부하고 싶은데	조현우	2019-04-02
2	오늘은	        최보라	2019-04-02
1	앗싸~1등	        전훈의	2019-04-02
*/

-----------------------------------------------------------------------------------

--■■■ JOIN(조인) ■■■--★★중요

-- 1. SQL 1992 CODE
SELECT *
FROM EMP, DEPT;
--> 수학에서 말하는 데카르트 곱(Catersian Product)
--  두 테이블을 합친(결합한) 모든 경우의 수

--Equi join : 서로 정확히 일치하는 데이터들끼리 연결시키는 결합★ 가장 많이 씀
SELECT *
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

SELECT *
FROM EMP E, DEPT D -- 별칭쓰기
WHERE E.DEPTNO = D.DEPTNO;

--Non Equi join : 범위 안에 적합한 데이터들끼리 연결시키는 결합
SELECT *
FROM SALGRADE;

SELECT *
FROM EMP;

SELECT *
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- Equi Join 시 『(+)』 를 활용한 결합 방법
SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO;

SELECT *
FROM TBL_DEPT;
--==>> 조인했을때 개발부 등장X
SELECT *
FROM TBL_EMP;
--==>>조인했을때 조인성~ 원빈까지 출력X
-- 결합할 대상이 없는 경우 출력되지 않음
-- TBL_EMP는 19건이지만 총 14건의 데이터가 결합되어 조회된 상황
-- 즉 부서번호를 갖지 못한 사원들은 모두 누락~!!!

SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO(+);
-- (+)기호가 있는 쪽이 주인공같지만 ㄴㄴ
-- E.DEPTNO를 짝맞춰 출력하고 남는 D.DPTNO 출력
--> 총 19건 데이터 결합되어 조회됨
--  즉, 부서번호를 갖지 못한 사원들도 모두 조회된 상황

SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
-- 총 16건의 데이터가 결합되어 조회된 상황
-- 즉, 부서에 소속된 사람이 아무도 없는 부서도 모두 조회된 상황

-- ※(+)가 없는 쪽 테이블의 데이터를 모두 메모리에 적재한 후
--   (+)가 있는 쪽 테이블의 데이터를 하나하나 확인하여 결합시키는 형태로
--   JOIN이 이루어진다.

--==>>
/*
7369	SMITH	CLERK   	7902	1980-12-17	800		20	20	    RESEARCH	DALLAS
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	30	30	SALES	    CHICAGO
7521	WARD	SALESMAN	7698	1981-02-22	1250	500	30	30	SALES	    CHICAGO
7566	JONES	MANAGER 	7839	1981-04-02	2975		20	20	RESEARCH	DALLAS
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	140030	30	SALES   	CHICAGO
7698	BLAKE	MANAGER	    7839	1981-05-01	2850		30	30	SALES	    CHICAGO
7782	CLARK	MANAGER	    7839	1981-06-09	2450		10	10	ACCOUNTING	NEW YORK
7788	SCOTT	ANALYST	    7566	1987-07-13	3000		20	20	RESEARCH	DALLAS
7839	KING	PRESIDENT		    1981-11-17	5000		10	10	ACCOUNTING	NEW YORK
7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	30	30	SALES	    CHICAGO
7876	ADAMS	CLERK	    7788	1987-07-13	1100		20	20	RESEARCH	DALLAS
7900	JAMES	CLERK	    7698	1981-12-03	950		30	30	    SALES	    CHICAGO
7902	FORD	ANALYST	    7566	1981-12-03	3000		20	20	RESEARCH	DALLAS
7934	MILLER	CLERK	    7782	1982-01-23	1300		10	10	ACCOUNTING	NEW YORK
                                                                50	개발부	    서울
                                                                40	OPERATIONS	BOSTON */                                                     
SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO(+);
-- 위와 같은 이유로 이러한 형태의 JOIN 구문은 존재하지 않는다.

-- 2. SQL 1999 CODE → 『JOIN』키워드 등장 → JOIN의 유형 명시
--                      결합 조건은 『WHERE』 대신 『ON』 사용

-- CROSS JOIN
SELECT *
FROM EMP, DEPT;

SELECT *
FROM EMP CROSS JOIN DEPT;


-- INNER JOIN
SELECT *
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM EMP E INNER JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

--※ INNER JOIN시 INNER는 생략 가능
SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

--OUTER JOIN
SELECT *
FROM TBL_EMP E LEFT OUTER JOIN TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO;

--※ 방향이 지정된 쪽이 테이블(→ LEFT)의 데이터를 모두 메모리에 적재한 후
--   방향이 지정되지 않은 쪽 테이블들의 데이터를 하나하나 확인하여 결합시키는 형태로
--   JOIN이 이루어진다.
SELECT *
FROM TBL_EMP E RIGHT OUTER JOIN TBL_DEPT D
ON E.DEPTNO= D.DEPTNO;

SELECT *
FROM TBL_EMP E FULL OUTER JOIN TBL_DEPT D
ON E.DEPTNO= D.DEPTNO;
-- 양쪽 모두의 데이터 

--※ OUTER JOIN에서 OUTER는 생략 가능
--OUTER JOIN
SELECT *
FROM TBL_EMP E LEFT JOIN TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO;

SELECT *
FROM TBL_EMP E RIGHT JOIN TBL_DEPT D
ON E.DEPTNO= D.DEPTNO;

SELECT *
FROM TBL_EMP E FULL JOIN TBL_DEPT D
ON E.DEPTNO= D.DEPTNO;

--INNER JOIN
SELECT *
FROM TBL_EMP E JOIN TBL_DEPT D
ON E.DEPTNO= D.DEPTNO;

-----------------------------------------------------
SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
--이 결과에서... 직종이 CLERK은 사원들만 조회....

SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
AND JOB = 'CLERK';
-- 이렇게 쿼리문을 구성해도 조회하는 데는 문제가 없다.
-- 그러나 ON은 결합조건이므로

SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB = 'CLERK';
-- 이런식으로 쿼리문을 구성하기를 권장한다.
-- ON과 WHERE를 구분하여 사용
-----------------------------------------------------

--○ EMP 테이블과 DEPT 테이블에서
--   직종이 MANAGER와 CLERK인 사원들만
--   부서번호, 부서명, 사원명, 직종명, 급여 항목을 조회한다.
SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E, DEPT D
ON E.DEPTNO = D.DEPTNO;
--==>>에러발생
/*
ORA-00933: SQL command not properly ended
00933. 00000 -  "SQL command not properly ended"
*Cause:    
*Action:
694행, 1열에서 오류 발생
*/
--> 두 테이블 간 중복되는 컬럼에 대한 소속 테이블을 정해줘야(명시해야)한다

SELECT DNAME, ENAME, JOB, SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--> 두 테이블간 중복되는 컬럼이 존재하지 않는 조회 구문은
--  에러 발생하지 않는다.

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E, DEPT D
ON E.DEPTNO = D.DEPTNO;
--> 두 테이블 간 중복되는 컬럼에 대해 소속 테이블을 명시하는 경우
--  부서, 사원 중 어떤 테이블을 지정해도
--  쿼리문 수행에 대한 결과 반환에 문제가 없다
--  ※ 하지만
--     두 테이블 간 중복되는 컬럼에 대해 소속 테이블을 명시하는 경우
--     부모 테이블의 컬럼을 참조할 수 있도록 해야 한다.
SELECT *
FROM DETP;  -- 부모 테이블

SELECT *
FROM EMP;   -- 자식 테이블

-- ※ 부모 자식 테이블 관계를 명확히 정리할 수 있도록 한다.

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--> 두 테이블 간 중복된 컬럼이 아니더라도
-- 소속 테이블을 명시할 수 있도록 권장한다.

SELECT D.DEPTNO"부서번호", D.DNAME"부서명", E.ENAME"사원명", E.JOB"직종명", E.SAL"급여"
FROM EMP E JOIN  DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB = 'MANAGER'
   OR JOB = 'CLERK';
/*
① JOIN상태에서 오라클은 양쪽 테이블을 다 확인하므로 효율을 위해서 앞에 테이블 이름을 꼭 붙이도록하자.
② 겹치는 칼럼은 부모테이블을 넣어야함
   부모는 칼럼안의 데이터를 하나씩 가지고있는 테이블
   EMP와 DEPT의 DEPTNO를 비교했을때 DEPT가 부모테이블이다.
*/

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E LEFT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT E.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E LEFT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

---
SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E RIGHT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
-- 부모테이블 참조
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E RIGHT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
-- 자식테이블 참조
-- 부서번호가 안나옴

--○ SELF JOIN(자기 조인)

-- EMP 테이블의 정보를 다음과 같이 조회할 수 있도록 한다.
/*
------------------------------------------------------
사원번호 사원명 직종명 관리자번호 관리자명 관리자직종명
------------------------------------------------------
 7369    SMITH  CLERK   7902     FORD      ANALTST
------------------------------------------------------
*/

SELECT *
FROM EMP;

SELECT E.EMPNO"사원번호", E.ENAME"사원명", E.JOB"직종명", E.MGR"관리자번호", E2.ENAME"관리자명", E2.JOB"관리자직종명"
FROM EMP E LEFT JOIN EMP E2
ON E.MGR = E2.EMPNO
ORDER BY 1;

--○ 선생님 풀이
/*
   E      E      E       E         E        E  
 EMPNO  ENAME   JOB     MGR
                       EMPNO     ENAME      JOB
------------------------------------------------------
사원번호 사원명 직종명 관리자번호 관리자명 관리자직종명
------------------------------------------------------
 7369    SMITH  CLERK   7902     FORD      ANALTST
 
  EMP     EMP    EMP     EMP      EMP        EMP
------------------------------①
                         EMP      EMP        EMP
                        ------------------------------②
*/
SELECT EMPNO, ENAME, JOB, MGR
FROM EMP;

SELECT EMPNO, ENAME, JOB, MGR
FROM EMP;

SELECT E1.EMPNO"사원번호", E1.ENAME"사원명", E1.JOB"직종명"
     , E1.MGR --E2.EMPNO라고 구성해도 상관없음
     , E2.ENAME"관리자명", E2.JOB"관리자직종명"
FROM EMP E1 LEFT JOIN EMP E2
ON E1.MGR = E2.EMPNO;
--==>>KING사원 출력될 수 있도록 LEFT JOIN T사용






































