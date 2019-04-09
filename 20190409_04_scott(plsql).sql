SELECT USER
FROM DUAL;
--==>>SCOTT

----------------------------------------------------------------------------------------

--�� ����

-- 1. INSERT, UPDATE, DELETE, (MERGE)
--==>> DML(Data Manipulation Language)
-- COMMIT / ROLLBACK �� �ʿ��ϴ�.

-- 2. CREATE, DROP, ALTER, (TRUNCATE)
--==>> DDL(Data definition Language)
-- �����ϸ� �ڵ����� COMMIT(AUTO COMMIT)

-- 3. GRANT, REVOKE
--==>> DCL(DATA CONTROL LANGUAGE)
-- �����ϸ� �ڵ����� COMMIT(AUTO COMMIT)

-- 4. COMMIT, ROLLBACK
--==> TCL(TRANSACTION CONTROL LANGUAGE)

--�� TRANSACTION
-- ��Ż� ���ϸ��� - �����ݾ� ����
-- ����(�츮)   ����(����)
--  100����      0
--   70����     30���� 
-- �� �� �ϳ��� ������ ����� �ȵǸ� ROLLBACK

-- ���� PL/SQL�� �� DML��, TCL���� ��� �����ϴ�
-- ���� PL/SQL�� �� DML��, DDL��, DCL��, TCL�� ��� �����ϴ�.

-----------------------------------------------------------------------------------------

--���� PROCEDURE(���ν���) ����--

-- 1. PL/SQL���� ���� ��ǥ���� ������ ������ ���ν�����
--    �����ڰ� ���� �ۼ��ؾ� �ϴ� ������ �帧��
--    �̸� �ۼ��Ͽ� �����ͺ��̽� ���� ������ �ξ��ٰ�
--    �ʿ��� �� ���� ȣ���Ͽ� ������ �� �ֵ��� ó���� �ִ� �����̴�.

-- 2. ���� �� ����
/*
CREATE [OR REPLACE] PROCEDURE ���ν�����
[(
    �Ű����� IN ������Ÿ��       --����
  , �Ű����� OUT ������Ÿ��      --���ι�
  , �Ű����� INOUT ������Ÿ��    --���ι鿡 ����ִ� ����
)]
IS
    [-- �ֿ� ���� ����;]
BEGIN
    --���౸��
    ...
    [EXCEPTION
        --���� ó�� ����;]
END;
*/

--�� FUNCTION�� ������ ��
--   ��RETURN ��ȯ�ڷ������κ��� �������� ������,
--   ��RETURN���� ��ü�� �������� ������,
--   ���ν��� ���� �� �Ѱ��ְ� �Ǵ� �Ű������� ������
--   IN, OUT, INOUT ���� ���еȴ�

-- 3.����(ȣ��)
/*
EXEC[UTE] ���ν�����[(�μ�1, �μ�2, ...)];
*/

--�� INSERT ���� ������ ���ν����� �ۼ�(INSERT ���ν���)
--���̺��� 1:1���谡 �ٶ����ϴٴ°��� �ƴϳ� ���ν����� ���� ������ ���� ������

-- �ǽ� ���̺� ����(TBL_STUDENTS)
CREATE TABLE TBL_STUDENTS
( ID    VARCHAR2(10)
, NAME  VARCHAR2(40)
, TEL   VARCHAR2(20)
, ADDR  VARCHAR2(100)
);
--==>Table TBL_STUDENTS��(��) �����Ǿ����ϴ�.

--�ǽ� ���̺� ����(TBL_IDPW)
CREATE TABLE TBL_IDPW
( ID    VARCHAR2(10)
, PW    VARCHAR2(20)
, CONSTRAINT IDPW_ID_PK PRIMARY KEY(ID)
);
--==>>Table TBL_IDPW��(��) �����Ǿ����ϴ�.

-- �� ���̺� ������ �Է�
INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
VALUES('superman','������','010-1111-1111','���ֵ� ��������');
INSERT INTO TBL_IDPW(ID, PW)
VALUES('superman','java006$');
--==>>1 �� ��(��) ���ԵǾ����ϴ�. * 2

SELECT *
FROM TBL_STUDENTS;
--==>>superman	������	010-1111-1111	���ֵ� ��������

SELECT *
FROM TBL_IDPW;
--==>>superman	java006$

-- ���� ������ ���ν���(INSERT ���ν���, �Է� ���ν���)�� �����ϰ� �Ǹ�
EXEC PRC_STUDENTS_INSERT('batnam','java006$','������','010-2222-2222','����');
-- �̿� ���� ���� �� �ٷ� ���� ���̺� �����͸� ��� ����� �Է��� �� �ִ�.

-- ���ν��� ����(�ۼ�)
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_INSERT
(V_ID   IN TBL_IDPW.ID%TYPE
,V_PW   IN TBL_IDPW.PW%TYPE
,V_NAME IN TBL_STUDENTS.NAME%TYPE
,V_TEL  IN TBL_STUDENTS.TEL%TYPE
,V_ADDR IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    -- TBL_IDPW ���̺� ������ �Է�
    INSERT INTO TBL_IDPW(ID, PW)
    VALUES(V_ID, V_PW);
    
    -- TBL_STUDENTS ���̺� ������ �Է�
    INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
    VALUES(V_ID, V_NAME, V_TEL, V_ADDR);

    -- Ŀ��
    COMMIT;
END;
--==>>Procedure PRC_STUDENTS_INSERT��(��) �����ϵǾ����ϴ�.



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

CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( V_HAKBUN    IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME      IN TBL_SUNGJUK.NAME%TYPE
, V_KOR       IN TBL_SUNGJUK.KOR%TYPE
, V_ENG       IN TBL_SUNGJUK.ENG%TYPE
, V_MAT       IN TBL_SUNGJUK.MAT%TYPE
)
IS
    --INSERT �������� �����ϴµ� �ʿ��� �ֿ� ���� ����
    V_TOT       TBL_SUNGJUK.TOT%TYPE;
    V_AVG       TBL_SUNGJUK.AVG%TYPE;
    V_GRADE     TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    -- �Ʒ��� ������ ������ ���ؼ���
    -- ������ �����鿡 ���� ��Ƴ��� �Ѵ�.
    V_TOT := V_KOR+V_ENG+V_MAT;
    V_AVG := V_TOT/3;
    IF (V_AVG>=90)    THEN V_GRADE :='A';
    ELSIF (V_AVG>=80) THEN V_GRADE :='B';
    ELSIF (V_AVG>=70) THEN V_GRADE :='C';
    ELSIF (V_AVG>=60) THEN V_GRADE :='D';
    ELSE V_GRADE :='F';
    END IF;            
    
    -- ���� ������ ���� ��Ƴ� �����
    -- INSERT ������ ����
    INSERT INTO TBL_SUNGJUK(HAKBUN,NAME,KOR,ENG,MAT,TOT,AVG,GRADE)
    VALUES (V_HAKBUN,V_NAME,V_KOR,V_ENG,V_MAT,V_TOT,V_AVG,V_GRADE);
    
    COMMIT;
END;
--==>>Procedure PRC_SUNGJUK_INSERT��(��) �����ϵǾ����ϴ�.


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
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN    IN TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR       IN TBL_SUNGJUK.KOR%TYPE
, V_ENG       IN TBL_SUNGJUK.ENG%TYPE
, V_MAT       IN TBL_SUNGJUK.MAT%TYPE
)
IS
    -- UPDATE ���� �� �ʿ��� �����͸� ���� �ֿ� ���� ����
    V_TOT       TBL_SUNGJUK.TOT%TYPE;
    V_AVG       TBL_SUNGJUK.AVG%TYPE;
    V_GRADE     TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    -- �Ʒ��� ������ ������ ���ؼ���
    -- ������ �����鿡 ���� ��Ƴ��� �Ѵ�. 
    V_TOT := V_KOR+V_ENG+V_MAT;
    V_AVG := V_TOT/3;
    IF (V_AVG>=90)    THEN V_GRADE :='A';
    ELSIF (V_AVG>=80) THEN V_GRADE :='B';
    ELSIF (V_AVG>=70) THEN V_GRADE :='C';
    ELSIF (V_AVG>=60) THEN V_GRADE :='D';
    ELSE V_GRADE :='F';
    END IF;       
    
    -- UPDATE ������ ����
    UPDATE TBL_SUNGJUK
    SET KOR = V_KOR, ENG=V_ENG, MAT=V_MAT, TOT=V_TOT, AVG=V_AVG, GRADE=V_GRADE
    WHERE HAKBUN = V_HAKBUN;
    
    COMMIT;
END;
--==>>Procedure PRC_SUNGJUK_UPDATE��(��) �����ϵǾ����ϴ�.

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
CREATE OR REPLACE PROCEDURE PRC_STUDNETS_UPDATE
(V_ID   IN TBL_IDPW.ID%TYPE
,V_PW   IN TBL_IDPW.PW%TYPE
,V_TEL  IN TBL_STUDENTS.TEL%TYPE
,V_ADDR IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    UPDATE TBL_STUDENTS
    SET TEL=V_TEL, ADDR=V_ADDR
    WHERE ID = V_ID AND V_PW=(SELECT PW FROM TBL_IDPW WHERE ID=V_ID);
    
    COMMIT;
END;
--==>>Procedure PRC_STUDNETS_UPDATE��(��) �����ϵǾ����ϴ�.

--�� Ǯ��

UPDATE ���̺��
SET �������=��������
WHERE ����

(
SELECT I.ID, I.PW, S.TEL, S.ADDR
FROM TBL_IDPW I JOIN TBL_STUDENTS S
ON I.ID = S.ID;
)T


UPDATE (SELECT I.ID, I.PW, S.TEL, S.ADDR
        FROM TBL_IDPW I JOIN TBL_STUDENTS S
        ON I.ID = S.ID;
        )T
SET T.TEL=�Է¹�����ȭ��ȣ, T.ADDR=�Է¹����ּ�
WHERE T.ID=�Է¹��� ID AND T.PW=�Է¹���PW;


CREATE OR REPLACE PROCEDURE PRC_STUDNETS_UPDATE
(V_ID   IN TBL_IDPW.ID%TYPE
,V_PW   IN TBL_IDPW.PW%TYPE
,V_TEL  IN TBL_STUDENTS.TEL%TYPE
,V_ADDR IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    UPDATE (SELECT I.ID, I.PW, S.TEL, S.ADDR
            FROM TBL_IDPW I JOIN TBL_STUDENTS S
            ON I.ID = S.ID
            )T
    SET T.TEL=V_TEL, T.ADDR=V_ADDR
    WHERE T.ID=V_ID AND T.PW=V_PW;    
    
    --Ŀ��
    COMMIT;
END;
--==>Procedure PRC_STUDNETS_UPDATE��(��) �����ϵǾ����ϴ�.





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
SELECT *
FROM TBL_INSA;

CREATE OR REPLACE PROCEDURE PRC_INSA_INSERT
( V_NAME        IN TBL_INSA.NAME%TYPE
, V_SSN         IN TBL_INSA.SSN%TYPE
, V_IBSADATE    IN TBL_INSA.IBSADATE%TYPE
, V_CITY        IN TBL_INSA.CITY%TYPE
, V_TEL         IN TBL_INSA.TEL%TYPE
, V_BUSEO       IN TBL_INSA.BUSEO%TYPE
, V_JIKWI       IN TBL_INSA.JIKWI%TYPE
, V_BASICPAY    IN TBL_INSA.BASICPAY%TYPE
, V_SUDANG      IN TBL_INSA.SUDANG%TYPE
)
IS
    V_NUM   NUMBER;
BEGIN
    SELECT MAX(NUM) INTO V_NUM 
    FROM TBL_INSA;
    
    INSERT INTO TBL_INSA(NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI,BASICPAY, SUDANG)
    VALUES(V_NUM+1, V_NAME, V_SSN , V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);

    COMMIT;
END;
--==>Procedure PRC_INSA_INSERT��(��) �����ϵǾ����ϴ�.

























