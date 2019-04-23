
--○ COURSE(과정) 테이블 생성
CREATE TABLE COURSE         -- 과정TABLE
( CS_ID     VARCHAR2(5)     -- 과정코드
, CS_NAME   VARCHAR(20)     -- 과정명
);
--==>>Table COURSE이(가) 생성되었습니다.

--○ CLASSROOM(강의실) 테이블 생성
CREATE TABLE CLASSROOM      -- 강의실TABLE
( CR_ID     VARCHAR2(5)     -- 강의실코드
, CR_NAME   VARCHAR2(20)    -- 강의실명
);
--==>>Table CLASSROOM이(가) 생성되었습니다.

--○ OPENCOURSE(개설과정) 테이블 생성
CREATE TABLE OPENCOURSE     -- 개설과정TABLE
( CS_ID     VARCHAR2(5)     -- 과정코드
, OC_ID     VARCHAR2(5)     -- 개설과정코드
, CR_ID     VARCHAR2(5)     -- 강의실코드
, OC_START  DATE            -- 과정시작
, OC_END    DATE            -- 과정끝
, CAPACITY  NUMBER(2)       -- 수강정원
);
--==>>Table OPENCOURSE이(가) 생성되었습니다.

-- COURSE 테이블 제약조건 추가
ALTER TABLE COURSE
ADD CONSTRAINT COURSE_ID_PK   PRIMARY KEY(CS_ID);

-- CLASSROOM 테이블 제약조건 추가
ALTER TABLE CLASSROOM
ADD CONSTRAINT CLASSROOM_ID_PK   PRIMARY KEY(CR_ID);

-- OPENCOURSE 테이블 제약조건 추가
ALTER TABLE OPENCOURSE
ADD ( CONSTRAINT OPENCOURSE_ID_PK   PRIMARY KEY(OC_ID)
    , CONSTRAINT OPENCOURSE_CS_ID_FK    FOREIGN KEY(CS_ID)      REFERENCES COURSE(CS_ID)
    , CONSTRAINT OPENCOURSE_CR_ID_FK    FOREIGN KEY(CR_ID)      REFERENCES CLASSROOM(CR_ID) );
    
--
ALTER TABLE COURSE
ADD CONSTRAINT COURSE_ID_NN NOT NULL