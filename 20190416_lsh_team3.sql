
--�� COURSE(����) ���̺� ����
CREATE TABLE COURSE         -- ����TABLE
( CS_ID     VARCHAR2(5)     -- �����ڵ�
, CS_NAME   VARCHAR(20)     -- ������
);
--==>>Table COURSE��(��) �����Ǿ����ϴ�.

--�� CLASSROOM(���ǽ�) ���̺� ����
CREATE TABLE CLASSROOM      -- ���ǽ�TABLE
( CR_ID     VARCHAR2(5)     -- ���ǽ��ڵ�
, CR_NAME   VARCHAR2(20)    -- ���ǽǸ�
);
--==>>Table CLASSROOM��(��) �����Ǿ����ϴ�.

--�� OPENCOURSE(��������) ���̺� ����
CREATE TABLE OPENCOURSE     -- ��������TABLE
( CS_ID     VARCHAR2(5)     -- �����ڵ�
, OC_ID     VARCHAR2(5)     -- ���������ڵ�
, CR_ID     VARCHAR2(5)     -- ���ǽ��ڵ�
, OC_START  DATE            -- ��������
, OC_END    DATE            -- ������
, CAPACITY  NUMBER(2)       -- ��������
);
--==>>Table OPENCOURSE��(��) �����Ǿ����ϴ�.

-- COURSE ���̺� �������� �߰�
ALTER TABLE COURSE
ADD CONSTRAINT COURSE_ID_PK   PRIMARY KEY(CS_ID);

-- CLASSROOM ���̺� �������� �߰�
ALTER TABLE CLASSROOM
ADD CONSTRAINT CLASSROOM_ID_PK   PRIMARY KEY(CR_ID);

-- OPENCOURSE ���̺� �������� �߰�
ALTER TABLE OPENCOURSE
ADD ( CONSTRAINT OPENCOURSE_ID_PK   PRIMARY KEY(OC_ID)
    , CONSTRAINT OPENCOURSE_CS_ID_FK    FOREIGN KEY(CS_ID)      REFERENCES COURSE(CS_ID)
    , CONSTRAINT OPENCOURSE_CR_ID_FK    FOREIGN KEY(CR_ID)      REFERENCES CLASSROOM(CR_ID) );
    
--
ALTER TABLE COURSE
ADD CONSTRAINT COURSE_ID_NN NOT NULL