SELECT USER
FROM DUAL;
--==>>HR

--���� DEFAULT ǥ���� ����--

-- 1. INSERT �� UPDATE ������
--    ����ڰ� �����ϴ� Ư������ �ƴ�
--    �⺻ ���� �Է��ϵ��� ó���� �� �ִ�.

-- 2. ���� �� ����
-- �÷��� ������Ÿ�� DEFAULT �⺻��

-- 3. INSERT ��� �� �ش� �÷��� �̺��� ���� �Ҵ��ϱ� �ʰų�
--    DEFAULT Ű���带 Ȱ���Ͽ� �⺻ ���� �Է��ϵ��� �� �� �ִ�

-- 4. DEFAULT Ű����� �ٸ� ����(NOT NULL��) ǥ�Ⱑ ���� ���� ���
--    DEFAULT Ű���带 ���� ǥ��(�ۼ�)�� ���� �����Ѵ�.

CREATE....
( COL1  ������Ÿ�� DEFAULT .... PRIMARY KEY
, COL2  ������Ÿ�� DEFAULT SYSDATE NOT NULL
, COL3  ������Ÿ��
);

--�� DEFAULT ǥ���� �ǽ�
-- ���̺� ����
SELECT *
FROM TAB;

CREATE TABLE TBL_BOARD                          -- �Խ��� ���̺� ����
( SID           NUMBER          PRIMARY KEY     -- �Խù� ��ȣ �� �ĺ���(�ڵ� ����)
, NAME          VARCHAR2(30)                    -- �Խù� �ۼ���
, CONTENTS      VARCHAR2(2000)                  -- �Խù� ����
, WRITEDAY      DATE         DEFAULT SYSDATE    -- �Խù� �ۼ���(���� ��¥ �ڵ� �Է�)
, COMMENTS      NUMBER       DEFAULT 0          -- �Խù��� ��� ����(�⺻�� 0)
, COUNTS        NUMBER       DEFAULT 0          -- �Խù� ��ȸ��(�⺻�� 0)
);
--==>>Table TBL_BOARD��(��) �����Ǿ����ϴ�.

--�� SID �� �ڵ� ���� ������ ��Ϸ��� ������ ��ü�� �ʿ��ϴ�.
--   �ڵ����� �ԷµǴ� �÷��� ����ڰ� �Է��ؾ� �ϴ� �׸񿡼�
--   ���ܽ�ų �� �ִ�.

-- ������ ����
CREATE SEQUENCE SEQ_BOARD
NOCACHE;
--==>>Sequence SEQ_BOARD��(��) �����Ǿ����ϴ�.

-- ���� ����
ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS';
--==>>Session��(��) ����Ǿ����ϴ�.

-- �Խù� �ۼ�
INSERT INTO TBL_BOARD(SID, NAME, CONTENTS, WRITEDAY, COMMENTS, COUNTS)
VALUES(SEQ_BOARD.NEXTVAL, '������'
, '����Ŭ���� DEFAULT ǥ������ �ǽ����Դϴ�.'
,TO_DATE('2019-04-05 11:01:13', 'YYYY-MM-DD HH24:MI:SS')
,0, 0);
--==>>1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD(SID, NAME, CONTENTS, WRITEDAY, COMMENTS, COUNTS)
VALUES(SEQ_BOARD.NEXTVAL, '�ѽ¿�'
, '��� �׽�Ʈ���Դϴ�',SYSDATE, 0, 0);
--==>1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD(SID, NAME, CONTENTS, WRITEDAY, COMMENTS, COUNTS)
VALUES(SEQ_BOARD.NEXTVAL, '���ȯ'
, '���� �׽�Ʈ���Դϴ�', DEFAULT , DEFAULT, DEFAULT);
--==>1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD(SID, NAME, CONTENTS)
VALUES(SEQ_BOARD.NEXTVAL, '������', '�׽�Ʈ ������');
--==>1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_BOARD;
--==>>
/*
3	������	����Ŭ���� DEFAULT ǥ������ �ǽ����Դϴ�.	2019-04-05 11:01:13	0	0
4	�ѽ¿�	��� �׽�Ʈ���Դϴ�	                    2019-04-05 11:06:53	0	0
5	���ȯ	���� �׽�Ʈ���Դϴ�	                    2019-04-05 11:06:55	0	0
6	������	�׽�Ʈ ������	                        2019-04-05 11:06:57	0	0
*/

--�� DEFAULT ǥ���� Ȯ��(��ȸ)
SELECT *
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME='TBL_BOARD';
--==>>
/*
TBL_BOARD	SID	        NUMBER			22			N	1													NO	NO		0		NO	YES	NONE
TBL_BOARD	NAME	    VARCHAR2		30			Y	2											CHAR_CS	30	NO	NO		30	B	NO	YES	NONE
TBL_BOARD	CONTENTS	VARCHAR2		2000		Y	3											CHAR_CS	2000	NO	NO		2000	B	NO	YES	NONE
TBL_BOARD	WRITEDAY	DATE			7			Y	4	63	"SYSDATE    -- �Խù� �ۼ���(���� ��¥ �ڵ� �Է�)											
TBL_BOARD	COMMENTS	NUMBER			22			Y	5	54	"0          -- �Խù��� ��� ����(�⺻�� 0)										
TBL_BOARD	COUNTS	    NUMBER			22			Y	6	47	"0          -- �Խù� ��ȸ��(�⺻�� 0)
"									
*/

--�� ���̺� ���� ���� DEFAULT ǥ���� �߰� / ����
ALTER TABLE ���̺��
MODIFY �÷��� [�ڷ���] DEFAULT �⺻��;

--�� ������ DEFAULT ǥ���� ����(����)
ALTER TABLE ���̺��
MODIFY �÷��� [�ڷ���] DEFAULT NULL;

























