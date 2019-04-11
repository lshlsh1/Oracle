--○ TBL_입고 테이블에서 입고수량을 수정(변경)하는 프로시저를 작성한다
--   프로시저 명 : PRC_입고_UPDATE(입고번호, 변경할입고수량);

CREATE OR REPLACE PROCEDURE PRC_입고_UPDATE
( V_입고번호        IN TBL_입고.입고번호%TYPE
, V_변경할입고수량  IN TBL_입고.입고수량%TYPE
)
IS
 V_상품코드          TBL_상품.상품코드%TYPE;
 V_원래입고수량       TBL_입고.입고수량%TYPE;
 
 
BEGIN
    SELECT 상품코드 INTO V_상품코드 FROM TBL_입고 WHERE 입고번호=V_입고번호;
    SELECT 입고수량 INTO V_원래입고수량 FROM TBL_입고 WHERE 입고번호=V_입고번호;
 
    

    UPDATE TBL_입고
    SET 입고수량 = V_변경할입고수량
    WHERE 입고번호=V_입고번호;
    
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_원래입고수량 + V_변경할입고수량
    WHERE 상품코드 = V_상품코드;

END;
--==>>Procedure PRC_입고_UPDATE이(가) 컴파일되었습니다.


--○ TBL_출고 테이블에서 출고수량을 삭제하는 프로시저를 작성한다.
--   프로시저 명 : PRC_출고_DELETE(출고번호);
CREATE OR REPLACE PROCEDURE PRC_출고_DELETE
( V_출고번호 IN TBL_출고.출고번호%TYPE )
IS
  V_출고수량    TBL_출고.출고수량%TYPE;
  V_상품코드    TBL_출고.상품코드%TYPE;
BEGIN
    SELECT 출고수량 INTO V_출고수량 FROM TBL_출고 WHERE 출고번호=V_출고번호;
    SELECT 상품코드 INTO V_상품코드 FROM TBL_출고 WHERE 출고번호=V_출고번호;
    
    DELETE 
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;
    
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_출고수량
    WHERE 상품코드 =V_상품코드;
END;
--==>Procedure PRC_출고_DELETE이(가) 컴파일되었습니다.

--○ TBL_입고 테이블에서 입고수량을 삭제하는 프로시저를 작성한다
--   프로시저 명 : PRC_입고_DELETE(입고번호);
--   단, 재고가 마이너스가 되지 않게.
CREATE OR REPLACE PROCEDURE PRC_입고_DELETE
( V_입고번호 IN TBL_입고.입고번호%TYPE)
IS
  V_상품코드 TBL_입고.상품코드%TYPE;
  V_입고수량 TBL_입고.입고수량%TYPE;
  V_재고수량 TBL_상품.재고수량%TYPE;
  USER_DEFINE_ERROR EXCEPTION;
BEGIN
    SELECT 상품코드,입고수량 INTO V_상품코드,V_입고수량 FROM TBL_입고 WHERE 입고번호=V_입고번호;
    SELECT 재고수량 INTO V_재고수량 FROM TBL_상품 WHERE 상품코드=V_상품코드;
    
    IF (V_입고수량>V_재고수량)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    DELETE
    FROM TBL_입고
    WHERE 입고번호=V_입고번호;

    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_입고수량
    WHERE 상품코드=V_상품코드;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '재고 부족~!!!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>>Procedure PRC_입고_DELETE이(가) 컴파일되었습니다.

--■■■ CURSOR(커서) ■■■--

-- 1. 오라클에서 하나의 레코드가 아닌 여러 레코드로 구성된
--    작업 영역에서 SQL문을 실행하고 그 과정에서 발생한 정보를
--    저장하기 위하여 커서(CURSER)를 사용하며,
--    커서에는 암시적 커서와 명시적 커서가 있다.


-- 2. 암시적 커서는 모든 SQL 문에 존재하며
--    SQL문 실행 후 오직 하나의 행(ROW)만 출력하게 된다.
--    그러나 SQL문을 실행한 결과물(RESULT SET)이
--    여러 행(ROW)으로 구성된 경우
--    커서(CURSOR)를 명시적으로 선언해야 여러 행(ROW)을 다룰 수 있다.

--○ 커서 이용 전 상황(단일 행 접근 시)
SET SERVEROUTPUT ON;

DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA
    WHERE NUM=1001;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME||', '||V_TEL);
END;
--==>>홍길동, 011-2356-4528


--○ 커서 이용 전 상황(단일 행 접근 시)
DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME||', '||V_TEL);
END;
--==>>에러발생
/*
ORA-01422: exact fetch returns more than requested number of rows
*/

--○ 커서 이용 전 상황(다중 행 접근 시 - 반복문을 활용하는 경우)
DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
    V_NUM   TBL_INSA.NUM%TYPE := 1001;
BEGIN
    LOOP
        SELECT NAME, TEL    INTO V_NAME, V_TEL
        FROM TBL_INSA
        WHERE NUM=V_NUM;
        
        DBMS_OUTPUT.PUT_LINE(V_NAME||', '||V_TEL);
        V_NUM := V_NUM + 1;
        
        EXIT WHEN V_NUM >= 1061;
    END LOOP;
END;
/*
홍길동, 011-2356-4528
이순신, 010-4758-6532
이순애, 010-4231-1236
김정훈, 019-5236-4221
            :
이미경, 016-6542-7546
김신제, 010-2415-5444
임수봉, 011-4151-4154
김신애, 011-4151-4444


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/

--○ 커서 이용 후 상황(다중 행 접근 시)
DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
    
    -- 커서 이용을 위한 커서변수 선언(→ 커서 정의)
    CURSOR CUR_INSA_SELECT 
    IS
    SELECT NAME, TEL
    FROM TBL_INSA;
BEGIN
    -- 커서 오픈
    OPEN CUR_INSA_SELECT;
    
    -- 커서 오픈 시 쏟아져나오는 데이터들 처리(잡아내기)
    LOOP
        -- 한 행 한 행 끄집어내어 가져오는 행위 → 『FETCH』
        FETCH CUR_INSA_SELECT INTO V_NAME, V_TEL;
        
        EXIT WHEN CUR_INSA_SELECT%NOTFOUND;
        
        --출력
        DBMS_OUTPUT.PUT_LINE(V_NAME||', '||V_TEL);

    END LOOP;
    
    --커서 클로즈
    CLOSE CUR_INSA_SELECT;
END;

--장점 1. 데이터를 serial화 시킬 수 없는 상태에도 사용이 가능하다.
--장점 2. 스타트데이터~엔드데이터를 확인하지 않아도 사용이 가능하다

-------------------------------------------------------------------------------

--■■■ TRIGGER(트리거) ■■■--

-- 사전적인 의미 : 방아쇠, 촉발시키다, 야기하다, 유발하다

-- 1. TRIGGER(트리거)란 DML 작업 즉, SELECT, INSERT, UPDATE, DELETE 작업이 일어날 때
--    자동으로 실행되는(유발되는, 촉발되는) 객체로
--    이와 같은 특징을 강조하여(부각시켜) DML TRIGGER 라고 부르기도 한다.
--    TRIGGER는 데이터 무결성 뿐 아니라
--    다음과 같은 작업에도 널리 사용된다.

-- 자동으로 파생된 열 값 생성
-- 잘못된 트랜잭션 방지
-- 복잡한 보안 권한 강제 수행
-- 분산 데이터베이스 노드 상에서 참조 무결성 강제 수행
-- 복잡한 업무 규칙 강제 적용
-- 투명한 이벤트 로깅 제공
-- 복잡한 감사 제공
-- 동기 테이블 복제 유지관리
-- 테이블 액세스 통계 수집

-- 2. TRIGGER 내에서는 COMMIT, ROLLBACK 문을 사용할 수 없다.

-- 3. 특징 및 종류

-- BEFORE STATEMENT
-- SQL 구문이 실행되기 전에 그 문장에 대해 한 번 실행

-- BEFORE ROW
-- SQL 구문이 실행되기 전에(DML 작업을 수행하기 전에)
-- 각 행(ROW)에 대해 한 번씩 실행

-- AFTER STATEMENT
-- SQL 구문이 실행된 후 그 문장에 대해 한 번 실행

-- BEFORE ROW
-- SQL 구문이 실행된 후에(DML 작업을 수행한 후에)
-- 각 행(ROW)에 대해 한 번씩 실행

-- 4. 형식 및 구조
/*
CREATE [OR REPLACE] TRIGGER 트리거명
    [BEFORE] | [AFTER]
    이벤트1 [OR 이벤트2 [OR 이벤트3]] ON 테이블명
    [FOR EACH ROW [WHEN TRIGGER 조건]] -- 행(ROW) TRIGGER에만 삽입됨
[DECLARE]
    -- 선언 구문;
BEGIN
    -- 실행 구문;
END;
*/

--■■■ AFTER STATEMENT TRIGGER 상황 실습 ■■■--
--※ DML 작업에 대한 이벤트 기록




--○ TRIGGER(트리거) 생성(TRG_EVENTLOG)
--DECLARE에 선언할게 없을 때 생략가능
CREATE OR REPLACE TRIGGER TRG_EVENTLOG
            AFTER
            INSERT OR UPDATE OR DELETE ON TBL_TEST1
BEGIN
    -- 이벤트 종류 구분(조건문을 통한 분기)
    IF (INSERTING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
            VALUES('INSERT 쿼리문이 수행되었습니다.');
    ELSIF (UPDATING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
            VALUES('UPDATE 쿼리문이 수행되었습니다.');
    ELSIF (DELETING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
            VALUES('DELETE 쿼리문이 수행되었습니다.');
    END IF;
    
    --COMMIT;
    --※ TRIGGER 내에서는 COMMIT 구문 사용 불가~!!!!
END;

--==>>Trigger TRG_EVENTLOG이(가) 컴파일되었습니다.





--■■■ BEFORE STATEMENT TRIGGER 상황 실습 ■■■--
--※ DML 작업 수행 전에 작업 가능여부 확인
--   (보안 정책 적용 / 업무 규칙 적용)

--○ TRIGGER(트리거) 작성(TRG_TEST1_DML)
CREATE OR REPLACE TRIGGER TRG_TEST1_DML
            BEFORE
            INSERT OR UPDATE OR DELETE ON TBL_TEST1
BEGIN
    IF (시간이 오전 8시 이전이거나... 오후 6시 이후라면....)
        THEN 예외를 발생시키도록 하겠다.
    END IF;
END;


CREATE OR REPLACE TRIGGER TRG_TEST1_DML
            BEFORE
            INSERT OR UPDATE OR DELETE ON TBL_TEST1
BEGIN
    IF (  TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) < 8 
          OR 
          TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) >= 18  )
        THEN RAISE_APPLICATION_ERROR(-20003, '작업은 08:00 ~ 18:00 까지만 가능합니다.');
    END IF;
END;
--==>>Trigger TRG_TEST1_DML이(가) 컴파일되었습니다.


--■■■ BEFORE ROW TRIGGER 상황 실습 ■■■--
--※ 참조 관계가 설정된 데이터(자식) 삭제를 먼저 수행하는 모델

--○ TRIGGER(트리거) 작성(TRG_TEST2_DELETE)
CREATE OR REPLACE TRIGGER TRG_TEST2_DELETE
            BEFORE
            DELETE ON TBL_TEST2 -- TEST2에 설치하는것 주의!!!
            FOR EACH ROW 
BEGIN
    DELETE
    FROM TBL_TEST3
    WHERE CODE = :OLD.CODE;
END;
--==>>Trigger TRG_TEST2_DELETE이(가) 컴파일되었습니다.

--※ 『:OLD』
--   참조 전 열의 값
--   (INSERT : 입력하기 이전 자료, DELETE : 삭제하기 이전자료 즉, 삭제할 자료)

--※ UPDATE → DELETE 그리고 INSERT 가 결합된 형태
--             이 과정에서 UPDATE하기 이전의 자료는 :OLD
--             이 과정에서 UPDATE한 후의 자료는 :NEW



--■■■ AFTER ROW TRIGGER 상황 실습 ■■■--
--※ 참조 관계가 설정된 데이터(자식) 삭제를 먼저 수행하는 모델

-- TBL_상품, TBL_입고, TBL_출고

--○ TBL_입고 테이블의 데이터 입력시(입고 이벤트 발생 시)
--   TBL_상품 테이블의 재고수량 변동 트리거 작성
CREATE OR REPLACE TRIGGER TRG_IBGO
        AFTER
        INSERT ON TBL_입고
        FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_상품
             SET 재고수량 = 재고수량 + 새로입고되는 입고수량 
             WHERE 상품코드 = 새로입고되는 상품코드;
    END IF;
END;


CREATE OR REPLACE TRIGGER TRG_IBGO
        AFTER
        INSERT ON TBL_입고
        FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_상품
             SET 재고수량 = 재고수량 + :NEW.입고수량 
             WHERE 상품코드 = :NEW.상품코드;
    END IF;
END;
--==>>Trigger TRG_IBGO이(가) 컴파일되었습니다.


--○ TBL_상품, TBL_입고, TBL_출고의 관계에서
--   입고수량, 출고수량, 재고수량의 트랜잭션 처리가 이루어질 수 있도록
--   TRG_IBGO 트리거를 수정한다.
CREATE OR REPLACE TRIGGER TRG_IBGO
            AFTER
            INSERT OR UPDATE OR DELETE ON TBL_입고
            FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_상품
             SET 재고수량 = 재고수량 + :NEW.입고수량
             WHERE 상품코드 = :NEW.상품코드;
    ELSIF (UPDATING)
        THEN UPDATE TBL_상품
             SET 재고수량 = 재고수량 - :OLD.입고수량 + :NEW.입고수량
             WHERE 상품코드 = :NEW.상품코드;
    ELSIF (DELETING)
        THEN UPDATE TBL_상품
             SET 재고수량 = 재고수량 - :OLD.입고수량
             WHERE 상품코드 = :OLD.상품코드;
    END IF;
END;
--==>Trigger TRG_IBGO이(가) 컴파일되었습니다.

--○ TBL_상품, TBL_입고, TBL_출고의 관계에서
--   입고수량, 출고수량, 재고수량의 트랜잭션 처리가 이루어질 수 있도록
--   TRG_CHULGO 트리거를 수정한다.
CREATE OR REPLACE TRIGGER TBL_CHULGO
            AFTER
            INSERT OR UPDATE OR DELETE ON TBL_출고
            FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_상품
             SET 재고수량 = 재고수량 - :NEW.출고수량
             WHERE 상품코드 = :NEW.상품코드;
    ELSIF (UPDATING)
        THEN UPDATE TBL_상품
             SET 재고수량 = 재고수량 + :OLD.출고수량 - :NEW.출고수량
             WHERE 상품코드 = :NEW.상품코드;
    ELSIF (DELETING)
        THEN UPDATE TBL_상품
             SET 재고수량 = 재고수량 + :OLD.출고수량
             WHERE 상품코드 = :OLD.상품코드;
    END IF;
END;
--==>>Trigger TBL_CHULGO이(가) 컴파일되었습니다.


-----------------------------------------------------------------------------------

--■■■ PACKAGE(패키지) ■■■--

-- 1. PL/SQL의 패키지는 관계되는 타입, 프로그램 객체,
--    서브 프로그램(PROCEDURE, FUNCTION 등)을
--    논리적으로 묶어놓은 것으로
--    오라클에서 제공하는 패키지 중 하나가 바로 『DBMS_OUTPUT』이다.

-- 2. 패키지는 서로 유사한 업무에 사용되는 여러 개의 프로시저와 함수를
--    하나의 패키지로 만들어 관리함으로서 향후 유지보수가 편리하고
--    전체 프로그램을 모듈화 할 수 있는 장점이 있다.

-- 3. 패키지는 명세부(PACKAGE SPECIFIATION)와
--    몸체부(PACKAGE BODY)로 구성되어 있으며,
--    명세 부분에는 TYPE, CONSTRAINT, VARIABLE, EXCEPTION, CURSOR,
--    SUBPROGRAM이 선언되고
--    몸체 부분에는 이들의 실제 내용이 존재하게 된다.
--    그리고 호출할 때에는 『패키지명.프로시저명』형식의 참조를 이용해야 한다.

-- 4. 형식 및 구조(명세부)
/*
CREATE [OR REPLACE] PACKAGE 패키지명
IS
    전역변수 선언;
    커서 선언;
    예외 선언;
    함수 선언;
    프로시저 선언;
        :
        
END 패키지명;
*/

-- 5. 형식 및 구조(몸체부)
/*
CREATE [OR REPLACE] PACKAGE BODY 패키지명
IS
    FUNCTION 함수명[(인수, ...)]
    RETURN 자료명
    IS
        변수 선언;
    BEGIN
        함수 몸체 구성 코드;
        RETURN 값;
    END;
    
    PROCEDURE 프로시저명[(인수, ...)]
    IS
        변수 선언;
    BEGIN
        프로시저 몸체 구성 코드;
    END;
    
END 패키지명;
*/


--○ 주민번호 입력 시 성별을 반환하는 함수
--   이 함수를 구성요소로 하는 패키지 작성

-- 함수 준비
CREATE OR REPLACE FUNCTION FN_GENDER(V_SSN VARCHAR2)
RETURN VARCHAR2
IS
    V_RESULT VARCHAR2(20);
BEGIN
    IF (SUBSTR(V_SSN, 8, 1) IN ('1','3'))
        THEN V_RESULT := '남자';
    ELSIF (SUBSTR(V_SSN, 8, 2) IN ('2','4'))
        THEN V_RESULT := '여자';
    ELSE
        V_RESULT := '확인불가';
    END IF;
END;
--==>>Function FN_GENDER이(가) 컴파일되었습니다.

-- 패키지 등록

-- 1. 명세부 작성
CREATE OR REPLACE PACKAGE INSA_PACK
IS 
    FUNCTION FN_GENDER(V_SSN VARCHAR2)
    RETURN VARCHAR2;
    
END INSA_PACK;
--==>>Package INSA_PACK이(가) 컴파일되었습니다.

-- 2. 몸체부 작성
CREATE OR REPLACE PACKAGE BODY INSA_PACK
IS 
    FUNCTION FN_GENDER(V_SSN VARCHAR2)
    RETURN VARCHAR2
    IS
        V_RESULT VARCHAR2(20);
    BEGIN
        IF (SUBSTR(V_SSN, 8, 1) IN ('1','3'))
            THEN V_RESULT := '남자';
        ELSIF (SUBSTR(V_SSN, 8, 1) IN ('2','4'))
            THEN V_RESULT := '여자';
        ELSE
            V_RESULT := '확인불가';
        END IF;
        
        RETURN V_RESULT;
    END;
END INSA_PACK;
--==>>Package Body INSA_PACK이(가) 컴파일되었습니다.










