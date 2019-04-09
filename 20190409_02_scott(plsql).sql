SELECT USER
FROM DUAL;
--==>>SCOTT

SET SERVEROUTPUT ON;

--○ SCOTT.TBL_INSA 테이블의 여러 명의 데이터 여러 개를 변수에 저장
--   (반복문 활용)
DECLARE
    VINSA  TBL_INSA%ROWTYPE;
    VNUM    TBL_INSA.NUM%TYPE := 1001;
BEGIN
    
    LOOP
    
        SELECT NAME, TEL, BUSEO INTO VINSA.NAME, VINSA.TEL, VINSA.BUSEO
        FROM TBL_INSA
        WHERE NUM=VNUM;
        
        DBMS_OUTPUT.PUT_LINE(VINSA.NAME||' - '||VINSA.TEL||' - '||VINSA.BUSEO);
    
        EXIT WHEN VNUM >= 1060;
        
        VNUM := VNUM + 1;       --VNUM을 1만큼 증가
        
    END LOOP;
    
END;
--==>>
/*
홍길동 - 011-2356-4528 - 기획부
이순신 - 010-4758-6532 - 총무부
이순애 - 010-4231-1236 - 개발부
김정훈 - 019-5236-4221 - 영업부
                :
이미경 - 016-6542-7546 - 자재부
김신제 - 010-2415-5444 - 기획부
임수봉 - 011-4151-4154 - 개발부
김신애 - 011-4151-4444 - 개발부


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/

---------------------------------------------------------------------------

--■■■ FUNCTION(함수) ■■■--

-- 1. 함수란 하나 이상의 PL/SQL 문으로 구성된 서브루틴으로
--    코드를 다시 사용할 수 있도록 캡슐화 하는데 사용된다.
--    오라클에서는 오라클에 정의된 기본 제공 함수를 사용하거나
--    직접 스토어드 함수를 만들 수 있다. (→ 사용자 정의 함수)
--    이 사용자 정의 함수는 시스템 함수처럼 쿼리에서 호출하거나
--    저장 프로시저처럼 EXECUTE 문을 통해 실행할 수 있다.

-- 2. 형식 및 구조
/*
CREATE [OR REPLACE] FUNCTION 함수명
[(
    매개변수1 자료형
  , 매개변수2 자료형
)]
RETURN 데이터타입    <<- 리턴타입 중요★
IS
    -- 주요 변수 선언(지역 변수)
BEGIN
    -- 실행문
    ...
    RETURN (값);
    
    [EXCEPTION]
        -- 예외 처리 구문;
END;
*/
--※ 사용자 정의 함수(스토어드 함수)는
--   IN 파라미터(입력 매개변수)만 사용할 수 있으며
--   반드시 반환될 값의 데이터타입을 RETURN 문에 선언해야 하고,
--   FUNCTION은 반드시 단일 값만 반환한다.


--○ TBL_INSA 테이블에서
--   주민등록번호를 가지고 성별을 조회한다.
SELECT NAME, SSN, DECODE( SUBSTR(SSN,8,1),1,'남자',2,'여자')"성별"
FROM TBL_INSA;

/*
            ↓ 주민등록번호
          \    /
       ----    --------------
       |                    |
       |                    |
       ----------------     -
                      /     \
                         ↓성별
*/

--○ FUNCTION 생성
-- 함수명 : FN_GENDER()
--                   ↑SSN(주민등록번호) → 'YYMMDD-NNNNNNN'

CREATE OR REPLACE FUNCTION FN_GENDER
( VSSN  VARCHAR2    -- 매개변수 : 자릿수(길이) 지정 안함
)
RETURN VARCHAR2     -- 반환 자료형 : 자릿수(길이) 지정 안함
IS
    -- 주요 변수 선언
    VRESULT VARCHAR2(20);
BEGIN
    -- 연산 및 처리
    IF ( SUBSTR(VSSN,8,1)IN('1','3') )
        THEN VRESULT := '남자';
    ELSIF ( SUBSTR(VSSN,8,1)IN('2','4') )
        THEN VRESULT := '여자';
    ELSE
        VRESULT := '성별확인불가';
    END IF;
    
    --최종 결과값 반환
    RETURN VRESULT;
END;
--==>> Function FN_GENDER이(가) 컴파일되었습니다.

--○ 임의의 정수 두 개를 매개변수(입력 파라미터)로 넘겨받아
--   A의 B승의 값을 반환하는 사용자 정의 함수를 작성한다.
--   함수명 : FN_POW()
/*
사용 예)
SELECT FN_POW(10, 3)
FROM DUAL;
--==>> 1000

FN_POW(10, 3)
      ------
        10 * 10 * 10 = 1000
        1 * 10 * 10 * 10 = 1000
        0 * 10 * 10 * 10 = 0
*/


CREATE OR REPLACE FUNCTION FN_POW
( A NUMBER
, B NUMBER
)
RETURN NUMBER
IS
    VRESULT NUMBER;
    VCOUNT  NUMBER;
BEGIN
    VRESULT := 1;
    VCOUNT := 1;
    
    LOOP
        VRESULT := VRESULT*A;
        VCOUNT := VCOUNT+1;
        EXIT WHEN VCOUNT>B;
    END LOOP;
    

    RETURN VRESULT;  
END;
--==>Function FN_POW이(가) 컴파일되었습니다.

--쌤 풀이
CREATE OR REPLACE FUNCTION FN_POW(A NUMBER, B NUMBER)
RETURN NUMBER
IS
    V_RESULT    NUMBER := 1;
    V_NUM       NUMBER;
BEGIN
    FOR V_NUM IN 1 .. B LOOP
        V_RESULT := V_RESULT * A;
    END LOOP;
    
    RETURN V_RESULT;
END;

--○ TBL_INSA 테이블의 급여 계산 전용 함수를 정의한다.
--   급여는 (기본급*12)+수당 기반으로 연산을 수행한다.
--   함수명 : FN_PAY(기본급, 수당)


SELECT *
FROM TBL_INSA;

CREATE OR REPLACE FUNCTION FN_PAY
(BASICPAY TBL_INSA.BASICPAY%TYPE
, SUDANG TBL_INSA.SUDANG%TYPE)
RETURN NUMBER
IS
    VRESULT NUMBER :=0;
BEGIN
    VRESULT := (BASICPAY*12)+SUDANG;
    
    RETURN VRESULT;
END;
--==>Function FN_PAY이(가) 컴파일되었습니다.

--○ TBL_INSA 테이블의 입사일을 기준으로
--   현재까지의 근무년수를 반환하는 함수를 정의한다
--   단, 근무년수는 소수점 이하 한자리까지 계산한다.
--   함수명 : FN_WORKYEAR(입사일)

CREATE OR REPLACE FUNCTION FN_WORKYEAR
(IBSADATE   TBL_INSA.IBSADATE%TYPE)
RETURN NUMBER
IS
    VRESULT NUMBER;
BEGIN
    VRESULT := TRUNC((SYSDATE - IBSADATE)/365 , 1);
    RETURN VRESULT;
END;
































