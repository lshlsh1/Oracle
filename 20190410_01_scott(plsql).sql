SELECT USER
FROM DUAL;
--==>> SCOTT


--○ TBL_INSA 테이블을 대상으로 신규 데이터 입력 프로시저를 작성한다.
--   NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG
--   구조를 갖고 있는 대상 테이블에 데이터 입력 시
--   NUM 컬럼(사원번호)의 값은
--   기존 부여된 사원번호 마지막 번호의 그 다음 번호를 자동으로
--   입력 처리할 수 있는 프로시저로 구성한다.
--   프로시저 명 : PRC_INSA_INSERT(NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG
/*
실행 예)
EXEC PRC_INSA_INSERT('김선아','901212-2234567',SYSDATE,'서울','010-5555-5555','영업부','대리',1000000,200000);

프로시저 호출로 처리된 결과)
1061 김선아 901212-2234567 SYSDATE 서울 010-5555-5555 영업부 대리 1000000,200000
*/
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
    -- INSERT 쿼리문 수행에 필요한 변수 추가 선언
    V_NUM   NUMBER;
BEGIN
    -- 선언한 변수에 값 담아내기
    SELECT MAX(NUM)+1 INTO V_NUM FROM TBL_INSA;
    
    -- INSERT 쿼리문 구성
    INSERT INTO TBL_INSA(NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
    VALUES(V_NUM, V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
    
    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_INSA_INSERT이(가) 컴파일되었습니다.


--○ TBL_상품, TBL_입고 테이블을 대상으로 
--   TBL_입고 테이블에 데이터 입력 시(즉, 입고 이벤트 발생 시)
--   TBL_상품 테이블의 재고수량이 함께 변동될 수 있는 기능을 가진
--   프로시저를 작성한다.
--   단, 이 과정에서 입고번호는 자동 증가 처리한다. (시퀀스 사용 X)
--   TBL_입고 테이블 구성 컬럼
--   → 입고번호, 상품코드, 입고일자, 입고수량, 입고단가
--   프로시저 명 : PRC_입고_INSERT(상품코드, 입고수량,  입고단가)

--※ TBL_입고 테이블에 입고 이벤트 발생 시
--   관련 테이블에서 수행되어야 하는 내용
--   ① INSERT → TBL_입고
--      INSERT INTO TBL_입고(입고번호, 상품코드, 입고일자, 입고수량, 입고단가)
--      VALUES(1, 'HOO1', SYSDATE, 20, 900);
--   ② UPDATE → TBL_상품
--      UPDATE TBL_상품
--      SET 재고수량 = 기존재고수량 + 20(←입고수량)
--      WHERE 상품코드 = 'H001';

--희진이 풀이~
CREATE OR REPLACE PROCEDURE PRC_입고_INSERT
( V_상품코드    IN TBL_상품.상품코드%TYPE
, V_입고수량    IN TBL_입고.입고수량%TYPE
, V_입고단가    IN TBL_입고.입고단가%TYPE
)
IS
    V_입고번호  NUMBER;
BEGIN
    SELECT MAX(입고번호) INTO V_입고번호 FROM TBL_입고;
    
    IF V_입고번호 IS NULL
        THEN V_입고번호 := 0;
    END IF;
    
    INSERT INTO TBL_입고(입고번호, 상품코드, 입고수량, 입고단가) VALUES(V_입고번호+1, V_상품코드, V_입고수량, V_입고단가);
    
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_입고수량
    WHERE 상품코드 = V_상품코드;
    
    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_입고_INSERT이(가) 컴파일되었습니다.

-- 썜 풀이
CREATE OR REPLACE PROCEDURE PRC_입고_INSERT
( V_상품코드    IN TBL_상품.상품코드%TYPE
, V_입고수량    IN TBL_입고.입고수량%TYPE
, V_입고단가    IN TBL_입고.입고단가%TYPE
)
IS
    -- 아래의 쿼리문을 수행하기 위해 필요한 데이터 변수로 선언
    V_입고번호  TBL_입고.입고번호%TYPE;
BEGIN
    -- 선언한 변수에 값 담아내기
    SELECT NVL(MAX(입고번호), 0) INTO V_입고번호   -- 입고된게 없을때는 NULL이 뜸! NULL+1 해도 NULL
    FROM TBL_입고;
    
    -- 쿼리문 구성
    -- ① INSERT → TBL_입고
    INSERT INTO TBL_입고(입고번호, 상품코드, 입고수량, 입고단가) 
    VALUES((V_입고번호+1), V_상품코드, V_입고수량, V_입고단가);
    
    -- ② UPDATE → TBL_상품
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_입고수량
    WHERE 상품코드 = V_상품코드;
    
    -- 커밋
    COMMIT;
    
    --예외처리
    EXCEPTION
        WHEN OTHERS THEN ROLLBACK;
END;
--==>>Procedure PRC_입고_INSERT이(가) 컴파일되었습니다.

--■■■ 프로시저 내에서의 예외 처리 ■■■--

--○ TBL_MEMBER 테이블에 데이터를 입력하는 프로시저를 생성
--   단, 이 프로시저를 통해 데이터를 입력할 경우
--   CITY(지역) 항목에 '서울', '인천', '경기' 만 입력이 가능하도록 구성한다.
--   이 지역 외의 지역을 프로시저 호출을 통해 입력하려고 하는 경우
--   예외 처리를 하려고 한다.
--   프로시저 명 : PRC_MEMBER_INSERT(이름, 전화번호, 지역)

-- 프로시저 생성
CREATE OR REPLACE PROCEDURE PRC_MEMBER_INSERT
( V_NAME    IN TBL_MEMBER.NAME%TYPE
, V_TEL     IN TBL_MEMBER.TEL%TYPE
, V_CITY    IN TBL_MEMBER.CITY%TYPE
)
IS
    -- 실행 영역의 쿼리문 수행을 위해 필요한 데이터 변수 선언
    V_NUM   TBL_MEMBER.NUM%TYPE;
    
    -- 사용자 정의 예외에 대한 변수 선언 CHECK!!
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    
    -- 프로시저를 통해 입력 처리를 정상적으로 진행해야 할 데이터인지
    -- 아닌지의 여부를 가장 먼저 확인할 수 있도록 코드 구성
    IF (V_CITY NOT IN ('서울','인천','경기'))
        -- 예외 발생!! CHECK!!!
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- 선언한 변수에 값 담아내기
    SELECT NVL(MAX(NUM), 0) INTO V_NUM
    FROM TBL_MEMBER;
    
    -- 쿼리문 구성(INSERT)
    INSERT INTO TBL_MEMBER(NUM, NAME, TEL, CITY)
    VALUES((V_NUM+1), V_NAME, V_TEL, V_CITY);
    
    -- 커밋
    COMMIT;
    
    -- 예외 처리 구문
    EXCEPTION 
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '서울, 인천, 경기만 입력 가능합니다.');     -- -마이너스가 아니라 하이푼개념
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>>Procedure PRC_MEMBER_INSERT이(가) 컴파일되었습니다.


--○ TBL_출고 테이블에 데이터 입력 시(즉, 출고 이벤트 발생 시)
--   TBL_상품 테이블의 재고수량이 변동되는 프로시저를 작성한다.
--   단, 출고번호는 입고번호와 마찬가지로 자동 증가.
--   또한, 출고 수량이 재고 수량보다 많은 경우....
--   출고 액션을 취소할 수 있도록 처리한다. (출고가 이루어지지 않도록...)
--   프로시저 명 : PRC_출고_INSERT(상품코드, 출고수량, 출고단가);
SELECT *
FROM TBL_출고;

CREATE OR REPLACE PROCEDURE PRC_출고_INSERT
( V_상품코드    IN TBL_상품.상품코드%TYPE
, V_출고수량    IN TBL_출고.출고수량%TYPE
, V_출고단가    IN TBL_출고.출고단가%TYPE
)
IS
  V_출고번호    TBL_출고.출고번호%TYPE;
  V_재고수량    TBL_상품.재고수량%TYPE;
  USER_DEFINE_ERROR EXCEPTION;
BEGIN
    SELECT 재고수량 INTO V_재고수량 FROM TBL_상품 WHERE 상품코드=V_상품코드;
    
    IF (V_재고수량<V_출고수량)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
   
    SELECT NVL(MAX(출고번호),0) INTO V_출고번호
    FROM TBL_출고;

    INSERT INTO TBL_출고(출고번호, 상품코드, 출고수량, 출고단가)
    VALUES ((V_출고번호+1),V_상품코드, V_출고수량, V_출고단가);
    
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_출고수량
    WHERE 상품코드 = V_상품코드;
    
    COMMIT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '출고수량이 재고수량보다 많습니다');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>Procedure PRC_출고_INSERT이(가) 컴파일되었습니다.

--쌤 풀이
CREATE OR REPLACE PROCEDURE PRC_출고_INSERT
( V_상품코드    IN TBL_상품.상품코드%TYPE
, V_출고수량    IN TBL_출고.출고수량%TYPE
, V_출고단가    IN TBL_출고.출고단가%TYPE
)
IS
    -- 주요 변수 선언
    V_출고번호  TBL_출고.출고번호%TYPE;
    V_재고수량  TBL_상품.재고수량%TYPE;
    USER_DEFINE_ERROR   EXCEPTION;  -- 사용자 정의 예외
BEGIN
    -- 쿼리문 수행 이전에 수행 여부 확인 → 기존 재고 확인 → 출고 수량과 비교
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드=V_상품코드;
    
    -- 출고를 정상적으로 진행해 줄 것인지에 대한 여부 확인
    -- (파악한 재고수량보다 출고수량이 많으면... 예외 발생)
    IF (V_출고수량 > V_재고수량)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- 선언한 변수에 값 담아내기
    SELECT NVL(MAX(출고번호), 0) INTO V_출고번호
    FROM TBL_출고;
    
    -- 쿼리문 구성(INSERT → TBL_출고)
    INSERT INTO TBL_출고(출고번호, 상품코드, 출고수량, 출고단가)
    VALUES((V_출고번호+1),V_상품코드,V_출고수량,V_출고단가);
    
    -- 쿼리문 구성(UPDATE → TBL_상품)
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_출고수량
    WHERE 상품코드=V_상품코드;
    
    --커밋
    COMMIT;
    
    -- 예외 처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '재고 부족~!!!!');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>>Procedure PRC_출고_INSERT이(가) 컴파일되었습니다.


--○ TBL_출고 테이블에서 출고 수량을 수정(변경)하는 프로시저를 작성한다.
--   프로시저 명 : PRC_출고_UPDATE(출고번호, 변경할 수량);
CREATE OR REPLACE PROCEDURE PRC_출고_UPDATE
( V_출고번호    IN TBL_출고.출고번호%TYPE
, V_변경수량    IN TBL_출고.출고수량%TYPE
)
IS
 V_출고수량     TBL_출고.출고수량%TYPE;
 V_상품코드     TBL_출고.상품코드%TYPE;
 V_재고수량     TBL_상품.재고수량%TYPE;
 USER_DEFINE_ERROR  EXCEPTION;
BEGIN
    SELECT 출고수량 INTO V_출고수량 FROM TBL_출고 WHERE 출고번호=V_출고번호;
    SELECT 상품코드 INTO V_상품코드 FROM TBL_출고 WHERE 출고번호=V_출고번호;
    SELECT 재고수량 INTO V_재고수량 FROM TBL_상품 WHERE 상품코드=V_상품코드;
    
    IF (V_재고수량+V_출고수량<V_변경수량)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    UPDATE TBL_출고
    SET 출고수량 = V_변경수량
    WHERE 출고번호=V_출고번호;
    
    UPDATE TBL_상품 
    SET 재고수량 = 재고수량 + V_출고수량 - V_변경수량 
    WHERE 상품코드=V_상품코드;
    
    COMMIT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '출고 수량이 재고보다 많습니다');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>>Procedure PRC_출고_UPDATE이(가) 컴파일되었습니다.

--쌤 풀이
CREATE OR REPLACE PROCEDURE PRC_출고_UPDATE
( 
  --① 매개변수 구성
  V_출고번호    IN TBL_출고.출고번호%TYPE
, V_출고수량    IN TBL_출고.출고수량%TYPE
)
IS 
    --③ 주요 변수 추가 선언
    V_상품코드 TBL_상품.상품코드%TYPE;
    
    --⑤ 주요 변수 추가 선언
    V_이전출고수량 TBL_출고.출고수량%TYPE;
    
    --⑦ 주요 변수 추가 선언
    V_재고수량 TBL_상품.재고수량%TYPE;
    
    --⑨ 주요 변수(사용자 정의 예외) 추가 선언
    USER_DEFINE_ERROR EXCEPTION;
    
BEGIN
    --④ 상품코드와 이전출고수량 파악을 위해 변경 이전의 출고 내역 확인
    SELECT 상품코드, 출고수량 INTO V_상품코드, V_이전출고수량
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;
    
    --⑥ 출고를 정상적으로 수행해야 하는지의 여부 판단 필요
    --   변경 이전의 출고수량 및 현재의 재고수량 확인
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;

    --⑧ 파악한 재고수량에 따라 데이터 변경 실시 여부 판단
    --   (『재고수량+이전출고수량 < 현재출고수량』 인 상황이라면... 사용자 정의 예외 발생)
    IF ((V_재고수량 + V_이전출고수량) < V_출고수량)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    --② 수행될 쿼리문 체크(UPDATE → TBL_출고/ UPDATE→TBL_상품)
    UPDATE TBL_출고
    SET 출고수량 = V_출고수량
    WHERE 출고번호 = V_출고번호;
    
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_이전출고수량 - V_출고수량
    WHERE 상품코드 = V_상품코드;
    
    --⑩ 커밋
    COMMIT;
    
    --⑪ 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '재고 부족~!!!!');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>>Procedure PRC_출고_UPDATE이(가) 컴파일되었습니다.























