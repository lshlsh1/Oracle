SELECT USER
FROM DUAL;
--==>>SCOTT

--○ 생성한 프로시저(PRC_STUDENTS_INSERT())가 제대로 작동하는지의
--   여부 확인 → 프로시저 호출
EXEC PRC_STUDENTS_INSERT('batnam','java006$','남상현','010-2222-2222','서울');
--==>>PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_IDPW;
--==>>
/*
superman	java006$
batnam	    java006$
*/

SELECT *
FROM TBL_STUDENTS;
--==>>
/*
superman	전훈의	010-1111-1111	제주도 서귀포시
batnam	    남상현	010-2222-2222	서울
*/

--○ 학번, 이름, 국어점수, 영어점수, 수학점수 데이터를
--   입력받을 수 있는 실습 테이블 생성(TBL_SUNGJUK)
CREATE TABLE TBL_SUNGJUK
( HAKBUN    NUMBER
, NAME      VARCHAR2(40)
, KOR       NUMBER(3)
, ENG       NUMBER(3)
, MAT       NUMBER(3)
, CONSTRAINT SUNGJUK_HAKBUN_PK PRIMARY KEY(HAKBUN)
);
--==>>Table TBL_SUNGJUK이(가) 생성되었습니다.

--○ 생성된 테이블에 컬럼 구조 추가
--   (총점 → TOT, 평균→AVG, 등급→GRADE)
ALTER TABLE TBL_SUNGJUK
ADD( TOT NUMBER(3), AVG NUMBER(4,1), GRADE CHAR);
--==>>Table TBL_SUNGJUK이(가) 변경되었습니다.

--※ 여기서 추가한 컬럼에 대한 항목들은
--   프로시저 실습을 위해 추가한 것일 뿐
--   실제 테이블 구조에 적합하지도, 바람직하지도 않은 내용이다.

--○ 변경된 테이블 구조 확인
DESC TBL_SUNGJUK;
--==>>
/*
이름     널?       유형           
------ -------- ------------ 
HAKBUN NOT NULL NUMBER       
NAME            VARCHAR2(40) 
KOR             NUMBER(3)    
ENG             NUMBER(3)    
MAT             NUMBER(3)    
TOT             NUMBER(3)    
AVG             NUMBER(4,1)  
GRADE           CHAR(1)    
*/

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

--○ 생성한 프로시저(PRC_STUDENTS_INSERT())가 제대로 작동하는지의
--   여부 확인 → 프로시저 호출
EXEC PRC_SUNGJUK_INSERT(1, '이원영',90,80,70);
EXEC PRC_SUNGJUK_INSERT(2, '이승희',90,80,70);

SELECT *
FROM TBL_SUNGJUK;
--==>>
/*
1	이원영	90	80	70	240	80	B
2	이승희	90	80	70	240	80	B
*/

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
--○ 생성한 프로시저(PRC_SUNGJUK_UPDATE())가 제대로 작동하는지의
--   여부 확인 → 프로시저 호출
EXEC PRC_SUNGJUK_UPDATE(1, 50, 50, 50);

SELECT *
FROM TBL_SUNGJUK;
--==>>
/*
1	이원영	50	50	50	150	50	F
2	이승희	90	80	70	240	80	B
*/

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
--○ 생성한 프로시저(PRC_STUDNETS_UPDATE())가 제대로 작동하는지의
--   여부 확인 → 프로시저 호출
EXEC PRC_STUDNETS_UPDATE('superman','java006$','010-9999-9999','경기');
--==>PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_STUDENTS;
--==>>
/*
superman	전훈의	010-9999-9999	경기
batnam	    남상현	010-2222-2222	서울
*/

EXEC PRC_STUDNETS_UPDATE('supermen','java006$','010-9999-9999','경기');
--==>PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_STUDENTS;
--==>>
/*
superman	전훈의	010-9999-9999	경기
batnam	    남상현	010-2222-2222	서울
*/

EXEC PRC_STUDNETS_UPDATE('superman','net006$','010-9999-9999','경기');
--==>PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_STUDENTS;
--==>>
/*
superman	전훈의	010-9999-9999	경기
batnam	    남상현	010-2222-2222	서울
*/

-->ID와 PW가 모두 유효한 데이터로 테스트 한 결과에만... 데이터 변경 성공

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

DESC TBL_INSA;

SELECT *
FROM TBL_INSA;

EXEC PRC_INSA_INSERT('김선아','901212-2234567',SYSDATE,'서울','010-5555-5555','영업부','대리',1000000,200000);
--==>PL/SQL 프로시저가 성공적으로 완료되었습니다.





















