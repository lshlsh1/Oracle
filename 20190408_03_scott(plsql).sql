SELECT USER
FROM DUAL;
--==>>SCOTT

--���� PL/SQL ����--

--1. PL/SQL(Procedural Language extension to SQL)��
--   ���α׷��� ����� Ư���� ������ SQL�� Ȯ���̸�
--   ������ ���۰� ���� ������ PL/SQL�� "������" �ڵ� �ȿ� ���Եȴ�
--   ���� PL/SQL�� ����ϸ� SQL�� �� �� ���� ������ �۾��� �����ϴ�
--   ���⿡�� �����������̶�� �ܾ ������ �ǹ̴�
--   � ���� � ������ ���� ��� �Ϸ�Ǵ���
--   �� ����� ��Ȯ�ϰ� �ڵ忡 ����Ѵٴ� ���� �ǹ��Ѵ�

--2. PL/SQL�� ���������� ǥ���ϱ� ����
--   ������ ������ �� �ִ� ���
--   ���� ������ ������ �� �ִ� ���
--   ���� �帧�� ��Ʈ���� �� �ִ� ��� ���� �����Ѵ�.

--3. PL/SQL�� �� ������ �Ǿ� ������
--   ���� ���� �κ�, ���� �κ�, ���� ó�� �κ���
--   �� �κ����� �����Ǿ� �ִ�
--   ����, �ݵ�� ���� �κ��� �����ؾ� �ϸ�, ������ ������ ����.

--4. ���� �� ����
/*
[DECLARE]
    -- ����(declarations)
BEGIN
    -- ���๮(statements)
    
    [EXCEPTION]
        -- ���� ó����(exception handlers)
END;
*/

--5. ���� ����
/*
DECLARE
    ������ �ڷ���;
    ������ �ڷ��� := �ʱⰪ;      �� := ���Կ�����
BEGIN
    PL/SQL ����;
END;
*/


SET SERVEROUTPUT ON;
--==>> �۾��� �Ϸ�Ǿ����ϴ�.
-- ��DBMS_OUTPUT.PUT_LINE()���� ����
-- ȭ�鿡 ����� ����ϱ� ���� ȯ�溯�� ����

--�� ������ ������ ���� �����ϰ� ����ϴ� ���� �ۼ�
DECLARE
    -- �����
    D1  NUMBER :=10 ;
    D2  VARCHAR2(30) := 'HELLO';
    D3  VARCHAR2(20) := 'Oracle';
BEGIN
    -- �����
    DBMS_OUTPUT.PUT_LINE(D1);
    DBMS_OUTPUT.PUT_LINE(D2);
    DBMS_OUTPUT.PUT_LINE(D3);
    
END;
--==>>
/*
10
HELLO
Oracle


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� ������ ������ ���� �����ϰ� ����ϴ� ���� �ۼ�
DECLARE
    -- �����
    D1  NUMBER :=10;
    D2  VARCHAR2(30) := 'HELLO';
    D3  VARCHAR2(20) := 'Oracle';
BEGIN
    -- �����
    D1 := D1 * 10;
    D2 := D2||' ����';
    D3 := D3||' World';
    
    DBMS_OUTPUT.PUT_LINE(D1);
    DBMS_OUTPUT.PUT_LINE(D2);
    DBMS_OUTPUT.PUT_LINE(D3);
END;
--==>>
/*
100
HELLO ����
Oracle World


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� IF��(���ǹ�)
-- IF - THEN ~ ELSE ~ END IF;

-- 1. PL/SQL�� IF ������ �ٸ� ����� IF ���ǹ��� ���� �����ϴ�.
--    ��ġ�ϴ� ���ǿ� ���� ���������� �۾��� ������ �� �ֵ��� �Ѵ�.
--    TRUE �̸� THEN�� ELSE ������ ������ �����ϰ�
--    FLASE�� NULL�̸� ELSE�� END IF ������ ������ �����ϰ� �ȴ�.

-- 2. ���� �� ����
/*
IF ����
    THEN ó������;
ESLIF
    THEN ó������;
ESLS
    ó������;
END IF;              <- ���߸��� �ʰ� ����
*/

--�� ������ ����ִ� ���� ����...
--   Excellent, Good, Fail�� �����Ͽ�
--   ����� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.

DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'C';
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('Excellent');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('Good');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Fail');
    END IF;
END;
--==>>
/*
Fail


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'A';
    
    IF (GRADE = 'A')
        THEN DBMS_OUTPUT.PUT_LINE('Excellent');
    ELSIF (GRADE = 'B')
        THEN DBMS_OUTPUT.PUT_LINE('Good');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Fail');
    END IF;
END;
--==>>
/*
Excellent


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� CASE�� (���ǹ�)
-- CASE ~ WHEN ~ THEN ~ ELSE ~ END CASE;

-- 1. ���� �� ����
/*
CASE ����
    WHEN ��1
        THEN ���๮;
    WHEN ��2
        THEN ���๮;
    ELSE
        ���๮;
END CASE;
*/

--�� ������ ����ִ� ���� ����...
--   Excellent, Good, Fail�� �����Ͽ�
--   ����� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.
--   ��, CASE ������ Ȱ���Ͽ� �ۼ��Ѵ�.
DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'A';
    
    CASE GRADE
       WHEN 'A'
            THEN DBMS_OUTPUT.PUT_LINE('Exellent');
        WHEN 'B'
            THEN DBMS_OUTPUT.PUT_LINE('Good');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Fail');
    END CASE;
END;
--==>>
/*
Exellent


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� �ܺ� �Է� ó��

-- 1. ACCEPT ��
-- ACCEPT ������ PROMPT '�޼���';
-- �ܺ� �����κ��� �Է¹��� �����͸� ���� ������ ������ ��
-- ��&�ܺκ��������·� �����ϰ� �ȴ�

--�� ���� 2���� �ܺηκ���(����ڷκ���) �Է¹޾�
--   �̵��� ���� ����� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.

ACCEPT N1 PROMPT 'ù ��° ������ �Է��ϼ���';
ACCEPT N2 PROMPT '�� ��° ������ �Է��ϼ���';

DECLARE
    -- �ֿ� ���� ���� �� �ʱ�ȭ
    NUM1    NUMBER := &N1;
    NUM2    NUMBER := &N2;
    TOTAL   NUMBER := 0;
BEGIN
    -- ���� �� ó��
    TOTAL := NUM1 + NUM2;
    
    -- ��� ���
    DBMS_OUTPUT.PUT_LINE(NUM1 || ' + ' || NUM2 || ' = ' || TOTAL);

END;
--==>>
/*
25 + 47 = 72


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� ����ڷκ��� �Է¹��� �ݾ��� ȭ�� ������ ����ϴ� ���α׷��� �ۼ��Ѵ�
--   ��, ��ȯ �ݾ��� ���ǻ� 1õ�� �̸�, 10�� �̻� �����ϴٰ� �����Ѵ�.

/*
���� ��)
���ε� ���� �Է� ��ȭâ �� �ݾ� �Է� :

�Է¹��� �ݾ� �Ѿ� : 990��
ȭ����� : �����1 , ��� 4, ���ʿ� 1, �ʿ� 4
*/
ACCEPT N1 PROMPT '�Է¹��� �ݾ� �Ѿ� : '

DECLARE
    NUM1    NUMBER := &N1;
    NUM2    NUMBER;
    NUM3    NUMBER;
    NUM4    NUMBER;
    NUM5    NUMBER;
BEGIN
   NUM2 := TRUNC(NUM1/500);
   NUM3 := TRUNC(MOD(NUM1,500)/100);
   NUM4 := TRUNC(MOD(NUM1,100)/50);
   NUM5 := MOD(NUM1,50)/10;
   
   DBMS_OUTPUT.PUT_LINE('�����'||NUM2||', ���'||NUM3||', ���ʿ�'||NUM4||', �ʿ�'||NUM5);
END;

-- ȫ�� Ǯ��
ACCEPT M PROMPT'�ݾ��Է� : ';

DECLARE
    M       NUMBER := &M;
        
    M500    NUMBER;
    M100    NUMBER;
    M50     NUMBER;
    M10     NUMBER;
    TEMP    NUMBER;
BEGIN
    M500 := TRUNC(M / 500);
    TEMP := M - M500*500;
    
    M100 := TRUNC(TEMP / 100);
    TEMP := TEMP - M100*100;
    
    M50  := TRUNC(TEMP / 50);
    TEMP := TEMP - M50*50;
    
    M10 := TRUNC(TEMP / 10);
    
    DBMS_OUTPUT.PUT_LINE('�Է¹��� �ݾ� �Ѿ� : '||M);
    DBMS_OUTPUT.PUT_LINE('ȭ����� : ����� '|| M500 || ', ��� '|| M100 || ', ���ʿ� '|| M50 || ', �ʿ� '|| M10);
END;

--�� Ǯ��
ACCEPT INPUT PROMPT '�ݾ� �Է�';

DECLARE
    --�� �ֿ� ���� ���� �� �ʱ�ȭ
    MONEY   NUMBER := &INPUT;   -- ������ ���� ��Ƶ� ����
    MONEY2  NUMBER := &INPUT;   -- ����� ���� ��Ƶ� ����(���� �������� ���� ���ϱ� ������)
    M500    NUMBER;  -- 500��¥�� ������ ��Ƶ� ����
    M100    NUMBER;  -- 100���ڸ� ������ ��Ƶ� ����
    M50     NUMBER;  -- 50��¥�� ������ ��Ƶ� ����
    M10     NUMBER;  -- 10��¥�� ������ ��Ƶ� ����
BEGIN
    --�� ���� �� ó��
    --MONEY�� 500���� ������ ���� ���ϰ� �������� ������. �� 500���� ����
    M500 := TRUNC(MONEY/500);
    
    --MONEY�� 500���� ������ ���� ������ �������� ���Ѵ�.
    --�� ����� MONEY�� ��Ƴ���.
    MONEY := MOD(MONEY,500);
    
    --MONEY�� 100���� ������ ���� ���ϰ� �������� ������. �� 100���� ����
    M100 := TRUNC(MONEY/100);
    
    --MONEY�� 100���� ������ ���� ������ �������� ���Ѵ�.
    --�� ����� MONEY�� ��Ƴ���
    MONEY := MOD(MONEY,100);
    
    --MONEY�� 50���� ������ ���� ���ϰ� �������� ������. �� 50���� ���� 
    M50 := TRUNC(MONEY/50);
    
    -- MONEY�� 50���� ������ ���� ������ �������� ���Ѵ�.
    MONEY := MOD(MONEY,50);
    
    -- MONEY�� 10���� ������ ���� ���ϰ� �������� ������. �� 10���� ����
    M10 := TRUNC(MONEY/10);
    
    --�� ��� ���
   DBMS_OUTPUT.PUT_LINE('�Է¹��� �ݾ� �Ѿ� : '||MONEY2||'��');
   DBMS_OUTPUT.PUT_LINE('ȭ����� : ����� '||M500||', ��� '||M100||', ���ʿ�'||M50||', �ʿ�'||M10);
END;
--==>>
/*
�Է¹��� �ݾ� �Ѿ� : 990��
ȭ����� : ����� 1, ��� 4, ���ʿ�1, �ʿ�4


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/







--�� �⺻ �ݺ���
--LOOP ~ END LOOP;

-- 1. ���ǰ� ������� ������ �ݺ��ϴ� ����

-- 2. ���� �� ����
/*
LOOP
    -- ���๮;
    EXIT WHEN ����;   -- ������ ���� ��� �ݺ����� ����������.
END LOOP;
*/

--�� 1���� 10������ �� ���(LOOP Ȱ��)
DECLARE
    N   NUMBER;
BEGIN
    N := 1;
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        EXIT WHEN N>=10;
        N := N+1;      -- N++;, N+=1;
    END LOOP;
END;
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� WHILE �ݺ���
-- WHILE LOOP ~ END LOOP;

-- 1. ���� ������ TRUE�� ���� �Ϸ��� ������ �ݺ��ϱ� ����
--    WHILE LOOP ������ ����Ѵ�
--    ������ �ݺ��� ���۵� �� üũ�ϰ� �Ǿ�
--    LOOP ���� ������ �� ���� ������� �ʴ� ��쵵 �ִ�.
--    LOOP�� ������ �� ������ FALSE �̸� �ݺ� ������ Ż���ϰ� �ȴ�.

--2. ���� �� ����
/*
WHILE LOOP
END LOOP;
*/

/*
WHILE ���� LOOP   -- ������ ���� ��� �ݺ� ����
    -- ���๮;
END LOOP;
*/

--�� 1���� 10������ �� ���(WHILE LOOP Ȱ��)
DECLARE
    N   NUMBER;
BEGIN
    N := 0;
    WHILE N<10 LOOP
        N := N+1;
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� FOR �ݺ���
-- FOR LOOP ~ END LOOP;
-- ���� FOR���� ���

-- 1. ������ �������� 1�� �����Ͽ�
--    ������ ������ �� �� ���� �ݺ� �����Ѵ�.

-- 2. ���� �� ����
/*
FOR ī���� in [REVERSE] ���ۼ� .. ������ LOOP
    -- ���๮
END LOOP
*/

--�� 1���� 10������ �� ���(FOR LOOP Ȱ��)
DECLARE
    N   NUMBER;
BEGIN
    FOR N IN 1 .. 10 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� ����ڷκ��� ������ ��(������)�� �Է¹޾�
--   �ش� �ܼ��� �������� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.
/*
���� ��)
���ε� ���� �Է� ��ȭâ �� ���� �Է��ϼ��� : 2

2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
  :
2 * 9 = 18
*/

--WHILE
ACCEPT INPUT PROMPT '���� �Է��ϼ���';

DECLARE
    N   NUMBER := &INPUT;
    M   NUMBER;
BEGIN
    M :=1;
    LOOP
    
    DBMS_OUTPUT.PUT_LINE(N||' * '||M||' = '||N*M);
    EXIT WHEN M>=9;
    M := M+1;
    END LOOP;
END;
/*
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
2 * 4 = 8
2 * 5 = 10
2 * 6 = 12
2 * 7 = 14
2 * 8 = 16
2 * 9 = 18


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--WHILE��
ACCEPT INPUT PROMPT '���� �Է��ϼ���';

DECLARE
    N   NUMBER := &INPUT;
    M   NUMBER;
BEGIN
    M := 0;
    WHILE M<10 LOOP
        M := M+1;
        DBMS_OUTPUT.PUT_LINE(N||' * '||M||' = '||N*M);
    END LOOP;
END;
--==>>
/*
3 * 1 = 3
3 * 2 = 6
3 * 3 = 9
3 * 4 = 12
3 * 5 = 15
3 * 6 = 18
3 * 7 = 21
3 * 8 = 24
3 * 9 = 27
3 * 10 = 30
*/

--FOR��
ACCEPT INPUT PROMPT '���� �Է��ϼ���';
DECLARE
    N   NUMBER := &INPUT;
    M   NUMBER;
BEGIN
    FOR M IN 1 .. 9 LOOP
        DBMS_OUTPUT.PUT_LINE(N||' * '||M||' = '||N*M);
    END LOOP;
END;
--==>>
/*
4 * 1 = 4
4 * 2 = 8
4 * 3 = 12
4 * 4 = 16
4 * 5 = 20
4 * 6 = 24
4 * 7 = 28
4 * 8 = 32
4 * 9 = 36
*/















