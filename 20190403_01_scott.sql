SELECT USER
FROM DUAL;
--==>> SCOTT

--■■■ UNION / UNION ALL ■■■--

--○ 실습 테이블 생성 (TBL_JUMUN)
CREATE TABLE TBL_JUMUN              -- 주문 테이블 생성
( JUNO      NUMBER                  -- 주문 번호
, JECODE    VARCHAR2(30)            -- 주문된 제품 코드
, JUSU      NUMBER                  -- 주문 수량
, JUDAY     DATE DEFAULT SYSDATE    -- 주문 일자
);
--==>> Table TBL_JUMUN이(가) 생성되었습니다.
--> 고객의 주문이 발생했을 경우 주문 내용에 대한 데이터가
--  입력될 수 있는 테이블

--○ 데이터 입력 → 고객의 주문 발생 / 접수
INSERT INTO TBL_JUMUN VALUES (1, '홈런볼', 20, TO_DATE('2001-11-01 09:00:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES (2, '꼬깔콘', 10, TO_DATE('2001-11-01 09:23:24', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES (3, '나쵸', 30, TO_DATE('2001-11-02 12:00:11', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES (4, '포카칩', 10, TO_DATE('2001-11-02 15:16:17', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES (5, '웨하스', 10, TO_DATE('2001-11-03 10:22:33', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES (6, '웨하스', 12, TO_DATE('2001-11-04 16:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES (7, '홈런볼', 50, TO_DATE('2001-11-06 11:11:11', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES (8, '포카칩', 40, TO_DATE('2001-11-10 19:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES (9, '꼬깔콘', 10, TO_DATE('2001-11-13 09:14:03', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES (10, '꿀꽤배기', 20, TO_DATE('2001-11-13 14:20:00', 'YYYY-MM-DD HH24:MI:SS'));
--==>> 1 행 이(가) 삽입되었습니다. * 10

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

--○ 확인
SELECT *
FROM TBL_JUMUN;
--==>>
/*
1	홈런볼	    20	2001-11-01 09:00:10
2	꼬칼콘	    10	2001-11-01 09:23:24
3	나쵸	    30	2001-11-02 12:00:11
4	포카칩	    10	2001-11-02 15:16:17
5	웨하스	    10	2001-11-03 10:22:33
6	웨하스	    12	2001-11-04 16:00:00
7	홈런볼	    50	2001-11-06 11:11:11
8	포카칩	    40	2001-11-10 19:00:00
9	꼬칼콘	    10	2001-11-13 09:14:03
10	꿀꽤배기	20	2001-11-13 14:20:00
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.


--○ 데이터 추가 입력 → 2001년 부터 시작된 주문이 현재(2019년)까지 계속 발생
INSERT INTO TBL_JUMUN VALUES (98765, '홈런볼', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES (98766, '뽀빠이', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES (98767, '포테토칩', 30, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES (98768, '웨하스', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES (98769, '웨하스', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES (98770, '꼬깔콘', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES (98771, '홈런볼', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES (98772, '초코송이', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES (98773, '홈런볼', 30, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES (98774, '초코칩', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.


--○ 확인
SELECT *
FROM TBL_JUMUN;
--==>>
/*
1	    홈런볼	    20	2001-11-01 09:00:10
2	    꼬칼콘	    10	2001-11-01 09:23:24
3	    나쵸	    30	2001-11-02 12:00:11
4	    포카칩	    10	2001-11-02 15:16:17
5	    웨하스	    10	2001-11-03 10:22:33
6	    웨하스	    12	2001-11-04 16:00:00
7	    홈런볼	    50	2001-11-06 11:11:11
8	    포카칩	    40	2001-11-10 19:00:00
9	    꼬칼콘	    10	2001-11-13 09:14:03
10	    꿀꽤배기	20	2001-11-13 14:20:00
                    :
                    :
98765	홈런볼	    10	2019-04-03 09:25:09
98766	뽀빠이	    20	2019-04-03 09:25:47
98767	포테토칩	30	2019-04-03 09:26:45
98768	웨하스	    10	2019-04-03 09:27:02
98769	웨하스	    20	2019-04-03 09:27:47
98770	꼬깔콘	    20	2019-04-03 09:28:22
98771	홈런볼	    20	2019-04-03 09:29:14
98772	초코송이	10	2019-04-03 09:29:44
98773	홈런볼	    30	2019-04-03 09:30:29
98774	초코칩	    20	2019-04-03 09:31:19
*/

--※ 과자 쇼핑몰 운영중
--   TBL_JUMUN 테이블이 너무 무거워진 상황
--   어플리케이션과의 연동으로 인해 주문 내역을 다른 테이블에
--   저장될 수 있도록 만드는 것은 불가능한 상황
--   기존의 모든 데이터를 덮어놓고 지우는 것도 불가능한 상황
--   → 결과적으로 현재까지 누적된 주문 데이터 중
--      금일 발생한 주문 내역을 제외하고 나머지를 다른 테이블(TBL_JUMUNBACKUP)로
--      데이터 이관을 수행할 계획


SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');
--==>>
/*
1	홈런볼	20	2001-11-01 09:00:10
2	꼬칼콘	10	2001-11-01 09:23:24
3	나쵸	30	2001-11-02 12:00:11
4	포카칩	10	2001-11-02 15:16:17
5	웨하스	10	2001-11-03 10:22:33
6	웨하스	12	2001-11-04 16:00:00
7	홈런볼	50	2001-11-06 11:11:11
8	포카칩	40	2001-11-10 19:00:00
9	꼬칼콘	10	2001-11-13 09:14:03
10	꿀꽤배기	20	2001-11-13 14:20:00
*/


--○ 위의 조회 결과로 TBL_JUMUNBACKUP 테이블 생성
CREATE TABLE TBL_JUMUNBACKUP
AS
SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');
--==> Table TBL_JUMUNBACKUP이(가) 생성되었습니다.


--○ 확인
SELECT *
FROM TBL_JUMUNBACKUP;
--==>>
/*
1	홈런볼	    20	2001-11-01 09:00:10
2	꼬칼콘	    10	2001-11-01 09:23:24
3	나쵸	    30	2001-11-02 12:00:11
4	포카칩	    10	2001-11-02 15:16:17
5	웨하스	    10	2001-11-03 10:22:33
6	웨하스	    12	2001-11-04 16:00:00
7	홈런볼	    50	2001-11-06 11:11:11
8	포카칩	    40	2001-11-10 19:00:00
9	꼬칼콘	    10	2001-11-13 09:14:03
10	꿀꽤배기	20	2001-11-13 14:20:00
*/
--> TBL_JUMUN 테이블의 데이터들 중
--  금일 주문내역 이외의 데이터는 모두 TBL_JUMUNBACKUPP 에 백업을 마친 상태


--○ TBL_JUMUN 테이블의 데이터들 중
--   백업을 마친 데이터들 삭제 → 금일 주문이 아닌 데이터들 제거
DELETE
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');
--==>> 10개 행 이(가) 삭제되었습니다.

-- 아직 제품 발송이 완료되지 않은 금일 주문 데이터를 제외하고
-- 이전의 모든 주문 데이터들이 삭제된 상황이므로
-- 테이블은 행(레코드)의 갯수가 줄어들어 배우 가벼워진 상황

--○ 확인
SELECT *
FROM TBL_JUMUN;
--==>>
/*
98765	홈런볼	    10	2019-04-03 09:25:09
98766	뽀빠이	    20	2019-04-03 09:25:47
98767	포테토칩	30	2019-04-03 09:26:45
98768	웨하스	    10	2019-04-03 09:27:02
98769	웨하스	    20	2019-04-03 09:27:47
98770	꼬깔콘	    20	2019-04-03 09:28:22
98771	홈런볼	    20	2019-04-03 09:29:14
98772	초코송이	10	2019-04-03 09:29:44
98773	홈런볼	    30	2019-04-03 09:30:29
98774	초코칩	    20	2019-04-03 09:31:19
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.

-- 그런데, 지금까지 주문받은 내역에 대한 정보를
-- 제품별 총 주문량으로 나타내야 할 상황이 발생하게 되었다.
-- 그렇다면 TBL_JUMUNBACKUP 테이블의 레코드(행)과
-- TBL_JUMUN 테이블의 레코드(행)을 합쳐서 하나의 테이블을
-- 조회하는 것과 같은 결과를 확인할 수 있도록 조회해야 한다.

-- 컬럼과 컬럼의 관계를 고려하여 테이블을 결합하고자 하는 경우 JOIN 을 사용하지만
-- 레코드(행)와 레코드(행)을 결합하고자 하는 경우 UNION / UNION ALL 을 사용할 수 있다.

SELECT *
FROM TBL_JUMUNBACKUP
UNION
SELECT *
FROM TBL_JUMUN;

SELECT *
FROM TBL_JUMUNBACKUP
UNION ALL
SELECT *
FROM TBL_JUMUN;


SELECT *
FROM TBL_JUMUN
UNION
SELECT *
FROM TBL_JUMUNBACKUP;
--==>> 
/*
1	    홈런볼	    20	2001-11-01 09:00:10
2	    꼬칼콘	    10	2001-11-01 09:23:24
3	    나쵸	    30	2001-11-02 12:00:11
4	    포카칩	    10	2001-11-02 15:16:17
5	    웨하스	    10	2001-11-03 10:22:33
6	    웨하스	    12	2001-11-04 16:00:00
7	    홈런볼	    50	2001-11-06 11:11:11
8	    포카칩	    40	2001-11-10 19:00:00
9	    꼬칼콘	    10	2001-11-13 09:14:03
10	    꿀꽤배기	20	2001-11-13 14:20:00
98765	홈런볼	    10	2019-04-03 09:25:09
98766	뽀빠이	    20	2019-04-03 09:25:47
98767	포테토칩	30	2019-04-03 09:26:45
98768	웨하스	    10	2019-04-03 09:27:02
98769	웨하스	    20	2019-04-03 09:27:47
98770	꼬깔콘	    20	2019-04-03 09:28:22
98771	홈런볼	    20	2019-04-03 09:29:14
98772	초코송이	10	2019-04-03 09:29:44
98773	홈런볼	    30	2019-04-03 09:30:29
98774	초코칩	    20	2019-04-03 09:31:19
*/

SELECT *
FROM TBL_JUMUN
UNION ALL
SELECT *
FROM TBL_JUMUNBACKUP;
--==>>
/*
98765	홈런볼	    10	2019-04-03 09:25:09
98766	뽀빠이	    20	2019-04-03 09:25:47
98767	포테토칩	30	2019-04-03 09:26:45
98768	웨하스	    10	2019-04-03 09:27:02
98769	웨하스	    20	2019-04-03 09:27:47
98770	꼬깔콘	    20	2019-04-03 09:28:22
98771	홈런볼	    20	2019-04-03 09:29:14
98772	초코송이	10	2019-04-03 09:29:44
98773	홈런볼	    30	2019-04-03 09:30:29
98774	초코칩	    20	2019-04-03 09:31:19
1	    홈런볼	    20	2001-11-01 09:00:10
2	    꼬칼콘	    10	2001-11-01 09:23:24
3	    나쵸	    30	2001-11-02 12:00:11
4	    포카칩	    10	2001-11-02 15:16:17
5	    웨하스	    10	2001-11-03 10:22:33
6	    웨하스	    12	2001-11-04 16:00:00
7	    홈런볼	    50	2001-11-06 11:11:11
8	    포카칩	    40	2001-11-10 19:00:00
9	    꼬칼콘	    10	2001-11-13 09:14:03
10	    꿀꽤배기	20	2001-11-13 14:20:00
*/

--※ UNION 은 항상 결과물이 첫 번째 컬럼을 기준으로
--   오름차순 정렬을 수행한다.
--   UNION ALL 은 결합된 순서대로 조회한 결과를 반환한다. (정렬 없음)
--   이로 인해 UNION 이 부하가 더 크다.
--   또한, UNION 은 결과물에서 중복된 행이 존재할 경우
--   중복을 제거하고 1개 행만 조회된 결과를 반환한다.

--   UNION ALL은 그냥 붙이는거 / UNION ALL은 첫번째 컬럼 기준 정렬하고 중복된 행 제거

--○ 지금까지 주문받은 모든 데이터를 통해 
--   제품별 총 주문량을 조회하는 쿼리문을 구성한다.
/*
----------------------------------------------------
    제품코드        총 주문량
----------------------------------------------------
*/

SELECT T.제품코드, SUM(T.주문량)
FROM
(
    SELECT JECODE"제품코드", JUSU"주문량"
    FROM TBL_JUMUN
    UNION ALL
    SELECT JECODE"제품코드", JUSU"주문량"
    FROM TBL_JUMUNBACKUP
)T
GROUP BY T.제품코드;
--==>>
/*
꼬깔콘	    40
포테토칩	30
웨하스	    52
초코칩	    20
뽀빠이	    20
나쵸	    30
초코송이	10
포카칩	    50
꿀꽤배기	20
홈런볼	   130
*/
--> 이 문제를 해결하는 과정에서는 UNION 을 사용해서는 안된다.
--  → JECODE 와 JUSU 를 조회하는 과정에서 중복된 행을 제거하는 상황 발생!!


--○ INTERSECT / MINUS (→ 교집합 / 차집합)

-- TBL_JUMUNBACKUP 테이블과 TBL_JUMUN 테이블에서
-- 제품코드와 주문량의 값이 똑같은 행만 추출하고자 한다.
SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>>
/*
웨하스	10
홈런볼	20
*/


--○ TBL_JUMUNBACKUP 테이블과 TBL_JUMUN 테이블에서
--   제품코드와 주문량의 값이 똑같은 행의 정보를
--   주문번호, 제품코드, 주문수량, 주문일자 항목으로 조회한다.

-- 방법1.
SELECT T2.JUNO"주문번호", T1.JECODE"제품코드", T1.JUSU"주문수량", T2.JUDAY"주문일자"
FROM 
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
)T2
JOIN
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)T1
ON T1.JECODE = T2.JECODE
AND T1.JUSU = T2.JUSU;

-- 방법2
SELECT T.*
FROM 
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
)T
--WHERE JECODE||JUSU IN ('홈런볼20','웨하스10');
--WHERE CONCAT(JECODE, JUSU) IN ('홈런볼20','웨하스10');
WHERE CONCAT(JECODE, JUSU) = ANY ('홈런볼20', '웨하스10');

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--> ('웨하스','10','홈런볼','20')

SELECT CONCAT(JECODE, JUSU)
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT CONCAT(JECODE, JUSU)
FROM TBL_JUMUN;

SELECT T.*
FROM 
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
)T
WHERE CONCAT(T.JECODE, T.JUSU) = ANY (SELECT CONCAT(JECODE, JUSU)
                                  FROM TBL_JUMUNBACKUP
                                  INTERSECT
                                  SELECT CONCAT(JECODE, JUSU)
                                  FROM TBL_JUMUN);
--==>>
/*
1	    홈런볼	20	2001-11-01 09:00:10
5	    웨하스	10	2001-11-03 10:22:33
98768	웨하스	10	2019-04-03 10:46:16
98771	홈런볼	20	2019-04-03 10:46:16
*/

SELECT *
FROM 
(
    SELECT *
    FROM TBL_JUMUN
    UNION ALL
    SELECT *
    FROM TBL_JUMUNBACKUP
)T,
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)Q
WHERE(T.JECODE = Q.JECODE AND T.JUSU = Q.JUSU);


--MINUS : 차집합

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>>
/*
웨하스	10
홈런볼	20
*/

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
MINUS
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>>
/*
꼬깔콘	    10
꿀꽤배기	20
나쵸	    30
웨하스	    12
포카칩	    10
포카칩	    40
홈런볼	    50
*/

/*
    A = {10, 20, 30, 40, 50}
    B = {10, 20, 30}
    
    A - B = {40, 50}
*/


SELECT D.DEPTNO, D.DNAME, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

-- CHECK!
SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP NATURAL JOIN DEPT;

SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP JOIN DEPT
USING(DEPTNO);
-- 권장하지않음













