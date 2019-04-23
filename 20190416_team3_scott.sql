--���� ���̺� ���� ����--
--�� STUDENT ���̺�
CREATE TABLE STUDENT
( STU_ID    VARCHAR2(10)    
, STU_NAME  VARCHAR2(20)
, STU_SSN   VARCHAR2(14)
, STU_TEL   VARCHAR2(13)
);
--==>> Table STUDENT��(��) �����Ǿ����ϴ�.

--�� ADMIN ���̺�
CREATE TABLE ADMIN
( ADM_ID    VARCHAR2(10)
, ADM_PW    VARCHAR2(10)
);
--==>> Table ADMIN��(��) �����Ǿ����ϴ�.

--�� PROFESSOR ���̺�
CREATE TABLE PROFESSOR
( PRO_ID    VARCHAR(10)    -- ����ID 
, PRO_NAME  VARCHAR2(20)  -- �����ڸ�
, PRO_SSN   VARCHAR2(14)  -- �ֹι�ȣ
, PRO_TEL   VARCHAR2(13)    -- ��ȭ��ȣ
);
--==>> Table PROFESSOR��(��) �����Ǿ����ϴ�.

--�� CLASSROOM ���̺�
CREATE TABLE CLASSROOM      -- ���ǽ�TABLE
( CR_ID     VARCHAR2(10)     -- ���ǽ��ڵ�
, CR_NAME   VARCHAR2(20)    -- ���ǽǸ�
);
--==>>Table CLASSROOM��(��) �����Ǿ����ϴ�.

--�� BOOK ���̺�
CREATE TABLE BOOK
( BK_ID     VARCHAR2(10)     -- �����ڵ�
, BK_NAME   VARCHAR2(20)    -- �����
);
--==>> Table BOOK��(��) �����Ǿ����ϴ�.

--�� COURSE ���̺�
CREATE TABLE COURSE         -- ����TABLE
( CS_ID     VARCHAR2(10)     -- �����ڵ�
, CS_NAME   VARCHAR2(20)     -- ������
);
--==>>Table COURSE��(��) �����Ǿ����ϴ�.

--�� SUBJECT ���̺�
CREATE TABLE SUBJECT
( SUB_ID    VARCHAR2(10)     -- �����ڵ�
, SUB_NAME  VARCHAR2(20)    -- �����
);
--==>> Table SUBJECT��(��) �����Ǿ����ϴ�.

--�� DROPSTUDENT ���̺�
CREATE TABLE DROPSTUDENT
( STU_ID        VARCHAR2(10)
, DROP_REASON   VARCHAR2(20)
, DROP_DATE     DATE	DEFAULT SYSDATE
, DROP_STU_ID   VARCHAR2(10)
);
--==>> Table DROPSTUDENT��(��) �����Ǿ����ϴ�.

--�� OPENCOURSE ���̺�
CREATE TABLE OPENCOURSE     -- ��������TABLE
( CS_ID     VARCHAR2(10)     -- �����ڵ�
, OC_ID     VARCHAR2(10)     -- ���������ڵ�
, CR_ID     VARCHAR2(10)     -- ���ǽ��ڵ�
, OC_START  DATE            -- ��������
, OC_END    DATE            -- ������
, CAPACITY  NUMBER(2)       -- ��������
);

--�� REGISTER ���̺�
CREATE TABLE REGISTER
( STU_ID    VARCHAR2(10)
, OC_ID     VARCHAR2(10)
, REG_ID    VARCHAR2(10)
, REG_DATE  DATE    DEFAULT SYSDATE
);
--==>> Table REGISTER��(��) �����Ǿ����ϴ�.

--�� OPENSUBJECT ���̺�
CREATE TABLE OPENSUBJECT
( OC_ID     VARCHAR2(10)     -- ���������ڵ�
, OS_ID     VARCHAR2(10)     -- ���������ڵ�
, PRO_ID    VARCHAR2(10)     -- ����ID
, BK_ID     VARCHAR2(10)     -- �����ڵ�
, SUB_ID    VARCHAR2(10)     -- �����ڵ�
, OS_START  DATE            -- �������
, OS_END    DATE            -- ����
);
--==>> Table OPENSUBJECT��(��) �����Ǿ����ϴ�.

--�� DROPPROFESSOR ���̺�
CREATE TABLE DROPPROFESSOR
( PRO_ID        VARCHAR2(10)  -- ����ID
, DROP_REASON   VARCHAR2(20)  -- Ż�����
, DROP_DATE     DATE  DEFAULT SYSDATE       -- Ż������
, DROP_PRO_ID   VARCHAR2(10)  -- Ż���ڵ�
);
--==>> Table DROPPROFESSOR��(��) �����Ǿ����ϴ�.

--�� GIVEUP ���̺�
CREATE TABLE GIVEUP
( REG_ID    VARCHAR2(10)
, GU_DATE   DATE DEFAULT SYSDATE
, GU_ID     VARCHAR2(10)
);
--==>> Table GIVEUP��(��) �����Ǿ����ϴ�.

--�� SCORE ���̺�
CREATE TABLE SCORE
( OS_ID         VARCHAR2(10)
, REG_ID        VARCHAR2(10)
, ATTENDANCE    NUMBER(3)
, PERFORMANCE   NUMBER(3)
, WRITTEN       NUMBER(3)
, SC_ID         VARCHAR2(10)
);
--==>>Table SCORE��(��) �����Ǿ����ϴ�.

--�� RATIO ���̺�
CREATE TABLE RATIO
( RATIO_ID      VARCHAR2(10)  -- �����ڵ�
, OS_ID         VARCHAR2(10)  -- ���������ڵ�
, ATTENDANCE    NUMBER(3)    -- ��� 
, PERFORMANCE   NUMBER(3)    -- �Ǳ�
, WRITTEN       NUMBER(3)    -- �ʱ�
);
--==>> Table RATIO��(��) �����Ǿ����ϴ�.


--�� �������� �߰�
ALTER TABLE STUDENT
ADD ( CONSTRAINT STUDENT_STU_ID_PK PRIMARY KEY(STU_ID)
    , CONSTRAINT STUDENT_STU_NAME_NN CHECK(STU_NAME IS NOT NULL)
    , CONSTRAINT STUDENT_STU_SSN_NN CHECK(STU_SSN IS NOT NULL) );
--==>> Table STUDENT��(��) ����Ǿ����ϴ�.

ALTER TABLE ADMIN
ADD ( CONSTRAINT ADMIN_ADM_ID_PK PRIMARY KEY(ADM_ID)
    , CONSTRAINT ADMIN_ADM_PW_NN CHECK(ADM_PW IS NOT NULL) );
--==>> Table ADMIN��(��) ����Ǿ����ϴ�.


ALTER TABLE PROFESSOR
ADD (CONSTRAINT PROFESSOR_PRO_ID_PK PRIMARY KEY(PRO_ID)
   , CONSTRAINT PROFESSOR_PRO_NAME_NN CHECK(PRO_NAME IS NOT NULL)
   , CONSTRAINT PROFESSOR_PRO_SSN_NN CHECK(PRO_SSN IS NOT NULL));
--==>> Table PROFESSOR��(��) ����Ǿ����ϴ�.


ALTER TABLE CLASSROOM
ADD ( CONSTRAINT CLASSROOM_CR_ID_PK   PRIMARY KEY(CR_ID)
         , CONSTRAINT CLASSROOM_CR_NAME_NN CHECK(CR_NAME IS NOT NULL));
--==>> Table CLASSROOM��(��) ����Ǿ����ϴ�.

ALTER TABLE BOOK
ADD ( CONSTRAINT BOOK_BK_ID_PK PRIMARY KEY(BK_ID)
         , CONSTRAINT BOOK_BK_NAME_NN CHECK(BK_NAME IS NOT NULL));
--==>> Table BOOK��(��) ����Ǿ����ϴ�.

ALTER TABLE COURSE
ADD ( CONSTRAINT COURSE_CS_ID_PK   PRIMARY KEY(CS_ID)
         , CONSTRAINT COURSE_CS_ID_NN CHECK(CS_ID IS NOT NULL) );
--==>> Table COURSE��(��) ����Ǿ����ϴ�.

ALTER TABLE SUBJECT
ADD (CONSTRAINT SUBJECT_SUB_ID_PK PRIMARY KEY(SUB_ID)
   , CONSTRAINT SUBJECT_SUB_NAME_NN CHECK(SUB_NAME IS NOT NULL));
--==>> Table SUBJECT��(��) ����Ǿ����ϴ�.

ALTER TABLE DROPSTUDENT
ADD ( CONSTRAINT DROPSTUDENT_DROP_STU_ID_PK PRIMARY KEY(DROP_STU_ID)
    , CONSTRAINT DROPSTUDENT_STU_ID_FK FOREIGN KEY(STU_ID) REFERENCES STUDENT(STU_ID)
    , CONSTRAINT DROPSTUDENT_STU_ID_NN CHECK(STU_ID IS NOT NULL)
    , CONSTRAINT DROPSTUDENT_DROP_DATE_NN CHECK(DROP_STU_ID IS NOT NULL) );
--==>> Table DROPSTUDENT��(��) ����Ǿ����ϴ�.
    
ALTER TABLE OPENCOURSE
ADD ( CONSTRAINT OPENCOURSE_OC_ID_PK   PRIMARY KEY(OC_ID)
    , CONSTRAINT OPENCOURSE_CS_ID_FK    FOREIGN KEY(CS_ID)      REFERENCES COURSE(CS_ID)
    , CONSTRAINT OPENCOURSE_CR_ID_FK    FOREIGN KEY(CR_ID)      REFERENCES CLASSROOM(CR_ID) 
    , CONSTRAINT OPENCOURSE_CS_ID_NN CHECK(CS_ID IS NOT NULL)
    , CONSTRAINT OPENCOURSE_CR_ID_NN CHECK(CR_ID IS NOT NULL)
    , CONSTRAINT OPENCOURSE_OC_START_END_CK CHECK(OC_START<OC_END));
--==>> Table OPENCOURSE��(��) ����Ǿ����ϴ�.
    
ALTER TABLE REGISTER
ADD (CONSTRAINT REGISTER_REG_ID_PK PRIMARY KEY(REG_ID)
   , CONSTRAINT REGISTER_STU_ID_FK FOREIGN KEY(STU_ID) REFERENCES STUDENT(STU_ID)
   , CONSTRAINT REGISTER_OC_ID_FK FOREIGN KEY(OC_ID) REFERENCES OPENCOURSE(OC_ID)
   , CONSTRAINT REGISTER_STU_ID_NN CHECK(STU_ID IS NOT NULL)
   , CONSTRAINT REGISTER_OC_ID_NN CHECK(OC_ID IS NOT NULL)
   , CONSTRAINT REGISTER_REG_DATE_NN CHECK(REG_DATE IS NOT NULL));
--==>> Table REGISTER��(��) ����Ǿ����ϴ�.

ALTER TABLE OPENSUBJECT
ADD (CONSTRAINT OPENSUBJECT_OS_ID_PK PRIMARY KEY(OS_ID)
   , CONSTRAINT OPENSUBJECT_OC_ID_FK FOREIGN KEY(OC_ID)    REFERENCES OPENCOURSE(OC_ID)
   , CONSTRAINT OPENSUBJECT_PRO_ID_FK FOREIGN KEY(PRO_ID)  REFERENCES PROFESSOR(PRO_ID)
   , CONSTRAINT OPENSUBJECT_BK_ID_FK FOREIGN KEY(BK_ID)    REFERENCES BOOK(BK_ID)
   , CONSTRAINT OPENSUBJECT_SUB_ID_FK FOREIGN KEY(SUB_ID)  REFERENCES SUBJECT(SUB_ID)
   , CONSTRAINT OPENSUBJECT_OS_ID_NN CHECK(OS_ID IS NOT NULL)
   , CONSTRAINT OPENSUBJECT_PRO_ID_NN CHECK(PRO_ID IS NOT NULL)
   , CONSTRAINT OPENSUBJECT_BK_ID_NN CHECK(BK_ID IS NOT NULL)
   , CONSTRAINT OPENSUBJECT_SUB_ID_NN CHECK(SUB_ID IS NOT NULL)
   , CONSTRAINT OPENSUBJECT_OS_START_END_CK CHECK(OS_START<OS_END));
--==>> Table OPENSUBJECT��(��) ����Ǿ����ϴ�.
  
ALTER TABLE DROPPROFESSOR
ADD (CONSTRAINT DROPPROFESSOR_DROP_PRO_ID_PK PRIMARY KEY(DROP_PRO_ID)
   , CONSTRAINT DROPPROFESSOR_PRO_ID_FK FOREIGN KEY(PRO_ID) REFERENCES PROFESSOR(PRO_ID)
   , CONSTRAINT DROPPROFESSOR_PRO_ID_NN CHECK(PRO_ID IS NOT NULL)
   , CONSTRAINT DROPPROFESSOR_DROP_DATE_NN CHECK(DROP_DATE IS NOT NULL));
--==>> Table DROPPROFESSOR��(��) ����Ǿ����ϴ�.

                                  
ALTER TABLE GIVEUP
ADD (CONSTRAINT GIVEUP_GU_ID_PK PRIMARY KEY(GU_ID)
   , CONSTRAINT GIVEUP_REG_ID_FK FOREIGN KEY(REG_ID) REFERENCES REGISTER(REG_ID)
   , CONSTRAINT GIVEUP_REG_ID_NN CHECK(REG_ID IS NOT NULL)
   , CONSTRAINT GIVEUP_GU_DATE_NN CHECK(GU_DATE IS NOT NULL));
--==>> Table GIVEUP��(��) ����Ǿ����ϴ�.

ALTER TABLE SCORE
ADD (CONSTRAINT SCORE_SC_ID_PK PRIMARY KEY(SC_ID)
   , CONSTRAINT SCORE_REG_ID_FK FOREIGN KEY(REG_ID) REFERENCES REGISTER(REG_ID)
   , CONSTRAINT SCORE_OS_ID_FK FOREIGN KEY(OS_ID) REFERENCES OPENSUBJECT(OS_ID)
   , CONSTRAINT SCORE_OS_ID_NN CHECK(OS_ID IS NOT NULL)
   , CONSTRAINT SCORE_REG_ID_NN CHECK(REG_ID IS NOT NULL));
--==>> Table SCORE��(��) ����Ǿ����ϴ�.


ALTER TABLE RATIO
ADD (CONSTRAINT RATIO_RATIO_ID_PK PRIMARY KEY(RATIO_ID)
   , CONSTRAINT RATIO_OS_ID_FK FOREIGN KEY(OS_ID) REFERENCES OPENSUBJECT(OS_ID)
   , CONSTRAINT RATIO_OS_ID_NN CHECK(OS_ID IS NOT NULL)
   , CONSTRAINT RATIO_ATTENDANCE_NN CHECK(ATTENDANCE IS NOT NULL)
   , CONSTRAINT RATIO_PERFORMANCE_NN CHECK(PERFORMANCE IS NOT NULL)
   , CONSTRAINT RATIO_WRITTEN_NN CHECK(WRITTEN IS NOT NULL)); 
--==>> Table RATIO��(��) ����Ǿ����ϴ�.


COMMIT;

EXEC PRC_STUDENTS_INSERT('batnam','java006$','������','010-2222-2222','����');
-- �̿� ���� ���� �� �ٷ� ���� ���̺��� �����͸� ��� ����� �Է��� �� �ִ�.

    INSERT INTO STUDENT(STU_ID, STU_NAME, STU_SSN, STU_TEL)
    SELECT (SELECT 'S'||TO_CHAR(SYSDATE,'YY')||'_'||LPAD(TO_CHAR(V_STU_ID_NUM), 3, '0'), V_STU_NAME, V_STU_SSN, V_STU_TEL
    FROM DUAL
    WHERE NOT EXISTS (SELECT * FROM STUDENT WHERE STU_SSN=V_STU_SSN );

    INSERT INTO CLASSROOM(CR_ID, CR_NAME)
    VALUES(( SELECT 'CR' || LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR(CR_ID,3))),0)+1), 3, '0') FROM BOOK ), 'A-������');


--�Է����ν���
CREATE OR REPLACE PROCEDURE PRC_STU_INSERT
( V_STU_NAME    IN STUDENT.STU_NAME%TYPE
, V_STU_SSN     IN STUDENT.STU_SSN%TYPE
, V_STU_TEL     IN STUDENT.STU_TEL%TYPE
)
IS
    V_STU_ID        STUDENT.STU_ID%TYPE;
    V_STU_ID_NUM    NUMBER(3);
    NUM_OVER_ERROR  EXCEPTION;
    V_OVERLAP       STUDENT.STU_ID%TYPE;
    OVERLAP_ERROR   EXCEPTION;

BEGIN    
    IF (V_STU_ID_NUM > 999)
        THEN RAISE NUM_OVER_ERROR;
    END IF;
    
    SELECT NVL(MAX(TO_NUMBER(SUBSTR(STU_ID,5))), 0 ) + 1 INTO V_STU_ID_NUM
    FROM STUDENT;
    
    V_STU_ID := 'S'||TO_CHAR(SYSDATE,'YY')||'_'||LPAD(TO_CHAR(V_STU_ID_NUM), 3, '0');
    
    INSERT INTO STUDENT(STU_ID, STU_NAME, STU_SSN, STU_TEL)
    SELECT V_STU_ID, V_STU_NAME, V_STU_SSN, V_STU_TEL
    FROM DUAL
    WHERE NOT EXISTS (SELECT * FROM STUDENT WHERE STU_SSN=V_STU_SSN );

    COMMIT;    
    
    EXCEPTION
        WHEN NUM_OVER_ERROR
            THEN RAISE_APPLICATION_ERROR(-20000, '�Է°����� ���ڹ����� �Ѿ���ϴ�. DB�����ڸ� ȣ���ϼ���');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>>Procedure PRC_STU_INSERT��(��) �����ϵǾ����ϴ�.

CREATE OR REPLACE PROCEDURE PRC_STU_UPDATE
(V_STU_ID       IN STUDENT.STU_ID%TYPE
, V_STU_NAME    IN STUDENT.STU_NAME%TYPE
, V_STU_SSN     IN STUDENT.STU_SSN%TYPE
, V_STU_TEL     IN STUDENT.STU_TEL%TYPE
)
IS
BEGIN
 
    UPDATE STUDENT
    SET STU_NAME=V_STU_NAME, STU_SSN=V_STU_SSN, STU_TEL=V_STU_TEL
    WHERE STU_ID = V_STU_ID;
    
END;

CREATE SEQUENCE SEQ_DROPSTU -- ������ ���� �⺻ ����(MSSQL�� IDENTITY�� ������ ����)
START WITH 1              -- ���۰�
INCREMENT BY 1            -- ������
NOMAXVALUE                -- �ִ밪 ���� ����
NOCACHE;                  -- ĳ�� ��� ����(����)
--==>>Sequence SEQ_DROPSTU����

CREATE OR REPLACE PROCEDURE PRC_DROPSTU_INSERT
( V_STU_ID      IN STUDENT.STU_ID%TYPE
, V_DROP_REASON IN DROPSTUDENT.DROP_REASON%TYPE)
IS
    V_STU_NAME  STUDENT.STU_NAME%TYPE;
    V_STU_SSN   STUDENT.STU_SSN%TYPE;
    V_STU_TEL   STUDENT.STU_TEL%TYPE;
    
BEGIN
    
    INSERT INTO DROPSTUDENT(STU_ID, DROP_REASON, DROP_STU_ID)
    VALUES(V_STU_ID, V_DROP_REASON, SEQ_DROPSTU.NEXTVAL);
    
END;
--==>>Procedure PRC_DROPSTU_INSERT��(��) �����ϵǾ����ϴ�.


EXEC PRC_STU_DELETE('S19_009');


CREATE OR REPLACE PROCEDURE PRC_REGISTER_INSERT
(V_STU_ID   IN STUDENT.STU_ID%TYPE
,V_OC_ID    IN OPENCOURSE.OC_ID%TYPE)
IS
 V_REG_ID       REGISTER.REG_ID%TYPE;
 V_REG_ID_NUM   NUMBER(4);
 V_OC_START     OPENCOURSE.OC_START%TYPE;
 OC_START_ERROR EXCEPTION;
BEGIN

    SELECT OC_START INTO V_OC_START FROM OPENCOURSE WHERE OC_ID=V_OC_ID;
    
    IF (SYSDATE<V_OC_START)
        THEN RAISE OC_START_ERROR;
    END IF;

    SELECT NVL(MAX(TO_NUMBER(SUBSTR(REG_ID,6))), 0 ) + 1 INTO V_REG_ID_NUM
    FROM REGISTER;

    V_REG_ID := 'RG'||TO_CHAR(SYSDATE,'YY')||'_'||LPAD(TO_CHAR(V_REG_ID_NUM), 4, '0');

    
    INSERT INTO REGISTER(STU_ID, OC_ID, REG_ID)
    VALUES (V_STU_ID, V_OC_ID, V_REG_ID);
    
    COMMIT;
    
    EXCEPTION
        WHEN OC_START_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '���� �������� ���� ������ ������û�� �� �����ϴ�');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;




