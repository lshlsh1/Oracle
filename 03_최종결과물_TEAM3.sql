--���� ��ü ���̺� �� ������ ���� ����--

--�� ��ü ���̺� ����
DROP TABLE ADMIN CASCADE CONSTRAINTS;
DROP TABLE COURSE CASCADE CONSTRAINTS;
DROP TABLE STUDENT CASCADE CONSTRAINTS;
DROP TABLE DROPSTUDENT CASCADE CONSTRAINTS;
DROP TABLE REGISTER CASCADE CONSTRAINTS;
DROP TABLE GIVEUP CASCADE CONSTRAINTS;
DROP TABLE SCORE CASCADE CONSTRAINTS;
DROP TABLE PROFESSOR CASCADE CONSTRAINTS;
DROP TABLE CLASSROOM CASCADE CONSTRAINTS;
DROP TABLE BOOK CASCADE CONSTRAINTS;
DROP TABLE SUBJECT CASCADE CONSTRAINTS;
DROP TABLE OPENCOURSE CASCADE CONSTRAINTS;
DROP TABLE RATIO CASCADE CONSTRAINTS;
DROP TABLE OPENSUBJECT CASCADE CONSTRAINTS;
DROP TABLE DROPPROFESSOR CASCADE CONSTRAINTS;
DROP TABLE NAME1 CASCADE CONSTRAINTS;
DROP TABLE NAME2 CASCADE CONSTRAINTS;
DROP TABLE NAME3 CASCADE CONSTRAINTS;

--�� ��ü ������ ����
DROP SEQUENCE SEQ_RATIO;
DROP SEQUENCE SEQ_GIVEUP;
DROP SEQUENCE SEQ_DROPSTU;
DROP SEQUENCE SEQ_DROPPRO;

--�� ������ ����
PURGE RECYCLEBIN;


--���� ���̺�(TABLE) ���� ����--



--�� STUDENT ���̺� ����
CREATE TABLE STUDENT
( STU_ID    VARCHAR2(10)    -- �л� ID
, STU_NAME  VARCHAR2(20)    -- �л���
, STU_SSN   CHAR(14)        -- �ֹι�ȣ
, STU_TEL   CHAR(13)        -- ��ȭ��ȣ
);
--==>> Table STUDENT��(��) �����Ǿ����ϴ�.


--�� ADMIN ���̺� ����
CREATE TABLE ADMIN
( ADM_ID    VARCHAR2(10)    -- ������ ID
, ADM_PW    VARCHAR2(10)    -- ������ PW
);
--==>> Table ADMIN��(��) �����Ǿ����ϴ�.


--�� PROFESSOR ���̺� ����
CREATE TABLE PROFESSOR
( PRO_ID    VARCHAR(10)    -- ������ ID 
, PRO_NAME  VARCHAR2(20)   -- �����ڸ�
, PRO_SSN   CHAR(14)       -- �ֹι�ȣ
, PRO_TEL   CHAR(13)       -- ��ȭ��ȣ
);
--==>> Table PROFESSOR��(��) �����Ǿ����ϴ�.


--�� CLASSROOM ���̺� ����
CREATE TABLE CLASSROOM     -- ���ǽ�TABLE
( CR_ID     VARCHAR2(10)   -- ���ǽ��ڵ�
, CR_NAME   VARCHAR2(100)  -- ���ǽǸ�
);
--==>>Table CLASSROOM��(��) �����Ǿ����ϴ�.


--�� BOOK ���̺� ����
CREATE TABLE BOOK
( BK_ID     VARCHAR2(10)    -- �����ڵ�
, BK_NAME   VARCHAR2(100)   -- �����
);
--==>> Table BOOK��(��) �����Ǿ����ϴ�.


--�� COURSE ���̺� ����
CREATE TABLE COURSE         -- ����TABLE
( CS_ID     VARCHAR2(10)    -- �����ڵ�
, CS_NAME   VARCHAR2(100)   -- ������
);
--==>>Table COURSE��(��) �����Ǿ����ϴ�.


--�� SUBJECT ���̺� ����
CREATE TABLE SUBJECT
( SUB_ID    VARCHAR2(10)    -- �����ڵ�
, SUB_NAME  VARCHAR2(100)   -- �����
);
--==>> Table SUBJECT��(��) �����Ǿ����ϴ�.


--�� DROPSTUDENT ���̺� ����
CREATE TABLE DROPSTUDENT
( STU_ID        VARCHAR2(10)        -- �л� ID
, DROP_REASON   VARCHAR2(1000)      -- Ż�����
, DROP_DATE     DATE	DEFAULT SYSDATE -- Ż������
, DROP_STU_ID   VARCHAR2(10)        -- Ż���ȣ
);
--==>> Table DROPSTUDENT��(��) �����Ǿ����ϴ�.


--�� OPENCOURSE ���̺� ����
CREATE TABLE OPENCOURSE             -- ��������TABLE
( CS_ID     VARCHAR2(10)            -- �����ڵ�
, OC_ID     VARCHAR2(10)            -- ���������ڵ�
, CR_ID     VARCHAR2(10)            -- ���ǽ��ڵ�
, OC_START  DATE                    -- ��������
, OC_END    DATE                    -- ������
, CAPACITY  NUMBER(2)               -- ��������
);


--�� REGISTER ���̺� ����
CREATE TABLE REGISTER               
( STU_ID    VARCHAR2(10)            -- �л� ID
, OC_ID     VARCHAR2(10)            -- ���������ڵ�
, REG_ID    VARCHAR2(10)            -- ������û�ڵ�
, REG_DATE  DATE    DEFAULT SYSDATE -- ������û����
);
--==>> Table REGISTER��(��) �����Ǿ����ϴ�.


--�� OPENSUBJECT ���̺� ����
CREATE TABLE OPENSUBJECT
( OC_ID     VARCHAR2(10)            -- ���������ڵ�
, OS_ID     VARCHAR2(10)            -- ���������ڵ�
, PRO_ID    VARCHAR2(10)            -- ������ ID
, BK_ID     VARCHAR2(10)            -- �����ڵ�
, SUB_ID    VARCHAR2(10)            -- �����ڵ�
, OS_START  DATE                    -- �������
, OS_END    DATE                    -- ����
);
--==>> Table OPENSUBJECT��(��) �����Ǿ����ϴ�.


--�� DROPPROFESSOR ���̺� ����
CREATE TABLE DROPPROFESSOR
( PRO_ID        VARCHAR2(10)            -- ������ ID
, DROP_REASON   VARCHAR2(1000)          -- Ż�����
, DROP_DATE     DATE  DEFAULT SYSDATE   -- Ż������
, DROP_PRO_ID   VARCHAR2(10)            -- Ż���ڵ�
);
--==>> Table DROPPROFESSOR��(��) �����Ǿ����ϴ�.


--�� GIVEUP ���̺� ����
CREATE TABLE GIVEUP
( REG_ID    VARCHAR2(10)         -- ������û�ڵ�
, GU_DATE   DATE DEFAULT SYSDATE -- �ߵ��������
, GU_ID     VARCHAR2(10)         -- �ߵ������ڵ�
);
--==>> Table GIVEUP��(��) �����Ǿ����ϴ�.


--�� SCORE ���̺� ����
CREATE TABLE SCORE
( OS_ID         VARCHAR2(10)    -- ���������ڵ�
, REG_ID        VARCHAR2(10)    -- ������û�ڵ�
, ATTENDANCE    NUMBER(3)       -- ���
, PERFORMANCE   NUMBER(3)       -- �Ǳ�
, WRITTEN       NUMBER(3)       -- �ʱ�
, SC_ID         VARCHAR2(10)    -- �����ڵ�
);
--==>>Table SCORE��(��) �����Ǿ����ϴ�.


--�� RATIO ���̺� ����
CREATE TABLE RATIO
( RATIO_ID      VARCHAR2(10)  -- �����ڵ�
, OS_ID         VARCHAR2(10)  -- ���������ڵ�
, ATTENDANCE    NUMBER(3)     -- ��� 
, PERFORMANCE   NUMBER(3)     -- �Ǳ�
, WRITTEN       NUMBER(3)     -- �ʱ�
);
--==>> Table RATIO��(��) �����Ǿ����ϴ�.


--�� LOG_STUDENT ���̺�(�л� �α��� �ʿ� ���̺�) ����
CREATE TABLE LOG_STUDENT
AS
SELECT STU_ID "STU_ID", SUBSTR(STU_SSN,8) "STU_PW"
FROM STUDENT;
--==>> Table LOG_STUDENT��(��) �����Ǿ����ϴ�.


--�� LOG_PROFESSOR ���̺�(������ �α��� �ʿ� ���̺�) ����
CREATE TABLE LOG_PROFESSOR
AS
SELECT PRO_ID "PRO_ID", SUBSTR(PRO_SSN,8) "PRO_PW"
FROM PROFESSOR;
--==>> Table LOG_PROFESSOR��(��) �����Ǿ����ϴ�.




--���� ��������(CONSTRAINT) �߰� ����--



--�� STUDENT ���̺� �������� �߰�
ALTER TABLE STUDENT
ADD ( CONSTRAINT STUDENT_STU_ID_PK PRIMARY KEY(STU_ID)
    , CONSTRAINT STUDENT_STU_NAME_NN CHECK(STU_NAME IS NOT NULL)
    , CONSTRAINT STUDENT_STU_SSN_NN CHECK(STU_SSN IS NOT NULL) );
--==>> Table STUDENT��(��) ����Ǿ����ϴ�.


--�� ADMIN ���̺� �������� �߰�
ALTER TABLE ADMIN
ADD ( CONSTRAINT ADMIN_ADM_ID_PK PRIMARY KEY(ADM_ID)
    , CONSTRAINT ADMIN_ADM_PW_NN CHECK(ADM_PW IS NOT NULL) );
--==>> Table ADMIN��(��) ����Ǿ����ϴ�.


--�� PROFESSOR ���̺� �������� �߰�
ALTER TABLE PROFESSOR
ADD (CONSTRAINT PROFESSOR_PRO_ID_PK PRIMARY KEY(PRO_ID)
   , CONSTRAINT PROFESSOR_PRO_NAME_NN CHECK(PRO_NAME IS NOT NULL)
   , CONSTRAINT PROFESSOR_PRO_SSN_NN CHECK(PRO_SSN IS NOT NULL));
--==>> Table PROFESSOR��(��) ����Ǿ����ϴ�.


--�� CLASSROOM ���̺� �������� �߰�
ALTER TABLE CLASSROOM
ADD ( CONSTRAINT CLASSROOM_CR_ID_PK   PRIMARY KEY(CR_ID)
         , CONSTRAINT CLASSROOM_CR_NAME_NN CHECK(CR_NAME IS NOT NULL));
--==>> Table CLASSROOM��(��) ����Ǿ����ϴ�.


--�� BOOK ���̺� �������� �߰�
ALTER TABLE BOOK
ADD ( CONSTRAINT BOOK_BK_ID_PK PRIMARY KEY(BK_ID)
         , CONSTRAINT BOOK_BK_NAME_NN CHECK(BK_NAME IS NOT NULL));
--==>> Table BOOK��(��) ����Ǿ����ϴ�.


--�� COURSE ���̺� �������� �߰�
ALTER TABLE COURSE
ADD ( CONSTRAINT COURSE_CS_ID_PK   PRIMARY KEY(CS_ID)
         , CONSTRAINT COURSE_CS_ID_NN CHECK(CS_ID IS NOT NULL) );
--==>> Table COURSE��(��) ����Ǿ����ϴ�.


--�� SUBJECT ���̺� �������� �߰�
ALTER TABLE SUBJECT
ADD (CONSTRAINT SUBJECT_SUB_ID_PK PRIMARY KEY(SUB_ID)
   , CONSTRAINT SUBJECT_SUB_NAME_NN CHECK(SUB_NAME IS NOT NULL));
--==>> Table SUBJECT��(��) ����Ǿ����ϴ�.


--�� DROPSTUDENT ���̺� �������� �߰�
ALTER TABLE DROPSTUDENT
ADD ( CONSTRAINT DROPSTUDENT_DROP_STU_ID_PK PRIMARY KEY(DROP_STU_ID)
    , CONSTRAINT DROPSTUDENT_STU_ID_FK FOREIGN KEY(STU_ID) REFERENCES STUDENT(STU_ID)
    , CONSTRAINT DROPSTUDENT_STU_ID_NN CHECK(STU_ID IS NOT NULL)
    , CONSTRAINT DROPSTUDENT_DROP_DATE_NN CHECK(DROP_STU_ID IS NOT NULL) );
--==>> Table DROPSTUDENT��(��) ����Ǿ����ϴ�.
    

--�� OPENCOURSE ���̺� �������� �߰�    
ALTER TABLE OPENCOURSE
ADD ( CONSTRAINT OPENCOURSE_OC_ID_PK   PRIMARY KEY(OC_ID)
    , CONSTRAINT OPENCOURSE_CS_ID_FK    FOREIGN KEY(CS_ID)      REFERENCES COURSE(CS_ID)
    , CONSTRAINT OPENCOURSE_CR_ID_FK    FOREIGN KEY(CR_ID)      REFERENCES CLASSROOM(CR_ID) 
    , CONSTRAINT OPENCOURSE_CS_ID_NN CHECK(CS_ID IS NOT NULL)
    , CONSTRAINT OPENCOURSE_CR_ID_NN CHECK(CR_ID IS NOT NULL)
    , CONSTRAINT OPENCOURSE_OC_START_END_CK CHECK(OC_START<OC_END));
--==>> Table OPENCOURSE��(��) ����Ǿ����ϴ�.


--�� REGISTER ���̺� �������� �߰�    
ALTER TABLE REGISTER
ADD (CONSTRAINT REGISTER_REG_ID_PK PRIMARY KEY(REG_ID)
   , CONSTRAINT REGISTER_STU_ID_FK FOREIGN KEY(STU_ID) REFERENCES STUDENT(STU_ID)
   , CONSTRAINT REGISTER_OC_ID_FK FOREIGN KEY(OC_ID) REFERENCES OPENCOURSE(OC_ID)
   , CONSTRAINT REGISTER_STU_ID_NN CHECK(STU_ID IS NOT NULL)
   , CONSTRAINT REGISTER_OC_ID_NN CHECK(OC_ID IS NOT NULL)
   , CONSTRAINT REGISTER_REG_DATE_NN CHECK(REG_DATE IS NOT NULL));
--==>> Table REGISTER��(��) ����Ǿ����ϴ�.


--�� OPENSUBJECT ���̺� �������� �߰�
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


--�� DROPPROFESSOR ���̺� �������� �߰�  
ALTER TABLE DROPPROFESSOR
ADD (CONSTRAINT DROPPROFESSOR_DROP_PRO_ID_PK PRIMARY KEY(DROP_PRO_ID)
   , CONSTRAINT DROPPROFESSOR_PRO_ID_FK FOREIGN KEY(PRO_ID) REFERENCES PROFESSOR(PRO_ID)
   , CONSTRAINT DROPPROFESSOR_PRO_ID_NN CHECK(PRO_ID IS NOT NULL)
   , CONSTRAINT DROPPROFESSOR_DROP_DATE_NN CHECK(DROP_DATE IS NOT NULL));
--==>> Table DROPPROFESSOR��(��) ����Ǿ����ϴ�.


--�� GIVEUP ���̺� �������� �߰�                                  
ALTER TABLE GIVEUP
ADD (CONSTRAINT GIVEUP_GU_ID_PK PRIMARY KEY(GU_ID)
   , CONSTRAINT GIVEUP_REG_ID_FK FOREIGN KEY(REG_ID) REFERENCES REGISTER(REG_ID)
   , CONSTRAINT GIVEUP_REG_ID_NN CHECK(REG_ID IS NOT NULL)
   , CONSTRAINT GIVEUP_GU_DATE_NN CHECK(GU_DATE IS NOT NULL));
--==>> Table GIVEUP��(��) ����Ǿ����ϴ�.


--�� SCORE ���̺� �������� �߰�
ALTER TABLE SCORE
ADD (CONSTRAINT SCORE_SC_ID_PK PRIMARY KEY(SC_ID)
   , CONSTRAINT SCORE_REG_ID_FK FOREIGN KEY(REG_ID) REFERENCES REGISTER(REG_ID)
   , CONSTRAINT SCORE_OS_ID_FK FOREIGN KEY(OS_ID) REFERENCES OPENSUBJECT(OS_ID)
   , CONSTRAINT SCORE_OS_ID_NN CHECK(OS_ID IS NOT NULL)
   , CONSTRAINT SCORE_REG_ID_NN CHECK(REG_ID IS NOT NULL));
--==>> Table SCORE��(��) ����Ǿ����ϴ�.


--�� RATIO ���̺� �������� �߰�
ALTER TABLE RATIO
ADD (CONSTRAINT RATIO_RATIO_ID_PK PRIMARY KEY(RATIO_ID)
   , CONSTRAINT RATIO_OS_ID_FK FOREIGN KEY(OS_ID) REFERENCES OPENSUBJECT(OS_ID)
   , CONSTRAINT RATIO_OS_ID_NN CHECK(OS_ID IS NOT NULL)
   , CONSTRAINT RATIO_ATTENDANCE_NN CHECK(ATTENDANCE IS NOT NULL)
   , CONSTRAINT RATIO_PERFORMANCE_NN CHECK(PERFORMANCE IS NOT NULL)
   , CONSTRAINT RATIO_WRITTEN_NN CHECK(WRITTEN IS NOT NULL)); 
--==>> Table RATIO��(��) ����Ǿ����ϴ�.



--���� ������(SEQUENCE) ���� ����--



--�� SEQ_RATIO ������(SEQUENCE) ����
CREATE SEQUENCE SEQ_RATIO  -- ������ ���� �⺻ ����(MSSQL�� IDENTITY�� ������ ����)
START WITH 1               -- ���۰�
INCREMENT BY 1             -- ������
NOMAXVALUE                 -- �ִ밪 ���� ����
NOCACHE;                   -- ĳ�� ��� ����(����)
--==>> Sequence SEQ_RATIO��(��) �����Ǿ����ϴ�.


--�� SEQ_GIVEUP ������(SEQUENCE) ����
CREATE SEQUENCE SEQ_GIVEUP -- ������ ���� �⺻ ����(MSSQL�� IDENTITY�� ������ ����)
START WITH 1              -- ���۰�
INCREMENT BY 1            -- ������
NOMAXVALUE                -- �ִ밪 ���� ����
NOCACHE;                  -- ĳ�� ��� ����(����)
--==>> Sequence SEQ_GIVEUP��(��) �����Ǿ����ϴ�.


--�� SEQ_DROPSTU ������(SEQUENCE) ����
CREATE SEQUENCE SEQ_DROPSTU -- ������ ���� �⺻ ����(MSSQL�� IDENTITY�� ������ ����)
START WITH 1               -- ���۰�
INCREMENT BY 1             -- ������
NOMAXVALUE                 -- �ִ밪 ���� ����
NOCACHE;                   -- ĳ�� ��� ����(����)
--==>> Sequence SEQ_DROPSTU��(��) �����Ǿ����ϴ�.


--�� SEQ_DROPPRO ������(SEQUENCE) ����
CREATE SEQUENCE SEQ_DROPPRO -- ������ ���� �⺻ ����(MSSQL�� IDENTITY�� ������ ����)
  START WITH 1              -- ���۰�
  INCREMENT BY 1            -- ������
  NOMAXVALUE                -- �ִ밪 ���� ����           
  MINVALUE 1                -- �ּҰ�
  NOCYCLE;                  -- ĳ�� ��� ����(����)
--==>> Sequence SEQ_DROPPRO��(��) �����Ǿ����ϴ�.



--���� �Լ�(FUNCTION) ���� ����--



--�� ��� ���̺� � �ڵ尡 ������ 1, ������ 0 �����ϴ� �Լ�(FUNCTION) ����
CREATE OR REPLACE FUNCTION IS_CONTAIN
( TABLE_NAME         IN VARCHAR2
, CODE_OR_ID_COLUMN  IN VARCHAR2
, CODE_OR_ID         IN VARCHAR2
)
RETURN NUMBER
IS
    V_RESULT    NUMBER;
    V_SQL       VARCHAR2(1000);
BEGIN
    V_SQL := 'SELECT NVL2(MAX(' || CODE_OR_ID_COLUMN || '), 1,0) FROM ' || TABLE_NAME || ' WHERE ' || CODE_OR_ID_COLUMN || ' = ''' || CODE_OR_ID ||'''' ;
    
    EXECUTE IMMEDIATE V_SQL INTO V_RESULT;
    
    RETURN V_RESULT;
END;
--==>> Function IS_CONTAIN��(��) �����ϵǾ����ϴ�.


--�� ���̺� �ڵ尪 +1 ���ִ� �Լ�(FUNCTION) ����
CREATE OR REPLACE FUNCTION ADD_ID
( TABLE_NAME        IN VARCHAR2
, CODE_OR_ID_COLUMN IN VARCHAR2
, CODE_OR_ID_FORMAT IN VARCHAR2
)
RETURN VARCHAR2
IS
    V_RESULT    VARCHAR2(10);
    V_SQL       VARCHAR2(1000);
    V_SUFFIX    VARCHAR2(10);
BEGIN
    IF (LENGTH(CODE_OR_ID_FORMAT)=5)
        THEN V_SUFFIX := SUBSTR(CODE_OR_ID_FORMAT, 1, 2);
             V_SQL := 'SELECT ''' || V_SUFFIX || ''' || LPAD( TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR('|| CODE_OR_ID_COLUMN ||', 3))), 0) + 1), 3, ''0'') FROM ' || TABLE_NAME ;
    ELSIF (LENGTH(CODE_OR_ID_FORMAT)=7)
        THEN V_SUFFIX := SUBSTR(CODE_OR_ID_FORMAT, 1, 1);
             V_SQL := 'SELECT '''||V_SUFFIX||'''||SUBSTR(EXTRACT(YEAR FROM SYSDATE), 3, 2)||''_''||LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR('||CODE_OR_ID_COLUMN||',5))), 0 ) + 1), 3, ''0'') FROM '|| TABLE_NAME;
    ELSIF (LENGTH(CODE_OR_ID_FORMAT)=8 AND SUBSTR(CODE_OR_ID_FORMAT,1 ,1)='S')
        THEN V_SUFFIX := SUBSTR(CODE_OR_ID_FORMAT, 1, 1);
             V_SQL := 'SELECT '''||V_SUFFIX||'''||SUBSTR(EXTRACT(YEAR FROM SYSDATE), 3, 2)||''_''||LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR('||CODE_OR_ID_COLUMN||',5))), 0 ) + 1), 4, ''0'') FROM '|| TABLE_NAME;
    ELSIF (LENGTH(CODE_OR_ID_FORMAT)=8)
        THEN V_SUFFIX := SUBSTR(CODE_OR_ID_FORMAT, 1, 2);
             V_SQL := 'SELECT '''||V_SUFFIX||'''||SUBSTR(EXTRACT(YEAR FROM SYSDATE), 3, 2)||''_''||LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR('||CODE_OR_ID_COLUMN||',6))), 0 ) + 1), 3, ''0'') FROM '|| TABLE_NAME;
    ELSIF (LENGTH(CODE_OR_ID_FORMAT)=9)
        THEN V_SUFFIX := SUBSTR(CODE_OR_ID_FORMAT, 1, 2);
             V_SQL := 'SELECT '''||V_SUFFIX||'''||SUBSTR(EXTRACT(YEAR FROM SYSDATE), 3, 2)||''_''||LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR('||CODE_OR_ID_COLUMN||',6))), 0 ) + 1), 4, ''0'') FROM '|| TABLE_NAME;
    END IF;
    
    EXECUTE IMMEDIATE V_SQL INTO V_RESULT;
    
    RETURN V_RESULT;
END;
--==>> Function ADD_ID��(��) �����ϵǾ����ϴ�.



--���� ��(VIEW) ���� ����--


--�� ���� ��(VIEW) ����
CREATE OR REPLACE VIEW ALL_STATUS
AS
SELECT STU.STU_ID "STU_ID"
     , OS.OS_ID "OS_ID"
     , OS.PRO_ID "PRO_ID"
     , CS.CS_ID "CS_ID"
     , CR.CR_ID "CR_ID"
     , OC.OC_ID "OC_ID"
     , SUB.SUB_NAME"�����"
     , CS.CS_NAME "������"
     , OS.OS_START "OS_START"
     , OS.OS_END "OS_END"
     , OC.OC_START "OC_START"
     , OC.OC_END "OC_END"
     , TO_CHAR(OS.OS_START, 'YYYY-MM-DD') || ' ~ ' || TO_CHAR(OS.OS_END, 'YYYY-MM-DD')"����Ⱓ"
     , TO_CHAR(OC.OC_START, 'YYYY-MM-DD') || ' ~ ' || TO_CHAR(OC.OC_END, 'YYYY-MM-DD')"�����Ⱓ"
     , BK.BK_NAME "�����"
     , PRO.PRO_NAME "�����ڸ�"
     , CR.CR_NAME "���ǽ�"
     , STU.STU_NAME "�л���"
     , SC.ATTENDANCE "���"
     , SC.PERFORMANCE "�Ǳ�"
     , SC.WRITTEN "�ʱ�"
     , SC.ATTENDANCE + SC.PERFORMANCE + SC.WRITTEN "����"
     , RANK() OVER(PARTITION BY OS.OS_ID ORDER BY (SC.ATTENDANCE + SC.PERFORMANCE + SC.WRITTEN) DESC) "���"
     , NVL2(GU.GU_DATE, '�ߵ�����', NULL) "�ߵ����⿩��"
     , CASE 
            WHEN OS_START > SYSDATE THEN '���ǿ���'
            WHEN OS_START < SYSDATE AND OS_END > SYSDATE THEN '������'
            WHEN OS_END < SYSDATE THEN '��������'
       ELSE '�̵��'
       END "�������࿩��"
FROM REGISTER REG JOIN OPENSUBJECT OS   ON REG.OC_ID = OS.OC_ID
                  LEFT JOIN SCORE SC    ON (REG.REG_ID = SC.REG_ID AND OS.OS_ID = SC.OS_ID)
                  JOIN SUBJECT SUB      ON OS.SUB_ID = SUB.SUB_ID
                  JOIN BOOK BK          ON OS.BK_ID = BK.BK_ID
                  JOIN OPENCOURSE OC    ON OS.OC_ID = OC.OC_ID
                  JOIN STUDENT STU      ON REG.STU_ID = STU.STU_ID
                  JOIN COURSE CS        ON OC.CS_ID = CS.CS_ID
                  JOIN PROFESSOR PRO    ON OS.PRO_ID = PRO.PRO_ID
                  JOIN CLASSROOM CR     ON OC.CR_ID = CR.CR_ID
                  LEFT JOIN GIVEUP GU   ON REG.REG_ID = GU.REG_ID;
--==>> View ALL_STATUS��(��) �����Ǿ����ϴ�.
              
                  
--���� Ʈ����(TRIGGER) ���� ����--

 
 
CREATE OR REPLACE TRIGGER TRG_OPENCOURSE_DELETE
    BEFORE
    DELETE ON OPENCOURSE
    FOR EACH ROW
DECLARE
    V_OC_START  OPENCOURSE.OC_START%TYPE;
    V_OC_END    OPENCOURSE.OC_END%TYPE;
    
    USER_DEFINE_ERROR EXCEPTION;
BEGIN   
    IF SYSDATE<:OLD.OC_START      -- ���糯¥���� �̷��� �������۳�¥
        THEN DELETE
             FROM REGISTER
             WHERE OC_ID = :OLD.OC_ID;
             DELETE
             FROM OPENSUBJECT
             WHERE OC_ID = :OLD.OC_ID;
    ELSE
        RAISE USER_DEFINE_ERROR;
    END IF;

    -- ����ó��
    EXCEPTION 
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20000, '�����Ұ�');  
            
END;
--==>> Trigger TRG_OPENCOURSE_DELETE��(��) �����ϵǾ����ϴ�.


--�� ���������� ���� �Ҷ� �����ִ� ���������� ���� ����� Ʈ����(TRIGGER) ����
--   ���� ���� ���� ���� �Է��� ��찡 ���� �� �־� Ʈ���� �޾� ����
--   ������ ������ ������ �Է°��� -> ���۵� ������ ������ ���ϹǷ� ������� �ʾƵ���
CREATE OR REPLACE TRIGGER TRG_OPENSUBJECT_DELETE
    BEFORE
    DELETE ON OPENSUBJECT
    FOR EACH ROW
DECLARE
BEGIN
    DELETE
    FROM RATIO
    WHERE OS_ID = :OLD.OS_ID;
END;
--==>> Trigger TRG_OPENSUBJECT_DELETE��(��) �����ϵǾ����ϴ�.





--���� ���ν���(PROCEDURE) ���� ����--



--�� �л� ����(�л���, �ֹι�ȣ, ��ȭ��ȣ) INSERT ���ν���
CREATE OR REPLACE PROCEDURE PRC_STUDENT_INSERT
( V_STU_NAME    IN  STUDENT.STU_NAME%TYPE
, V_STU_SSN     IN  STUDENT.STU_SSN%TYPE
, V_STU_TEL     IN  STUDENT.STU_TEL%TYPE
)
IS
    V_STU_ID            STUDENT.STU_ID%TYPE;
    V_STU_ID_NUM        NUMBER(3);
    ISNULL_STU_SSN      NUMBER(1);
    ISNULL_DROP_STU_ID  NUMBER(1);
    V_DROP_STU_ID  STUDENT.STU_ID%TYPE;
    V_DROP_STU_ID2 STUDENT.STU_ID%TYPE;
    V_DROP_STU_ID3 STUDENT.STU_ID%TYPE;
    
    REENTRANCE_ERROR    EXCEPTION;
    NUM_OVER_ERROR      EXCEPTION;
BEGIN
     IF (V_STU_ID_NUM > 9999)         -- ID���ڰ� 9999�̻��� �Ǹ� ����
        THEN RAISE NUM_OVER_ERROR;
     END IF;

    -- �Է��� �ֹι�ȣ�� �ߺ��� �ֹι�ȣ�� ���̵� �����ϸ� 1, �������� ������ 0
    SELECT NVL2(MAX(STU_SSN), 1, 0), MAX(STU_ID) INTO ISNULL_STU_SSN, V_STU_ID
    FROM STUDENT
    WHERE STU_SSN = V_STU_SSN;

    SELECT NVL2(MAX(DROP_STU_ID), 1, 0) INTO ISNULL_DROP_STU_ID
    FROM DROPSTUDENT
    WHERE STU_ID = V_STU_ID;
    
    IF(ISNULL_STU_SSN=0) -- �ű԰���
        THEN -- ID���ںκ� ���̱�
            SELECT NVL(MAX(TO_NUMBER(SUBSTR(STU_ID,5))), 0 ) + 1 INTO V_STU_ID_NUM
            FROM STUDENT;
            V_STU_ID := 'S'||TO_CHAR(SYSDATE,'YY')||'_'||LPAD(TO_CHAR(V_STU_ID_NUM), 4, '0');
        
            -- �� ���� INSERT�ϱ�
            INSERT INTO STUDENT(STU_ID, STU_NAME, STU_SSN, STU_TEL)
            SELECT V_STU_ID, V_STU_NAME, V_STU_SSN, V_STU_TEL
            FROM DUAL
            WHERE NOT EXISTS (SELECT * FROM STUDENT WHERE STU_SSN=V_STU_SSN ); 

    ELSIF(ISNULL_STU_SSN=1 AND ISNULL_DROP_STU_ID=1)-- Ż���ߴٰ� 1�� ������ �� �ٽð���
        THEN  -- Ż���� ȸ���� �簡���Ҷ� DROPSTUDENT���� ���ڵ带 ����� ����
            SELECT STU_ID INTO V_DROP_STU_ID 
            FROM STUDENT 
            WHERE STU_SSN=V_STU_SSN;         -- �ֹι�ȣ�� STUDENT���� STU_ID ����
            
            SELECT STU_ID INTO V_DROP_STU_ID2 
            FROM DROPSTUDENT 
            WHERE STU_ID=V_DROP_STU_ID; -- STU_ID�� DROPSTUDENT�� ������(Ż���� ȸ���̸�) STU_ID�� V_DROP_STU_ID2�� ��´�
            
                IF(V_DROP_STU_ID=V_DROP_STU_ID2)    -- STUDENT ���̺� STU_ID = DROPSTUDENT ���̺� STU_ID �̸�
                    THEN V_DROP_STU_ID3 := V_DROP_STU_ID;   -- ������ V_DROP_STU_ID3�� ��´�
                END IF;
         
            DELETE
            FROM DROPSTUDENT
            WHERE STU_ID=V_DROP_STU_ID3;    -- V_DROP_STU_ID3�� �����Ѵٸ� DROPSTUDENT ���̺��� ������ ����
            
            UPDATE STUDENT
            SET STU_NAME =V_STU_NAME, STU_TEL=V_STU_TEL
            WHERE STU_ID=V_DROP_STU_ID3;    -- V_DROP_STU_ID3�� �����Ѵٸ� �ֹι�ȣ�� STU_ID�� ������ STUDENT�� ���� �Է°����� ����

    ELSIF(ISNULL_STU_SSN=1 AND ISNULL_DROP_STU_ID=0) -- �̹� ���Ե� ����� �簡���Ϸ��� �ϴ� ���
        THEN RAISE REENTRANCE_ERROR;
    END IF;
    
    -- Ŀ��
    COMMIT;
    
    -- ����ó��
    EXCEPTION
        WHEN NUM_OVER_ERROR
            THEN RAISE_APPLICATION_ERROR(-20000, '�Է°����� ���ڹ����� �Ѿ���ϴ�. DB�����ڸ� ȣ���ϼ���');
                 ROLLBACK;
        WHEN REENTRANCE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20004, '�̹� ������ ������ �����մϴ�');
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_STUDENT_INSERT��(��) �����ϵǾ����ϴ�.


--�� ������ ����(����ID,������,�ֹι�ȣ,��ȭ��ȣ) INSERT ���ν���
CREATE OR REPLACE PROCEDURE PRC_PROFESSOR_INSERT
( V_PRO_NAME    IN  PROFESSOR.PRO_NAME%TYPE
, V_PRO_SSN     IN  PROFESSOR.PRO_SSN%TYPE
, V_PRO_TEL     IN  PROFESSOR.PRO_TEL%TYPE
)
IS
    V_PRO_ID            PROFESSOR.PRO_ID%TYPE;
    V_PRO_ID_NUM        NUMBER(3);
    ISNULL_PRO_SSN      NUMBER(1);
    ISNULL_DROP_PRO_ID  NUMBER(1);
    V_DROP_PRO_ID  PROFESSOR.PRO_ID%TYPE;
    V_DROP_PRO_ID2 PROFESSOR.PRO_ID%TYPE;
    V_DROP_PRO_ID3 PROFESSOR.PRO_ID%TYPE;
       
    REENTRANCE_ERROR    EXCEPTION;
    NUM_OVER_ERROR      EXCEPTION;
BEGIN
     IF (V_PRO_ID_NUM > 999)         -- ID���ڰ� 999�̻��� �Ǹ� ����
        THEN RAISE NUM_OVER_ERROR;
     END IF;

    SELECT NVL2(MAX(PRO_SSN), 1, 0), MAX(PRO_ID) INTO ISNULL_PRO_SSN, V_PRO_ID
    FROM PROFESSOR
    WHERE PRO_SSN = V_PRO_SSN;
    
    SELECT NVL2(MAX(DROP_PRO_ID), 1, 0) INTO ISNULL_DROP_PRO_ID
    FROM DROPPROFESSOR
    WHERE PRO_ID = V_PRO_ID;
    
    IF(ISNULL_PRO_SSN=0) -- �ű԰���
        THEN -- ID���ںκ� ���̱�
            SELECT NVL(MAX(TO_NUMBER(SUBSTR(PRO_ID,6))), 0 ) + 1 INTO V_PRO_ID_NUM
            FROM PROFESSOR;
            V_PRO_ID := 'PR'||TO_CHAR(SYSDATE,'YY')||'_'||LPAD(TO_CHAR(V_PRO_ID_NUM), 3, '0');
        
            -- �� ���� INSERT
            INSERT INTO PROFESSOR(PRO_ID, PRO_NAME, PRO_SSN, PRO_TEL)
            SELECT V_PRO_ID, V_PRO_NAME, V_PRO_SSN, V_PRO_TEL
            FROM DUAL
            WHERE NOT EXISTS (SELECT * FROM PROFESSOR WHERE PRO_SSN=V_PRO_SSN ); 

    ELSIF(ISNULL_PRO_SSN=1 AND ISNULL_DROP_PRO_ID=1) -- Ż���ߴٰ� 1�� ������ �� �ٽð���
        THEN  -- Ż���� ȸ���� �簡���Ҷ� DROPPROFESSOR���� ���ڵ带 ����� ����
            SELECT PRO_ID INTO V_DROP_PRO_ID 
            FROM PROFESSOR 
            WHERE PRO_SSN=V_PRO_SSN;     -- �ֹι�ȣ�� PROFESSOR���� PRO_ID ����
            
            SELECT PRO_ID INTO V_DROP_PRO_ID2 
            FROM DROPPROFESSOR 
            WHERE PRO_ID=V_DROP_PRO_ID; -- PRO_ID�� DROPPROFESSOR�� ������(Ż���� ȸ���̸�) PRO_ID�� V_DROP_PRO_ID2�� ��´�
            
                IF(V_DROP_PRO_ID=V_DROP_PRO_ID2)    -- PROFESSOR ���̺� PRO_ID = DROPPROFESSOR ���̺� PRO_ID �̸�
                    THEN V_DROP_PRO_ID3 := V_DROP_PRO_ID;   -- ������ V_DROP_PRO_ID3�� ��´�
                END IF;
         
            DELETE
            FROM DROPPROFESSOR
            WHERE PRO_ID=V_DROP_PRO_ID3;    -- V_DROP_PRO_ID3�� �����Ѵٸ� DROPPROFESSOR ���̺��� ������ �����ϰ�
            
            UPDATE PROFESSOR
            SET PRO_NAME =V_PRO_NAME, PRO_TEL=V_PRO_TEL
            WHERE PRO_ID=V_DROP_PRO_ID3;    -- V_DROP_PRO_ID3�� �����Ѵٸ� �ֹι�ȣ�� PRO_ID�� ������ PROFESSOR�� ���� �Է°����� ����

    ELSIF(ISNULL_PRO_SSN=1 AND ISNULL_DROP_PRO_ID=0) -- �̹� ���Ե� ����� �簡���Ϸ��� �ϴ� ���
        THEN RAISE REENTRANCE_ERROR;
    END IF;
    
    -- Ŀ��
    COMMIT;
    
    -- ����ó��
    EXCEPTION
        WHEN NUM_OVER_ERROR
            THEN RAISE_APPLICATION_ERROR(-20000, '�Է°����� ���ڹ����� �Ѿ���ϴ�. DB�����ڸ� ȣ���ϼ���');
                 ROLLBACK;
        WHEN REENTRANCE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20004, '�̹� ������ ������ �����մϴ�');
       
END;
--==>> Procedure PRC_PROFESSOR_INSERT��(��) �����ϵǾ����ϴ�.


--�� OPENCOURSE UPDATE ���ν���
CREATE OR REPLACE PROCEDURE PRC_OPENCOURSE_UPDATE
( V_OC_ID       IN OPENCOURSE.OC_ID%TYPE
, V_OC_START    IN OPENCOURSE.OC_START%TYPE
, V_OC_END      IN OPENCOURSE.OC_END%TYPE
, V_CAPACITY    IN OPENCOURSE.CAPACITY%TYPE
)
IS
    V_OC_START_OLD  OPENCOURSE.OC_START%TYPE;
    V_OC_END_OLD    OPENCOURSE.OC_END%TYPE;
    
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    SELECT OC_START, OC_END INTO V_OC_START_OLD, V_OC_END_OLD
    FROM OPENCOURSE
    WHERE OC_ID = V_OC_ID;

    IF SYSDATE>=V_OC_START              -- ���������Ϻ��� ������ ��� ���ܹ߻�
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    UPDATE OPENCOURSE
    SET OC_START = V_OC_START, OC_END = V_OC_END, CAPACITY = V_CAPACITY
    WHERE OC_ID = V_OC_ID;
    
    -- Ŀ��
    COMMIT;
    
    -- ����ó��
    EXCEPTION 
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20000, '�����Ұ�');     
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_OPENCOURSE_UPDATE��(��) �����ϵǾ����ϴ�.


--�� ������ ���� DELETE(DROPPROFESSOR ���̺�� INSERT ó��) ���ν���
CREATE OR REPLACE PROCEDURE PRC_DROPPRO_INSERT
( V_PRO_ID      IN PROFESSOR.PRO_ID%TYPE
, V_DROP_REASON IN DROPPROFESSOR.DROP_REASON%TYPE)
IS  
    V_OS_END      OPENSUBJECT.OS_END%TYPE;
    V_OS_ID       OPENSUBJECT.OS_ID%TYPE;
    ISNULL_PRO_ID NUMBER(1);
    
    OPENCOURSING_PRO_DROP_ERROR   EXCEPTION;        
BEGIN

    SELECT NVL2(MAX(PRO_ID), 1, 0) INTO ISNULL_PRO_ID
    FROM OPENSUBJECT
    WHERE PRO_ID = V_PRO_ID;
    
    IF(ISNULL_PRO_ID=0)
        THEN INSERT INTO DROPPROFESSOR(PRO_ID, DROP_REASON, DROP_PRO_ID)
             VALUES(V_PRO_ID, V_DROP_REASON, SEQ_DROPPRO.NEXTVAL);
    ELSIF(ISNULL_PRO_ID=1)
        THEN SELECT OS_ID INTO V_OS_ID 
             FROM OPENSUBJECT 
             WHERE PRO_ID=V_PRO_ID;
             
             SELECT OS_END INTO V_OS_END 
             FROM OPENSUBJECT 
             WHERE OS_ID=V_OS_ID; 
             
             IF (SYSDATE<=V_OS_END)
                THEN RAISE OPENCOURSING_PRO_DROP_ERROR;
                ELSE INSERT INTO DROPPROFESSOR(PRO_ID, DROP_REASON, DROP_PRO_ID)
                     VALUES(V_PRO_ID, V_DROP_REASON, SEQ_DROPPRO.NEXTVAL);
             END IF;         
    END IF;
    
   -- Ŀ��
   COMMIT;    
    
    -- ����ó��
    EXCEPTION
        WHEN OPENCOURSING_PRO_DROP_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '�������� ������ ������ �� �����ϴ�');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;    
END;
--==>> Procedure PRC_DROPPRO_INSERT��(��) �����ϵǾ����ϴ�.


--�� Ż�� �л� DELETE ���ν���
CREATE OR REPLACE PROCEDURE PRC_DROPSTU_INSERT
( V_STU_ID      IN STUDENT.STU_ID%TYPE
, V_DROP_REASON IN DROPSTUDENT.DROP_REASON%TYPE)
IS  
    V_OC_END   OPENCOURSE.OC_END%TYPE;
    V_OC_START OPENCOURSE.OC_START%TYPE;
    V_OC_ID     REGISTER.OC_ID%TYPE;
    ISNULL_STU_ID   NUMBER(1);
    
    OPENCOURSING_STU_DROP_ERROR   EXCEPTION;
BEGIN

    SELECT NVL2(MAX(STU_ID), 1, 0) INTO ISNULL_STU_ID
    FROM REGISTER
    WHERE STU_ID = V_STU_ID;
    
    IF(ISNULL_STU_ID=0)
        THEN INSERT INTO DROPSTUDENT(STU_ID, DROP_REASON, DROP_STU_ID)
             VALUES(V_STU_ID, V_DROP_REASON, SEQ_DROPSTU.NEXTVAL);
    ELSIF(ISNULL_STU_ID=1)
        THEN SELECT OC_ID INTO V_OC_ID 
             FROM REGISTER 
             WHERE STU_ID=V_STU_ID;
             
             SELECT OC_END INTO V_OC_END 
             FROM OPENCOURSE 
             WHERE OC_ID=V_OC_ID;
             
             SELECT OC_START INTO V_OC_START 
             FROM OPENCOURSE 
             WHERE OC_ID=V_OC_ID;
             
             IF (V_OC_START<=SYSDATE AND SYSDATE<=V_OC_END)
                THEN RAISE OPENCOURSING_STU_DROP_ERROR;
             ELSE INSERT INTO DROPSTUDENT(STU_ID, DROP_REASON, DROP_STU_ID)
                  VALUES(V_STU_ID, V_DROP_REASON, SEQ_DROPSTU.NEXTVAL);
             END IF;
   END IF;
   
   -- Ŀ��
   COMMIT;
     
     -- ����ó��   
     EXCEPTION
        WHEN OPENCOURSING_STU_DROP_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '�������� �л��� ������ �� �����ϴ�');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;    
END;
--==>> Procedure PRC_DROPSTU_INSERT��(��) �����ϵǾ����ϴ�.


--�� ��� ������ ���� PRINT ������
SELECT PRO_ID
FROM PROFESSOR
MINUS
SELECT PRO_ID
FROM OPENSUBJECT
WHERE (OS_START<TO_DATE('2019-04-17','YYYY-MM-DD') AND TO_DATE('2019-04-17','YYYY-MM-DD')<OS_END)
   OR (OS_START<TO_DATE('2019-06-17','YYYY-MM-DD') AND TO_DATE('2019-06-17','YYYY-MM-DD')<OS_END);


--�� �������� INSERT ���ν���
--   ����, �� �Ⱓ�� �Ҵ�� ���� �Ⱓ �ȿ� �ִ��� �˻��ϱ� ���� ���ν��� ���
CREATE OR REPLACE PROCEDURE PRC_OPENSUBJECT_INSERT
( V_OC_ID       IN  OPENCOURSE.OC_ID%TYPE
, V_PRO_ID      IN  PROFESSOR.PRO_ID%TYPE
, V_BK_ID       IN  BOOK.BK_ID%TYPE
, V_SUB_ID      IN  SUBJECT.SUB_ID%TYPE
, V_OS_START    IN  OPENSUBJECT.OS_START%TYPE
, V_OS_END      IN  OPENSUBJECT.OS_END%TYPE
)
IS
    V_OS_ID             OPENSUBJECT.OS_ID%TYPE;
    V_OC_START          OPENCOURSE.OC_START%TYPE;
    V_OC_END            OPENCOURSE.OC_END%TYPE;
    
    DATE_RANGE_ERROR    EXCEPTION;
BEGIN
    SELECT OC_START, OC_END INTO V_OC_START, V_OC_END
    FROM OPENCOURSE
    WHERE OC_ID = V_OC_ID;
    
    IF (V_OS_START<V_OC_START)
        THEN RAISE DATE_RANGE_ERROR;
    ELSIF (V_OS_END>V_OC_END)
        THEN RAISE DATE_RANGE_ERROR;
    ELSIF (V_OS_START >= V_OS_END)
        THEN RAISE DATE_RANGE_ERROR;        
    END IF;
    
    SELECT 'OS' || TO_CHAR(SYSDATE, 'YY') || '_' || LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR(OS_ID,6))),0)+1), 4, '0') INTO V_OS_ID
    FROM OPENSUBJECT;
    
    INSERT INTO OPENSUBJECT(OS_ID, OC_ID, PRO_ID, BK_ID, SUB_ID, OS_START, OS_END)
    VALUES
    ( V_OS_ID    -- ���������ڵ�
    , V_OC_ID    -- ���������ڵ�
    , V_PRO_ID   -- �����ڵ�
    , V_BK_ID    -- �����ڵ�
    , V_SUB_ID   -- �����ڵ�
    , V_OS_START -- �����������
    , V_OS_END   -- ��������
    );
    
    -- Ŀ��
    COMMIT;
    
    -- ����ó��
    EXCEPTION
        WHEN DATE_RANGE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20000, '���� ���� ���� ��¥�� �Է����ּ���');
                 ROLLBACK;
        WHEN OTHERS
            THEN RAISE_APPLICATION_ERROR(-20000, '��ü�Ҹ��� ���� �����ڸ� ȣ���ϼ���');
                 ROLLBACK;
END;
--==>> Procedure PRC_OPENSUBJECT_INSERT��(��) �����ϵǾ����ϴ�.


--�� �������� UPDATE
--   ����, �� �Ⱓ�� �Ҵ�� ���� �Ⱓ �ȿ� �ִ��� �˻��ϱ� ���� ���ν��� ���
CREATE OR REPLACE PROCEDURE PRC_OPENSUBJECT_UPDATE
( V_OS_ID       IN  OPENSUBJECT.OS_ID%TYPE
, V_OC_ID       IN  OPENCOURSE.OC_ID%TYPE
, V_PRO_ID      IN  PROFESSOR.PRO_ID%TYPE
, V_BK_ID       IN  BOOK.BK_ID%TYPE
, V_SUB_ID      IN  SUBJECT.SUB_ID%TYPE
, V_OS_START    IN  OPENSUBJECT.OS_START%TYPE
, V_OS_END      IN  OPENSUBJECT.OS_END%TYPE
)
IS
    V_OC_START          OPENCOURSE.OC_START%TYPE;
    V_OC_END            OPENCOURSE.OC_END%TYPE;
    
    DATE_RANGE_ERROR    EXCEPTION;
BEGIN
    SELECT OC_START, OC_END INTO V_OC_START, V_OC_END
    FROM OPENCOURSE
    WHERE OC_ID = V_OC_ID;
    
    IF (V_OS_START<V_OC_START)
        THEN RAISE DATE_RANGE_ERROR;
    ELSIF (V_OS_END>V_OC_END)
        THEN RAISE DATE_RANGE_ERROR;
    ELSIF (V_OS_START >= V_OS_END)
        THEN RAISE DATE_RANGE_ERROR;        
    END IF;
    
    UPDATE OPENSUBJECT
    SET OC_ID = V_OC_ID
      , PRO_ID = V_PRO_ID
      , BK_ID = V_BK_ID
      , SUB_ID = V_SUB_ID
      , OS_START = V_OS_START 
      , OS_END = V_OS_END
    WHERE OS_ID = V_OS_ID;
    
    -- Ŀ��
    COMMIT;
    
    -- ����ó��
    EXCEPTION
        WHEN DATE_RANGE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20000, '���� ���� ���� ��¥�� �Է����ּ���');
                 ROLLBACK;
        WHEN OTHERS
            THEN RAISE_APPLICATION_ERROR(-20000, '��ü�Ҹ��� ���� �����ڸ� ȣ���ϼ���');
                 ROLLBACK;
END;
--==>> Procedure PRC_OPENSUBJECT_UPDATE��(��) �����ϵǾ����ϴ�.


--�� �������� DELETE ���ν���
CREATE OR REPLACE PROCEDURE PRC_OPENSUBJECT_DELETE
(   V_OS_ID    IN  OPENSUBJECT.OS_ID%TYPE
)
IS
    V_OS_START  OPENSUBJECT.OS_START%TYPE;
    
    ALREADY_OPEN_CANNOT_DELETE EXCEPTION;
BEGIN
    SELECT OS_START INTO V_OS_START
    FROM OPENSUBJECT
    WHERE OS_ID = V_OS_ID;
    
    IF (SYSDATE > V_OS_START)
        THEN RAISE ALREADY_OPEN_CANNOT_DELETE;
    END IF;

    DELETE
    FROM OPENSUBJECT
    WHERE OS_ID = V_OS_ID;
    
    EXCEPTION
        WHEN ALREADY_OPEN_CANNOT_DELETE
            THEN RAISE_APPLICATION_ERROR(-20000, '�̹� �����/�������� ������ ������ �� �����ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN RAISE_APPLICATION_ERROR(-20000, '��ü�Ҹ��� ���� �����ڸ� ȣ���ϼ���');
                 ROLLBACK;
END;
--==>> Procedure PRC_OPENSUBJECT_DELETE��(��) �����ϵǾ����ϴ�.


--�� ������û INSERT ���ν���
CREATE OR REPLACE PROCEDURE PRC_REGISTER_INSERT
( V_STU_ID   IN STUDENT.STU_ID%TYPE
, V_OC_ID    IN OPENCOURSE.OC_ID%TYPE)
IS
    V_REG_ID       REGISTER.REG_ID%TYPE;
    V_REG_ID_NUM   NUMBER(4);
    V_OC_START     OPENCOURSE.OC_START%TYPE;
    V_CAPACITY     OPENCOURSE.CAPACITY%TYPE;
    V_NOW          OPENCOURSE.CAPACITY%TYPE;
  
 OC_START_ERROR EXCEPTION;
 OC_START_ERROR2 EXCEPTION;

BEGIN
    -- �������� ���۳�¥ ��������
    SELECT OC_START INTO V_OC_START FROM OPENCOURSE WHERE OC_ID=V_OC_ID;
       
    -- ���������ϰ��� ����ϸ� ����
    IF (SYSDATE>=V_OC_START)
        THEN RAISE OC_START_ERROR;
    END IF;
    
    SELECT CAPACITY INTO V_CAPACITY 
    FROM OPENCOURSE 
    WHERE OC_ID = V_OC_ID;
    
    SELECT COUNT(*) INTO V_NOW 
    FROM REGISTER  
    WHERE OC_ID = V_OC_ID;
       
    IF (V_CAPACITY = V_NOW)
        THEN RAISE OC_START_ERROR2;
    END IF;   
       
    -- REG_ID�� ���ںκ� �����
    SELECT NVL(MAX(TO_NUMBER(SUBSTR(REG_ID,6))), 0 ) + 1 INTO V_REG_ID_NUM
    FROM REGISTER;

    -- REG_ID����
    V_REG_ID := 'RG'||TO_CHAR(SYSDATE,'YY')||'_'||LPAD(TO_CHAR(V_REG_ID_NUM), 4, '0');

    -- INSERT�ϱ�
    INSERT INTO REGISTER(STU_ID, OC_ID, REG_ID)
    VALUES (V_STU_ID, V_OC_ID, V_REG_ID);
    
    -- Ŀ��
    COMMIT;
    
    -- ����ó��
    EXCEPTION
        WHEN OC_START_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '���� �������� ���� ������ ������û�� �� �����ϴ�');
                 ROLLBACK;
        WHEN OC_START_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20020, '�����ο� �ʰ��Դϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_REGISTER_INSERT��(��) �����ϵǾ����ϴ�.


--�� ������û�̷� DELETE ���ν���
CREATE OR REPLACE PROCEDURE PRC_REGISTER_DELETE
( V_REG_ID     IN REGISTER.REG_ID%TYPE 
)
IS
    V_OC_ID       REGISTER.OC_ID%TYPE;
    V_OC_START    OPENCOURSE.OC_START%TYPE;
 
 COURSE_OPEN_ERROR  EXCEPTION;
BEGIN
    SELECT OC_ID    INTO V_OC_ID FROM REGISTER WHERE REG_ID=V_REG_ID;
    SELECT OC_START INTO V_OC_START FROM OPENCOURSE WHERE OC_ID = V_OC_ID;

    IF (SYSDATE>=V_OC_START)            -- ���ǰ� ���۵Ǳ� ������ ������û�̷��� ������ �� ����
        THEN RAISE COURSE_OPEN_ERROR;
    END IF;

    DELETE
    FROM REGISTER
    WHERE REG_ID = V_REG_ID;
    
    -- Ŀ��
    COMMIT;
    
    -- ����ó��
    EXCEPTION
        WHEN COURSE_OPEN_ERROR
            THEN RAISE_APPLICATION_ERROR(-20000, '������ �̹� ���۵Ǿ��� ��� ������û�� ������ �� �����ϴ�.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_REGISTER_DELETE��(��) �����ϵǾ����ϴ�.


--�� �ߵ� Ż�� ���̺� INSERT ���ν���
CREATE OR REPLACE PROCEDURE PRC_GIVEUP_INSERT
( V_STU_ID   IN STUDENT.STU_ID%TYPE
)
IS
    V_OC_ID     OPENCOURSE.OC_ID%TYPE;
    V_OC_START  OPENCOURSE.OC_START%TYPE;
    V_OC_END    OPENCOURSE.OC_END%TYPE;
    V_REG_ID    REGISTER.REG_ID%TYPE;
     
    USER_DEFINE_ERROR EXCEPTION;
BEGIN  
    SELECT REG_ID INTO V_REG_ID
    FROM REGISTER
    WHERE STU_ID = V_STU_ID;
    
    SELECT OC_ID INTO V_OC_ID
    FROM REGISTER
    WHERE STU_ID = V_STU_ID;
    
    SELECT OC_START, OC_END INTO V_OC_START, V_OC_END
    FROM OPENCOURSE
    WHERE OC_ID = V_OC_ID;
    
    IF SYSDATE<V_OC_START      -- ���ܹ߻� �������� ������ ������ �� ����
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    INSERT INTO GIVEUP(REG_ID, GU_ID)
    VALUES(V_REG_ID, SEQ_GIVEUP.NEXTVAL);
    
    -- ����ó��
    EXCEPTION 
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20000, '�ߵ����� �Ұ� ���� ���Դϴ�.');     
                 ROLLBACK;
        WHEN OTHERS 
            THEN RAISE_APPLICATION_ERROR(-20000, '�ߵ����� �Ұ� ���� ������ �����ϴ�.');   
                 ROLLBACK;
END;
--==>> Procedure PRC_GIVEUP_INSERT��(��) �����ϵǾ����ϴ�.


--�� ���� INSERT ���ν���(������)
CREATE OR REPLACE PROCEDURE PRC_RATIO_INSERT
( V_OS_ID IN RATIO.OS_ID%TYPE
, V_ATTENDANCE IN RATIO.ATTENDANCE%TYPE
, V_PERFORMANCE IN RATIO.PERFORMANCE%TYPE
, V_WRITTEN IN RATIO.WRITTEN%TYPE
)
IS
    USER_DEFINE_ERROR1 EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;   
BEGIN
    IF (V_ATTENDANCE>100 OR V_ATTENDANCE <0) OR 
       (V_PERFORMANCE>100 OR V_PERFORMANCE <0) OR
       (V_WRITTEN>100 OR V_WRITTEN <0)
       THEN RAISE USER_DEFINE_ERROR1;
    END IF;
    
    IF ( (V_ATTENDANCE+V_PERFORMANCE+V_WRITTEN) != 100 )
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    INSERT INTO RATIO(RATIO_ID,OS_ID,ATTENDANCE,PERFORMANCE,WRITTEN)
    VALUES(SEQ_RATIO.NEXTVAL,V_OS_ID,V_ATTENDANCE,V_PERFORMANCE,V_WRITTEN);
    
    -- Ŀ��
    COMMIT;
    
    -- ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20013,'������ 0~100 (%) �� �Է°����մϴ�.');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20015,'���,�Ǳ�,�ʱ� ���� �� ���� 100% �Դϴ�.');
                 ROLLBACK;
        
END;
--==>> Procedure PRC_RATIO_INSERT��(��) �����ϵǾ����ϴ�.


--�� ���� UPDATE ���ν���(������)
CREATE OR REPLACE PROCEDURE PRC_RATIO_UPDATE
( V_OS_ID IN RATIO.OS_ID%TYPE
, V_ATTENDANCE IN RATIO.ATTENDANCE%TYPE
, V_PERFORMANCE IN RATIO.PERFORMANCE%TYPE
, V_WRITTEN IN RATIO.WRITTEN%TYPE
)
IS
   USER_DEFINE_ERROR1 EXCEPTION;
   USER_DEFINE_ERROR2 EXCEPTION;
BEGIN
   IF (V_ATTENDANCE>100 OR V_ATTENDANCE <0) OR 
       (V_PERFORMANCE>100 OR V_PERFORMANCE <0) OR
       (V_WRITTEN>100 OR V_WRITTEN <0)
       THEN RAISE USER_DEFINE_ERROR1;
    END IF;

    IF ( (V_ATTENDANCE+V_PERFORMANCE+V_WRITTEN) != 100 )
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    UPDATE RATIO
    SET ATTENDANCE = V_ATTENDANCE
       ,PERFORMANCE = V_PERFORMANCE
       ,WRITTEN = V_WRITTEN
    WHERE OS_ID = V_OS_ID;
    
    -- Ŀ��
    COMMIT;
    
    -- ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20013,'������ 0~100 (%) �� �Է°����մϴ�.');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20015,'���,�Ǳ�,�ʱ� ���� �� ���� 100% �Դϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;   

END;
--==>> Procedure PRC_RATIO_UPDATE��(��) �����ϵǾ����ϴ�.


--�� ���� INSERT ���ν���(������)
CREATE OR REPLACE PROCEDURE PRC_SCORE_INSERT
(   V_OS_ID IN OPENSUBJECT.OS_ID%TYPE
,   V_STU_ID IN REGISTER.STU_ID%TYPE
,   V_ATTENDANCE IN SCORE.ATTENDANCE%TYPE
,   V_PERFORMANCE IN SCORE.PERFORMANCE%TYPE
,   V_WRITTEN IN SCORE.WRITTEN%TYPE
)
IS
    V_SC_ID SCORE.SC_ID%TYPE ;
    V_SC_ID_NUM NUMBER(10);
    V_REG_ID REGISTER.REG_ID%TYPE;
    V_RA RATIO.ATTENDANCE%TYPE;
    V_RP RATIO.PERFORMANCE%TYPE;
    V_RW RATIO.WRITTEN%TYPE;
    
    V_OC_ID REGISTER.OC_ID%TYPE;
    
    V_OS_END OPENSUBJECT.OS_END%TYPE;
    
    USER_DEFINE_ERROR1 EXCEPTION; 
    USER_DEFINE_ERROR2 EXCEPTION;  
    
BEGIN
   SELECT OS_END INTO V_OS_END FROM OPENSUBJECT WHERE OS_ID = V_OS_ID;  -- OPENSUBJECT ���̺��� OS_END ��������
   
   IF ((SYSDATE < V_OS_END) OR (SYSDATE > V_OS_END +3))        -- ���������Ⱓ (OS_END �������� 3��) 
        THEN RAISE USER_DEFINE_ERROR1;                          
   END IF;

    SELECT OC_ID INTO V_OC_ID FROM OPENSUBJECT WHERE OS_ID = V_OS_ID;
    
    SELECT REG_ID INTO V_REG_ID FROM REGISTER WHERE (STU_ID = V_STU_ID AND OC_ID = V_OC_ID) ;
    -- �л�ID�� �̿��ؼ� REG_ID ��������
    
    SELECT ATTENDANCE INTO V_RA FROM RATIO WHERE OS_ID = V_OS_ID;
    SELECT PERFORMANCE INTO V_RP FROM RATIO WHERE OS_ID = V_OS_ID;
    SELECT WRITTEN INTO V_RW FROM RATIO WHERE OS_ID = V_OS_ID;
    -- RATIO ���̺��� �������� ���̵� ��ġ�ϴ� ������ ��������.
    
    IF (V_ATTENDANCE>100 OR V_ATTENDANCE <0) OR 
       (V_PERFORMANCE>100 OR V_PERFORMANCE <0) OR
       (V_WRITTEN>100 OR V_WRITTEN <0) 
    THEN
       RAISE USER_DEFINE_ERROR2;
    END IF;
    
    
       

    
    
    
    SELECT NVL(MAX(TO_NUMBER(SUBSTR(SC_ID,6))), 0 ) + 1 INTO V_SC_ID_NUM
    FROM SCORE;
    
    
    
            
     V_SC_ID := 'SC'||SUBSTR(TO_CHAR(SYSDATE,'YYYY'),3,2)||'_'
        ||LPAD(TO_CHAR(V_SC_ID_NUM), 4, '0');
 
    
   
    
    INSERT INTO SCORE(SC_ID,OS_ID,REG_ID,ATTENDANCE,PERFORMANCE,WRITTEN)
    VALUES(V_SC_ID,V_OS_ID,V_REG_ID,V_ATTENDANCE * (V_RA / 100)
                ,V_PERFORMANCE * (V_RP / 100),V_WRITTEN * (V_RW / 100));
    
    COMMIT;

    EXCEPTION 
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20010,'�����Է±Ⱓ�� �ƴմϴ�.');
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20011,'������ 0~100 (��) �� �Է°����մϴ�.');
                 ROLLBACK;
        
    
    -- ������ ������ �� �Է� �����ϵ���.
    -- ���� ���� 100�� �̸�����.
    
END;
--==>> Procedure PRC_SCORE_INSERT��(��) �����ϵǾ����ϴ�.


--�� ���� UPDATE ���ν���(������)
CREATE OR REPLACE PROCEDURE PRC_SCORE_UPDATE
( V_OS_ID   IN OPENSUBJECT.OS_ID%TYPE
, V_STU_ID  IN REGISTER.STU_ID%TYPE
, V_ATTENDANCE IN SCORE.ATTENDANCE%TYPE
, V_PERFORMANCE IN SCORE.PERFORMANCE%TYPE
, V_WRITTEN IN SCORE.WRITTEN%TYPE
)
IS
    V_REG_ID REGISTER.REG_ID%TYPE; 
    V_RA RATIO.ATTENDANCE%TYPE;
    V_RP RATIO.PERFORMANCE%TYPE;
    V_RW RATIO.WRITTEN%TYPE;
    V_OS_END OPENSUBJECT.OS_END%TYPE;
    
    USER_DEFINE_ERROR1 EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;
BEGIN       
    IF (V_ATTENDANCE>100 OR V_ATTENDANCE <0) OR 
       (V_PERFORMANCE>100 OR V_PERFORMANCE <0) OR
       (V_WRITTEN>100 OR V_WRITTEN <0)
       THEN RAISE USER_DEFINE_ERROR1;
    END IF;
    
    SELECT OS_END INTO V_OS_END 
    FROM OPENSUBJECT 
    WHERE OS_ID = V_OS_ID;

    IF ((SYSDATE < V_OS_END) OR (SYSDATE > V_OS_END +3))
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
     
    SELECT REG_ID INTO V_REG_ID 
    FROM REGISTER 
    WHERE STU_ID = V_STU_ID;
    
    SELECT ATTENDANCE INTO V_RA 
    FROM RATIO 
    WHERE OS_ID = V_OS_ID;
    
    SELECT PERFORMANCE INTO V_RP 
    FROM RATIO 
    WHERE OS_ID = V_OS_ID;
    
    SELECT WRITTEN INTO V_RW 
    FROM RATIO 
    WHERE OS_ID = V_OS_ID;
    
     UPDATE SCORE
     SET ATTENDANCE = V_ATTENDANCE * (V_RA/100)
       , PERFORMANCE = V_PERFORMANCE * (V_RP/100)
       , WRITTEN = V_WRITTEN * (V_RW/100)
     WHERE (REG_ID = V_REG_ID AND OS_ID = V_OS_ID);
    
    -- Ŀ��
    COMMIT;     
    
    -- ����ó��         
    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20011,'������ 0~100 (��) �� �Է°����մϴ�.');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20014,'���� �����Ⱓ�� �ƴմϴ�.');
                 ROLLBACK;
END;
--==>> Procedure PRC_SCORE_UPDATE��(��) �����ϵǾ����ϴ�.


--�� ���� DELETE ���ν���(������)
CREATE OR REPLACE PROCEDURE PRC_SCORE_DELETE
( V_OS_ID   IN OPENSUBJECT.OS_ID%TYPE
, V_STU_ID  IN REGISTER.STU_ID%TYPE
)
IS
    V_REG_ID REGISTER.REG_ID%TYPE;
    V_OS_END OPENSUBJECT.OS_END%TYPE;
    
    USER_DEFINE_ERROR1 EXCEPTION;    
BEGIN
    SELECT REG_ID INTO V_REG_ID 
    FROM REGISTER 
    WHERE STU_ID = V_STU_ID;
    
    SELECT OS_END INTO V_OS_END 
    FROM OPENSUBJECT 
    WHERE OS_ID = V_OS_ID;

    IF ((SYSDATE < V_OS_END) OR (SYSDATE > V_OS_END +3))
        THEN RAISE USER_DEFINE_ERROR1;
    END IF;
    
    DELETE
    FROM SCORE
    WHERE (REG_ID = V_REG_ID AND OS_ID = V_OS_ID);
    
    -- Ŀ��
    COMMIT;
    
    -- ����ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20014,'���� �����Ⱓ�� �ƴմϴ�.');
                 ROLLBACK;    
        WHEN OTHERS
            THEN ROLLBACK;  
END;
--==>> Procedure PRC_SCORE_DELETE��(��) �����ϵǾ����ϴ�.


--���� �Լ�(FUNCTION) ���� ����--



--�� ���̺� �ڵ尪 +1 ���ִ� �Լ�(FUNCTION) ����
CREATE OR REPLACE FUNCTION ADD_ID
( TABLE_NAME        IN VARCHAR2
, CODE_OR_ID_COLUMN IN VARCHAR2
, CODE_OR_ID_FORMAT IN VARCHAR2
)
RETURN VARCHAR2
IS
    V_RESULT    VARCHAR2(10);
    V_SQL       VARCHAR2(1000);
    V_SUFFIX    VARCHAR2(10);
BEGIN
    IF (LENGTH(CODE_OR_ID_FORMAT)=5)
        THEN V_SUFFIX := SUBSTR(CODE_OR_ID_FORMAT, 1, 2);
             V_SQL := 'SELECT ''' || V_SUFFIX || ''' || LPAD( TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR('|| CODE_OR_ID_COLUMN ||', 3))), 0) + 1), 3, ''0'') FROM ' || TABLE_NAME ;
    ELSIF (LENGTH(CODE_OR_ID_FORMAT)=7)
        THEN V_SUFFIX := SUBSTR(CODE_OR_ID_FORMAT, 1, 1);
             V_SQL := 'SELECT '''||V_SUFFIX||'''||SUBSTR(EXTRACT(YEAR FROM SYSDATE), 3, 2)||''_''||LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR('||CODE_OR_ID_COLUMN||',5))), 0 ) + 1), 3, ''0'') FROM '|| TABLE_NAME;
    ELSIF (LENGTH(CODE_OR_ID_FORMAT)=8)
        THEN V_SUFFIX := SUBSTR(CODE_OR_ID_FORMAT, 1, 2);
             V_SQL := 'SELECT '''||V_SUFFIX||'''||SUBSTR(EXTRACT(YEAR FROM SYSDATE), 3, 2)||''_''||LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR('||CODE_OR_ID_COLUMN||',6))), 0 ) + 1), 3, ''0'') FROM '|| TABLE_NAME;
    ELSIF (LENGTH(CODE_OR_ID_FORMAT)=9)
        THEN V_SUFFIX := SUBSTR(CODE_OR_ID_FORMAT, 1, 2);
             V_SQL := 'SELECT '''||V_SUFFIX||'''||SUBSTR(EXTRACT(YEAR FROM SYSDATE), 3, 2)||''_''||LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR('||CODE_OR_ID_COLUMN||',6))), 0 ) + 1), 4, ''0'') FROM '|| TABLE_NAME;
    END IF;
    
    EXECUTE IMMEDIATE V_SQL INTO V_RESULT;
    
    RETURN V_RESULT;
END;
--==>> Function ADD_ID��(��) �����ϵǾ����ϴ�.


--�� �ֹι�ȣ ���� �Լ�(FUNCTION) ����
CREATE OR REPLACE FUNCTION  FN_MAKE_SSN
RETURN VARCHAR2
IS
    V_YEAR  NUMBER;
    V_MONTH NUMBER;
    V_DAY   NUMBER;
    V_SEX   NUMBER;
    V_ELSE  NUMBER;   
    V_SSN   VARCHAR2(20);
BEGIN
    V_YEAR  := TRUNC(DBMS_RANDOM.VALUE(70, 99));
    V_MONTH := TRUNC(DBMS_RANDOM.VALUE(1, 13));
    V_DAY   := TRUNC(DBMS_RANDOM.VALUE(1, 28));    
    V_SEX   := TRUNC(DBMS_RANDOM.VALUE(1, 3));   
    V_ELSE  := TRUNC(DBMS_RANDOM.VALUE(111111, 999999));
    V_SSN   := TO_CHAR(V_YEAR) || LPAD(TO_CHAR(V_MONTH), 2, '0') || LPAD(TO_CHAR(V_DAY), 2, '0')||'-'||TO_CHAR(V_SEX)||TO_CHAR(V_ELSE);
    
    RETURN V_SSN;
END;
--==>> Function FN_MAKE_SSN��(��) �����ϵǾ����ϴ�.


--�� ��ȭ��ȣ ���� �Լ�(FUNCTION) ����
CREATE OR REPLACE FUNCTION FN_MAKE_TEL
RETURN VARCHAR2
IS
    V_MIDDLE    VARCHAR2(4);
    V_END       VARCHAR2(4);
    V_TEL       VARCHAR2(20);
BEGIN
    V_MIDDLE := TRUNC(DBMS_RANDOM.VALUE(1111, 9999));
    V_END    := TRUNC(DBMS_RANDOM.VALUE(1111, 9999));    
    V_TEL    := '010-'||TO_CHAR(V_MIDDLE)||'-'||TO_CHAR(V_END);
    
    RETURN V_TEL;
END;
--==>> Function FN_MAKE_TEL��(��) �����ϵǾ����ϴ�.

--�� �ڵ��� �ִ��� �а� �������� �����ϴ� �Լ�(FUNCTION) ����
CREATE OR REPLACE FUNCTION ADD_ID
( TABLE_NAME        IN VARCHAR2
, CODE_OR_ID_COLUMN IN VARCHAR2
, CODE_OR_ID_FORMAT IN VARCHAR2
)
RETURN VARCHAR2
IS
    V_RESULT    VARCHAR2(10);
    V_SQL       VARCHAR2(1000);
    V_SUFFIX    VARCHAR2(10);
BEGIN
    IF (LENGTH(CODE_OR_ID_FORMAT)=5)
        THEN V_SUFFIX := SUBSTR(CODE_OR_ID_FORMAT, 1, 2);
             V_SQL := 'SELECT ''' || V_SUFFIX || ''' || LPAD( TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR('|| CODE_OR_ID_COLUMN ||', 3))), 0) + 1), 3, ''0'') FROM ' || TABLE_NAME ;
    ELSIF (LENGTH(CODE_OR_ID_FORMAT)=7)
        THEN V_SUFFIX := SUBSTR(CODE_OR_ID_FORMAT, 1, 1);
             V_SQL := 'SELECT '''||V_SUFFIX||'''||SUBSTR(EXTRACT(YEAR FROM SYSDATE), 3, 2)||''_''||LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR('||CODE_OR_ID_COLUMN||',5))), 0 ) + 1), 3, ''0'') FROM '|| TABLE_NAME;
    ELSIF (LENGTH(CODE_OR_ID_FORMAT)=8 AND SUBSTR(CODE_OR_ID_FORMAT,1 ,1)='S')
        THEN V_SUFFIX := SUBSTR(CODE_OR_ID_FORMAT, 1, 1);
             V_SQL := 'SELECT '''||V_SUFFIX||'''||SUBSTR(EXTRACT(YEAR FROM SYSDATE), 3, 2)||''_''||LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR('||CODE_OR_ID_COLUMN||',5))), 0 ) + 1), 4, ''0'') FROM '|| TABLE_NAME;
    ELSIF (LENGTH(CODE_OR_ID_FORMAT)=8)
        THEN V_SUFFIX := SUBSTR(CODE_OR_ID_FORMAT, 1, 2);
             V_SQL := 'SELECT '''||V_SUFFIX||'''||SUBSTR(EXTRACT(YEAR FROM SYSDATE), 3, 2)||''_''||LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR('||CODE_OR_ID_COLUMN||',6))), 0 ) + 1), 3, ''0'') FROM '|| TABLE_NAME;
    ELSIF (LENGTH(CODE_OR_ID_FORMAT)=9)
        THEN V_SUFFIX := SUBSTR(CODE_OR_ID_FORMAT, 1, 2);
             V_SQL := 'SELECT '''||V_SUFFIX||'''||SUBSTR(EXTRACT(YEAR FROM SYSDATE), 3, 2)||''_''||LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR('||CODE_OR_ID_COLUMN||',6))), 0 ) + 1), 4, ''0'') FROM '|| TABLE_NAME;
    END IF;
    
    EXECUTE IMMEDIATE V_SQL INTO V_RESULT;
    
    RETURN V_RESULT;
END;
--==>> Function ADD_ID��(��) �����ϵǾ����ϴ�.




--���� ���� ������ �Է�(INSERT) ����--



--�� COURSE ���� INSERT
INSERT INTO COURSE(CS_ID, CS_NAME)
VALUES(ADD_ID('COURSE', 'CS_ID', 'CS000'), 'JAVA ������ �缺����');
INSERT INTO COURSE(CS_ID, CS_NAME)
VALUES(ADD_ID('COURSE', 'CS_ID', 'CS000'), '�������� �缺����');
INSERT INTO COURSE(CS_ID, CS_NAME)
VALUES(ADD_ID('COURSE', 'CS_ID', 'CS000'), '�ӽŷ��� Ȱ�� ���� ����');
INSERT INTO COURSE(CS_ID, CS_NAME)
VALUES(ADD_ID('COURSE', 'CS_ID', 'CS000'), '������ �м� ���� ����');
INSERT INTO COURSE(CS_ID, CS_NAME)
VALUES(ADD_ID('COURSE', 'CS_ID', 'CS000'), '���ø����̼� ���� ���� ����');
INSERT INTO COURSE(CS_ID, CS_NAME)
VALUES(ADD_ID('COURSE', 'CS_ID', 'CS000'), '���� ������ �缺 ����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 6


--�� CRASSROOM ���� INSERT
INSERT INTO CLASSROOM(CR_ID, CR_NAME)
VALUES(ADD_ID('CLASSROOM', 'CR_ID', 'CR000'), 'A-������');
INSERT INTO CLASSROOM(CR_ID, CR_NAME)
VALUES(ADD_ID('CLASSROOM', 'CR_ID', 'CR000'), 'B-������');
INSERT INTO CLASSROOM(CR_ID, CR_NAME)
VALUES(ADD_ID('CLASSROOM', 'CR_ID', 'CR000'), 'C-������');
INSERT INTO CLASSROOM(CR_ID, CR_NAME)
VALUES(ADD_ID('CLASSROOM', 'CR_ID', 'CR000'), 'D-������');
INSERT INTO CLASSROOM(CR_ID, CR_NAME)
VALUES(ADD_ID('CLASSROOM', 'CR_ID', 'CR000'), 'E-������');
INSERT INTO CLASSROOM(CR_ID, CR_NAME)
VALUES(ADD_ID('CLASSROOM', 'CR_ID', 'CR000'), 'F-������');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 6


--�� BOOK ���� INSERT
INSERT INTO BOOK(BK_ID, BK_NAME) 
VALUES(ADD_ID('BOOK', 'BK_ID', 'BK000'), 'ó�� ���� JAVA');
INSERT INTO BOOK(BK_ID, BK_NAME) 
VALUES(ADD_ID('BOOK', 'BK_ID', 'BK000'), 'ORACLE �������ϱ�');
INSERT INTO BOOK(BK_ID, BK_NAME) 
VALUES(ADD_ID('BOOK', 'BK_ID', 'BK000'), '���ʺ��� HTML');
INSERT INTO BOOK(BK_ID, BK_NAME) 
VALUES(ADD_ID('BOOK', 'BK_ID', 'BK000'), '���� ���� CSS');
INSERT INTO BOOK(BK_ID, BK_NAME) 
VALUES(ADD_ID('BOOK', 'BK_ID', 'BK000'), 'JAVASCRIPT FOR BEGGINER');
INSERT INTO BOOK(BK_ID, BK_NAME) 
VALUES(ADD_ID('BOOK', 'BK_ID', 'BK000'), 'SPRING �����ӿ�ũ 2�ֿϼ�');
INSERT INTO BOOK(BK_ID, BK_NAME) 
VALUES(ADD_ID('BOOK', 'BK_ID', 'BK000'), 'C��� ����');
INSERT INTO BOOK(BK_ID, BK_NAME) 
VALUES(ADD_ID('BOOK', 'BK_ID', 'BK000'), 'JDBC�� �����ͺ��̽� �����ϱ�');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 8


--�� SUBJECT ���� INSERT
INSERT INTO SUBJECT(SUB_ID, SUB_NAME)
VALUES(ADD_ID('SUBJECT', 'SUB_ID', 'SB000') , 'JAVA');
INSERT INTO SUBJECT(SUB_ID, SUB_NAME)
VALUES(ADD_ID('SUBJECT', 'SUB_ID', 'SB000') , 'ORACLE');
INSERT INTO SUBJECT(SUB_ID, SUB_NAME)
VALUES(ADD_ID('SUBJECT', 'SUB_ID', 'SB000') , 'HTML');
INSERT INTO SUBJECT(SUB_ID, SUB_NAME)
VALUES(ADD_ID('SUBJECT', 'SUB_ID', 'SB000') , 'CSS');
INSERT INTO SUBJECT(SUB_ID, SUB_NAME)
VALUES(ADD_ID('SUBJECT', 'SUB_ID', 'SB000') , 'JAVASCRIPT');
INSERT INTO SUBJECT(SUB_ID, SUB_NAME)
VALUES(ADD_ID('SUBJECT', 'SUB_ID', 'SB000') , 'SPRING');
INSERT INTO SUBJECT(SUB_ID, SUB_NAME)
VALUES(ADD_ID('SUBJECT', 'SUB_ID', 'SB000') , 'C');
INSERT INTO SUBJECT(SUB_ID, SUB_NAME)
VALUES(ADD_ID('SUBJECT', 'SUB_ID', 'SB000') , 'JDBC');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 8


--�� PROFESSOR ���� INSERT
EXEC PRC_PROFESSOR_INSERT('ȫ��ȣ','851124-1113406', '010-8480-7507');
EXEC PRC_PROFESSOR_INSERT('������','861211-1649329', '010-1029-8685');
EXEC PRC_PROFESSOR_INSERT('Ź�Թ�','850813-1747684', '010-6264-3039');
EXEC PRC_PROFESSOR_INSERT('���Ϻ�','841023-1959166', '010-7572-4649');
EXEC PRC_PROFESSOR_INSERT('�����','800712-1259552', '010-5660-3774');

EXEC PRC_PROFESSOR_INSERT('�߿���', '740489-1817954', '010-1248-1748');
EXEC PRC_PROFESSOR_INSERT('��öȯ', '770417-1687814', '010-1217-7789');
EXEC PRC_PROFESSOR_INSERT('�ּ���', '841111-1857145', '010-1384-3566');
EXEC PRC_PROFESSOR_INSERT('������', '860215-1487156', '010-1458-7425');
EXEC PRC_PROFESSOR_INSERT('�ڴܿ�', '811214-1471465', '010-1897-6655');

EXEC PRC_PROFESSOR_INSERT('�ڶ���', '770818-2146745', '010-1354-9371');
EXEC PRC_PROFESSOR_INSERT('�ڿ���', '830411-2251476', '010-1811-9448');
EXEC PRC_PROFESSOR_INSERT('������', '820619-2417648', '010-1917-6581');
EXEC PRC_PROFESSOR_INSERT('������', '790414-2314847', '010-2848-7657');
EXEC PRC_PROFESSOR_INSERT('�ӹ̿�', '800114-2517486', '010-1874-7487');

EXEC PRC_PROFESSOR_INSERT('����ǥ', '830822-1596784', '010-5055-5146');
EXEC PRC_PROFESSOR_INSERT('������', '850729-1365947', '010-5650-5674');
EXEC PRC_PROFESSOR_INSERT('�����', '780507-1587164', '010-9504-9204');
EXEC PRC_PROFESSOR_INSERT('��±�', '720628-1784891', '010-7112-1143');
EXEC PRC_PROFESSOR_INSERT('�Ȼ���', '691202-1098614', '010-7496-3151');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 20


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.




--���� ���ν���(PROCEDURE) ���� ����--



--�� ����, ������ �Է¹޾� �ش翬���� n���� ���� �������� �����
CREATE OR REPLACE PROCEDURE PRC_OPENCOURSE_SAMPLE
( V_YEAR    IN  NUMBER
, V_NUM     IN  NUMBER
)
IS
    V_MONTH NUMBER;
    V_DAY   NUMBER;
    V_OC_START DATE;
    V_OC_END   DATE;
    V_CS_ID COURSE.CS_ID%TYPE;
    V_CR_ID CLASSROOM.CR_ID%TYPE;
    
    NO_MORE_USABLE_DATA EXCEPTION;
BEGIN
    FOR N IN 1 .. V_NUM LOOP
        V_MONTH := TRUNC(DBMS_RANDOM.VALUE(1, 13));
        V_DAY := TRUNC(DBMS_RANDOM.VALUE(1,28));
        
        V_OC_START := TO_DATE(TO_CHAR(V_YEAR)||'-'||TO_CHAR(V_MONTH)||'-'||TO_CHAR(V_DAY), 'YYYY-MM-DD');
        V_OC_END := ADD_MONTHS(V_OC_START, 6);
         DBMS_OUTPUT.PUT_LINE(V_OC_START||' ~ '||V_OC_END);
        ------------------------------------------------------------------------------------------------------------ �̻����
        SELECT CS_ID  INTO V_CS_ID
        FROM
        (SELECT CS_ID
        FROM COURSE
        ORDER BY DBMS_RANDOM.VALUE)
        WHERE ROWNUM=1;
        
        SELECT NVL(MAX(CR_ID), 'NO_DATA') INTO V_CR_ID
        FROM
        (SELECT CR_ID
        FROM (SELECT CR_ID
              FROM CLASSROOM
              MINUS   
              SELECT CR_ID
              FROM OPENCOURSE
              WHERE (OC_START < V_OC_START AND V_OC_START<OC_END)
                 OR (OC_START < V_OC_END AND V_OC_END < OC_END))
        ORDER BY DBMS_RANDOM.VALUE)
        WHERE ROWNUM=1;
        
         DBMS_OUTPUT.PUT_LINE(V_CR_ID);
        ------------------------------------------------------------------------------------------------------------ �̻����
        IF(V_CS_ID='NO_DATA' OR V_CR_ID='NO_DATA')
            THEN DBMS_OUTPUT.PUT_LINE('�Է°����� �����Ͱ� �����ϴ�.');
        ELSE
            INSERT INTO OPENCOURSE(OC_ID, CS_ID, CR_ID, OC_START, OC_END, CAPACITY) 
            VALUES(ADD_ID('OPENCOURSE', 'OC_ID', 'OC19_000'), V_CS_ID, V_CR_ID, V_OC_START, V_OC_END, 20);
        END IF;
        
   END LOOP;  
   /*
   EXCEPTION
       WHEN NO_MORE_USABLE_DATA
           THEN DBMS_OUTPUT.PUT_LINE('�Է°����� �����Ͱ� �����ϴ�.');
       WHEN OTHERS
           THEN RAISE_APPLICATION_ERROR(-20000, '��ü�Ҹ��� ���� �߻�. �����ڸ� �ҷ��ּ���');   
    */
END;
--==>> Procedure PRC_OPENCOURSE_SAMPLE��(��) �����ϵǾ����ϴ�.


SET SERVEROUTPUT ON;


--�� �������� ���� INSERT
EXEC PRC_OPENCOURSE_SAMPLE(2017, 10);
EXEC PRC_OPENCOURSE_SAMPLE(2018, 10);
EXEC PRC_OPENCOURSE_SAMPLE(2019, 10);
EXEC PRC_OPENCOURSE_SAMPLE(2020, 10);




--���� ���ν���(PROCEDURE) ���� ����--



--�� �������� ����
--   Ŀ���� ���������� ��´�. 
--   ���������� �������� 3���� ������. ���� ������ ���縦 ��� �ٷ�� �ϴ� ���� ������ ����(�ϴ� ���񺰷� ���� 1���� �ִٰ� ���� - ���߿� ��/�ۿ��� ���� �ϴϱ� ���� ���ص���)
CREATE OR REPLACE PROCEDURE PRC_OPENSUBJECT_SAMPLE
IS
    CURSOR CUR_OPENCOURSE
    IS
    SELECT OC_ID, OC_START
    FROM OPENCOURSE;
    
    V_TEMP2     NUMBER; -- ���� ������ ����
    V_TEMP      NUMBER; -- ���� ���� ��Ƶ�
    V_NUM       NUMBER; -- ����, ���� �� ��������
    V_OC_ID     OPENCOURSE.OC_ID%TYPE;
    V_OC_START  OPENCOURSE.OC_START%TYPE;
    V_PRO_ID    PROFESSOR.PRO_ID%TYPE;
    V_BK_ID     BOOK.BK_ID%TYPE;
    V_SUB_ID    SUBJECT.SUB_ID%TYPE;
BEGIN
    OPEN CUR_OPENCOURSE;
    LOOP
        FETCH CUR_OPENCOURSE INTO V_OC_ID, V_OC_START;
        
        SELECT COUNT(*) INTO V_TEMP
        FROM SUBJECT;
        
        V_TEMP2 := 0;
        
        FOR N IN 1 .. 3 LOOP
            V_NUM    := TRUNC(DBMS_RANDOM.VALUE(1, V_TEMP+1));            
            V_SUB_ID := 'SB'|| LPAD(TO_CHAR(V_NUM), 3, '0');
            V_BK_ID  := 'BK'|| LPAD(TO_CHAR(V_NUM), 3, '0');
            
            SELECT NVL(MAX(PRO_ID), 'NO_DATA') INTO V_PRO_ID
            FROM
            (SELECT PRO_ID
            FROM
               (SELECT PRO_ID
                FROM PROFESSOR
                MINUS
                SELECT PRO_ID
                FROM OPENSUBJECT
                WHERE (OS_START<ADD_MONTHS(V_OC_START, 2*V_TEMP2)       AND ADD_MONTHS(V_OC_START, 2*V_TEMP2)<OS_END)
                   OR (OS_START<ADD_MONTHS(V_OC_START, 2*(V_TEMP2 + 1)) AND ADD_MONTHS(V_OC_START, 2*(V_TEMP2 + 1))<OS_END))
            ORDER BY DBMS_RANDOM.VALUE)
            WHERE ROWNUM=1;
            
            IF(V_PRO_ID = 'NO_DATA')
                THEN V_PRO_ID := ADD_ID('PROFESSOR', 'PRO_ID', 'PR19_000');
                     INSERT INTO PROFESSOR(PRO_ID, PRO_NAME, PRO_SSN, PRO_TEL) VALUES(V_PRO_ID, '�ӽñ���', '999999-9999999', '999-9999-9999');
            END IF;
            
            INSERT INTO OPENSUBJECT(OS_ID, OC_ID, PRO_ID, BK_ID, SUB_ID, OS_START, OS_END)
            VALUES (ADD_ID('OPENSUBJECT', 'OS_ID', 'OS19_0000'), V_OC_ID, V_PRO_ID, V_BK_ID, V_SUB_ID, ADD_MONTHS(V_OC_START, 2*V_TEMP2), ADD_MONTHS(V_OC_START, 2*(V_TEMP2 + 1)));
            
            V_TEMP2 := V_TEMP2 + 1;
        END LOOP;
        
        EXIT WHEN CUR_OPENCOURSE%NOTFOUND;
    END LOOP;
    
    CLOSE CUR_OPENCOURSE;
END;
--==>> Procedure PRC_OPENSUBJECT_SAMPLE��(��) �����ϵǾ����ϴ�.

EXEC PRC_OPENSUBJECT_SAMPLE;

SELECT *
FROM OPENSUBJECT;
SELECT *
FROM OPENCOURSE;

--�� Ŀ��
COMMIT;


CREATE TABLE NAME1
( NAME1 NCHAR(1));
--==>> Table NAME1��(��) �����Ǿ����ϴ�.

INSERT INTO NAME1 VALUES('��');
INSERT INTO NAME1 VALUES('��');
INSERT INTO NAME1 VALUES('��');
INSERT INTO NAME1 VALUES('��');
INSERT INTO NAME1 VALUES('��');

INSERT INTO NAME1 VALUES('��');
INSERT INTO NAME1 VALUES('��');
INSERT INTO NAME1 VALUES('��');
INSERT INTO NAME1 VALUES('��');
INSERT INTO NAME1 VALUES('��');

CREATE TABLE NAME2
( NAME2 NCHAR(1));
--==>> Table NAME2��(��) �����Ǿ����ϴ�.

INSERT INTO NAME2 VALUES('��');
INSERT INTO NAME2 VALUES('��');
INSERT INTO NAME2 VALUES('��');
INSERT INTO NAME2 VALUES('��');
INSERT INTO NAME2 VALUES('��');

INSERT INTO NAME2 VALUES('��');
INSERT INTO NAME2 VALUES('��');
INSERT INTO NAME2 VALUES('��');
INSERT INTO NAME2 VALUES('��');
INSERT INTO NAME2 VALUES('��');

CREATE TABLE NAME3
( NAME3 NCHAR(1));
--==>> Table NAME3��(��) �����Ǿ����ϴ�.

INSERT INTO NAME3 VALUES('ȯ');
INSERT INTO NAME3 VALUES('��');
INSERT INTO NAME3 VALUES('��');
INSERT INTO NAME3 VALUES('��');
INSERT INTO NAME3 VALUES('��');

INSERT INTO NAME3 VALUES('��');
INSERT INTO NAME3 VALUES('��');
INSERT INTO NAME3 VALUES('��');
INSERT INTO NAME3 VALUES('��');
INSERT INTO NAME3 VALUES('��');



CREATE OR REPLACE PROCEDURE PRC_STUDENT_SAMPLE
IS
    CURSOR CUR_NAME
    IS
    SELECT NAME1||NAME2||NAME3 "STU_NAME"
    FROM NAME1, NAME2, NAME3
    ORDER BY DBMS_RANDOM.VALUE;
    
    V_STU_NAME  STUDENT.STU_NAME%TYPE;    
    V_STU_SSN   STUDENT.STU_SSN%TYPE;
    V_STU_TEL   STUDENT.STU_TEL%TYPE;
BEGIN
    OPEN CUR_NAME;
    LOOP
        FETCH CUR_NAME INTO V_STU_NAME;
            V_STU_TEL := FN_MAKE_TEL;
            
            LOOP
                V_STU_SSN := FN_MAKE_SSN;
                EXIT WHEN IS_CONTAIN('STUDENT','STU_SSN',V_STU_SSN)=0;
            END LOOP;
            
            --DBMS_OUTPUT.PUT_LINE(V_STU_NAME||'   '|| V_STU_SSN||'   '|| V_STU_TEL);
           INSERT INTO STUDENT(STU_ID, STU_NAME, STU_SSN, STU_TEL) VALUES(ADD_ID('STUDENT','STU_ID','S19_0000') , V_STU_NAME, V_STU_SSN, V_STU_TEL);
            
        EXIT WHEN CUR_NAME%NOTFOUND;
    END LOOP;
    CLOSE CUR_NAME;
END;
--==>> Procedure PRC_STUDENT_SAMPLE��(��) �����ϵǾ����ϴ�.


EXEC PRC_STUDENT_SAMPLE;


CREATE OR REPLACE PROCEDURE PRC_REGISTER_SAMPLE
IS  
    CURSOR CUR_OPENCOURSE
    IS
    SELECT OC_ID, OC_START
    FROM OPENCOURSE;
    
    V_OC_ID     OPENCOURSE.OC_ID%TYPE;
    V_OC_START  OPENCOURSE.OC_START%TYPE;    
    V_ID_NUM    NUMBER;
    V_STU_ID    STUDENT.STU_ID%TYPE;
BEGIN
    V_ID_NUM := 1;
    
    OPEN CUR_OPENCOURSE;
    
    LOOP
        FETCH CUR_OPENCOURSE INTO V_OC_ID, V_OC_START;
        
            DBMS_OUTPUT.PUT_LINE('======================  '||V_OC_ID||'  ======================');
            
            FOR N IN 1 .. 17 LOOP
                SELECT STU_ID INTO V_STU_ID
                FROM STUDENT
                WHERE TO_NUMBER(SUBSTR(STU_ID,5)) = V_ID_NUM;
                
                INSERT INTO REGISTER(REG_ID, STU_ID, OC_ID, REG_DATE) VALUES(ADD_ID('REGISTER','REG_ID','RG19_0000'), V_STU_ID, V_OC_ID, V_OC_START);
                
                V_ID_NUM := V_ID_NUM+1;
            END LOOP;

        EXIT WHEN CUR_OPENCOURSE%NOTFOUND;
    END LOOP;
    
    CLOSE CUR_OPENCOURSE;
    
    EXCEPTION 
        WHEN NO_DATA_FOUND
            THEN DBMS_OUTPUT.PUT_LINE('�뵥���� ����');
END;
--==>> Procedure PRC_REGISTER_SAMPLE��(��) �����ϵǾ����ϴ�.

EXEC PRC_REGISTER_SAMPLE;


SELECT COUNT(*)
FROM REGISTER
WHERE TO_NUMBER(SUBSTR(STU_ID,5)) >= 562;

SELECT COUNT(*)
FROM REGISTER;

--�� Ŀ��
COMMIT;




--���� ���ν���(PROCEDURE) ���� ����--



CREATE OR REPLACE PROCEDURE PRC_RATIO_SAMPLE
IS
    CURSOR CUR_OPENSUBJECT
    IS
    SELECT OS_ID
    FROM OPENSUBJECT;
    
    V_OS_ID         OPENSUBJECT.OS_ID%TYPE;
    V_ATTENDANCE    RATIO.ATTENDANCE%TYPE;
    V_PERFORMANCE   RATIO.PERFORMANCE%TYPE;
    V_WRITTEN       RATIO.WRITTEN%TYPE;
BEGIN
    OPEN CUR_OPENSUBJECT;
    LOOP
        FETCH CUR_OPENSUBJECT INTO V_OS_ID;
        
        V_ATTENDANCE := ROUND(DBMS_RANDOM.VALUE(20,40), -1);
        V_PERFORMANCE := ROUND(DBMS_RANDOM.VALUE(20,40), -1);
        V_WRITTEN := 100 - V_ATTENDANCE - V_PERFORMANCE;
        
        INSERT INTO RATIO(RATIO_ID, OS_ID, ATTENDANCE, PERFORMANCE, WRITTEN)
        VALUES(SEQ_RATIO.NEXTVAL, V_OS_ID, V_ATTENDANCE, V_PERFORMANCE, V_WRITTEN);
        
        EXIT WHEN CUR_OPENSUBJECT%NOTFOUND;
    END LOOP;
    CLOSE CUR_OPENSUBJECT;
END;
--==>> Procedure PRC_RATIO_SAMPLE��(��) �����ϵǾ����ϴ�.

SELECT *
FROM RATIO;

EXEC PRC_RATIO_SAMPLE;


CREATE OR REPLACE PROCEDURE PRC_SCORE_SAMPLE
IS  
    V_OS_ID         OPENSUBJECT.OS_ID%TYPE;
    V_REG_ID        REGISTER.REG_ID%TYPE;
    V_ATTENDANCE    RATIO.ATTENDANCE%TYPE;
    V_PERFORMANCE   RATIO.PERFORMANCE%TYPE;
    V_WRITTEN       RATIO.WRITTEN%TYPE;
    V_OS_END        OPENSUBJECT.OS_END%TYPE;
    V_SC_ID         SCORE.SC_ID%TYPE;
    
    CURSOR  CUR_GET_V
    IS
    SELECT OS.OS_ID, REG.REG_ID, RATIO.ATTENDANCE, RATIO.PERFORMANCE, RATIO.WRITTEN, OS.OS_END
    FROM OPENSUBJECT OS JOIN REGISTER REG ON OS.OC_ID = REG.OC_ID
                        JOIN RATIO        ON OS.OS_ID = RATIO.OS_ID;
BEGIN
    OPEN CUR_GET_V;
    LOOP
        FETCH CUR_GET_V INTO V_OS_ID, V_REG_ID, V_ATTENDANCE, V_PERFORMANCE, V_WRITTEN, V_OS_END;
        
        V_SC_ID := ADD_ID('SCORE', 'SC_ID', 'SC19_0000');    
        
        IF (SYSDATE < V_OS_END)
            THEN DBMS_OUTPUT.PUT_LINE('������ ���� �� �Է��� �ּ���');
        ELSE            
            INSERT INTO SCORE(SC_ID, OS_ID, REG_ID, ATTENDANCE, PERFORMANCE, WRITTEN)
            VALUES(V_SC_ID, V_OS_ID, V_REG_ID, TRUNC(DBMS_RANDOM.VALUE(60, 100))*V_ATTENDANCE/100,  TRUNC(DBMS_RANDOM.VALUE(60, 100))*V_PERFORMANCE/100, TRUNC(DBMS_RANDOM.VALUE(60, 100))*V_WRITTEN/100);
        END IF;
                
        EXIT WHEN CUR_GET_V%NOTFOUND;
    END LOOP;
    
    CLOSE CUR_GET_V;
    
    COMMIT;
END;
--==>> Procedure PRC_SCORE_SAMPLE��(��) �����ϵǾ����ϴ�.


EXEC PRC_SCORE_SAMPLE;

SELECT *
FROM SCORE
ORDER BY 2 DESC ,1 DESC;

SELECT *
FROM OPENSUBJECT
WHERE OS_END > SYSDATE;
--> ������ �������� ������ ���� ���� 52��

SELECT *
FROM OPENSUBJECT;
--> ��ü ���� 99�� (33�� ���� * 3����)

--�� Ŀ��
COMMIT;



--���� ���̺�&�÷� �ڸ�Ʈ(COMMENT) ����--



COMMENT ON TABLE ADMIN IS '������';
    COMMENT ON COLUMN ADMIN.ADM_ID IS '������ ID';
    COMMENT ON COLUMN ADMIN.ADM_PW IS '������ PW';

COMMENT ON TABLE BOOK IS '����';
    COMMENT ON COLUMN BOOK.BK_ID IS '�����ڵ�';
    COMMENT ON COLUMN BOOK.BK_NAME IS '�����';
    
COMMENT ON TABLE CLASSROOM IS '���ǽ�';
    COMMENT ON COLUMN CLASSROOM.CR_ID IS '���ǽ��ڵ�';
    COMMENT ON COLUMN CLASSROOM.CR_NAME IS '���ǽǸ�';
    
COMMENT ON TABLE COURSE IS '����';    
    COMMENT ON COLUMN COURSE.CS_ID IS '�����ڵ�';
    COMMENT ON COLUMN COURSE.CS_NAME IS '������';
    
COMMENT ON TABLE DROPPROFESSOR IS '����Ż��';
    COMMENT ON COLUMN DROPPROFESSOR.PRO_ID IS '���� ID';
    COMMENT ON COLUMN DROPPROFESSOR.DROP_REASON IS 'Ż�����';
    COMMENT ON COLUMN DROPPROFESSOR.DROP_DATE IS 'Ż������';
    COMMENT ON COLUMN DROPPROFESSOR.DROP_PRO_ID IS 'Ż���ڵ�';

COMMENT ON TABLE DROPSTUDENT IS '�л�Ż��';
    COMMENT ON COLUMN DROPSTUDENT.STU_ID IS '�л� ID';
    COMMENT ON COLUMN DROPSTUDENT.DROP_REASON IS 'Ż�����';
    COMMENT ON COLUMN DROPSTUDENT.DROP_DATE IS 'Ż������';
    COMMENT ON COLUMN DROPSTUDENT.DROP_STU_ID IS 'Ż���ڵ�';
    
COMMENT ON TABLE GIVEUP IS '�ߵ�����';
    COMMENT ON COLUMN GIVEUP.REG_ID IS '������û�ڵ�';
    COMMENT ON COLUMN GIVEUP.GU_DATE IS '�ߵ��������';
    COMMENT ON COLUMN GIVEUP.GU_ID IS '�ߵ������ڵ�';
    
COMMENT ON TABLE LOG_PROFESSOR IS '�����α���';
    COMMENT ON COLUMN LOG_PROFESSOR.PRO_ID IS '���� ID';
    COMMENT ON COLUMN LOG_PROFESSOR.PRO_PW IS '���� PW';

COMMENT ON TABLE LOG_STUDENT IS '�л��α���';
    COMMENT ON COLUMN LOG_STUDENT.STU_ID IS '�л� ID';
    COMMENT ON COLUMN LOG_STUDENT.STU_PW IS '�л� PW';

COMMENT ON TABLE OPENCOURSE IS '��������';
    COMMENT ON COLUMN OPENCOURSE.CS_ID IS '�����ڵ�';
    COMMENT ON COLUMN OPENCOURSE.OC_ID IS '���������ڵ�';
    COMMENT ON COLUMN OPENCOURSE.CR_ID IS '���ǽ��ڵ�';
    COMMENT ON COLUMN OPENCOURSE.OC_START IS '��������';
    COMMENT ON COLUMN OPENCOURSE.OC_END IS '������';
    COMMENT ON COLUMN OPENCOURSE.CAPACITY IS '��������';
    
COMMENT ON TABLE OPENSUBJECT IS '��������';
    COMMENT ON COLUMN OPENSUBJECT.OC_ID IS '���������ڵ�';
    COMMENT ON COLUMN OPENSUBJECT.OS_ID IS '���������ڵ�';
    COMMENT ON COLUMN OPENSUBJECT.PRO_ID IS '���� ID';
    COMMENT ON COLUMN OPENSUBJECT.BK_ID IS '�����ڵ�';
    COMMENT ON COLUMN OPENSUBJECT.SUB_ID IS '�����ڵ�';
    COMMENT ON COLUMN OPENSUBJECT.OS_START IS '�������';
    COMMENT ON COLUMN OPENSUBJECT.OS_END IS '����';

COMMENT ON TABLE PROFESSOR IS '����';
    COMMENT ON COLUMN PROFESSOR.PRO_ID IS '���� ID';
    COMMENT ON COLUMN PROFESSOR.PRO_NAME IS '������';
    COMMENT ON COLUMN PROFESSOR.PRO_SSN IS '�ֹι�ȣ';
    COMMENT ON COLUMN PROFESSOR.PRO_TEL IS '��ȭ��ȣ';

COMMENT ON TABLE RATIO IS '����';
    COMMENT ON COLUMN RATIO.RATIO_ID IS '�����ڵ�';
    COMMENT ON COLUMN RATIO.OS_ID IS '���������ڵ�';
    COMMENT ON COLUMN RATIO.ATTENDANCE IS '���';
    COMMENT ON COLUMN RATIO.PERFORMANCE IS '�Ǳ�';
    COMMENT ON COLUMN RATIO.WRITTEN IS '�ʱ�';

COMMENT ON TABLE REGISTER IS '������û';
    COMMENT ON COLUMN REGISTER.STU_ID IS '�л� ID';
    COMMENT ON COLUMN REGISTER.OC_ID IS '���������ڵ�';
    COMMENT ON COLUMN REGISTER.REG_ID IS '������û�ڵ�';
    COMMENT ON COLUMN REGISTER.REG_DATE IS '������û����';

COMMENT ON TABLE SCORE IS '����';
    COMMENT ON COLUMN SCORE.OS_ID IS '���������ڵ�';
    COMMENT ON COLUMN SCORE.REG_ID IS '������û�ڵ�';
    COMMENT ON COLUMN SCORE.ATTENDANCE IS '���';
    COMMENT ON COLUMN SCORE.PERFORMANCE IS '�Ǳ�';
    COMMENT ON COLUMN SCORE.WRITTEN IS '�ʱ�';
    COMMENT ON COLUMN SCORE.SC_ID IS '�����ڵ�';

COMMENT ON TABLE STUDENT IS '�л�';
    COMMENT ON COLUMN STUDENT.STU_ID IS '�л� ID';
    COMMENT ON COLUMN STUDENT.STU_NAME IS '�л���';
    COMMENT ON COLUMN STUDENT.STU_SSN IS '�ֹι�ȣ';
    COMMENT ON COLUMN STUDENT.STU_TEL IS '��ȭ��ȣ';
    
COMMENT ON TABLE SUBJECT IS '����';
    COMMENT ON COLUMN SUBJECT.SUB_ID IS '�����ڵ�';
    COMMENT ON COLUMN SUBJECT.SUB_NAME IS '�����';






-- �� �������� �䱸�м�


-- 1. �ý��� ���� ���

-- 2. ������ ���� ���� ��� ����




-- 3. ������ ���� ���� ��� ����


-- 3.1 ������ ���� ���   
    EXEC PRC_PROFESSOR_INSERT(�̸�, �ֹι�ȣ, ��ȭ��ȣ);
   
-- 3.1-A) ���డ�ɱ���   
    EXEC PRC_PROFESSOR_INSERT('��ö��', '750312-1234567', '010-5305-0506');
   
-- 3.1-B) �ֹι�ȣ ��ĥ ���
    EXEC PRC_PROFESSOR_INSERT('ȫ�浿', '750312-1234567', '010-3421-2243');
   
-- 3.2 ������ ���� ���
    SELECT UNIQUE(�����ڸ�),�����,����Ⱓ,�����,���ǽ�,�������࿩��
    FROM ALL_STATUS
    ORDER BY 1;
      
-- 3.3 ������ ���� ����(UPDATE) SQL��
    UPDATE PROFESSOR
    SET PRO_NAME = '�Է°�', PRO_TEL= '�Է°�'
    WHERE PRO_ID = '�Է°�';
    
-- 3.3-A) ���డ�ɱ���
    UPDATE PROFESSOR
    SET PRO_NAME = 'ȫ�浿', PRO_TEL= '010-3982-4839'
    WHERE PRO_ID = 'ȫ�浿ID';

-- 3.4 ������ ���� ���� 
    EXEC PRC_DROPPRO_INSERT('������ID', 'Ż�����');

-- 3.4-A) ���డ�ɱ���
    EXEC PRC_DROPPRO_INSERT('ȫ�浿ID', 'Ż��');
    
-- 3.4-B) �������� ������ ���
--       (�������� ������ ������ �� �����ϴ�. ���� �޼��� ���)
    EXEC PRC_DROPPRO_INSERT('ȫ�浿ID', '�ȳ����輼��. ������. �� ������ ��� ������ �ӹ��� ����, �� �ູ�� ã�� �����ϴ�.');

--  3.5 ������ ������ 1��� ������ ���� SQL��
--  (1���� �����Ǿ��� ���� ������ �ʿ�)
    DELETE
    FROM DROPPROFESSOR
    WHERE TRUNC(SYSDATE)-TO_DATE(DROP_DATE, 'YYYY-MM-DD') > 365;

-- 3.5-A) ���డ�ɱ���
    DELETE
    FROM DROPPROFESSOR
    WHERE TRUNC(SYSDATE)-TO_DATE(DROP_DATE, 'YYYY-MM-DD') > 365;



      
-- 4. ���� ���� ��� ����


-- 4.1 ������ ���
    INSERT INTO CLASSROOM(CR_ID, CR_NAME)
    VALUES(( SELECT 'CR' || LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR(CR_ID,3))),0)+1), 3, '0') FROM CLASSROOM ), �������);
   
-- 4.1-A) ���� ���� ����
    INSERT INTO CLASSROOM(CR_ID, CR_NAME)
    VALUES(( SELECT 'CR' || LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR(CR_ID,3))),0)+1), 3, '0') FROM CLASSROOM ), 'G-������');

-- 4.2 ������ ���� ���� 
    UPDATE CLASSROOM
    SET CR_NAME = ������ �������
    WHERE CR_ID = ������ �������ڵ�;

-- 4.2-A) ���� ���� ����
    UPDATE CLASSROOM
    SET CR_NAME = 'H-������'
    WHERE CR_ID = 'CR007';

-- 4.3 ������ ���� ����
--     (�ƿ� �����ϴ� ���� �ƴ϶� ���ǽǸ� �ڿ� '(���Ұ�)' �߰� ���)
    UPDATE CLASSROOM
    SET CR_NAME = CR_NAME||'(���Ұ�)'            
    WHERE CR_ID = ���Ȱ��ǽ��ڵ�;

-- 4.4 �ƿ� ��� �Ұ����ϰ� �� ���ǽ�(����)
-- 4.4-A) ���� ���� ����
--       (�ƿ� �����ϴ� ���� �ƴ϶� ���ǽǸ� �ڿ� '(���Ұ�)' �߰� ���)
    UPDATE CLASSROOM
    SET CR_NAME = CR_NAME||'(���Ұ�)'             
    WHERE CR_ID = �������ڵ�;   

-- 4.5 �̹� ������� ������
    SELECT CR_NAME
    FROM CLASSROOM
    WHERE ( SELECT CR_ID
            FROM OPENCOURSE
            WHERE (OC_START<SYSDATE AND SYSDATE<OC_END)
  	       OR (OC_START<ADD_MONTHS(SYSDATE, 6) AND ADD_MONTHS(SYSDATE, 6)<OC_END);	

-- 4.5-A) ���� ���� ����
    UPDATE CLASSROOM
    SET CR_NAME = CR_NAME||'(���Ұ�)'     -- �ƿ� �����ϴ� ���� �ƴ϶� ���ǽǸ� �ڿ� '(���Ұ�)' �߰� ���
    WHERE CR_ID = ��CR007��;

-- 4.6 ��� ������ ������ ���
    SELECT CR_NAME
    FROM CLASSROOM
    MINUS
    SELECT CR_NAME
    FROM CLASSROOM
    WHERE CR_ID IN ( SELECT CR_ID
                     FROM OPENCOURSE
                     WHERE (OC_START<SYSDATE AND SYSDATE<OC_END)
                                OR (OC_START<ADD_MONTHS(SYSDATE, 6) AND         
                                ADD_MONTHS(SYSDATE, 6)<OC_END))
        OR CR_NAME IN (SELECT CR_NAME
                       FROM CLASSROOM
                       WHERE CR_NAME LIKE '%(���Ұ�)%');

-- 4.7 ���� ���� ���
    INSERT INTO COURSE(CS_ID, CS_NAME)
    VALUES(( SELECT 'CS' || LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR(CS_ID,3))),0)+1), 3, '0') FROM COURSE ), ������);

-- 4.7-A) ���� ���� ����
    INSERT INTO COURSE(CS_ID, CS_NAME)
    VALUES(( SELECT 'CS' || LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR(CS_ID,3))),0)+1), 3, '0') FROM COURSE ), 'JAVA����� ����Ʈ �� �������� �缺');

-- 4.8 ���� ���� ����
    UPDATE COURSE
    SET CS_NAME = ������ ������                       
    WHERE CS_ID = ������ �����ڵ�;

-- 4.8-A) ���� ���� ����
    UPDATE COURSE
    SET CS_NAME = 'JAVA����� ����Ʈ �� �������� ��ȭ �缺'                          
    WHERE CS_ID = 'CS_ID';

-- 4.9 ���� ���� ����
-- 4.9-A) �ƿ� ���� ����
--       (�ƿ� �����ϴ� ���� �ƴ϶� ������ �ڿ� '(�����Ұ�)' �߰� ���)
    UPDATE COURSE
    SET CS_NAME = CS_NAME||'(�����Ұ�)'             
    WHERE CS_ID = ���Ұ����ڵ�;

-- 4.9-A.1) ���� ���� ����
--         (�ƿ� �����ϴ� ���� �ƴ϶� ������ �ڿ� '(�����Ұ�)' �߰� ���)
    UPDATE COURSE
    SET CS_NAME = CS_NAME||'(�����Ұ�)'  
    WHERE CS_ID = 'CS007';

-- 4.10 ���� �������� ���� ���� �� Ư�� ��¥�� �ȿ� ���� ���� ����
    UPDATE COURSE
    SET CS_NAME = CS_NAME||'(�����Ұ�)' 
    WHERE CS_ID IN ( SELECT CS_ID
                     FROM OPENCOURSE
                     WHERE (OC_START>SYSDATE AND OC_END < Ư����¥);

-- 4.10-A) ���� ���� ����
    UPDATE COURSE
    SET CS_NAME = CS_NAME||'(�����Ұ�)' 
    WHERE CS_ID IN ( SELECT CS_ID
                     FROM OPENCOURSE
                     WHERE (OC_START>SYSDATE AND OC_END < TO_DATE('2020-01-01')));

-- 4.11 ���� ������ ���� ���
    SELECT CS_NAME
    FROM COURSE
    MINUS
    SELECT CS_NAME
    FROM COURSE
    WHERE CS_NAME LIKE '%(�����Ұ�)%';

-- 4.12 ��밡���� ���ǽǰ� ���������� ���� Ȯ�� �� ���� ���� �Է�
    INSERT INTO OPENCOURSE(OC_ID, CS_ID, CR_ID, OC_START, OC_END, CAPACITY) 
    VALUES(( SELECT 'OC'||SUBSTR(EXTRACT(YEAR FROM SYSDATE), 3, 2)||'_'||LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR(OC_ID,6))), 0 ) + 1), 3, '0') FROM OPENCOURSE )
           , ������, ���ǽǸ�, ��������, ������, �����ο�);

-- 4.12-A) ���� ���� ����
    INSERT INTO OPENCOURSE(OC_ID, CS_ID, CR_ID, OC_START, OC_END, CAPACITY) 
    VALUES(( SELECT 'OC'||SUBSTR(EXTRACT(YEAR FROM SYSDATE), 3, 2)||'_'||LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR(OC_ID,6))), 0 ) + 1), 3, '0') FROM OPENCOURSE )
           , 'CS001', 'CR001' , TO_DATE('2019-08-01', 'YYYY-MM-DD''), TO_DATE('2020-02-30', 'YYYY-MM-DD''), 25);

-- 4.13 ���� ���� ���� ����
    EXEC PRC_OPENCOURSE_UPDATE(�����Ұ��������ڵ�, ��������, ������, �����ο�);

-- 4.13-A) ���� ���� ���� (���� ���� ���� ����)
    EXEC PRC_OPENCOURSE_UPDATE('OC19_035', TO_DATE('2019-07-01', 'YYYY-MM-DD''), TO_DATE('2020-01-31', 'YYYY-MM-DD''), 20);
  
-- 4.13-B) ���� �Ұ��� ���� (�̹� ���� �����̰ų� �������� ����) �� ���� �߻�
    EXEC PRC_OPENCOURSE_UPDATE('OC19_001', TO_DATE('2019-07-01', 'YYYY-MM-DD''), TO_DATE('2020-01-31', 'YYYY-MM-DD''), 20);

-- 4.14 ���� ���� ���� ����
    DELETE FROM OPENCOURSE WHERE OC_ID = �����Ұ��������ڵ�;

-- 4.14-A) ���� ���� ���� (���� �������� ���� ��������) 
--        (������ ���������� ���õ� ������û�� �������� �����͵� ���� ������)
    DELETE FROM OPENCOURSE WHERE OC_ID = 'OC19_035';

-- 4.14-B) ���� �Ұ��� ���� (������ ���� ���� ���̰ų� �̹� ����� ����) �� ���� �߻�
    DELETE FROM OPENCOURSE WHERE OC_ID = 'OC19_001';

-- 4.15 ���� ���� ���
    SELECT C.CS_NAME"������", CR.CR_NAME"���ǽ�", S.SUB_NAME"�����", OS.OS_START"�������", OS.OS_END"����", B.BK_NAME"�����", PR.PRO_NAME"�����ڸ�" 
    FROM COURSE C, OPENCOURSE OC, CLASSROOM CR, SUBJECT S, OPENSUBJECT OS, BOOK B, PROFESSOR PR
    WHERE OC.CS_ID = C.CS_ID(+)
    AND OC.CR_ID = CR.CR_ID(+)
    AND OC.OC_ID = OS.OC_ID(+)
    AND OS.BK_ID = B.BK_ID(+)
    AND OS.SUB_ID = S.SUB_ID(+)
    AND OS.PRO_ID = PR.PRO_ID(+);




-- 5. ���� ���� ��� ����


-- 5.1 ���� ������ ����(�������� ���� ����) ����Ʈ ���
    SELECT *
    FROM BOOK
    WHERE BK_NAME NOT LIKE '%(����)';

-- 5.2 ���� INSERT (��, �ۿ��� BK_NAME�� �޾ƾ� ��)
    INSERT INTO BOOK(BK_ID, BK_NAME) 
    VALUES( ADD_ID('BOOK','BK_ID','BK000'), '�ӽñ����');

-- 5.3 ���� UPDATE (��, �ۿ��� BK_ID, BK_NAME�� �޾ƾ� ��)
--    (BK_ID�� �ӽ÷� ���, ���⿡ ��, �ۿ��� ������ ������ ����)
    UPDATE BOOK
    SET BK_NAME = '���������Ʈ1'
    WHERE BK_ID = 'BK009'; 

-- 5.4 ���� DELETE
--    (BK_NAME�� '(����)'�� ���� Ʃ���� BK_ID�� �� �� �ְ� �ص�)
    UPDATE BOOK
    SET BK_NAME = BK_NAME||'(����)'
    WHERE BK_ID = 'BK009'; 

-- 5.5 ���� ������ ����(�������� ���� ����) ����Ʈ ���
    SELECT *
    FROM SUBJECT
    WHERE SUB_NAME NOT LIKE '%(����)';

-- 5.6 ���� INSERT
    INSERT INTO SUBJECT(SUB_ID, SUB_NAME)
    VALUES( ( SELECT 'SB' || LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR(SUB_ID,3))),0)+1), 3, '0') FROM SUBJECT ), '�ӽð����');

-- 5.6-A) ����� - ��ȣ �̴� SUB QUERY��
    SELECT 'SB' || LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR(SUB_ID,3))),0)+1), 3, '0')
    FROM SUBJECT;

-- 5.7 ���� UPDATE (��, �ۿ��� SUB_ID, SUB_NAME�� �޾ƾ� ��)
--     (SUB_ID�� �ӽ�, ���⿡ ��, �ۿ��� ������ ������ ����)
    UPDATE SUBJECT
    SET SUB_NAME = '���������Ʈ1'
    WHERE SUB_ID = 'SB001'; 

-- 5.8 ���� DELETE
    UPDATE SUBJECT
    SET SUB_NAME = SUB_NAME||'(����)'
    WHERE SUB_ID = 'SB009';

-- 5.9 Ư�� ��¥�� ���� ������ �� ����� �� �ִ� ���� ��� ���
    SELECT PRO_ID,PRO_NAME
    FROM PROFESSOR
    WHERE PRO_ID IN ( SELECT PRO_ID
    FROM PROFESSOR
    MINUS
    SELECT PRO_ID
    FROM OPENSUBJECT
    WHERE (OS_START<TO_DATE('2019-04-20','YYYY-MM-DD') AND TO_DATE('2019-04-20','YYYY-MM-DD')<OS_END)
       OR (OS_START<TO_DATE('2019-06-20','YYYY-MM-DD') AND TO_DATE('2019-06-20','YYYY-MM-DD')<OS_END));

-- 5.10 ���� ���� INSERT
    EXEC PRC_OPENSUBJECT_INSERT(���������ڵ�, ������ȣ, �����ڵ�, �����ڵ�, ���������, ������);
    
-- 5.10-A) ���డ�ɱ���
    EXEC PRC_OPENSUBJECT_INSERT('OC_ID', 'PRO_ID', 'BK001', 'SB001', TO_DATE('2019-04-17','YYYY-MM-DD'), TO_DATE('2019-06-17','YYYY-MM-DD'));

-- 5.11 ���� ���� UPDATE
    EXEC PRC_OPENSUBJECT_UPDATE(���������ڵ�, ���������ڵ�, ������ȣ, �����ڵ�, �����ڵ�, ���������, ������);
    
-- 5.11-A) ���డ�ɱ���
    EXEC PRC_OPENSUBJECT_UPDATE('OS_ID','OC_ID', 'PRO_ID', 'BK001', 'SB001', TO_DATE('2019-04-17','YYYY-MM-DD'), TO_DATE('2019-06-17','YYYY-MM-DD'));

-- 5.12 ���� ���� DELETE
    EXEC PRC_OPENSUBJECT_DELETE(���������ڵ�);
    
-- 5.12-A) ���డ�ɱ���
    EXEC PRC_OPENSUBJECT_DELETE('OS_ID');

-- 5.13 ��ϵ� ��� ����, ���� ���� ���
    SELECT UNIQUE(������), ���ǽ�, �����, ����Ⱓ, �����, �����ڸ�
    FROM ALL_STATUS
    ORDER BY ����Ⱓ;



-- 6. �л� ���� ��� ����


-- 6.1 �л� ������ �Է�
    EXEC PRC_STUDENT_INSERT('�̸�','�ֹι�ȣ','��ȭ��ȣ');

-- 6.1-A) �л� ������ �Է� �׽�Ʈ
    EXEC PRC_STUDENT_INSERT('������','123456-2111111','010-1111-1111');
    EXEC PRC_STUDENT_INSERT('������','123456-2222222','010-2222-2222');
    EXEC PRC_STUDENT_INSERT('�̻���','123456-2333333','010-3333-3333');
    EXEC PRC_STUDENT_INSERT('�̻���','123456-2444444','010-4444-4444');

-- 6.1-B) �л� �ֹι�ȣ �ߺ� ������ �Է� �׽�Ʈ 
--        �� ���� �Ұ�(ORA-20004: �̹� ������ ������ �����մϴ�)
    EXEC PRC_STUDENT_INSERT('�׽�Ʈ','123456-2111111','010-9999-9999');


-- 6.2 Ż���ߴٰ� �ٽ� �����ϴ°��
--     �� ��STU_ID�� �״��, ���� ���� ��DROPSTUDENT ���� �ش� STU_ID ���ڵ尡 ������
    EXEC PRC_DROPSTU_INSERT('S19_0601','�����׽�Ʈ'); -- Ż���Ŵ
    EXEC PRC_STUDENT_INSERT('�׽�Ʈ','123456-2111111','010-9999-9999');
--==>> �л��� ���������
    SELECT * FROM DROPSTUDENT WHERE STU_ID='S19_0601';
    SELECT * FROM STUDENT WHERE STU_ID='S19_0601';

-- 6.3 ��ϵ� �л� ���� ����
    UPDATE STUDENT
    SET STU_NAME = '������ �̸�', STU_SSN='������ �ֹι�ȣ',STU_TEL='������ �ֹι�ȣ'
    WHERE STU_ID = '�ٲ� ��� STU_ID';

-- 6.4 ��ϵ� �л� ���� ���� ������
    UPDATE STUDENT
    SET STU_NAME = '������', STU_SSN='123456-1111111',STU_TEL='010-0101-0101'
    WHERE STU_ID = 'S19_0001';
    UPDATE STUDENT
    SET STU_NAME = '������', STU_SSN='123456-2222222',STU_TEL='010-0202-0202'
    WHERE STU_ID = 'S19_0002';
    UPDATE STUDENT
    SET STU_NAME = '�̻��', STU_SSN='123456-1333333',STU_TEL='010-0303-0303'
    WHERE STU_ID = 'S19_0003';

-- 6.5 ��ϵ� �л� ���� (DROPSTUDENT ���̺�� �̵�)
    EXEC PRC_DROPSTU_INSERT('STU_ID','Ż�� ����');

-- 6.6 STU_ID�� ��� & REGISTER�� ������û���� ���� �л� 
--     �� ������
    EXEC PRC_DROPSTU_INSERT('S19_0602','������ûX/����O');
    EXEC PRC_DROPSTU_INSERT('S19_0991','������ûX/����O');

-- 6.7 STU_ID�� ��� & REGISTER�� ������û�� �л�
-- 6.7-A) ���������л� 
--       �� �������� ����(����)
    EXEC PRC_DROPSTU_INSERT('S19_0337','������/����X');
    EXEC PRC_DROPSTU_INSERT('S19_0338','������/����X');

-- 6.7-B) ���������� ���� �л� �� ������
-- 6.7-C) �������� �л� �� ������
    EXEC PRC_DROPSTU_INSERT('S19_0447','���� ����/����O');

-- 6.7-C.1) ������ ���� �л� �� ������
    EXEC PRC_DROPSTU_INSERT('S19_0005','������ ����/����O');

-- 6.8 DROPSTUDENT ���̺� �ִ� ������ �� 1���� ���� �ڷ� ���� ������
    DELETE
    FROM DROPSTUDENT
    WHERE MONTHS_BETWEEN(SYSDATE, DROP_DATE) > 12;

-- 6.9 �л� ���� ��� - �̸�, ������, ��������, ����, �ߵ�����
    SELECT STU.STU_NAME"�л��̸�", CS.CS_NAME"������", SUB.SUB_NAME"�����" , SC.ATTENDANCE + SC.PERFORMANCE + SC.WRITTEN "����"
         ,CASE WHEN (GU_DATE<OS_START) OR (OS_START<GU_DATE AND GU_DATE<OS_END) THEN '�ߵ�����'
          ELSE ' '
          END"�ߵ����⿩��"
    FROM REGISTER REG JOIN OPENSUBJECT OS   ON REG.OC_ID = OS.OC_ID
                  LEFT JOIN SCORE SC    ON (REG.REG_ID = SC.REG_ID AND OS.OS_ID = SC.OS_ID)
                  JOIN SUBJECT SUB      ON OS.SUB_ID = SUB.SUB_ID
                  JOIN OPENCOURSE OC    ON OS.OC_ID = OC.OC_ID
                  JOIN STUDENT STU      ON REG.STU_ID = STU.STU_ID
                  JOIN COURSE CS        ON OC.CS_ID = CS.CS_ID
                  LEFT JOIN GIVEUP GU   ON REG.REG_ID = GU.REG_ID
    WHERE STU.STU_ID = �л��ڵ�;

--6.10 �ߵ�Ż��
    EXEC PRO_GIVEUP_INSERT('�ߵ�Ż�����л��ڵ�');

--6.10-A) ���� ���� ���� (���� �������� �л�)
    EXEC PRO_GIVEUP_INSERT('');

--6.10-B) ���� �Ұ��� ���� (�̹� ������ �л��̰ų� ���� ���������� �л�)
    EXEC PRO_GIVEUP_INSERT('S19_001');



-- 7. ���� ���� ��� ����




-- �� ������ �䱸�м� 

-- 1. �α��� ��� ����

--1.1 �� �󿡼� ������ �α����� ������ �� ��ȸ�� ���̺� ����
--   (����ID_�� ID ,�ֹι�ȣ ���ڸ��� PW �� �����Ͽ� ���̺� ����)
    CREATE TABLE LOG_PROFESSOR
    AS
    SELECT PRO_ID"PRO_ID",SUBSTR(PRO_SSN,8)"PRO_PW"
    FROM PROFESSOR;



-- 2. ���� �Է� ��� ����


-- 2.1 ���� �Է�
    EXEC PRC_RATIO_INSERT(�����ڵ�,������,�Ǳ����,�ʱ����);
    
-- 2.2 ��������
    EXEC PRC_RATIO_UPDATE(�����ڵ�,������,�Ǳ����,�ʱ����);

-- 2.3 ���� �Է�
    EXEC PRC_SCORE_INSERT(�����ڵ�,�л�ID,�������,�Ǳ�����,�ʱ�����);

-- 2.4 ���� ����
    EXEC PRC_SCORE_UPDATE(�����ڵ�,�л�ID,�������,�Ǳ�����,�ʱ�����);

-- 2.5 ���� ����
    EXEC PRC_SCORE_DELETE(�����ڵ�,�л�ID);


-- 3. ���� ��� ��� ����
-- 3.1 �� ������ ��ü ���� �� �л� ���� ���
    SELECT �����, ����Ⱓ, �����, �л���, ���, �Ǳ�, �ʱ�, ����, ���
    FROM ALL_STATUS
    WHERE PRO_ID = 'PR19_001'
    ORDER BY ����Ⱓ, ���, �л���;

-- 3.2 �� ������ ���� ���� ��ü ���
    SELECT UNIQUE(OS_ID), �����, ����Ⱓ
    FROM ALL_STATUS
    WHERE PRO_ID = 'PR19_001'
    ORDER BY ����Ⱓ;



-- �� �л��� �䱸�м� 

-- 1. �α��� ��� ����

-- 1.1-A) �� �󿡼� �л��� �α����� ������ �� ��ȸ�� ���̺� ����
--       (�л�ID_�� ID ,�ֹι�ȣ ���ڸ��� PW �� �����Ͽ� ���̺� ����)
    CREATE TABLE LOG_STUDENT
    AS
    SELECT STU_ID"�л�ID",SUBSTR(STU_SSN,8)"�л�PW(�ֹι�ȣ ���ڸ�)"
    FROM STUDENT;



-- 2. ���� ��� ��� ����

-- 2.1-A) �α��� �� �ڽ��� ������ ���� ���� ���
    SELECT ������,�����,����Ⱓ
    FROM ALL_STATUS
    WHERE SYSDATE >= OS_END AND STU_ID ='S19_0030'
    ORDER BY ����Ⱓ;

-- 2.2-A.1) EX) ���� ������ ���� ���
--            ������              	�����          ����Ⱓ
--    �ӽŷ��� Ȱ�� ���� ����	    	HTML		2017-11-23 ~ 2018-01-23  ��
--    ���ø����̼� ���� ���� ����		CSS	    2019-07-09 ~ 2019-09-09  �� 
--    �ӽŷ��� Ȱ�� ���� ����	    	HTML		2019-12-01 ~ 2020-02-01  ��  ����

-- 2.3 ������ ���� ������ ���� �� �ش� �л��� ���� ���
    SELECT �л���, ������, �����, ����Ⱓ, �����, ���, �Ǳ�, �ʱ�, ����, ���
    FROM ALL_STATUS
    WHERE SYSDATE >= OS_END AND STU_ID ='S19_0030'
    ORDER BY ����Ⱓ,���,�л���;

-- 2.3-A) EX) ���� ������ ������ ����
--    �л���          ������           �����           ����Ⱓ             �����       ���  �Ǳ�  �ʱ�  ����  ���
--    ������   �ӽŷ��� Ȱ�� ���� ����   HTML	   2019-12-01 ~ 2020-02-01   ���ʺ��� HTML    39    20    28	  87    4


-- 2.4 ������û ��� ����
-- 2.4-A) ������û ������ ��� Ȯ���ϴ� ������
    SELECT OC_ID
    FROM OPENCOURSE
    MINUS
    SELECT OC_ID
    FROM 
    (SELECT R.OC_ID,OC.OC_START,OC.OC_END
     FROM REGISTER R JOIN OPENCOURSE OC
                     ON R.OC_ID = OC.OC_ID
    WHERE R.STU_ID = {������û�ϴ� �л�ID})
    WHERE( OC_START<{������û�ϴ� ������ ���۳�¥} AND {������û�ϴ� ������ ���۳�¥}< OC_END) 
          OR (OC_START<{������û�ϴ� ������ �����³�¥} AND {������û�ϴ� ������ �����³�¥}< OC_END); 

-- 2.5 ������û ��� 
--  �� ���������� �����ο������� ������û�� �л��� ���� �� ������ ������� �Ұ��� (�����߻�)

    EXEC PRC_REGISTER_INSERT('STU_ID','OC_ID(���������ڵ�)');
-- ���� ���۵��� ���� ������ ������û �� ��û ����
    EXEC PRC_REGISTER_INSERT('S19_0601','OC19_024');
-- �̹� ���۵� ������ ������û �� ��û ����
    EXEC PRC_REGISTER_INSERT('S19_0601','OC19_020');
    
-- 2.6 ������û ���� 
    EXEC PRC_REGISTER_DELETE('REG_ID(������û�ڵ�)');
-- ������û ���(��û�� ������ �����ϱ� ����) �� ��Ҽ���
    EXEC PRC_REGISTER_DELETE('RG19_0409');
-- ������û ���(��û�� ������ ������ ���) �� ��ҺҰ�
    EXEC PRC_REGISTER_DELETE('RG19_0336');
--==>>ORA-20000: ������ �̹� ���۵Ǿ��� ��� ������û�� ������ �� �����ϴ�.








