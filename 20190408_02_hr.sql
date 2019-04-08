SELECT USER
FROM DUAL;
--==>>HR

--○ EMPLOYEES 테이블의 직원들 SALARY를 10% 인상한다.
--   단, 부서명이 'IT'인 경우로 한정한다
--   (결과 확인 후 ROLLBACK)

SELECT *
FROM EMPLOYEES;

UPDATE EMPLOYEES
SET SALARY = SALARY*1.1
WHERE SUBSTR(JOB_ID,1,2)='IT';

--선생님 풀이
SELECT *
FROM DEPARTMENTS;
/*
10	Administration	200	1700
20	Marketing   	201	1800
30	Purchasing	    114	1700
40	Human Resources	203	2400
50	Shipping	    121	1500
60	IT	            103	1400 --------------
70	Public Relations204	2700
80	Sales	        145	2500
90	Executive	    100	1700
100	Finance	        108	1700
110	Accounting	    205	1700
120	Treasury		    1700
130	Corporate Tax		1700
140	Control And Credit	1700
150	Shareholder Services1700
160	Benefits	        1700
170	Manufacturing		1700
180	Construction		1700
190	Contracting		    1700
200	Operations	    	1700
210	IT Support		    1700
220	NOC		            1700
230	IT Helpdesk		    1700
240	Government Sales	1700
250	Retail Sales		1700
260	Recruiting		    1700
270	Payroll		        1700
*/

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES;
--==>>
/*
Steven	King	    24000	90
Neena	Kochhar	    17000	90
Lex	De Haan	        17000	90
Alexander	Hunold	9900	60
Bruce	Ernst	    6600	60
David	Austin	    5280	60
Valli	Pataballa	5280	60
Diana	Lorentz	    4620	60
Nancy	Greenberg	12008	100
Daniel	Faviet	    9000	100
John	Chen	    8200	100
Ismael	Sciarra	    7700	100
Jose Manuel	Urman	7800	100
Luis	Popp	    6900	100
Den	Raphaely	    11000	30
Alexander	Khoo	3100	30
Shelli	Baida	    2900	30
Sigal	Tobias	    2800	30
Guy	Himuro	        2600	30
Karen	Colmenares	2500	30
Matthew	Weiss	    8000	50
Adam	Fripp	    8200	50
Payam	Kaufling	7900	50
Shanta	Vollman	    6500	50
Kevin	Mourgos	    5800	50
Julia	Nayer	    3200	50
Irene	Mikkilineni	2700	50
James	Landry	    2400	50
Steven	Markle	    2200	50
Laura	Bissot	    3300	50
Mozhe	Atkinson	2800	50
James	Marlow	    2500	50
TJ	Olson	        2100	50
Jason	Mallin	    3300	50
Michael	Rogers	    2900	50
Ki	Gee	            2400	50
Hazel	Philtanker	2200	50
Renske	Ladwig	    3600	50
Stephen	Stiles	    3200	50
John	Seo	        2700	50
Joshua	Patel	    2500	50
Trenna	Rajs	    3500	50
Curtis	Davies	    3100	50
Randall	Matos	    2600	50
Peter	Vargas	    2500	50
John	Russell	    14000	80
Karen	Partners	13500	80
Alberto	Errazuriz	12000	80
Gerald	Cambrault	11000	80
Eleni	Zlotkey	    10500	80
Peter	Tucker	    10000	80
David	Bernstein	9500	80
Peter	Hall	    9000	80
Christopher	Olsen	8000	80
Nanette	Cambrault	7500	80
Oliver	Tuvault	    7000	80
Janette	King	    10000	80
Patrick	Sully	    9500	80
Allan	McEwen	    9000	80
Lindsey	Smith	    8000	80
Louise	Doran	    7500	80
Sarath	Sewall	    7000	80
Clara	Vishney	    10500	80
Danielle	Greene	9500	80
Mattea	Marvins	    7200	80
David	Lee	        6800	80
Sundar	Ande	    6400	80
Amit	Banda	    6200	80
Lisa	Ozer	    11500	80
Harrison	Bloom	10000	80
Tayler	Fox	        9600	80
William	Smith	    7400	80
Elizabeth	Bates	7300	80
Sundita	Kumar	    6100	80
Ellen	Abel	    11000	80
Alyssa	Hutton	    8800	80
Jonathon	Taylor	8600	80
Jack	Livingston	8400	80
Kimberely	Grant	7000	
Charles	Johnson	    6200	80
Winston	Taylor	    3200	50
Jean	Fleaur	    3100	50
Martha	Sullivan	2500	50
Girard	Geoni	    2800	50
Nandita	Sarchand	4200	50
Alexis	Bull	    4100	50
Julia	Dellinger	3400	50
Anthony	Cabrio	    3000	50
Kelly	Chung	    3800	50
Jennifer	Dilly	3600	50
Timothy	Gates	    2900	50
Randall	Perkins	    2500	50
Sarah	Bell	    4000	50
Britney	Everett	    3900	50
Samuel	McCain	    3200	50
Vance	Jones	    2800	50
Alana	Walsh	    3100	50
Kevin	Feeney	    3000	50
Donald	OConnell	2600	50
Douglas	Grant	    2600	50
Jennifer	Whalen	4400	10
Michael	Hartstein	13000	20
Pat	Fay	            6000	20
Susan	Mavris	    6500	40
Hermann	Baer	    10000	70
Shelley	Higgins	    12008	110
William	Gietz	    8300	110
*/

UPDATE EMPLOYEES
SET 
WHERE DEPARTMENT_ID=(DEPARTMENTS 테이블에서 IT부서의 부서ID)

UPDATE EMPLOYEES
SET 
WHERE DEPARTMENT_ID=( SELECT DEPARTMENT_ID 
                      FROM DEPARTMENTS
                      WHERE DEPARTMENT_NAME='IT')
                      
UPDATE EMPLOYEES
SET SALARY = SALARY*1.1
WHERE DEPARTMENT_ID=( SELECT DEPARTMENT_ID 
                      FROM DEPARTMENTS
                      WHERE DEPARTMENT_NAME='IT');

ROLLBACK;
--==>>롤백 완료.

--○ EMPLOYEES 테이블에서 JOB_TITLE이 『Sales Manager』인 사원들의
--   SALARY를 해당 직무(직종)의 최고 급여(MAX_SALARY)로 수정한다.
--   단, 입사일일 2006년 이전(해당 년도 제외) 입사자에 한하여
--   적용할 수 있도록 처리한다
--   (결과 확인 후 ROLLBACK)
SELECT *
FROM JOBS;

SELECT *
FROM EMPLOYEES;

SELECT *
FROM EMPLOYEES
WHERE JOB_ID = 'SA_MAN' AND HIRE_DATE<TO_DATE('2006-01-01','YYYY-MM-DD');

SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE>=TO_DATE('2006-01-01','YYYY-MM-DD');


UPDATE EMPLOYEES
SET SALARY = ( SELECT MAX_SALARY 
               FROM JOBS 
               WHERE JOB_TITLE='Sales Manager')
WHERE JOB_ID = ( SELECT JOB_ID
                 FROM JOBS
                 WHERE JOB_TITLE ='Sales Manager') 
  AND HIRE_DATE<TO_DATE('2006-01-01','YYYY-MM-DD');

--○ 쌤 풀이
UPDATE EMPLOYEES
SET SALARY = (Sales Manager의 MAX_SALARY)
WHERE JOB_ID=(Sales Manager의 JOB_ID)
      TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) <= 2005;
      
-- (Sales Manager 의 MAX_SALARY)
SELECT MAX_SALARY
FROM JOBS
WHERE JOB_TITLE='Sales Manager';
--==>>20080

-- (Sales Manager 의 JOB_ID)
SELECT JOB_ID
FROM JOBS
WHERE JOB_TITLE='Sales Manager';
--==>>SA_MAN

UPDATE EMPLOYEES
SET SALARY = ( SELECT MAX_SALARY
                FROM JOBS
                WHERE JOB_TITLE='Sales Manager')
WHERE JOB_ID=( SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE='Sales Manager')
  AND TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) <= 2005;
--==>>3개 행 이(가) 업데이트되었습니다.

ROLLBACK;

--○ EMPLOYEES 테이블에서 SLALARY를
--   각 부서의 이름별로 다른 인상률을 적용하여 수정할 수 있도록 한다.
--   Finance → 10%
--   Executive → 15%
--   Accounting → 20%
--   (결과 확인 후 ROLLBACK)

SELECT *
FROM JOBS;

SELECT *
FROM EMPLOYEES;

SELECT *
FROM DEPARTMENTS;

SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Finance';

SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Executive';

SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Accounting';


UPDATE EMPLOYEES
SET SALARY = SALARY*1.1
WHERE DEPARTMENT_ID = ( SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'Finance');

-- 홍비 방법

UPDATE EMPLOYEES
SET SALARY = 
    CASE 
    WHEN DEPARTMENT_ID = ( SELECT DEPARTMENT_ID
                           FROM DEPARTMENTS
                           WHERE DEPARTMENT_NAME = 'Finance')
    THEN SALARY*1.1
    WHEN DEPARTMENT_ID = ( SELECT DEPARTMENT_ID
                           FROM DEPARTMENTS
                           WHERE DEPARTMENT_NAME = 'Executive')
    THEN SALARY*1.15
    WHEN DEPARTMENT_ID = ( SELECT DEPARTMENT_ID
                           FROM DEPARTMENTS
                           WHERE DEPARTMENT_NAME = 'Accounting')
    THEN SALARY*1.2
    ELSE SALARY*1
    END;
--==>>107개 행 이(가) 업데이트되었습니다.

-- 기승 방법
UPDATE EMPLOYEES
SET SALARY = SALARY * (SELECT DECODE(DEPARTMENT_NAME, 'Finance', 1.1, 'Executive', 1.15, 'Accounting', 1.2, 1)
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID)
WHERE DEPARTMENT_ID IN ( SELECT DEPARTMENT_ID
                         FROM DEPARTMENTS
                         WHERE DEPARTMENT_NAME IN ('Finance','Executive','Accounting') );
--==>>11개 행 이(가) 업데이트되었습니다.

-- 선생님 방법1
UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN ('Finance'의 부서 ID)
                                THEN SALARY*1.1
                                WHEN ('Executive'의 부서 ID)
                                THEN SALARY*1.15
                                WHEN ('Accounting'의 부서 ID)
                                THEN SALARY*1.2
                                ELSE SALARY
             END;

--'Finance'의 부서 ID
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Finance';
--'Executive'의 부서 ID
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Executive';
--'Accounting'의 부서 ID
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Accounting';

UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME = 'Finance')
                                THEN SALARY*1.1
                                WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME = 'Executive')
                                THEN SALARY*1.15
                                WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME = 'Accounting')
                                THEN SALARY*1.2
                                ELSE SALARY
             END;
--==>>107개 행 이(가) 업데이트되었습니다.
-- 실행되긴하지만 너무 많은 낭비가됩니다
-- 범위를 한정해봅시다

WHERE DEPARTMENT_ID IN ('Finance','Executive','Accounting');

SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME IN ('Finance','Executive','Accounting');
↓
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance','Executive','Accounting'));

--<완성된 식>
UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME = 'Finance')
                                THEN SALARY*1.1
                                WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME = 'Executive')
                                THEN SALARY*1.15
                                WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME = 'Accounting')
                                THEN SALARY*1.2
                                ELSE SALARY
             END
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance','Executive','Accounting'));
--==>>11개 행 이(가) 업데이트되었습니다.

-------------------------------------------------------------------------------------------

--■■■ DELETE ■■■--

--1. 테이블에서 지정된 행(레코드)을 삭제하는 데 사용하는 구문

--2. 형식 및 구조
-- DELETE [FROM] 테이블명
-- [WHERE 조건절];
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID=198;

DELETE
FROM EMPLOYEES
WHERE EMPLOYEE_ID=198;
--==>1 행 이(가) 삭제되었습니다.

ROLLBACK;
--==>>롤백 완료.


--○ EMPLOYEES 테이블에서 직원들의 정보를 삭제한다
--   단, 부서명이 'IT'인 경우로 한정한다.
SELECT *
FROM DEPARTMENTS;

SELECT*
FROM EMPLOYEES;

--※ 실제로는 EMPLOYEES 테이블의 데이터가(삭제하고자 하는 대상)
--   다른 테이블 (혹은 자기 자신테이블)에 의해 참조당하는 경우
--   삭제되지 않을 수 있다는 사실을 염두해야 하며...
--   그에 대한 이유도 알아야 한다.

SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME='IT';

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID
                     FROM DEPARTMENTS
                     WHERE DEPARTMENT_NAME='IT');
DELETE
FROM EMPLOYEES
WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID
                     FROM DEPARTMENTS
                     WHERE DEPARTMENT_NAME='IT');
--==>>에러발생
/*
ORA-02292: integrity constraint (HR.DEPT_MGR_FK) violated - child record found
*/

--■■■ 뷰(VIEW) ■■■--

--1. 뷰(VIEW)란 이미 특정한 데이터베이스 내에 존재하는
--   하나 이상의 테이블에서 사용자가 얻기 원하는 데이터들만 모아서
--   정확하고 편하게 가져오기 위하여 사전에 원하는 컬럼들만 모아서
--   만들어놓은 가상의 테이블로 편의성 및 보안에 목적이 있다.

--   가상의 테이블이란 뷰가 실제로 존재하는 테이블(객체)이 아니라
--   하나 이상의 테이블에서 파생된 또 다른 정보를 볼 수 있는 방법이며
--   그 정보를 추출해내는 SQL 문장이라고 볼 수 있다

--2. 형식 및 구조
--CREATE [OR REPLACE] VIEW 뷰이름
--[(ALIAS[, ALIAS, ...])]
--AS
--서브쿼리(SUBQUERY)
--[WITH CHECK OPTION]
--[WITH READ ONLY];

--○ 뷰(VIEW) 생성
CREATE OR REPLACE VIEW VIEW_EMPLOYEES
AS
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+)
  AND C.REGION_ID = R.REGION_ID(+);
--==>>View VIEW_EMPLOYEES이(가) 생성되었습니다.

SELECT *
FROM EMPLOYEES;

--○ 뷰 조회
SELECT*
FROM VIEW_EMPLOYEES;

--○ 뷰(VIEW) 구조 확인
DESC VIEW_EMPLOYEES;
--==>>
/*
이름              널?       유형           
--------------- -------- ------------ 
FIRST_NAME               VARCHAR2(20) 
LAST_NAME       NOT NULL VARCHAR2(25) 
DEPARTMENT_NAME          VARCHAR2(30) 
CITY                     VARCHAR2(30) 
COUNTRY_NAME             VARCHAR2(40) 
REGION_NAME              VARCHAR2(25) 
*/

--○ 뷰(VIEW) 소스 확인 -- CHECK~!!!
SELECT VIEW_NAME, TEXT              -- TEXT
FROM USER_VIEWS                     -- USER_VIEWS
WHERE VIEW_NAME='VIEW_EMPLOYEES';
/*
"SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+)
  AND C.REGION_ID = R.REGION_ID(+)"
*/











