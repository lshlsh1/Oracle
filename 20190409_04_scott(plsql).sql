SELECT USER
FROM DUAL;
--==>>SCOTT

----------------------------------------------------------------------------------------

--※ 참고

-- 1. INSERT, UPDATE, DELETE, (MERGE)
--==>> DML(Data Manipulation Language)
-- COMMIT / ROLLBACK 이 필요하다.

-- 2. CREATE, DROP, ALTER, (TRUNCATE)
--==>> DDL(Data definition Language)
-- 실행하면 자동으로 COMMIT(AUTO COMMIT)

-- 3. GRANT, REVOKE
--==>> DCL(DATA CONTROL LANGUAGE)
-- 실행하면 자동으로 COMMIT(AUTO COMMIT)

-- 4. COMMIT, ROLLBACK
--==> TCL(TRANSACTION CONTROL LANGUAGE)

--＊ TRANSACTION
-- 통신사 마일리지 - 결제금액 예시
-- 훈의(우리)   상현(국민)
--  100만원      0
--   70만원     30만원 
-- 둘 중 하나라도 수행이 제대로 안되면 ROLLBACK

-- 정적 PL/SQL문 → DML문, TCL문만 사용 가능하다
-- 동적 PL/SQL문 → DML문, DDL문, DCL문, TCL문 사용 가능하다.

-----------------------------------------------------------------------------------------

--■■■ PROCEDURE(프로시저) ■■■--

-- 1. PL/SQL에서 가장 대표적인 구조인 스토어드 프로시저는
--    개발자가 자주 작성해야 하는 업무의 흐름을
--    미리 작성하여 데이터베이스 내에 저장해 두었다가
--    필요할 때 마다 호출하여 실행할 수 있도록 처리해 주는 구문이다.

-- 2. 형식 및 구조
/*
CREATE [OR REPLACE] PROCEDURE 프로시저명
[(
    매개변수 IN 데이터타입       --생닭
  , 매개변수 OUT 데이터타입      --쇼핑백
  , 매개변수 INOUT 데이터타입    --쇼핑백에 담겨있는 생닭
)]
IS
    [-- 주요 변수 선언;]
BEGIN
    --실행구문
    ...
    [EXCEPTION
        --예외 처리 구문;]
END;
*/

--※ FUNCTION과 비교했을 때
--   『RETURN 반환자료형』부분이 존재하지 않으며,
--   『RETURN』문 자체도 존재하지 않으며,
--   프로시저 실행 시 넘겨주게 되는 매개변수의 종류는
--   IN, OUT, INOUT 으로 구분된다

-- 3.실행(호출)
/*
EXEC[UTE] 프로시저명[(인수1, 인수2, ...)];
*/

--○ INSERT 쿼리 실행을 프로시저로 작성(INSERT 프로시저)
--테이블에서 1:1관계가 바람직하다는것은 아니나 프로시저를 쉽게 익히기 위한 예시임

-- 실습 테이블 생성(TBL_STUDENTS)
CREATE TABLE TBL_STUDENTS
( ID    VARCHAR2(10)
, NAME  VARCHAR2(40)
, TEL   VARCHAR2(20)
, ADDR  VARCHAR2(100)
);
--==>Table TBL_STUDENTS이(가) 생성되었습니다.

--실습 테이블 생성(TBL_IDPW)
CREATE TABLE TBL_IDPW
( ID    VARCHAR2(10)
, PW    VARCHAR2(20)
, CONSTRAINT IDPW_ID_PK PRIMARY KEY(ID)
);
--==>>Table TBL_IDPW이(가) 생성되었습니다.

-- 두 테이블에 데이터 입력
INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
VALUES('superman','전훈의','010-1111-1111','제주도 서귀포시');
INSERT INTO TBL_IDPW(ID, PW)
VALUES('superman','java006$');
--==>>1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_STUDENTS;
--==>>superman	전훈의	010-1111-1111	제주도 서귀포시

SELECT *
FROM TBL_IDPW;
--==>>superman	java006$

-- 위의 업무를 프로시저(INSERT 프로시저, 입력 프로시저)를 생성하게 되면
EXEC PRC_STUDENTS_INSERT('batnam','java006$','남상현','010-2222-2222','서울');
-- 이와 같은 구문 한 줄로 양쪽 테이블에 데이터를 모두 제대로 입력할 수 있다.

-- 프로시저 생성(작성)
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_INSERT
(V_ID   IN TBL_IDPW.ID%TYPE
,V_PW   IN TBL_IDPW.PW%TYPE
,V_NAME IN TBL_STUDENTS.NAME%TYPE
,V_TEL  IN TBL_STUDENTS.TEL%TYPE
,V_ADDR IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    -- TBL_IDPW 테이블에 데이터 입력
    INSERT INTO TBL_IDPW(ID, PW)
    VALUES(V_ID, V_PW);
    
    -- TBL_STUDENTS 테이블에 데이터 입력
    INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
    VALUES(V_ID, V_NAME, V_TEL, V_ADDR);

    -- 커밋
    COMMIT;
END;
--==>>Procedure PRC_STUDENTS_INSERT이(가) 컴파일되었습니다.



--○ 데이터 입력 시 특정 항목의 데이터(학번, 이름, 국어점수, 영어점수, 수학점수)만 입력하면
--   내부적으로 총점, 평균, 등급 항목이 함께 입력 처리될 수 있도록 하는 
--   프로시저를 생성한다.
--   프로시저 명 : PRC_SUNGJUK_INSERT()
/*
실행 예)
EXEC PRC_SUNGJUK_INSERT(1, '이원영',90,80,70);

프로시저 호출로 처리된 결과)
학번  이름  국어점수    영어점수    수학점수    총점  평균  등급
 1   이원영    90          80          70      240   80    B
*/

CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( V_HAKBUN    IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME      IN TBL_SUNGJUK.NAME%TYPE
, V_KOR       IN TBL_SUNGJUK.KOR%TYPE
, V_ENG       IN TBL_SUNGJUK.ENG%TYPE
, V_MAT       IN TBL_SUNGJUK.MAT%TYPE
)
IS
    --INSERT 쿼리문을 수행하는데 필요한 주요 변수 선언
    V_TOT       TBL_SUNGJUK.TOT%TYPE;
    V_AVG       TBL_SUNGJUK.AVG%TYPE;
    V_GRADE     TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    -- 아래의 쿼리문 실행을 위해서는
    -- 선언한 변수들에 값을 담아내야 한다.
    V_TOT := V_KOR+V_ENG+V_MAT;
    V_AVG := V_TOT/3;
    IF (V_AVG>=90)    THEN V_GRADE :='A';
    ELSIF (V_AVG>=80) THEN V_GRADE :='B';
    ELSIF (V_AVG>=70) THEN V_GRADE :='C';
    ELSIF (V_AVG>=60) THEN V_GRADE :='D';
    ELSE V_GRADE :='F';
    END IF;            
    
    -- 위의 과정을 통해 담아낸 값들로
    -- INSERT 쿼리문 실행
    INSERT INTO TBL_SUNGJUK(HAKBUN,NAME,KOR,ENG,MAT,TOT,AVG,GRADE)
    VALUES (V_HAKBUN,V_NAME,V_KOR,V_ENG,V_MAT,V_TOT,V_AVG,V_GRADE);
    
    COMMIT;
END;
--==>>Procedure PRC_SUNGJUK_INSERT이(가) 컴파일되었습니다.


--○ TBL_SUNGJUK 테이블에서 특정 학생의 점수(학번, 국어점수, 영어점수, 수학점수)
--   데이터 수정 시 총점, 평균, 등급까지 수정하는 프로시저를 작성한다
--   프로시저 명 : PRC_SUNGJUK_UPDATE()
/*
실행 예)
EXEC PRC_SUNGJUK_UPDATE(1, 50, 50, 50);

프로시저 호출로 처리된 결과)
학번  이름  국어점수    영어점수    수학점수    총점  평균  등급
 1   이원영    50          50          50      150   50    F
*/
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN    IN TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR       IN TBL_SUNGJUK.KOR%TYPE
, V_ENG       IN TBL_SUNGJUK.ENG%TYPE
, V_MAT       IN TBL_SUNGJUK.MAT%TYPE
)
IS
    -- UPDATE 진행 시 필요한 데이터를 담을 주요 변수 선언
    V_TOT       TBL_SUNGJUK.TOT%TYPE;
    V_AVG       TBL_SUNGJUK.AVG%TYPE;
    V_GRADE     TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    -- 아래의 쿼리문 실행을 위해서는
    -- 선언한 변수들에 값을 담아내야 한다. 
    V_TOT := V_KOR+V_ENG+V_MAT;
    V_AVG := V_TOT/3;
    IF (V_AVG>=90)    THEN V_GRADE :='A';
    ELSIF (V_AVG>=80) THEN V_GRADE :='B';
    ELSIF (V_AVG>=70) THEN V_GRADE :='C';
    ELSIF (V_AVG>=60) THEN V_GRADE :='D';
    ELSE V_GRADE :='F';
    END IF;       
    
    -- UPDATE 쿼리문 수행
    UPDATE TBL_SUNGJUK
    SET KOR = V_KOR, ENG=V_ENG, MAT=V_MAT, TOT=V_TOT, AVG=V_AVG, GRADE=V_GRADE
    WHERE HAKBUN = V_HAKBUN;
    
    COMMIT;
END;
--==>>Procedure PRC_SUNGJUK_UPDATE이(가) 컴파일되었습니다.

--○ TBL_STUDENTS 테이블에서
--   전화번호와 주소 데이터를 수정하는(변경하는) 프로시저를 작성한다.
--   단, ID와 PW가 일치하는 경우에만 수정을 진행할 수 있도록 한다,
--   프로시저 명 : PRC_STUDENTS_UPDATE()
/*
실행 예)
EXEC PRC_STUDENTS_UPDATE('superman','java006$','010-9999-9999','경기');

프로시저 호출로 처리된 결과
superman	전훈의	010-9999-9999	경기
*/
CREATE OR REPLACE PROCEDURE PRC_STUDNETS_UPDATE
(V_ID   IN TBL_IDPW.ID%TYPE
,V_PW   IN TBL_IDPW.PW%TYPE
,V_TEL  IN TBL_STUDENTS.TEL%TYPE
,V_ADDR IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    UPDATE TBL_STUDENTS
    SET TEL=V_TEL, ADDR=V_ADDR
    WHERE ID = V_ID AND V_PW=(SELECT PW FROM TBL_IDPW WHERE ID=V_ID);
    
    COMMIT;
END;
--==>>Procedure PRC_STUDNETS_UPDATE이(가) 컴파일되었습니다.

--쌤 풀이

UPDATE 테이블명
SET 수정대상=수정내용
WHERE 조건

(
SELECT I.ID, I.PW, S.TEL, S.ADDR
FROM TBL_IDPW I JOIN TBL_STUDENTS S
ON I.ID = S.ID;
)T


UPDATE (SELECT I.ID, I.PW, S.TEL, S.ADDR
        FROM TBL_IDPW I JOIN TBL_STUDENTS S
        ON I.ID = S.ID;
        )T
SET T.TEL=입력받은전화번호, T.ADDR=입력받은주소
WHERE T.ID=입력받은 ID AND T.PW=입력받은PW;


CREATE OR REPLACE PROCEDURE PRC_STUDNETS_UPDATE
(V_ID   IN TBL_IDPW.ID%TYPE
,V_PW   IN TBL_IDPW.PW%TYPE
,V_TEL  IN TBL_STUDENTS.TEL%TYPE
,V_ADDR IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    UPDATE (SELECT I.ID, I.PW, S.TEL, S.ADDR
            FROM TBL_IDPW I JOIN TBL_STUDENTS S
            ON I.ID = S.ID
            )T
    SET T.TEL=V_TEL, T.ADDR=V_ADDR
    WHERE T.ID=V_ID AND T.PW=V_PW;    
    
    --커밋
    COMMIT;
END;
--==>Procedure PRC_STUDNETS_UPDATE이(가) 컴파일되었습니다.





--○ TBL_INSA 테이블을 대상으로 신규 데이터 입력 프로시저를 작성한다.
--   NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI,BASICPAY, SUDANG
--   구조를 갖고 있는 대상 테이블에 데이터 입력 시
--   NUM 컬럼(사원번호)의 값은
--   기존 부여된 사원번호 마지막 번호의 그 다음 번호를 자동으로 
--   입력 처리할 수 있는 프로시저로 구성한다.
--   프로시저 명: PRC_INSA_INSERT(NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI,BASICPAY, SUDANG);
/*
실행 예)
EXEC PRC_INSA_INSERT('김선아','901212-2234567',SYSDATE,'서울','010-5555-5555','영업부','대리',1000000,200000);

프로시저 호출로 처리된 결과)
1061 김선아 901212-2234567 SYSDATE 서울 010-5555-5555 영업부 대리 1000000,200000
*/
SELECT *
FROM TBL_INSA;

CREATE OR REPLACE PROCEDURE PRC_INSA_INSERT
( V_NAME        IN TBL_INSA.NAME%TYPE
, V_SSN         IN TBL_INSA.SSN%TYPE
, V_IBSADATE    IN TBL_INSA.IBSADATE%TYPE
, V_CITY        IN TBL_INSA.CITY%TYPE
, V_TEL         IN TBL_INSA.TEL%TYPE
, V_BUSEO       IN TBL_INSA.BUSEO%TYPE
, V_JIKWI       IN TBL_INSA.JIKWI%TYPE
, V_BASICPAY    IN TBL_INSA.BASICPAY%TYPE
, V_SUDANG      IN TBL_INSA.SUDANG%TYPE
)
IS
    V_NUM   NUMBER;
BEGIN
    SELECT MAX(NUM) INTO V_NUM 
    FROM TBL_INSA;
    
    INSERT INTO TBL_INSA(NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI,BASICPAY, SUDANG)
    VALUES(V_NUM+1, V_NAME, V_SSN , V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);

    COMMIT;
END;
--==>Procedure PRC_INSA_INSERT이(가) 컴파일되었습니다.

























