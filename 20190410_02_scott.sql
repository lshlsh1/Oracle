SELECT USER
FROM DUAL;
--==>> SCOTT

--○ 생성한 프로시저(PRC_STUDENTS_INSERT())가 제대로 작동하는지의
--   여부 확인 → 프로시저 호출
EXEC PRC_INSA_INSERT('김선아','901212-2234567',SYSDATE,'서울','010-5555-5555','영업부','대리',1000000,200000);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_INSA;
--==>> 1061	김선아	901212-2234567	19/04/09	서울	010-5555-5555	영업부	대리	1000000	200000


EXEC PRC_INSA_INSERT('한승원','910101-1234567',SYSDATE,'인천','010-1212-1212','기획부','대리',1000000,200000);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_INSA;
--==>> 1062	한승원	910101-1234567	19/04/10	인천	010-1212-1212	기획부	대리	1000000	200000


--------------------------------------------------------------------------------------------------------------------------------

--○ 실습 테이블 생성(TBL_상품)
CREATE TABLE TBL_상품
( 상품코드      VARCHAR2(20)
, 상품명        VARCHAR2(100)
, 소비자가격    NUMBER
, 재고수량      NUMBER DEFAULT 0
, CONSTRAINT 상품_상품코드_PK PRIMARY KEY(상품코드)
);
--==>> Table TBL_상품이(가) 생성되었습니다.
-- TBL_상품 테이블의 상품코드를 기본키(PK) 제약조건 설정


--○ 실습 테이블 생성(TBL_입고)
CREATE TABLE TBL_입고
( 입고번호  NUMBER
, 상품코드  VARCHAR2(20)
, 입고일자  DATE DEFAULT SYSDATE
, 입고수량  NUMBER
, 입고단가  NUMBER
, CONSTRAINT 입고_입고번호_PK PRIMARY KEY(입고번호)
, CONSTRAINT 입고_상품코드_FK FOREIGN KEY(상품코드)
                    REFERENCES TBL_상품(상품코드)
);
--==>> Table TBL_입고이(가) 생성되었습니다.
-- TBL_입고 테이블의 입고번호를 기본키(PK) 제약조건 설정
-- TBL_입고 테이블의 상품코드는 TBL_상품 테이블의 상품코드를
-- 참조할 수 있도록 외래키(FK) 제약조건 설정


--○ TBL_상품 테이블에 상품 데이터 입력
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H001', '홈런볼', 1000);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H002', '새우깡', 900);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H003', '자갈치', 800);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H004', '감자깡', 900);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H005', '꼬깔콘', 1200);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H006', '포카칩', 1500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H007', '뽀빠이', 2000);
--==>> 1 행 이(가) 삽입되었습니다. * 7

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C001', '초코칩', 1800);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C002', '다이제', 2500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C003', '버터링', 1500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C004', '에이스', 1700);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C005', '오레오', 1900);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C006', '비인츠', 900);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C007', '빠다코', 2900);
--==>> 1 행 이(가) 삽입되었습니다. * 7

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E001', '엠엔엠', 600);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E002', '부푸러', 900);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E003', '아폴로', 300);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E004', '쫀드기', 400);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E005', '비틀즈', 800);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E006', '마이쮸', 1100);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E007', '트윅스', 1200);
--==>> 1 행 이(가) 삽입되었습니다. * 7


--○ 확인
SELECT *
FROM TBL_상품;
--==>>
/*
H001	홈런볼	1000	0
H002	새우깡	 900	0
H003	자갈치	 800	0
H004	감자깡	 900	0
H005	꼬깔콘	1200	0
H006	포카칩	1500	0
H007	뽀빠이	2000	0
C001	초코칩	1800	0
C002	다이제	2500	0
C003	버터링	1500	0
C004	에이스	1700	0
C005	오레오	1900	0
C006	비인츠	 900	0
C007	빠다코	2900	0
E001	엠엔엠	 600	0
E002	부푸러	 900	0
E003	아폴로	 300	0
E004	쫀드기	 400	0
E005	비틀즈	 800	0
E006	마이쮸	1100	0
E007	트윅스	1200	0
*/

SELECT COUNT(*)
FROM TBL_상품;
--==>> 21


--○ 커밋
COMMIT;
--==>> 커밋 완료.


--○ 날짜 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


--○ 생성한 프로시저(PRC_입고_INSERT())가 제대로 작동하는지의 여부 확인
SELECT *
FROM TBL_상품;
SELECT *
FROM TBL_입고;

UPDATE TBL_상품;
SET 재고수량 = 0;

COMMIT;

EXEC PRC_입고_INSERT('H005', 200, 1000);

EXEC PRC_입고_INSERT('C001', 50, 1500);

EXEC PRC_입고_INSERT('C001', 20, 1600);

EXEC PRC_입고_INSERT('E001', 80, 500);

EXEC PRC_입고_INSERT('E001', 200, 400);

EXEC PRC_입고_INSERT('H007', 100, 1800);

EXEC PRC_입고_INSERT('E006', 50, 1000);

EXEC PRC_입고_INSERT('E006', 250, 900);

EXEC PRC_입고_INSERT('E006', 80, 900);

EXEC PRC_입고_INSERT('H002', 40, 800);
--==>>PL/SQL 프로시저가 성공적으로 완료되었습니다. * 10

SELECT *
FROM TBL_상품;
/*
H001	홈런볼	1000	0
H002	새우깡	900	    40
H003	자갈치	800	    0
H004	감자깡	900	    0
H005	꼬깔콘	1200	200
H006	포카칩	1500	0
H007	뽀빠이	2000	100
C001	초코칩	1800	70
C002	다이제	2500	0
C003	버터링	1500	0
C004	에이스	1700	0
C005	오레오	1900	0
C006	비인츠	900	    0
C007	빠다코	2900	0
E001	엠엔엠	600	    280
E002	부푸러	900	    0
E003	아폴로	300	    0
E004	쫀드기	400	    0
E005	비틀즈	800	    0
E006	마이쮸	1100	380
E007	트윅스	1200	0
*/


--■■■ 프로시저 내에서의 예외 처리 ■■■--

--○ 테이블 생성(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( NUM   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CITY  VARCHAR2(60)
);
--==>> Table TBL_MEMBER이(가) 생성되었습니다.

--○ 생성한 프로시저(PRC_MEMBER_INSERT()) 정상 작동여부 확인
EXEC PRC_MEMBER_INSERT('이승희', '010-4444-4444', '대구');
--==>>ORA-20001: 서울, 인천, 경기만 입력 가능합니다.

--○ 확인
SELECT *
FROM TBL_MEMBER;
--==>>
/*
1	유진석	010-1111-1111	서울
2	곽한얼	010-3333-3333	경기
3	이기승	010-2222-2222	인천
*/


--○ 실습 테이블 생성(TBL_출고)
CREATE TABLE TBL_출고
( 출고번호  NUMBER
, 상품코드  VARCHAR2(20)
, 출고일자  DATE DEFAULT SYSDATE
, 출고수량  NUMBER 
, 출고단가  NUMBER
);
--==>>Table TBL_출고이(가) 생성되었습니다.

--○ TBL_츨고 테이블의 출고번호에 PK 제약조건 지정
ALTER TABLE TBL_출고
ADD CONSTRAINT 출고_출고번호_PK PRIMARY KEY(출고번호);
--==>>Table TBL_출고이(가) 변경되었습니다.

--○ TBL_출고 테이블의 상품코드는 TBL_상품 테이블의 상품코드를
--   참조할 수 있도록 외래키(FK) 제약조건 지정
ALTER TABLE TBL_출고
ADD CONSTRAINT 출고_상품코드_FK FOREIGN KEY(상품코드)
                REFERENCES TBL_상품(상품코드);
--==>>Table TBL_출고이(가) 변경되었습니다.

--○ TBL_출고 테이블에 데이터 입력 시(즉, 출고 이벤트 발생 시)
--   TBL_상품 테이블의 재고수량이 변동되는 프로시저를 작성한다.
--   단, 출고번호는 입고번호와 마찬가지로 자동 증가.
--   또한, 출고 수량이 재고 수량보다 많은 경우....
--   출고 액션을 취소할 수 잇도록 처리한다. (출고가 이루어지지 않도록...)
--   프로시저 명 : PRC_출고_INSERT(상품코드, 출고수량, 출고단가);

SELECT *
FROM TBL_상품;
/*
C001	초코칩	1800	70
*/

--○ 생성된 프로시저(PRC_출고_INSERT())가 제대로 작동하는지의 여부 확인
EXEC PRC_출고_INSERT('C001', 60, 1800);
--==>>PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_상품;
/*
C001	초코칩	1800	10
*/

SELECT *
FROM TBL_출고;
--==>1	C001	19/04/10	60	1800



--○ 생성된 프로시저(PRC_출고_INSERT())가 제대로 작동하는지의 여부 확인
--   재고수량 보다 많은 출고수량 설정
EXEC PRC_출고_INSERT('C001', 20, 1800);
--==>>ORA-20002: 재고 부족~!!!!

SELECT *
FROM TBL_상품;
--==>>
/*
C001	초코칩	1800	10
*/
SELECT *
FROM TBL_출고;
--==>1	C001	19/04/10	60	1800

--○ TBL_출고 테이블에서 출고 수량을 수정(변경)하는 프로시저를 작성한다.
--   프로시저 명 : PRC_출고_UPDATE(출고번호, 변경할 수량);
EXEC PRC_출고_UPDATE(1, 70);


UPDATE TBL_출고
SET 출고수량 = 60
WHERE 출고번호=1;

UPDATE TBL_상품
SET 재고수량 = 10
WHERE 상품코드='C001';

COMMIT;

--------------------------------------------------

--○ 실습 환경 구성
EXEC PRC_입고_INSERT('C004', 200, 1500);
--==>>PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_상품;

EXEC PRC_출고_INSERT('C004', 150, 1800);
--==>PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_출고;

EXEC PRC_출고_UPDATE(2, 50);
--==>>PL/SQL 프로시저가 성공적으로 완료되었습니다.
--==>C004	에이스	1700	150

EXEC PRC_출고_UPDATE(2, 200);
--==>>PL/SQL 프로시저가 성공적으로 완료되었습니다.
--==>C004	에이스	1700	0

EXEC PRC_출고_UPDATE(2, 201);
--==>ORA-20002: 재고 부족~!!!!
--==>C004	에이스	1700	0












