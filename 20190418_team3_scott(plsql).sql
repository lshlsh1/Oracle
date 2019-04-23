->�л� ������ �Է� 
--�л� ������ �Է� ���ν���
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
    REENTRANCE_ERROR    EXCEPTION;
    NUM_OVER_ERROR  EXCEPTION;
    V_DROP_STU_ID  STUDENT.STU_ID%TYPE;
    V_DROP_STU_ID2 STUDENT.STU_ID%TYPE;
    V_DROP_STU_ID3 STUDENT.STU_ID%TYPE;

BEGIN
     IF (V_STU_ID_NUM > 999)         ---ID���ڰ� 999�̻��� �Ǹ� ����
        THEN RAISE NUM_OVER_ERROR;
    END IF;

    -- �Է��� �ֹι�ȣ�� �ߺ��� �ֹι�ȣ�� ���̵� �����ϸ� 1, �������� ������ 0 �̾Ƴ���
    SELECT NVL2(MAX(STU_SSN), 1, 0), MAX(STU_ID) INTO ISNULL_STU_SSN, V_STU_ID
    FROM STUDENT
    WHERE STU_SSN = V_STU_SSN;

    -- 
    SELECT NVL2(MAX(DROP_STU_ID), 1, 0) INTO ISNULL_DROP_STU_ID
    FROM DROPSTUDENT
    WHERE STU_ID = V_STU_ID;
    
    IF(ISNULL_STU_SSN=0) -- �ű԰���
        THEN -- ID���ںκ� ���̱�
            SELECT NVL(MAX(TO_NUMBER(SUBSTR(STU_ID,5))), 0 ) + 1 INTO V_STU_ID_NUM
            FROM STUDENT;
            V_STU_ID := 'S'||TO_CHAR(SYSDATE,'YY')||'_'||LPAD(TO_CHAR(V_STU_ID_NUM), 4, '0');
        
            --�� ���� INSERT�ϱ�
            INSERT INTO STUDENT(STU_ID, STU_NAME, STU_SSN, STU_TEL)
            SELECT V_STU_ID, V_STU_NAME, V_STU_SSN, V_STU_TEL
            FROM DUAL
            WHERE NOT EXISTS (SELECT * FROM STUDENT WHERE STU_SSN=V_STU_SSN ); 

    ELSIF(ISNULL_STU_SSN=1 AND ISNULL_DROP_STU_ID=1)-- Ż���ߴٰ� 1�� ������ �� �ٽð���
        THEN  --Ż���� ȸ���� �簡���Ҷ� DROPSTUDENT���� ���ڵ带 ����� ����
            SELECT STU_ID INTO V_DROP_STU_ID FROM STUDENT WHERE STU_SSN=V_STU_SSN;     -- �ֹι�ȣ�� STUDENT���� STU_ID�� �̾Ƴ���
            SELECT STU_ID INTO V_DROP_STU_ID2 FROM DROPSTUDENT WHERE STU_ID=V_DROP_STU_ID; -- STU_ID�� DROPSTUDENT�� ������(Ż���� ȸ���̸�) STU_ID�� V_DROP_STU_ID2�� ��´�
            
                IF(V_DROP_STU_ID=V_DROP_STU_ID2)    -- STUDENT ���̺� STU_ID = DROPSTUDENT ���̺� STU_ID �̸�
                    THEN V_DROP_STU_ID3 := V_DROP_STU_ID;   --������ V_DROP_STU_ID3�� ��´�
                END IF;
         
            DELETE
            FROM DROPSTUDENT
            WHERE STU_ID=V_DROP_STU_ID3;    --V_DROP_STU_ID3�� �����Ѵٸ� DROPSTUDENT ���̺��� ������ �����ϰ�
            
            UPDATE STUDENT
            SET STU_NAME =V_STU_NAME, STU_TEL=V_STU_TEL
            WHERE STU_ID=V_DROP_STU_ID3;    --V_DROP_STU_ID3�� �����Ѵٸ� �ֹι�ȣ�� STU_ID�� ������ STUDENT�� ���� �Է°����� ����

    ELSIF(ISNULL_STU_SSN=1 AND ISNULL_DROP_STU_ID=0) -- �̹� ���Ե� �갡 �簡���Ϸ��� ��
        THEN RAISE REENTRANCE_ERROR;
    END IF;
    
    COMMIT;
    
    --����ó��
    EXCEPTION
        WHEN NUM_OVER_ERROR
            THEN RAISE_APPLICATION_ERROR(-20000, '�Է°����� ���ڹ����� �Ѿ���ϴ�. DB�����ڸ� ȣ���ϼ���');
                 ROLLBACK;
        WHEN REENTRANCE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20004, '�̹� ������ ������ �����մϴ�');
        WHEN OTHERS
            THEN ROLLBACK;
END;
-> ���� ������
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

->�л� ����
-- DROP_STU_ID ���� ������
CREATE SEQUENCE SEQ_DROPSTU -- ������ ���� �⺻ ����(MSSQL�� IDENTITY�� ������ ����)
START WITH 1              -- ���۰�
INCREMENT BY 1            -- ������
NOMAXVALUE                -- �ִ밪 ���� ����
NOCACHE;                  -- ĳ�� ��� ����(����)

-- ���� ���ν���
CREATE OR REPLACE PROCEDURE PRC_DROPSTU_INSERT
( V_STU_ID      IN STUDENT.STU_ID%TYPE
, V_DROP_REASON IN DROPSTUDENT.DROP_REASON%TYPE)
IS  
    V_OC_END   OPENCOURSE.OC_END%TYPE;
    V_OC_START OPENCOURSE.OC_START%TYPE;
    OPENCOURSING_STU_DROP_ERROR   EXCEPTION;
    V_OC_ID     REGISTER.OC_ID%TYPE;
    ISNULL_STU_ID   NUMBER(1);
BEGIN

    SELECT NVL2(MAX(STU_ID), 1, 0) INTO ISNULL_STU_ID
    FROM REGISTER
    WHERE STU_ID = V_STU_ID;
    
    IF(ISNULL_STU_ID=0)
        THEN INSERT INTO DROPSTUDENT(STU_ID, DROP_REASON, DROP_STU_ID)
             VALUES(V_STU_ID, V_DROP_REASON, SEQ_DROPSTU.NEXTVAL);
    ELSIF(ISNULL_STU_ID=1)
        THEN SELECT OC_ID INTO V_OC_ID FROM REGISTER WHERE STU_ID=V_STU_ID;
             SELECT OC_END INTO V_OC_END FROM OPENCOURSE WHERE OC_ID=V_OC_ID;
             SELECT OC_START INTO V_OC_START FROM OPENCOURSE WHERE OC_ID=V_OC_ID;
             
             
             IF (V_OC_START<=SYSDATE AND SYSDATE<=V_OC_END)
                THEN RAISE OPENCOURSING_STU_DROP_ERROR;
             ELSE INSERT INTO DROPSTUDENT(STU_ID, DROP_REASON, DROP_STU_ID)
                  VALUES(V_STU_ID, V_DROP_REASON, SEQ_DROPSTU.NEXTVAL);
             END IF;
             
   END IF;
   
   COMMIT;
        
     EXCEPTION
        WHEN OPENCOURSING_STU_DROP_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '�������� �л��� ������ �� �����ϴ�');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;    
END;



------------�׽�Ʈ ������
EXEC PRC_DROPSTU_INSERT('S19_001','�����׽�Ʈ1');

EXEC PRC_DROPSTU_INSERT('S19_002','�����׽�Ʈ2');

EXEC PRC_DROPSTU_INSERT('S19_003','�����׽�Ʈ3');

-- ���������� �׽�Ʈ����
-- 1. STU_ID�� ��� ������ REGISTER�� ������û���� ���� �л� �� ������
--2. STU_ID�� ����߰� REGISTER�� ������û�� �л�
      2.1 ���������л� �� �������� ����(����)
      2.2 ���������� ���� �л� �� ������


->�л� ���� ������
DELETE
FROM DROPSTUDENT
WHERE MONTHS_BETWEEN(SYSDATE, DROP_DATE) > 12;


CREATE OR REPLACE PROCEDURE PRC_REGISTER_INSERT
(V_STU_ID   IN STUDENT.STU_ID%TYPE
,V_OC_ID    IN OPENCOURSE.OC_ID%TYPE)
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
    
    
    SELECT CAPACITY INTO V_CAPACITY FROM OPENCOURSE WHERE OC_ID = V_OC_ID;
    SELECT COUNT(*) INTO V_NOW FROM REGISTER  WHERE OC_ID = V_OC_ID;
    
    
    
    IF (V_CAPACITY <= V_NOW)
        THEN RAISE OC_START_ERROR2;
    END IF;   
    

    -- REG_ID�� ���ںκ� �����
    SELECT NVL(MAX(TO_NUMBER(SUBSTR(REG_ID,6))), 0 ) + 1 INTO V_REG_ID_NUM
    FROM REGISTER;

    -- REG_ID����
    V_REG_ID := 'RG'||TO_CHAR(SYSDATE,'YY')||'_'||LPAD(TO_CHAR(V_REG_ID_NUM), 4, '0');

    --INSERT�ϱ�
    INSERT INTO REGISTER(STU_ID, OC_ID, REG_ID)
    VALUES (V_STU_ID, V_OC_ID, V_REG_ID);
    
    -- Ŀ��
    COMMIT;
    
    --����ó��
    EXCEPTION
        WHEN OC_START_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '���� �������� ���� ������ ������û�� �� �����ϴ�');
                 ROLLBACK;
        WHEN OC_START_ERROR2
            THEN RAISE_APPLICATION_ERROR(-200020, '�����ο� �ʰ��Դϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;


--������û�̷� ����
CREATE OR REPLACE PROCEDURE PRC_REGISTER_DELETE
( V_REG_ID     IN REGISTER.REG_ID%TYPE )
IS
 V_OC_ID       REGISTER.OC_ID%TYPE;
 V_OC_START    OPENCOURSE.OC_START%TYPE;
 COURSE_OPEN_ERROR  EXCEPTION;

BEGIN
    SELECT OC_ID INTO V_OC_ID FROM REGISTER WHERE REG_ID=V_REG_ID;
    SELECT OC_START INTO V_OC_START FROM OPENCOURSE WHERE OC_ID = V_OC_ID;

    IF (SYSDATE>=V_OC_START)            -- ���ǰ� ���۵Ǳ� ������ ������û�̷��� ������ �� ����
        THEN RAISE COURSE_OPEN_ERROR;
    END IF;

    DELETE
    FROM REGISTER
    WHERE REG_ID = V_REG_ID;

    EXCEPTION
        WHEN COURSE_OPEN_ERROR
            THEN RAISE_APPLICATION_ERROR(-20000, '������ �̹� ���۵Ǿ��� ��� ������û�� ������ �� �����ϴ�.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;

EXEC PRC_REGISTER_DELETE(RC19_1112);




















