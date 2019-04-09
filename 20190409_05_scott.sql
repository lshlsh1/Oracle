SELECT USER
FROM DUAL;
--==>>SCOTT

--�� ������ ���ν���(PRC_STUDENTS_INSERT())�� ����� �۵��ϴ�����
--   ���� Ȯ�� �� ���ν��� ȣ��
EXEC PRC_STUDENTS_INSERT('batnam','java006$','������','010-2222-2222','����');
--==>>PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

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
superman	������	010-1111-1111	���ֵ� ��������
batnam	    ������	010-2222-2222	����
*/

--�� �й�, �̸�, ��������, ��������, �������� �����͸�
--   �Է¹��� �� �ִ� �ǽ� ���̺� ����(TBL_SUNGJUK)
CREATE TABLE TBL_SUNGJUK
( HAKBUN    NUMBER
, NAME      VARCHAR2(40)
, KOR       NUMBER(3)
, ENG       NUMBER(3)
, MAT       NUMBER(3)
, CONSTRAINT SUNGJUK_HAKBUN_PK PRIMARY KEY(HAKBUN)
);
--==>>Table TBL_SUNGJUK��(��) �����Ǿ����ϴ�.

--�� ������ ���̺� �÷� ���� �߰�
--   (���� �� TOT, ��ա�AVG, ��ޡ�GRADE)
ALTER TABLE TBL_SUNGJUK
ADD( TOT NUMBER(3), AVG NUMBER(4,1), GRADE CHAR);
--==>>Table TBL_SUNGJUK��(��) ����Ǿ����ϴ�.

--�� ���⼭ �߰��� �÷��� ���� �׸����
--   ���ν��� �ǽ��� ���� �߰��� ���� ��
--   ���� ���̺� ������ ����������, �ٶ��������� ���� �����̴�.

--�� ����� ���̺� ���� Ȯ��
DESC TBL_SUNGJUK;
--==>>
/*
�̸�     ��?       ����           
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

--�� ������ �Է� �� Ư�� �׸��� ������(�й�, �̸�, ��������, ��������, ��������)�� �Է��ϸ�
--   ���������� ����, ���, ��� �׸��� �Բ� �Է� ó���� �� �ֵ��� �ϴ� 
--   ���ν����� �����Ѵ�.
--   ���ν��� �� : PRC_SUNGJUK_INSERT()
/*
���� ��)
EXEC PRC_SUNGJUK_INSERT(1, '�̿���',90,80,70);

���ν��� ȣ��� ó���� ���)
�й�  �̸�  ��������    ��������    ��������    ����  ���  ���
 1   �̿���    90          80          70      240   80    B
*/

--�� ������ ���ν���(PRC_STUDENTS_INSERT())�� ����� �۵��ϴ�����
--   ���� Ȯ�� �� ���ν��� ȣ��
EXEC PRC_SUNGJUK_INSERT(1, '�̿���',90,80,70);
EXEC PRC_SUNGJUK_INSERT(2, '�̽���',90,80,70);

SELECT *
FROM TBL_SUNGJUK;
--==>>
/*
1	�̿���	90	80	70	240	80	B
2	�̽���	90	80	70	240	80	B
*/

--�� TBL_SUNGJUK ���̺��� Ư�� �л��� ����(�й�, ��������, ��������, ��������)
--   ������ ���� �� ����, ���, ��ޱ��� �����ϴ� ���ν����� �ۼ��Ѵ�
--   ���ν��� �� : PRC_SUNGJUK_UPDATE()
/*
���� ��)
EXEC PRC_SUNGJUK_UPDATE(1, 50, 50, 50);

���ν��� ȣ��� ó���� ���)
�й�  �̸�  ��������    ��������    ��������    ����  ���  ���
 1   �̿���    50          50          50      150   50    F
*/
--�� ������ ���ν���(PRC_SUNGJUK_UPDATE())�� ����� �۵��ϴ�����
--   ���� Ȯ�� �� ���ν��� ȣ��
EXEC PRC_SUNGJUK_UPDATE(1, 50, 50, 50);

SELECT *
FROM TBL_SUNGJUK;
--==>>
/*
1	�̿���	50	50	50	150	50	F
2	�̽���	90	80	70	240	80	B
*/

--�� TBL_STUDENTS ���̺���
--   ��ȭ��ȣ�� �ּ� �����͸� �����ϴ�(�����ϴ�) ���ν����� �ۼ��Ѵ�.
--   ��, ID�� PW�� ��ġ�ϴ� ��쿡�� ������ ������ �� �ֵ��� �Ѵ�,
--   ���ν��� �� : PRC_STUDENTS_UPDATE()
/*
���� ��)
EXEC PRC_STUDENTS_UPDATE('superman','java006$','010-9999-9999','���');

���ν��� ȣ��� ó���� ���
superman	������	010-9999-9999	���
*/
--�� ������ ���ν���(PRC_STUDNETS_UPDATE())�� ����� �۵��ϴ�����
--   ���� Ȯ�� �� ���ν��� ȣ��
EXEC PRC_STUDNETS_UPDATE('superman','java006$','010-9999-9999','���');
--==>PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM TBL_STUDENTS;
--==>>
/*
superman	������	010-9999-9999	���
batnam	    ������	010-2222-2222	����
*/

EXEC PRC_STUDNETS_UPDATE('supermen','java006$','010-9999-9999','���');
--==>PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM TBL_STUDENTS;
--==>>
/*
superman	������	010-9999-9999	���
batnam	    ������	010-2222-2222	����
*/

EXEC PRC_STUDNETS_UPDATE('superman','net006$','010-9999-9999','���');
--==>PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM TBL_STUDENTS;
--==>>
/*
superman	������	010-9999-9999	���
batnam	    ������	010-2222-2222	����
*/

-->ID�� PW�� ��� ��ȿ�� �����ͷ� �׽�Ʈ �� �������... ������ ���� ����

--�� TBL_INSA ���̺��� ������� �ű� ������ �Է� ���ν����� �ۼ��Ѵ�.
--   NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI,BASICPAY, SUDANG
--   ������ ���� �ִ� ��� ���̺� ������ �Է� ��
--   NUM �÷�(�����ȣ)�� ����
--   ���� �ο��� �����ȣ ������ ��ȣ�� �� ���� ��ȣ�� �ڵ����� 
--   �Է� ó���� �� �ִ� ���ν����� �����Ѵ�.
--   ���ν��� ��: PRC_INSA_INSERT(NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI,BASICPAY, SUDANG);
/*
���� ��)
EXEC PRC_INSA_INSERT('�輱��','901212-2234567',SYSDATE,'����','010-5555-5555','������','�븮',1000000,200000);

���ν��� ȣ��� ó���� ���)
1061 �輱�� 901212-2234567 SYSDATE ���� 010-5555-5555 ������ �븮 1000000,200000
*/

DESC TBL_INSA;

SELECT *
FROM TBL_INSA;

EXEC PRC_INSA_INSERT('�輱��','901212-2234567',SYSDATE,'����','010-5555-5555','������','�븮',1000000,200000);
--==>PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.





















