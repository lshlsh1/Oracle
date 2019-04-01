SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ROUND() �ݿø��� ó�����ִ� �Լ�
SELECT 48.678 "��"
     , ROUND(48.678, 2) "��"     -- �Ҽ��� ���� ��°�ڸ����� ǥ��(��°�ڸ����� �ݿø�)
     , ROUND(48.674, 2) "��"
     , ROUND(48.674, 1) "��"
     , ROUND(48.674, 0) "��"
     , ROUND(48.674) "��"        -- �� ��° �Ķ���� ���� 0�� ��� ���� ����
     , ROUND(48.674, -1) "��"
     , ROUND(48.674, -2) "��"
     , ROUND(48.674, -3) "��"
FROM DUAL;
/*
��          ��          ��          ��          ��          ��          ��          ��          ��
---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------
    48.678      48.68      48.67       48.7         49         49         50          0          0
*/

--�� TRUNC() ������ ó�����ִ� �Լ�
SELECT 48.678 "��"
     , TRUNC(48.678, 2) "��"     -- �Ҽ��� ���� ��°�ڸ����� ǥ��
     , TRUNC(48.674, 2) "��"
     , TRUNC(48.678, 1) "��"
     , TRUNC(48.678, 0) "��"
     , TRUNC(48.678) "��"
     , TRUNC(48.678, -1) "��"
     , TRUNC(48.678, -2) "��"
     , TRUNC(48.678, -3) "��"
FROM DUAL;
--==>> 48.678   48.67   48.67   48.6   48   48   40   0   0

--�� MOD() �������� ��ȯ�ϴ� �Լ�
SELECT MOD(5,2)
FROM DUAL;
--> 5�� 2�� ���� ������ ����� ��ȯ
--==> 1

--�� POWER() ������ ����� ��ȯ�ϴ� �Լ�
SELECT POWER(5, 3)
FROM DUAL;
--==>>125
--> 5�� 3���� ��������� ��ȯ

--�� SQRT() ��Ʈ ������� ��ȯ�ϴ� �Լ�
SELECT SQRT(2)
FROM DUAL;
--==>>1.41421356237309504880168872420969807857
��Ʈ 2�� ���� ����� ��ȯ

--�� LOG() �α� �Լ�
--   (����Ŭ�� ���α׸� �����ϴ� �ݸ�, MSSQL�� ���α�, �ڿ��α� ��� �����Ѵ�
SELECT LOG(10,100), LOG(10,20)
FROM DOUL;

--�� �ﰢ �Լ�
--   ����, �ڽ��� ź��Ʈ ������� ��ȯ�Ѵ�
SELECT SIN(1), COS(1), TAN(1)
FROM DUAL;
--==>>0.8414709848078965066525023216302989996233
--    0.5403023058681397174009366074429766037354
--    1.55740772465490223050697480745836017308

--�� �ﰢ�Լ��� ���Լ�(���� : -1 - 1)
--   �����, ���ڽ���, ��ź��Ʈ ������� ��ȯ�Ѵ�
SELECT ASIN(0.5), ACOS(0.5), ATAN(0.5)
FROM DUAL;
--==>> 0.52359877559829887307710723054658381405
--     1.04719755119659774615421446109316762805
--     0.4636476090008061162142562314612144020295

--�� SIGN()  ����, ��ȣ, Ư¡
--> ���� ������� ����̸� 1, 0�̸� 0, �����̸� -1�� ��ȯ�Ѵ�
SELECT SIGN(5-2), SIGN(5-5), SIGN(5-7)
FROM DUAL;
--==>>1	    0	-1
--==>1(���)	0	-1(����)

--�� ASCII(), CHR() �� ���� �����ϴ� ������ �Լ�
SELECT ASCII('A'), CHR(65)
FROM DUAL;
--==>>65	A
--> ASCII() : �Ű������� �Ѱܹ��� ������ �ƽ�Ű�ڵ� ���� ��ȯ�Ѵ�
--  CHR()   : �Ű������� �Ѱܹ��� ���ڸ� �ƽ�Ű�ڵ� ������ ���ϴ� ���ڸ� ��ȯ�Ѵ�

-----------------------------------------------------------------------

--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ��¥ ������ �⺻ ������ DAY(�ϼ�)�̴�~!!!! CHECK~!!!
SELECT SYSDATE, SYSDATE+1, SYSDATE-2, SYSDATE-29
FROM DUAL;
--==>>2019-03-29 09:28:54  --  ����
--    2019-03-30 09:28:54  --  1�� ��
--    2019-03-27 09:28:54  --  2�� ��
--    2019-02-28 09:28:54  --  29�� ��

--�� �ð� ���� ����
SELECT SYSDATE, SYSDATE+1/24, SYSDATE -2/24
FROM DUAL;
--===>> 2019-03-29 09:30:59	-- ����
--      2019-03-29 10:30:59	-- 1�ð� ��
--      2019-03-29 07:30:59 -- 2�ð� ��

--�� ���� �ð���... ���� �ð� ���� 1�� 2�ð� 3�� 4�� �ĸ� ��ȸ�Ѵ�.

SELECT SYSDATE"����ð�", SYSDATE+1 + 2/24 +3/24/60 + 4/24/60/60"���� �� �ð�"
FROM DUAL;

/*
------------------------------------------------
    ���� �ð�                ���� �� �ð�
------------------------------------------------
2019-03-29 09:35:33	    2019-03-30 11:39:23
------------------------------------------------
*/

--���1
SELECT SYSDATE"���� �ð�"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60))"���� �� �ð�"
FROM DUAL;
--==>>2019-03-29 09:41:13	2019-03-30 11:44:17

--���2
SELECT SYSDATE"����ð�"
     , SYSDATE + ((24*60*60) + (2*60*60) + (3*60) + 4 ) /(24*60*60)"���� �� �ð�"
--                  1��(�ʴ���)   2�ð�      3��    4��
FROM DUAL;
--==>>2019-03-29 09:44:35	2019-03-30 11:47:39


--�� ��¥ - ��¥ = �ϼ�
-- ex) (2019-07-18) - (2019-03-29)
--        ������          ������
SELECT TO_DATE('2019-07-18', 'YYYY-MM-DD') - TO_DATE('2019-03-29','YYYY-MM-DD')
FROM DUAL;
--==>111

--�� ������ Ÿ���� ��ȯ
SELECT TO_DATE('2019-03-29','YYYY-MM-DD')  -- ��¥ �������� ��ȯ
FROM DUAL;

SELECT TO_DATE('2019-02-29','YYYY-MM-DD')
FROM DAUL;
--==>>�����߻�
/*
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
149��, 6������ ���� �߻�
*/
--==>> ������ ��¥�� ��¥ ������

SELECT TO_DATE('2019-13-29','YYYY-MM-DD')
FROM DAUL;
--==>>�����߻�
/*
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
*/
--==>> ������ ���� ��¥ ������

--�� TO_DATE() �Լ��� ���� ���� Ÿ���� ��¥ Ÿ������ ��ȯ�� ������ ��
--   ���������� �ش� ��¥�� ���� ��ȿ�� �˻簡 �̷������~!!!!

--�� ADD_MONTHS() ���� ���� �����ִ� �Լ�
SELECT SYSDATE"1"
     , ADD_MONTHS(SYSDATE, 2)"2"
     , ADD_MONTHS(SYSDATE, 3)"3"
     , ADD_MONTHS(SYSDATE, -2)"4"
     , ADD_MONTHS(SYSDATE, -3)"5"
FROM DUAL;
--==>>
/*
2019-03-29 10:05:34	
2019-05-29 10:05:34	
2019-06-29 10:05:34	
2019-01-29 10:05:34	
2018-12-29 10:05:34
*/
--> �� ���ϰ� ����

--�� ��¥ ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>>Session��(��) ����Ǿ����ϴ�.


--�� MONTHS_BETWEEN()
-- ù ��° ���ڰ����� �� ��° ���ڰ��� �� ���� ���� ��ȯ
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2002-05-31','YYYY-MM-DD'))
FROM DUAL;
--==>>201.949149118876941457586618876941457587
-- 201����...

--> ���� ���� ���̸� ��ȯ�ϴ� �Լ�
--  �� ������� ��ȣ�� ��-���� ��ȯ�Ǿ��� ��쿡��
--     ù ��° ���ڰ��� �ش��ϴ� ��¥����
--     �� ��° ���ڰ��� �ش��ϴ� ��¥�� ���̷������ �ǹ̷� Ȯ���� �� �ִ�.

SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2019-07-18','YYYY-MM-DD'))
FROM DUAL;
--==>> -3.63143145161290322580645161290322580645

--�� NEXT_DAY()
--   ù��° ���ڰ��� ���� ��¥�� ���ƿ��� ���� ���� ���� ��ȯ
SELECT NEXT_DAY(SYSDATE,'��'), NEXT_DAY(SYSDATE, '��')
FROM DUAL;
--==>> 2019-03-30 2019-04-01

--�� �߰� ���� ���� ����
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
--==>>Session��(��) ����Ǿ����ϴ�.

SELECT NEXT_DAY(SYSDATE,'��'), NEXT_DAY(SYSDATE, '��')
FROM DUAL;
--==>>�����߻�
/*
ORA-01846: not a valid day of the week
01846. 00000 -  "not a valid day of the week"
*Cause:    
*Action:
*/

SELECT NEXT_DAY(SYSDATE, 'SAT'), NEXT_DAY(SYSDATE, 'MON')
FROM DUAL;
--==>>2019-03-30	2019-04-01

--�� �߰� ���� ���� ����
ALTER SESSION SET NLS_DATE_LANGUAGE ='KOREAN';
--==>>Session��(��) ����Ǿ����ϴ�.

--�� LAST_DAY()
--   �ش� ��¥�� ���ԵǾ� �ִ� �� ���� ������ ���� ��ȯ�Ѵ�
SELECT LAST_DAY(SYSDATE)
FROM DUAL;
--==>>2019-03-31

SELECT LAST_DAY(TO_DATE('2018-02-01','YYYY-MM-DD'))
FROM DUAL;
--==>>2018-02-28

--�� ���� �η�... �����Դ���... �� ���뿡 ����(?)����.
--   ���� �Ⱓ�� 22������ �Ѵ�.

-- 1. ���� ���ڸ� ���Ѵ�.
SELECT SYSDATE"���糯¥",ADD_MONTHS(SYSDATE,22)"������¥", (ADD_MONTHS(SYSDATE,22)-SYSDATE)*3"����-���糯¥"
FROM DUAL;
--==>> 2021-01-29

-- 2. �Ϸ� ���ڲ��� 3���Ļ縦 �ؾ� �Ѵٰ� �����ϸ�
--    ���԰� �� ���� �Ծ�� ���� �����ٱ�
-- �����Ⱓ * 3
-- -------
-- (�������� - ��������)
-- (�������� - ��������)*3
SELECT (ADD_MONTHS(SYSDATE,22)-SYSDATE)*3"�Ծ���ϴ³���"
FROM DUAL;
--==>> 2016

--�� ���� ��¥ �� �ð����κ���... ������(2019-07-18 18:00:00)����
--   ���� �Ⱓ��... ������ ���� ���·� ��ȸ�� �� �ֵ��� �Ѵ�.
/*
----------------------------------------------------------------------------------------
���� �ð�              |    ������                 |   ��   |   �ð�  |   ��   |   ��   |
----------------------------------------------------------------------------------------
2019-03-29 10:37:36   | 2019-07-18 18:00:00       |   110  |     7   |  26    |   33   |
----------------------------------------------------------------------------------------
*/
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>>Session��(��) ����Ǿ����ϴ�.

SELECT SYSDATE"����ð�", TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')"������"
     , TRUNC(TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE)"��"
     , TRUNC((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE-TRUNC(TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE))*24)"��"
     , TRUNC((((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE-TRUNC(TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE))*24)
     - TRUNC((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE-TRUNC(TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE))*24))*60)"��"
     , TRUNC((((((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE-TRUNC(TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE))*24)
     - TRUNC((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE-TRUNC(TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE))*24))*60)
     - (TRUNC((((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE-TRUNC(TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE))*24)
     - TRUNC((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE-TRUNC(TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE))*24))*60)))*60)"��"
FROM DUAL;

--��¥ ���� ��(��¥Ÿ���� �ƴ϶� ����Ÿ���̶�� �� ����)
TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;

--������ Ǯ��
--��1�� 2�ð� 3�� 4�ʡ��� ���ʡ��� ȯ���ϸ�
SELECT (1��) + (2�ð�) + (3��) + (4��)
FROM DUAL;

SELECT (1*24*60*60) + (2*60*60) + (3*60) + (4)
FROM DUAL;
--==>>93784

-- ��93784���ʸ� �ٽ� ��, �ð�, ��, �ʷ� ȯ���ϸ�

SELECT MOD(93784, 60)
FROM DUAL;
--==>> 4 (��)


SELECT MOD(TRUNC(93784/60), 60)
     , MOD(93784, 60)
FROM DUAL;
--==>> 3 (��) 4 (��)

SELECT MOD(TRUNC(TRUNC(93784/60)/60), 24) -- ���� �о���� �ð�
     , MOD(TRUNC(93784/60), 60) -- �ʸ� �о���� ��
     , MOD(93784, 60)           -- ��
FROM DUAL;
--==>> 2�ð� 3 (��) 4 (��)

SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24) -- ��¥
     , MOD(TRUNC(TRUNC(93784/60)/60), 24) -- ���� �о���� �ð�
     , MOD(TRUNC(93784/60), 60) -- �ʸ� �о���� ��
     , MOD(93784, 60)           -- ��
FROM DUAL;
--==>> 1(��) 2(�ð�) 3 (��) 4 (��)

-- �����ϱ��� ���� �Ⱓ Ȯ��(��¥ ����) �� ���� : �ϼ�
SELECT �������� - ��������
FROM DUAL;

-- ��������
SELECT TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')
FROM DUAL;
--==>>2019-07-18 18:00:00 �� ��¥����

-- �����ϱ��� ���� �Ⱓ Ȯ��(��¥ ����)  �� ��
SELECT TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE
FROM DUAL;
---==>>111.238055555555555555555555555555555556
--> �����ϱ��� ���� �ϼ�

-- �����ϱ��� ���� �Ⱓ Ȯ��(��¥ ����)  �� ��
SELECT �����ϱ��������ϼ� * �Ϸ縦 �����ϴ� ��ü ��
FROM DUAL;

SELECT �����ϱ��������ϼ� * (24*60*60)
FROM DUAL;

SELECT (TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)
FROM DUAL;
--==>>9610808.00000000000000000000000000000003

SELECT TRUNC(TRUNC(TRUNC((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60)/24) -- ��¥
     , MOD(TRUNC(TRUNC((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60), 24) -- ���� �о���� �ð�
     , MOD(TRUNC((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60), 60) -- �ʸ� �о���� ��
     , MOD((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60), 60)           -- ��
FROM DUAL;

SELECT TRUNC(TRUNC(TRUNC((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60)/24)"��"
     , MOD(TRUNC(TRUNC((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60), 24)"�ð�"
     , MOD(TRUNC((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60), 60)"��"
     , TRUNC(MOD((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60), 60))"��"
FROM DUAL;



--�� ����
--   ������ �¾�� ������� �󸶸�ŭ�� �� �ð� �� �ʸ� ��Ҵ���... (��� �ִ���) ��ȸ�Ѵ�.
/*
----------------------------------------------------------------------------------------
���� �ð�              |    �¾ �ð�            |   ��   |   �ð�  |   ��   |   ��   |
----------------------------------------------------------------------------------------
2019-03-29 10:37:36   | 1992-11-20 10:00:00       | XXXXX  |    XX   |  XX    |   XX   |
----------------------------------------------------------------------------------------
*/

SELECT (SYSDATE-TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS'))
FROM DUAL;
--==>>9625.104016203703703703703703703703703704

SELECT (SYSDATE-TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS'))*(24*60*60)
FROM DUAL;
--==>831609531

-- 1��,2�ð�,3��,4��
SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24) -- ��
     , MOD(TRUNC(TRUNC(93784/60)/60),24)--��
     , MOD(TRUNC(93784/60),60) --��
     , MOD(93784, 60) -- ��
FROM DUAL;

SELECT  SYSDATE"���� �ð�" , TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS')"�¾ �ð�" 
     , TRUNC(TRUNC(TRUNC((SYSDATE-TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS'))*(24*60*60)/60)/60)/24)"��" -- ��
     , MOD(TRUNC(TRUNC((SYSDATE-TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS'))*(24*60*60)/60)/60),24)"�ð�"--��
     , MOD(TRUNC((SYSDATE-TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS'))*(24*60*60)/60),60)"��" --��
     , MOD((SYSDATE-TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS'))*(24*60*60), 60)"��" -- ��
FROM DUAL;
/*
���� �ð�               �¾ �ð�              ��       �ð�          ��         ��
------------------- ------------------- ---------- ---------- ---------- ----------
2019-03-29 12:51:36 1992-11-20 10:00:00       9625          2         51         36
*/

SELECT SYSDATE"���� �ð�" , TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS')"�¾ �ð�"
     , TRUNC(TRUNC(TRUNC(TRUNC((SYSDATE-TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS'))*(24*60*60)/60)/60)/24)/365)"��"
     , MOD(TRUNC(TRUNC(TRUNC((SYSDATE-TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS'))*(24*60*60)/60)/60)/24),365)"��" -- ��
     , MOD(TRUNC(TRUNC((SYSDATE-TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS'))*(24*60*60)/60)/60),24)"�ð�"--��
     , MOD(TRUNC((SYSDATE-TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS'))*(24*60*60)/60),60)"��" --��
     , MOD((SYSDATE-TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS'))*(24*60*60), 60)"��" -- ��
FROM DUAL;
/*
���� �ð�               �¾ �ð�             ��         ��       �ð�        ��          ��
------------------- ------------------- ---------- ---------- ---------- ---------- ----------
2019-03-29 12:51:05 1992-11-20 10:00:00         26        135          2         51          5
*/


--��¥ ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>>Session��(��) ����Ǿ����ϴ�.

--�� ��¥ �����͸� ������� �ݿø�, ������ ������ �� �ִ�.
--   ���� �����ʹ� ��¥�����Ͱ� �ƴ� ���ڵ����Ϳ���.


--�� ��¥ �ݿø�
SELECT SYSDATE"1"                   -- 2019-03-29 �� �⺻ ���� ��¥
     , ROUND(SYSDATE, 'YEAR') "2"   -- 2019-01-01 �� �⵵���� ��ȿ�� ������(��ݱ�, �Ϲݱ� ����)
     , ROUND(SYSDATE, 'MONTH') "3"  -- 2019-04-01 �� ������ ��ȿ�� ������(15�� ����)
     , ROUND(SYSDATE, 'DD') "4"     -- 2019-03-30 �� ��¥���� ��ȿ�� ������(���� ����, ���� ����, ���� �ø�)
     , ROUND(SYSDATE, 'DAY') "5"    -- 2019-03-31 �� ��¥���� ��ȿ�� ������(������ ����)
FROM DUAL;
--==>>2019-03-29	2019-01-01	2019-04-01	2019-03-30	2019-03-31

--�� ��¥ ����
SELECT SYSDATE"1"                   -- 2019-03-29 �� �⺻ ���� ��¥
     , TRUNC(SYSDATE, 'YEAR') "2"   -- 2019-01-01 �� �⵵���� ��ȿ�� ������
     , TRUNC(SYSDATE, 'MONTH') "3"  -- 2019-03-01 �� ������ ��ȿ�� ������
     , TRUNC(SYSDATE, 'DD') "4"     -- 2019-03-29 �� ��¥���� ��ȿ�� ������
     , TRUNC(SYSDATE, 'DAY') "5"    -- 2019-03-24 �� ��¥���� ��ȿ�� ������(�׻� �� �Ͽ���)
FROM DUAL;
--==>>2019-03-29	2019-01-01	2019-03-01	2019-03-29	2019-03-24

------------------------------------------------------------------------------------

--���� ��ȯ �Լ� ����--

--TO_CHAR()     : ���ڳ� ��¥ �����͸� ���� Ÿ������ ��ȯ�����ִ� �Լ�
--TO_DATE()     : ���� ������(��¥ ����)�� ��¥ Ÿ������ ��ȯ�����ִ� �Լ�
--TO_NUMBER()   : ���� ������(���� ����)�� ���� Ÿ������ ��ȯ�����ִ� �Լ�

--�� ��¥�� ��ȭ ������ ���� ���� ���
--   ���� �������� ���� ������ �� �ֵ��� �Ѵ�.

ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN'
--==>> Session��(��) ����Ǿ����ϴ�.

ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN'

ALTER SESSION SET NLS_CURRENCY ='\'; --��ȭ����

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>>Session��(��) ����Ǿ����ϴ�.

-->> ��¥ �� ����Ÿ��
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')   -- 2019-03-29
     , TO_CHAR(SYSDATE, 'YYYY')         -- 2019
     , TO_CHAR(SYSDATE, 'YEAR')         -- TWENTY NINETEEN
     , TO_CHAR(SYSDATE, 'MM')           -- 03
     , TO_CHAR(SYSDATE, 'MONTH')        -- 3�� 
     , TO_CHAR(SYSDATE, 'MON')          -- 3�� 
     , TO_CHAR(SYSDATE, 'DD')           -- 29
     , TO_CHAR(SYSDATE, 'DY')           -- ��
     , TO_CHAR(SYSDATE, 'HH24')         -- 14 -- 24�ñ��
     , TO_CHAR(SYSDATE, 'HH')           -- 02
     , TO_CHAR(SYSDATE, 'HH AM')        -- 02 ����
     , TO_CHAR(SYSDATE, 'HH PM')        -- 02 ����
     , TO_CHAR(SYSDATE, 'MI')           -- 20 -- ��
     , TO_CHAR(SYSDATE, 'SS')           -- 08 -- ��
     , TO_CHAR(SYSDATE, 'SSSSS')        -- 51608 -- �����Ϸ絿�� �귯�� ��ü ��
     , TO_CHAR(SYSDATE, 'Q')            -- 1     -- ���� ���ͺб�
FROM DUAL;


SELECT TO_CHAR(4), '4'
FROM DUAL;
--==>>4	    4

SELECT '04', TO_NUMBER('04')
FROM DUAL;
--==>>04	4

-- ���� ��������
-- ���� ��������

SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))
FROM DUAL;
--==>>2019


--�� EXTRACT()

SELECT TO_CHAR(SYSDATE, 'YYYY')     -- 2019 �� ������ �����Ͽ� ���� Ÿ������...
     , TO_CHAR(SYSDATE, 'MM')       -- 03   �� ���� �����Ͽ� ���� Ÿ������
     , TO_CHAR(SYSDATE, 'DD')       -- 29   �� ���� �����Ͽ� ���� Ÿ������
     , EXTRACT(YEAR FROM SYSDATE)   -- 2019 �� ������ �����Ͽ� ���� Ÿ������....
     , EXTRACT(MONTH FROM SYSDATE)  -- 3    �� ���� �����Ͽ� ���� Ÿ������
     , EXTRACT(DAY FROM SYSDATE)    -- 29   �� ���� �����Ͽ� ���� Ÿ������
FROM DUAL;

--> �� �� �� ���� �ٸ� ���� �Ұ���

--�� TO_CHAR() Ȱ�� �� ���� ���� ǥ�� ����� ��ȯ
SELECT 60000                        -- 60000
     , TO_CHAR(60000)               -- 60000
     , TO_CHAR(60000, '999,999')    -- 60,000
     , TO_CHAR(60000, '$99,999')    -- $60,000
     , TO_CHAR(60000, 'L99,999')    --        ��60,000  -- LANGUAGE�� ������� �� ��ȭ
     , LTRIM(TO_CHAR(60000, 'L99,999')) -- ��60,000     -- ���鶧���� �̷������� ���
FROM DUAL;

--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT ='YYYY-MM-DD HH24:MI:SS';
--==>>Session��(��) ����Ǿ����ϴ�.

--�� ���� �ð��� �������� 1�� 2�ð� 3�� 4�� �ĸ� ��ȸ�Ѵ�.
SELECT SYSDATE
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60))
FROM DUAL;
--==>>2019-03-29 14:46:10	2019-03-30 16:49:14

--�� ���� �ð��� �������� 1�� 2���� 3�� 4�ð� 5�� 6���ĸ� ��ȸ�Ѵ�.
--   TO_YMINTERVAL(), TO_DSINTERVAL()
SELECT SYSDATE"���� �ð�"
     , SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06')
FROM DUAL;
--==>>2019-03-29 14:50:27	2020-06-01 18:55:33
-----------------------------------------------------------------------

--�� CASE ����
/*
CASE
WHEN
THEN
ELSE
END
*/

SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2�� �����' END"Ȯ��"
FROM DUAL;
--==>>5+2=7

SELECT CASE 5+2 WHEN 9 THEN '5+2=7' ELSE '5+2�� �����' END"Ȯ��"
FROM DUAL;
--==>>5+2�� �����

SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+2=3'
                WHEN 4 THEN '1+2=4'
                ELSE '����'
                END"��� Ȯ��"
FROM DUAL;
--==>1+1=2

SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+2=3'
                WHEN 4 THEN '1+2=4'
                ELSE '����'
                END"��� Ȯ��"
FROM DUAL;

--�� DECODE() 
--   ���׿�����
SELECT DECODE(5-2,1,'5-2=1',2,'5-2=2',3,'5-2=3','5-2�� ����') "���Ȯ��"
FROM DUAL;
--==>>5-2=3

--�� CASE WHEN THEN ELSE END ���� Ȱ��
SELECT CASE WHEN 5<2 THEN '5<2'
            WHEN 5>2 THEN '5>2'
            ELSE '5��2�� �񱳺Ұ�'
        END"��� Ȯ��"
FROM DUAL;
--==>> 5>2
--> WHEN ���� ù��°�� �´� ���� ���

SELECT CASE WHEN 5<2 OR 3>1 AND 2=2 THEN '��������'
            WHEN 5>2 OR 2=3 THEN '��¸���'
            ELSE '��������'
        END
FROM DUAL;
--==>>
/*
SELECT CASE WHEN F OR T AND T THEN '��������'
            WHEN T OR F THEN '��¸���'
            ELSE '��������'
        END
FROM DUAL;
*/

SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '���Ǹ���'
            WHEN 5<2 AND 2=3 THEN '��������'
            ELSE '���󸸼�'
        END "��� Ȯ��"
FROM DUAL;
--==>>���Ǹ���
/*
SELECT CASE WHEN F AND F OR T AND T THEN '���Ǹ���'
            WHEN T OR T AND T THEN'���Ǹ���'
*/

SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=2 THEN '���Ǹ���'
            WHEN 5<2 AND 2=3 THEN '��������'
            ELSE '���󸸼�'
        END "��� Ȯ��"
FROM DUAL;
--==>>���󸸼�

SELECT *
FROM TBL_SAWON;

--�� ����
--   TBL_SAWON ���̺��� Ȱ���Ͽ� ������ ���� �׸���� ��ȸ�Ѵ�.
--   �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���
--   ����������, �ٹ��ϼ�, �����ϼ�, �޿�, ���ʽ�

-- ��, ���� ���̴� �ѱ����� ������ ���� ������ �����Ѵ�.
-- ���� ������������ �ش������� ���̰� �ѱ� ���̷� 60���� �Ǵ� ��(�⵵)�� 
-- �� ������ �Ի� ��, �Ϸ� ������ �����Ѵ�.
-- �׸��� ���ʽ��� 1000�� �̻� 2000�� �̸� �ٹ��� �����
-- �� ����� ���� �޿� ���� 30% ����, 
-- 2000�� �̻� �ٹ��� ����� �� ����� ���� �޿����� 50% ������ �� �� �ֵ��� ó���Ѵ�.


ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>>Session��(��) ����Ǿ����ϴ�.

SELECT SANO"�����ȣ", SANAME"�����", JUBUN"�ֹι�ȣ"
     , CASE SUBSTR(JUBUN,7,1) WHEN '1' THEN '����' WHEN '2' THEN '����' WHEN '3' THEN '����' WHEN '4' THEN '����' END"����"
     , CASE WHEN  SUBSTR(JUBUN,1,2)>00 AND  SUBSTR(JUBUN,1,2)<10 THEN TO_CHAR(SYSDATE, 'YY')- SUBSTR(JUBUN,1,2)+1
        ELSE TO_CHAR(SYSDATE, 'YY')+100 - SUBSTR(JUBUN,1,2)+1 END"���糪��"
     ,    HIREDATE"�Ի���"
     ,  CASE WHEN  SUBSTR(JUBUN,1,2)>00 AND  SUBSTR(JUBUN,1,2)<10 THEN ADD_MONTHS(HIREDATE, (60-(TO_CHAR(SYSDATE, 'YY')- SUBSTR(JUBUN,1,2)+1) + (2019-EXTRACT(YEAR FROM HIREDATE)))*12)
        ELSE ADD_MONTHS(HIREDATE, (60-(TO_CHAR(SYSDATE, 'YY')+100 - SUBSTR(JUBUN,1,2)+1) + (2019-EXTRACT(YEAR FROM HIREDATE)))*12) END"����������"
     , TRUNC(SYSDATE - HIREDATE)"�ٹ��ϼ�"
     , CASE WHEN  SUBSTR(JUBUN,1,2)>00 AND  SUBSTR(JUBUN,1,2)<10 THEN TRUNC(ADD_MONTHS(HIREDATE, (60-(TO_CHAR(SYSDATE, 'YY')- SUBSTR(JUBUN,1,2)+1) + (2019-EXTRACT(YEAR FROM HIREDATE)))*12)-SYSDATE)
        ELSE TRUNC(ADD_MONTHS(HIREDATE, (60-(TO_CHAR(SYSDATE, 'YY')+100 - SUBSTR(JUBUN,1,2)+1) + (2019-EXTRACT(YEAR FROM HIREDATE)))*12)-SYSDATE) END "�����ϼ�"
     , SAL"�޿�"
     , CASE WHEN TRUNC(SYSDATE - HIREDATE)<1000 THEN 0
            WHEN TRUNC(SYSDATE - HIREDATE)<2000 THEN SAL*0.3
            ELSE SAL*0.5 END"���ʽ�"
FROM TBL_SAWON;

--���糪��
CASE WHEN �ֹ� 00~10 THEN ����� - ����+1
ELSE THEN �����+100-����+1

--����������
CASE WHEN �ֹ� 00~10 THEN �Ի��� + ADD_MONTHS((60-���糪��) + (2019-�Ի��))*12
ELSE THEN �Ի��� + ADD_MONTH((����-���糪��+100)+(2019-�Ի��))*12

(�Ի���~����) + (���糪�� ~ 60��) => ����������

--�ٹ��ϼ�
����-�Ի���

--�����ϼ�
CASE WHEN �ֹ� 00~10 THEN �Ի��� +  (ADD_MONTHS((60-���糪��) + (2019-�Ի��))*12)-����ð�
ELSE THEN �Ի��� +  (ADD_MONTHS((����-���糪��+100) + (2019-�Ի��))*12)-����ð�


--ȫ���
SELECT SANO"�����ȣ",SANAME"�����",JUBUN"�ֹι�ȣ",
        CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '��'
             WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '��'
             ELSE '����ƴ�'
             END "����"
       
        ,CASE WHEN SUBSTR(JUBUN,1,1) = 0 THEN (2019-(TO_NUMBER(SUBSTR(JUBUN,1,2))+2000)+1)
             ELSE (2019-(TO_NUMBER(SUBSTR(JUBUN,1,2))+1900)+1)
             END "���糪��"
       
        , HIREDATE "�Ի���"
       
        ,CASE WHEN SUBSTR(JUBUN,1,1)=0 
              THEN ADD_MONTHS(HIREDATE, 12*(  (60- (2019-(TO_NUMBER(SUBSTR(JUBUN,1,2))+2000)+1)) +  (2019-EXTRACT(YEAR FROM HIREDATE)) ) )
              ELSE ADD_MONTHS(HIREDATE, 12*(  (60- (2019-(TO_NUMBER(SUBSTR(JUBUN,1,2))+1900)+1)) +  (2019-EXTRACT(YEAR FROM HIREDATE)) ) )
              END "����������"
       
        ,TRUNC(SYSDATE - HIREDATE) "�ٹ��ϼ�" 
        
        ,CASE WHEN SUBSTR(JUBUN,1,1)=0 
              THEN TRUNC( ADD_MONTHS(HIREDATE, 12*(  (60- (2019-(TO_NUMBER(SUBSTR(JUBUN,1,2))+2000)+1)) +  (2019-EXTRACT(YEAR FROM HIREDATE)) ) ) - SYSDATE)
              ELSE TRUNC( ADD_MONTHS(HIREDATE, 12*(  (60- (2019-(TO_NUMBER(SUBSTR(JUBUN,1,2))+1900)+1)) +  (2019-EXTRACT(YEAR FROM HIREDATE)) ) ) - SYSDATE)
              END "�����ϼ�"
        
        ,SAL "�޿�"
        
        ,CASE WHEN TRUNC(SYSDATE - HIREDATE) <1000 THEN 0
              WHEN TRUNC(SYSDATE - HIREDATE) <2000 THEN SAL*0.3
              ELSE SAL*0.5
              END "���ʽ�"
FROM TBL_SAWON;

--�� ������ Ǯ��

-- TBL_SAWON ���̺� �����ϴ� �������
-- �Ի���(HIREDATE) �÷����� ��, �ϸ� ��ȸ�ϱ�
SELECT SANAME, HIREDATE, TO_CHAR(HIREDATE, 'MMDD')
FROM TBL_SAWON;
--==>>0103

SELECT SANAME, HIREDATE, TO_CHAR(HIREDATE, 'MM'), TO_CHAR(HIREDATE, 'DD')
FROM TBL_SAWON;
--==>>01	03

SELECT SANAME, HIREDATE, TO_CHAR(HIREDATE, 'MM')||'-'|| TO_CHAR(HIREDATE, 'DD')
FROM TBL_SAWON;
--==>>01-03

SELECT SANAME, HIREDATE, TO_CHAR(HIREDATE, 'MM-DD')
FROM TBL_SAWON;
--==>>01-03

--����
SELECT CASE WHEN �ֹι�ȣ 7��°�ڸ� 1���� 1 �Ǵ� 3 THEN '����'
            WHEN �ֹι�ȣ 7�����ڸ� 1���� 2 �Ǵ� 4 THEN '����'
            ELSE '����Ȯ�κҰ�' �� ELSE ���� ����������
        END
FROM TBL_SAWON;

SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '����'
            WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '����'
            ELSE '����Ȯ�κҰ�'
       END "����"
FROM TBL_SAWON;

--���糪�� = ����⵵ - �¾�⵵ + 1 (1900��� ��/2000�� ��)
SELECT CASE WHEN 1900��� ���̶��
            THEN ����⵵ - (�ֹι�ȣ �� ���ڸ� + 1899)
            WHEN 2000��� ���̶��
            THEN ����⵵ - (�ֹι�ȣ �� ���ڸ� + 1999)
            ELSE 0 �� �� �����͵� ������� ����Ÿ��, ELSE ���� '����Ȯ�κҰ�'�� ������ ����Ÿ�� �� �����߻�
      END"���糪��"
FROM TBL_SAWON;

SELECT CASE WHEN �ֹι�ȣ 7��° �ڸ� 1���� 1 �Ǵ� 2
            THEN ����⵵ - (�ֹι�ȣ �� ���ڸ� + 1899)
            WHEN �ֹι�ȣ 7��° �ڸ� 1���� 3 �Ǵ� 4
            THEN ����⵵ - (�ֹι�ȣ �� ���ڸ� + 1999)
            ELSE 0
      END"���糪��"
FROM TBL_SAWON;

SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1','2')
            THEN ����⵵ - (�ֹι�ȣ �� ���ڸ� + 1899)
            WHEN SUBSTR(JUBUN, 7, 1) IN ('3','4')
            THEN ����⵵ - (�ֹι�ȣ �� ���ڸ� + 1999)
            ELSE 0
      END"���糪��"
FROM TBL_SAWON;

SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
            WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
            ELSE 0
        END"���糪��"
FROM TBL_SAWON;
--==>>TO_NUMBER(TO_CHAR(SYSDATE,'YYYY') 
--==>>EXTRACT(YEAR FROM SYSDATE) ����





















