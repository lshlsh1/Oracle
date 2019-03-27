--1�� �ּ��� ó��(������ �ּ��� ó��)

/*
������(���� ��)
�ּ��� ó��
*/

--�� ���� ����Ŭ ������ ������ �ڽ��� ���� ��ȸ
show user;
--==>>USER��(��) "SYS"�Դϴ�.
--> sqlplus ������ �� ����ϴ� ��ɾ�
--���x

--������ ���
SELECT USER
FROM DUAL;
--==>>SYS

SELECT 1+2
FROM DUAL;
--==>> 3

SELECT 1 + 2
FROM DUAL;
--==>> 3

SELECT '�ֿ밭��F������'
FROM DUAL;
--==>>�ֿ밭��F������

-- SELECT ~
-- FROM ���;

SELECT '������ ������ ����Ŭ ����';
--==>> FROM���� �ʿ�
/*
ORA-00923: FROM keyword not found where expected
00923. 00000 -  "FROM keyword not found where expected"
*Cause:    
*Action:
34��, 23������ ���� �߻�
*/

SELECT '������ ������ ����Ŭ ����'
FROM DUAL;
--==>>������ ������ ����Ŭ ����


SELECT 3.14+1.36
FROM DUAL;
--==>>4.5
--�Ǽ� ���굵 ����

SELECT 1.234 + 2.345
FROM DUAL;
--==>>3.579

SELECT 10 * 5
FROM DUAL;
--==>> 50
--���� ���굵 ����

SELECT 1000/23
FROM DUAL;
--==>>43.47826086956521739130434782608695652174
--��������� ���꿡���� �Ǽ������ ����� ���� ����

SELECT 100-23
FROM DUAL;
--==>> 77

SELECT "�׽�Ʈ"
FROM DUAL;
/*ORA-00904: "�׽�Ʈ": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
72��, 8������ ���� �߻�*/
--==>> ���ڿ��� �ֵ���ǥ ����ϸ� ����

SELECT '������'+'������'
FROM DAUL;
/*ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
80��, 28������ ���� �߻�*/
--���ڿ� ���� ���� ���� �߻�

--�׸� - �÷�  / �� �� - ���ڵ� 
--������ '���̺�'�� ǥ�� �����ϱ�
--���̺����̽�
--�����ͺ��̽�

--FROM���� ����

--�� ���� ����Ŭ ������ �����ϴ� ����� ���� ���� ���� ��ȸ

SELECT *
FROM DBA_USERS;
--��ü �÷� ���

SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS;

SELECT USERNAME, USER_ID, ACCOUNT_STATUS, PASSWORD, LOCK_DATE
FROM DBA_USERS;
-- ��, �Ʒ� �������� CPU�Һ��ϴ� ���� ����


-->��DBA_���� �����ϴ� Oracle Data Dictionary View ��
-- ������ ������ �������� �������� ��쿡�� ��ȸ�� �����ϴ�
-- ������ ������ ��ųʸ� ������ ���� ���ص� �������


--�� ��HR������� ������ ��� ���·� ����
ALTER USER HR ACCOUNT LOCK;
--==>>User HR��(��) ����Ǿ����ϴ�.

--�� �ٽ� ����� ���� ���� ��ȸ
SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS;
--==>>HR	LOCKED

ALTER USER HR ACCOUNT UNLOCK;

SELECT USERNAME,ACCOUNT_STATUS
FROM DBA_USERS;
--==>>HR	OPEN

----------------------------------------------------------------------

--�� TABLESPACE ����

--�� TABLESPACE��?
--   ���׸�Ʈ(���̺�, �ε���, ...) �� ��Ƶδ�(�����صδ�)
--   ����Ŭ�� ������ ���� ������ �ǹ��Ѵ�.

-- ���� ����  ���� �����ϰ� ����� ���� �ΰ���
-- INSERT - ������������ �����ؾ��� �� ����ϴ� ����
-- CREATE - ���������� �������� ���� ����� ����

CREATE TABLESPACE TBS_EDUA                  -- CREATE ���� ��ü�� �� ����
DATAFILE 'C:\TESTORADATA\TBS_EDUA01.DBF'    -- ���������� ����Ǵ� ������ ����
SIZE 4M                                     -- ������ ������ ������ �뷮
EXTENT MANAGEMENT LOCAL                     -- ����Ŭ ������ ���׸�Ʈ �˾Ƽ� �����϶�
SEGMENT SPACE MANAGEMENT AUTO;              -- ���׸�Ʈ ���� ������ �ڵ����� ����Ŭ ������ �����϶�

/* ���͸� ���� ��>>
���� ���� -
ORA-01119: error in creating database file 'C:\TESTORADATA\TBS_EDUA01.DBF'
ORA-27040: file create error, unable to create file
OSD-04002: unable to open file
O/S-Error: (OS 3) ??????? ??????
01119. 00000 -  "error in creating database file '%s'"
*Cause:    Usually due to not having enough space on the device.
*Action:*/

-- ���̺����̽� ���� ������ �����ϱ� ����
-- �������� ��ο� ���͸�(TESTORADATA) ������ ��

/* ���͸� ���� ��>>
TABLESPACE TBS_EDUA��(��) �����Ǿ����ϴ�.
*/

--�� ������ ���̺����̽�(TBS_EDUA) ��ȸ
SELECT *
FROM DBA_TABLESPACES;
--==>>
/*
    :
TBS_EDUA	8192	65536		1	2147483645	2147483645		65536	ONLINE	PERMANENT	LOGGING	NO	LOCAL	SYSTEM	NO	AUTO	DISABLED	NOT APPLY	NO	HOST	NO	
    :
*/

--�� �������� ���� �̸� ��ȸ
SELECT *
FROM DBA_DATA_FILES;
--==>>
/*
    :
C:\TESTORADATA\TBS_EDUA01.DBF	5	TBS_EDUA	4194304	512	AVAILABLE	5	NO	0	0	0	3145728	384	ONLINE
    :
*/

--�� ����Ŭ ����� ���� ����
CREATE USER LSH IDENTIFIED BY java006$
DEFAULT TABLESPACE TBS_EDUA;
--> LSH��� ����� ������ ����ڴ�(�����ϰڴ�).
--  �� ������ ���� �����ϴ� ����Ŭ ��ü��(���׸�Ʈ����)
--  �⺻������ TBS_EDUA ��� ���̺����̽��� ������ �� �ֵ��� �����ϰڴ�.
--==>>User LSH��(��) �����Ǿ����ϴ�.


--�� ������ ����Ŭ ����� ����(LSH)�� ����
--   ������ �õ��� �������� ���� �Ұ�
--   �� ��create session�������� ���� ������...

--�� ������ ����Ŭ ����� ����(LSH)��
--   ���� ������ ������ �� �ֵ��� create session ���� �ο� �� sys��...
GRANT CREATE SESSION TO LSH;
--==>>Grant��(��) �����߽��ϴ�.

--�� ������ ����Ŭ ����� ����(LSH)��
--   DEFAULT TABLESPACE ��ȸ
SELECT USERNAME, DEFAULT_TABLESPACE
FROM DBA_USERS;
--==>>
/*
            :
HR	                USERS
LSH	                TBS_EDUA
            :
*/

--�� ������ ����Ŭ ����� ����(LSH)��
--   �ý��� ���� ���� ��ȸ
SELECT *
FROM DBA_SYS_PRIVS;
--==>>
/*
            :
LSH	CREATE SESSION	NO
            :
*/

--�� ������ ����Ŭ ����� ����(LSH)��
--   ���̺� ������ ������ �� �ֵ���CREATE TABLE ���� �ο�
GRANT CREATE TABLE TO LSH;
--==>>Grant��(��) �����߽��ϴ�.


--�� ������ ����Ŭ ����� ����(LSH)��
--   ���̺����̽�(TBS_EDUA)���� ����� �� �ִ� ����(�Ҵ緮)
--   �� ũ�⸦ ���������� ����
--   �������� �����̹Ƿ� ALTER ���
ALTER USER LSH
QUOTA UNLIMITED ON TBS_EDUA;
--==>>User LSH��(��) ����Ǿ����ϴ�.

















