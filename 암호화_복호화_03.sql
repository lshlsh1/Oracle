SELECT USER
FROM DUAL;
--==>>SCOTT

--■■■ 암호화 복호화 테스트 ■■■--

--○ 테이블 생성
CREATE TABLE TBL_EXAM
( ID    NUMBER
, PW    VARCHAR2(20)
);
--==>>Table TBL_EXAM이(가) 생성되었습니다.

--○ 데이터 입력(암호화)
INSERT INTO TBL_EXAM(ID, PW) VALUES(1, CRYPTPACK.ENCRYPT('java006$', '1111'));
--==>> 1 행 이(가) 삽입되었습니다.
-- CRYPTPACK.ENCRYPT('암호', '키값')

--○ 데이터 조회
SELECT *
FROM TBL_EXAM;
--==>>1	??/\?

-- 공인인증서 개념
-- 키 값을 은행도 가지고 있고 나도 가지고 있음

--○ 데이터 조회
-- 다른 키값을 전해주는 경우
SELECT ID, CRYPTPACK.DECRYPT(PW, '2222')
FROM TBL_EXAM;
--==>>1	5?

-- 키값을 제대로 전해주는 경우
SELECT ID, CRYPTPACK.DECRYPT(PW, '1111')
FROM TBL_EXAM;
--==>>1	java006$

