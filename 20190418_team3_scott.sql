     SELECT MAX(STU_ID)
    FROM STUDENT
    WHERE STU_SSN = '123456-2123499';
    
    
    SELECT *
    FROM STUDENT;
    
DELETE
FROM REGISTER
WHERE STU_ID='S19_001';

DELETE
FROM SCORE
WHERE STU_ID='S19_001';

SELECT *
FROM SCORE;

SELECT *
FROM GIVEUP;

SELECT *
FROM REGISTER;

--������û ������ �� �� ID�� ������

DELETE
FROM REGISTER
WHERE REG_ID='RG19_111';

--������û���� ���ν���


SELECT *
FROM OPENCOURSE;

DELETE
FROM SCORE
WHERE REG_ID='RG19_1111';

--������û ���� ���ν��� �����
EXEC PRC_REGISTER_DELETE('RG19_1114');


SELECT NVL2(MAX(GU_ID), '�ߵ�����', NULL)
FROM GIVEUP
WHERE REG_ID='RG19_1121';

SELECT *
FROM GIVEUP;

EXEC PRO_GIVEUP_INSERT('S19_007');


DELETE
FROM DROPSTUDENT
WHERE MONTHS_BETWEEN(SYSDATE, DROP_DATE) > 12;

EXEC PRC_STUDENT_INSERT('�̸�','�ֹι�ȣ','��ȭ��ȣ');
EXEC PRC_STUDENT_INSERT('������','123456-2111112','010-1111-1111');
EXEC PRC_STUDENT_INSERT('�׽�Ʈ','123456-2111112','010-9999-9999');

EXEC PRC_DROPSTU_INSERT('S19_1002','�����׽�Ʈ');

SELECT *
FROM STUDENT;

DELETE
FROM STUDENT
WHERE STU_ID='S19_015';

SELECT *
FROM DROPSTUDENT;


PRC_REGISTER_INSERT



EXEC PRC_STUDENT_INSERT('������','123456-2555555','010-1111-1111');
EXEC PRC_STUDENT_INSERT('������','123456-2666666','010-2222-2222');
EXEC PRC_STUDENT_INSERT('�̻���','123456-2777777','010-3333-3333');
EXEC PRC_STUDENT_INSERT('�̻���','123456-2888888','010-4444-4444');

SELECT *
FROM STUDENT;

EXEC PRC_DROPSTU_INSERT('S19_0017','�����׽�Ʈ');



--1.0 �л� ������ �Է�
EXEC PRC_STUDENT_INSERT('�̸�','�ֹι�ȣ','��ȭ��ȣ');

--1.1 �л� ������ �Է� �׽�Ʈ
EXEC PRC_STUDENT_INSERT('������','123456-2111111','010-1111-1111');
EXEC PRC_STUDENT_INSERT('������','123456-2222222','010-2222-2222');
EXEC PRC_STUDENT_INSERT('�̻���','123456-2333333','010-3333-3333');
EXEC PRC_STUDENT_INSERT('�̻���','123456-2444444','010-4444-4444');

--1.2 �л� �ֹι�ȣ �ߺ� ������ �Է� �׽�Ʈ �� ���� �Ұ�
EXEC PRC_STUDENT_INSERT('�׽�Ʈ','123456-2111111','010-9999-9999');
--==>>ORA-20004: �̹� ������ ������ �����մϴ�


--1.3 Ż���ߴٰ� �ٽ� �����ϴ°�� �� ��STU_ID�� �״��, ���� ���� ��DROPSTUDENT ���� �ش� STU_ID ���ڵ尡 ������
EXEC PRC_DROPSTU_INSERT('S19_0601','�����׽�Ʈ'); -- Ż���Ŵ
EXEC PRC_STUDENT_INSERT('�׽�Ʈ','123456-2111111','010-9999-9999');
--==>> �л��� ���������
SELECT * FROM DROPSTUDENT WHERE STU_ID='S19_0601';
SELECT * FROM STUDENT WHERE STU_ID='S19_0601';
--S19_1002	�׽�Ʈ	123456-2111112	010-9999-9999

--2.0 ��ϵ� �л� ���� ����
UPDATE STUDENT
SET STU_NAME = '������ �̸�', STU_SSN='������ �ֹι�ȣ',STU_TEL='������ �ֹι�ȣ'
WHERE STU_ID = '�ٲ� ��� STU_ID';

--2.1 ��ϵ� �л� ���� ���� ������
UPDATE STUDENT
SET STU_NAME = '������', STU_SSN='123456-1111111',STU_TEL='010-0101-0101'
WHERE STU_ID = 'S19_0001';
UPDATE STUDENT
SET STU_NAME = '������', STU_SSN='123456-2222222',STU_TEL='010-0202-0202'
WHERE STU_ID = 'S19_0002';
UPDATE STUDENT
SET STU_NAME = '�̻��', STU_SSN='123456-1333333',STU_TEL='010-0303-0303'
WHERE STU_ID = 'S19_0003';

--Ȯ��
SELECT * FROM STUDENT;

--3.0. ��ϵ� �л� ���� (DROPSTUDENT ���̺�� �̵�)
EXEC PRC_DROPSTU_INSERT('STU_ID','Ż�� ����');

--3.1. STU_ID�� ��� & REGISTER�� ������û���� ���� �л� �� ������
EXEC PRC_DROPSTU_INSERT('S19_0602','������ûX/����O');
EXEC PRC_DROPSTU_INSERT('S19_0991','������ûX/����O');

--3.2. STU_ID�� ��� & REGISTER�� ������û�� �л�
--3.2.1 ���������л� �� �������� ����(����)
EXEC PRC_DROPSTU_INSERT('S19_0337','������/����X');
EXEC PRC_DROPSTU_INSERT('S19_0338','������/����X');

--3.2.2 ���������� ���� �л� �� ������
--3.2.2.1 �������� �л� �� ������
EXEC PRC_DROPSTU_INSERT('S19_0447','���� ����/����O');

--3.2.2.2 ������ ���� �л� �� ������
EXEC PRC_DROPSTU_INSERT('S19_0005','������ ����/����O');

--��ȸ
SELECT * FROM DROPSTUDENT;

--4.1 DROPSTUDENT ���̺� �ִ� ������ �� 1���� ���� �ڷ� ���� ������
DELETE
FROM DROPSTUDENT
WHERE MONTHS_BETWEEN(SYSDATE, DROP_DATE) > 12;

--5.1 �л� ���� ��� - �̸�, ������, ��������, ����, �ߵ�Ż��
SELECT STU.STU_NAME"�л��̸�", CS.CS_NAME"������", SUB.SUB_NAME"�����" , SC.ATTENDANCE + SC.PERFORMANCE + SC.WRITTEN "����"
     , NVL2(GU.GU_DATE, '�ߵ�����', NULL) "�ߵ����⿩��"
FROM REGISTER REG JOIN OPENSUBJECT OS   ON REG.OC_ID = OS.OC_ID
                  LEFT JOIN SCORE SC    ON (REG.REG_ID = SC.REG_ID AND OS.OS_ID = SC.OS_ID)
                  JOIN SUBJECT SUB      ON OS.SUB_ID = SUB.SUB_ID
                  JOIN OPENCOURSE OC    ON OS.OC_ID = OC.OC_ID
                  JOIN STUDENT STU      ON REG.STU_ID = STU.STU_ID
                  JOIN COURSE CS        ON OC.CS_ID = CS.CS_ID
                  LEFT JOIN GIVEUP GU   ON REG.REG_ID = GU.REG_ID;

--6.0 ������û(ȫ�� �߰��Ѻκ� ������ ����Ǽ� UPDATE �ʿ�)
EXEC PRC_REGISTER_INSERT('STU_ID','OC_ID(���������ڵ�)');

--6.1 ���� ���۵��� ���� ������ ������û �� ��û ����
EXEC PRC_REGISTER_INSERT('S19_0601','OC19_024');

--6.2 �̹� ���۵� ������ ������û �� ��û ����
EXEC PRC_REGISTER_INSERT('S19_0601','OC19_020');

--7.0 ������û ���
EXEC PRC_REGISTER_DELETE('REG_ID(������û�ڵ�)');

--7.1 ������û ���(��û�� ������ �����ϱ� ����) �� ��Ҽ���
EXEC PRC_REGISTER_DELETE('RG19_0409');

--7.2 ������û ���(��û�� ������ ������ ���) �� ��ҺҰ�
EXEC PRC_REGISTER_DELETE('RG19_0336');
--==>>ORA-20000: ������ �̹� ���۵Ǿ��� ��� ������û�� ������ �� �����ϴ�.

--8.0 �ߵ�Ż��(����)
EXEC PRO_GIVEUP_INSERT(�ߵ�Ż�����л��ڵ�);

--8.1 ���� ���� ���� (���� �������� �л�)
EXEC PRO_GIVEUP_INSERT('');

--8.2 ���� �Ұ��� ���� (�̹� ������ �л��̰ų� ���� ���������� �л�)
EXEC PRO_GIVEUP_INSERT('S19_001');
