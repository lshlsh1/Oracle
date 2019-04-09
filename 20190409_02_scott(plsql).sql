SELECT USER
FROM DUAL;
--==>>SCOTT

SET SERVEROUTPUT ON;

--�� SCOTT.TBL_INSA ���̺��� ���� ���� ������ ���� ���� ������ ����
--   (�ݺ��� Ȱ��)
DECLARE
    VINSA  TBL_INSA%ROWTYPE;
    VNUM    TBL_INSA.NUM%TYPE := 1001;
BEGIN
    
    LOOP
    
        SELECT NAME, TEL, BUSEO INTO VINSA.NAME, VINSA.TEL, VINSA.BUSEO
        FROM TBL_INSA
        WHERE NUM=VNUM;
        
        DBMS_OUTPUT.PUT_LINE(VINSA.NAME||' - '||VINSA.TEL||' - '||VINSA.BUSEO);
    
        EXIT WHEN VNUM >= 1060;
        
        VNUM := VNUM + 1;       --VNUM�� 1��ŭ ����
        
    END LOOP;
    
END;
--==>>
/*
ȫ�浿 - 011-2356-4528 - ��ȹ��
�̼��� - 010-4758-6532 - �ѹ���
�̼��� - 010-4231-1236 - ���ߺ�
������ - 019-5236-4221 - ������
                :
�̹̰� - 016-6542-7546 - �����
����� - 010-2415-5444 - ��ȹ��
�Ӽ��� - 011-4151-4154 - ���ߺ�
��ž� - 011-4151-4444 - ���ߺ�


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

---------------------------------------------------------------------------

--���� FUNCTION(�Լ�) ����--

-- 1. �Լ��� �ϳ� �̻��� PL/SQL ������ ������ �����ƾ����
--    �ڵ带 �ٽ� ����� �� �ֵ��� ĸ��ȭ �ϴµ� ���ȴ�.
--    ����Ŭ������ ����Ŭ�� ���ǵ� �⺻ ���� �Լ��� ����ϰų�
--    ���� ������ �Լ��� ���� �� �ִ�. (�� ����� ���� �Լ�)
--    �� ����� ���� �Լ��� �ý��� �Լ�ó�� �������� ȣ���ϰų�
--    ���� ���ν���ó�� EXECUTE ���� ���� ������ �� �ִ�.

-- 2. ���� �� ����
/*
CREATE [OR REPLACE] FUNCTION �Լ���
[(
    �Ű�����1 �ڷ���
  , �Ű�����2 �ڷ���
)]
RETURN ������Ÿ��    <<- ����Ÿ�� �߿��
IS
    -- �ֿ� ���� ����(���� ����)
BEGIN
    -- ���๮
    ...
    RETURN (��);
    
    [EXCEPTION]
        -- ���� ó�� ����;
END;
*/
--�� ����� ���� �Լ�(������ �Լ�)��
--   IN �Ķ����(�Է� �Ű�����)�� ����� �� ������
--   �ݵ�� ��ȯ�� ���� ������Ÿ���� RETURN ���� �����ؾ� �ϰ�,
--   FUNCTION�� �ݵ�� ���� ���� ��ȯ�Ѵ�.


--�� TBL_INSA ���̺���
--   �ֹε�Ϲ�ȣ�� ������ ������ ��ȸ�Ѵ�.
SELECT NAME, SSN, DECODE( SUBSTR(SSN,8,1),1,'����',2,'����')"����"
FROM TBL_INSA;

/*
            �� �ֹε�Ϲ�ȣ
          \    /
       ----    --------------
       |                    |
       |                    |
       ----------------     -
                      /     \
                         �鼺��
*/

--�� FUNCTION ����
-- �Լ��� : FN_GENDER()
--                   ��SSN(�ֹε�Ϲ�ȣ) �� 'YYMMDD-NNNNNNN'

CREATE OR REPLACE FUNCTION FN_GENDER
( VSSN  VARCHAR2    -- �Ű����� : �ڸ���(����) ���� ����
)
RETURN VARCHAR2     -- ��ȯ �ڷ��� : �ڸ���(����) ���� ����
IS
    -- �ֿ� ���� ����
    VRESULT VARCHAR2(20);
BEGIN
    -- ���� �� ó��
    IF ( SUBSTR(VSSN,8,1)IN('1','3') )
        THEN VRESULT := '����';
    ELSIF ( SUBSTR(VSSN,8,1)IN('2','4') )
        THEN VRESULT := '����';
    ELSE
        VRESULT := '����Ȯ�κҰ�';
    END IF;
    
    --���� ����� ��ȯ
    RETURN VRESULT;
END;
--==>> Function FN_GENDER��(��) �����ϵǾ����ϴ�.

--�� ������ ���� �� ���� �Ű�����(�Է� �Ķ����)�� �Ѱܹ޾�
--   A�� B���� ���� ��ȯ�ϴ� ����� ���� �Լ��� �ۼ��Ѵ�.
--   �Լ��� : FN_POW()
/*
��� ��)
SELECT FN_POW(10, 3)
FROM DUAL;
--==>> 1000

FN_POW(10, 3)
      ------
        10 * 10 * 10 = 1000
        1 * 10 * 10 * 10 = 1000
        0 * 10 * 10 * 10 = 0
*/


CREATE OR REPLACE FUNCTION FN_POW
( A NUMBER
, B NUMBER
)
RETURN NUMBER
IS
    VRESULT NUMBER;
    VCOUNT  NUMBER;
BEGIN
    VRESULT := 1;
    VCOUNT := 1;
    
    LOOP
        VRESULT := VRESULT*A;
        VCOUNT := VCOUNT+1;
        EXIT WHEN VCOUNT>B;
    END LOOP;
    

    RETURN VRESULT;  
END;
--==>Function FN_POW��(��) �����ϵǾ����ϴ�.

--�� Ǯ��
CREATE OR REPLACE FUNCTION FN_POW(A NUMBER, B NUMBER)
RETURN NUMBER
IS
    V_RESULT    NUMBER := 1;
    V_NUM       NUMBER;
BEGIN
    FOR V_NUM IN 1 .. B LOOP
        V_RESULT := V_RESULT * A;
    END LOOP;
    
    RETURN V_RESULT;
END;

--�� TBL_INSA ���̺��� �޿� ��� ���� �Լ��� �����Ѵ�.
--   �޿��� (�⺻��*12)+���� ������� ������ �����Ѵ�.
--   �Լ��� : FN_PAY(�⺻��, ����)


SELECT *
FROM TBL_INSA;

CREATE OR REPLACE FUNCTION FN_PAY
(BASICPAY TBL_INSA.BASICPAY%TYPE
, SUDANG TBL_INSA.SUDANG%TYPE)
RETURN NUMBER
IS
    VRESULT NUMBER :=0;
BEGIN
    VRESULT := (BASICPAY*12)+SUDANG;
    
    RETURN VRESULT;
END;
--==>Function FN_PAY��(��) �����ϵǾ����ϴ�.

--�� TBL_INSA ���̺��� �Ի����� ��������
--   ��������� �ٹ������ ��ȯ�ϴ� �Լ��� �����Ѵ�
--   ��, �ٹ������ �Ҽ��� ���� ���ڸ����� ����Ѵ�.
--   �Լ��� : FN_WORKYEAR(�Ի���)

CREATE OR REPLACE FUNCTION FN_WORKYEAR
(IBSADATE   TBL_INSA.IBSADATE%TYPE)
RETURN NUMBER
IS
    VRESULT NUMBER;
BEGIN
    VRESULT := TRUNC((SYSDATE - IBSADATE)/365 , 1);
    RETURN VRESULT;
END;
































