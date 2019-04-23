EXEC PRC_STUDENT_INSERT('������','123456-2123451','010-1111-1111');
EXEC PRC_STUDENT_INSERT('������','123456-2123452','010-2222-2222');
EXEC PRC_STUDENT_INSERT('�̻���','123456-2123453','010-3333-3333');
EXEC PRC_STUDENT_INSERT('�̻���','123456-2123454','010-4444-4444');

SELECT *
FROM OPENCOURSE;

EXEC PRC_REGISTER_INSERT('S19_001','OC19_001');
EXEC PRC_REGISTER_INSERT('S19_002','OC19_001');
EXEC PRC_REGISTER_INSERT('S19_003','OC19_001');

SELECT *
FROM REGISTER;

SELECT *
FROM OPENCOURSE;


UPDATE STUDENT
SET STU_NAME = '������', STU_SSN='123456-1111111',STU_TEL='010-0101-0101'
WHERE STU_ID = 'S19_001';

UPDATE STUDENT
SET STU_NAME = '������', STU_SSN='123456-2222222',STU_TEL='010-0202-0202'
WHERE STU_ID = 'S19_002';

UPDATE STUDENT
SET STU_NAME = '�̻��', STU_SSN='123456-1333333',STU_TEL='010-0303-0303'
WHERE STU_ID = 'S19_003';

UPDATE STUDENT
SET STU_NAME = '�̻��', STU_SSN='123456-2444444',STU_TEL='010-0404-0404'
WHERE STU_ID = 'S19_004';

UPDATE STUDENT
SET STU_NAME = '�̿���', STU_SSN='123456-1555555',STU_TEL='010-0505-0505'
WHERE STU_ID = 'S19_005';


SELECT *
FROM STUDENT;



CREATE SEQUENCE SEQ_DROPSTU -- ������ ���� �⺻ ����(MSSQL�� IDENTITY�� ������ ����)
START WITH 1              -- ���۰�
INCREMENT BY 1            -- ������
NOMAXVALUE                -- �ִ밪 ���� ����
NOCACHE;                  -- ĳ�� ��� ����(����)


INSERT INTO DROPSTUDENT(STU_ID, DROP_REASON, DROP_STU_ID)
VALUES('S19_001', '�׳�', SEQ_DROPSTU.NEXTVAL);


SELECT *
FROM DROPSTUDENT;


EXEC PRC_REGISTER_INSERT('S19_001','OC19_001');
EXEC PRC_REGISTER_INSERT('S19_002','OC19_001');
EXEC PRC_REGISTER_INSERT('S19_007','OC19_001');


SELECT *
FROM REGISTER;

INSERT INTO OPENCOURSE(OC_ID, CS_ID, CR_ID, OC_START, OC_END, CAPACITY) 
VALUES(( SELECT 'OC'||SUBSTR(EXTRACT(YEAR FROM SYSDATE), 3, 2)||'_'||LPAD(TO_CHAR(NVL(MAX(TO_NUMBER(SUBSTR(OC_ID,6))), 0 ) + 1), 3, '0') FROM OPENCOURSE ), 'CS001', 'CR001', TO_DATE('2019-03-01','YYYY-MM-DD'), TO_DATE('2019-06-30','YYYY-MM-DD'), 24);


SELECT *
FROM COURSE;

SELECT *
FROM OPENCOURSE;

INSERT INTO OPENCOURSE(CS_ID, OC_ID, CR_ID, OC_START, OC_END, CAPACITY) 
VALUES('CS001','OC19_001','CR111',SYSDATE,SYSDATE+30,24);


INSERT INTO BOOK(BK_ID, BK_NAME) VALUES('BK001','å1');
INSERT INTO COURSE(CS_ID,CS_NAME) VALUES('CS001','�����߰���001');


EXEC PRC_DROPSTU_INSERT('S19_008','�����׽�Ʈ1');

EXEC PRC_DROPSTU_INSERT('S19_009','�����׽�Ʈ2');

EXEC PRC_DROPSTU_INSERT('S19_007','�����׽�Ʈ3');


SELECT *
FROM REGISTER;

SELECT *
FROM DROPSTUDENT;

SELECT *
FROM OPENCOURSE;


ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';


SELECT *
FROM STUDENT;

SELECT STU_ID FROM DROPSTUDENT;

SELECT *
FROM STUDENT
WHERE STU_ID = (SELECT STU_ID FROM DROPSTUDENT);

SELECT STU_ID
FROM STUDENT S ,DROPSTUDENT D
WHERE S.STU_ID = D.STU_ID;


DELETE 
FROM DROPSTUDENT 
WHERE STU_ID='S19_010';


EXEC PRC_STUDENT_INSERT('�׽�Ʈ','123456-2123454','010-1111-1111');

SELECT *
FROM STUDENT;


EXEC PRC_STUDENT_INSERT('�׽�Ʈ','123456-2123451','010-1111-1111');

EXEC PRC_STUDENT_INSERT('������','123456-2123456','010-6666-6666');

EXEC PRC_STUDENT_INSERT('��ĥ��','123456-2123457','010-7777-7777');

EXEC PRC_STUDENT_INSERT('��ĥ�׽�Ʈ','123456-2123457','010-7777-7778');


EXEC PRC_STUDENT_INSERT('������','123456-2123458','010-8888-8888');

EXEC PRC_STUDENT_INSERT('�̱���','123456-2123459','010-9999-9998');

SELECT *
FROM REGISTER;

EXEC PRC_DROPSTU_INSERT('S19_014','�����׽�Ʈ');

SELECT *
FROM STUDENT;

SELECT *
FROM DROPSTUDENT;

DELETE
FROM DROPSTUDENT
WHERE STU_ID='S19_013';


SELECT *
FROM OPENCOURSE;



EXEC PRC_DROPSTU_INSERT('S19_0002','�����׽�Ʈ1');
EXEC PRC_DROPSTU_INSERT('S19_0003','�����׽�Ʈ2');
EXEC PRC_DROPSTU_INSERT('S19_009','�����׽�Ʈ3');