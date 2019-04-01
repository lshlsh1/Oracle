SELECT USER
FROM DUAL;
--==>> SCOTT

--○ ROUND() 반올림을 처리해주는 함수
SELECT 48.678 "①"
     , ROUND(48.678, 2) "②"     -- 소수점 이하 둘째자리까지 표현(셋째자리에서 반올림)
     , ROUND(48.674, 2) "③"
     , ROUND(48.674, 1) "④"
     , ROUND(48.674, 0) "⑤"
     , ROUND(48.674) "⑥"        -- 두 번째 파라미터 값이 0일 경우 생략 가능
     , ROUND(48.674, -1) "⑦"
     , ROUND(48.674, -2) "⑧"
     , ROUND(48.674, -3) "⑨"
FROM DUAL;
/*
①          ②          ③          ④          ⑤          ⑥          ⑦          ⑧          ⑨
---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------
    48.678      48.68      48.67       48.7         49         49         50          0          0
*/

--○ TRUNC() 절삭을 처리해주는 함수
SELECT 48.678 "①"
     , TRUNC(48.678, 2) "②"     -- 소수점 이하 둘째자리까지 표현
     , TRUNC(48.674, 2) "③"
     , TRUNC(48.678, 1) "④"
     , TRUNC(48.678, 0) "⑤"
     , TRUNC(48.678) "⑥"
     , TRUNC(48.678, -1) "⑦"
     , TRUNC(48.678, -2) "⑧"
     , TRUNC(48.678, -3) "⑨"
FROM DUAL;
--==>> 48.678   48.67   48.67   48.6   48   48   40   0   0

--○ MOD() 나머지를 반환하는 함수
SELECT MOD(5,2)
FROM DUAL;
--> 5를 2로 나눈 나머지 결과값 반환
--==> 1

--○ POWER() 제곱의 결과를 반환하는 함수
SELECT POWER(5, 3)
FROM DUAL;
--==>>125
--> 5의 3승을 결과값으로 반환

--○ SQRT() 루트 결과값을 반환하는 함수
SELECT SQRT(2)
FROM DUAL;
--==>>1.41421356237309504880168872420969807857
루트 2에 대한 결과값 반환

--○ LOG() 로그 함수
--   (오라클은 상용로그만 지원하는 반면, MSSQL은 상용로그, 자연로그 모두 지원한다
SELECT LOG(10,100), LOG(10,20)
FROM DOUL;

--○ 삼각 함수
--   싸인, 코싸인 탄젠트 결과값을 반환한다
SELECT SIN(1), COS(1), TAN(1)
FROM DUAL;
--==>>0.8414709848078965066525023216302989996233
--    0.5403023058681397174009366074429766037354
--    1.55740772465490223050697480745836017308

--○ 삼각함수의 역함수(범위 : -1 - 1)
--   어싸인, 어코싸인, 어탄젠트 결과값을 반환한다
SELECT ASIN(0.5), ACOS(0.5), ATAN(0.5)
FROM DUAL;
--==>> 0.52359877559829887307710723054658381405
--     1.04719755119659774615421446109316762805
--     0.4636476090008061162142562314612144020295

--○ SIGN()  서명, 부호, 특징
--> 연산 결과값이 양수이면 1, 0이면 0, 음수이면 -1을 반환한다
SELECT SIGN(5-2), SIGN(5-5), SIGN(5-7)
FROM DUAL;
--==>>1	    0	-1
--==>1(양수)	0	-1(음수)

--○ ASCII(), CHR() → 서로 상응하는 개념의 함수
SELECT ASCII('A'), CHR(65)
FROM DUAL;
--==>>65	A
--> ASCII() : 매개변수로 넘겨받은 문자의 아스키코드 값을 반환한다
--  CHR()   : 매개변수로 넘겨받은 숫자를 아스키코드 값으로 취하는 문자를 반환한다

-----------------------------------------------------------------------

--※ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

--○ 날짜 연산의 기본 단위는 DAY(일수)이다~!!!! CHECK~!!!
SELECT SYSDATE, SYSDATE+1, SYSDATE-2, SYSDATE-29
FROM DUAL;
--==>>2019-03-29 09:28:54  --  현재
--    2019-03-30 09:28:54  --  1일 후
--    2019-03-27 09:28:54  --  2일 전
--    2019-02-28 09:28:54  --  29일 전

--○ 시간 단위 연산
SELECT SYSDATE, SYSDATE+1/24, SYSDATE -2/24
FROM DUAL;
--===>> 2019-03-29 09:30:59	-- 현재
--      2019-03-29 10:30:59	-- 1시간 후
--      2019-03-29 07:30:59 -- 2시간 전

--○ 현재 시간과... 현재 시간 기준 1일 2시간 3분 4초 후를 조회한다.

SELECT SYSDATE"현재시간", SYSDATE+1 + 2/24 +3/24/60 + 4/24/60/60"연산 후 시간"
FROM DUAL;

/*
------------------------------------------------
    현재 시간                연산 후 시간
------------------------------------------------
2019-03-29 09:35:33	    2019-03-30 11:39:23
------------------------------------------------
*/

--방법1
SELECT SYSDATE"현재 시간"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60))"연산 후 시간"
FROM DUAL;
--==>>2019-03-29 09:41:13	2019-03-30 11:44:17

--방법2
SELECT SYSDATE"현재시간"
     , SYSDATE + ((24*60*60) + (2*60*60) + (3*60) + 4 ) /(24*60*60)"연산 후 시간"
--                  1일(초단위)   2시간      3분    4초
FROM DUAL;
--==>>2019-03-29 09:44:35	2019-03-30 11:47:39


--○ 날짜 - 날짜 = 일수
-- ex) (2019-07-18) - (2019-03-29)
--        수료일          현재일
SELECT TO_DATE('2019-07-18', 'YYYY-MM-DD') - TO_DATE('2019-03-29','YYYY-MM-DD')
FROM DUAL;
--==>111

--○ 데이터 타입의 변환
SELECT TO_DATE('2019-03-29','YYYY-MM-DD')  -- 날짜 형식으로 변환
FROM DUAL;

SELECT TO_DATE('2019-02-29','YYYY-MM-DD')
FROM DAUL;
--==>>에러발생
/*
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
149행, 6열에서 오류 발생
*/
--==>> 지정한 날짜의 날짜 부적합

SELECT TO_DATE('2019-13-29','YYYY-MM-DD')
FROM DAUL;
--==>>에러발생
/*
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
*/
--==>> 지정한 월의 날짜 부적합

--※ TO_DATE() 함수를 통해 문자 타입을 날짜 타입으로 변환을 진행할 때
--   내부적으로 해당 날짜에 대한 유효성 검사가 이루어진다~!!!!

--○ ADD_MONTHS() 개월 수를 더해주는 함수
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
--> 월 더하고 빼기

--※ 날짜 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>>Session이(가) 변경되었습니다.


--○ MONTHS_BETWEEN()
-- 첫 번째 인자값에서 두 번째 인자값을 뺀 개월 수를 반환
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2002-05-31','YYYY-MM-DD'))
FROM DUAL;
--==>>201.949149118876941457586618876941457587
-- 201개월...

--> 개월 수의 차이를 반환하는 함수
--  ※ 결과값의 부호가 『-』로 반환되었을 경우에는
--     첫 번째 인자값에 해당하는 날짜보다
--     두 번째 인자값에 해당하는 날짜가 『미래』라는 의미로 확인할 수 있다.

SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2019-07-18','YYYY-MM-DD'))
FROM DUAL;
--==>> -3.63143145161290322580645161290322580645

--○ NEXT_DAY()
--   첫번째 인자값을 기준 날짜로 돌아오는 가장 빠른 요일 반환
SELECT NEXT_DAY(SYSDATE,'토'), NEXT_DAY(SYSDATE, '월')
FROM DUAL;
--==>> 2019-03-30 2019-04-01

--※ 추가 세션 설정 변경
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
--==>>Session이(가) 변경되었습니다.

SELECT NEXT_DAY(SYSDATE,'토'), NEXT_DAY(SYSDATE, '월')
FROM DUAL;
--==>>에러발생
/*
ORA-01846: not a valid day of the week
01846. 00000 -  "not a valid day of the week"
*Cause:    
*Action:
*/

SELECT NEXT_DAY(SYSDATE, 'SAT'), NEXT_DAY(SYSDATE, 'MON')
FROM DUAL;
--==>>2019-03-30	2019-04-01

--○ 추가 세션 설정 변경
ALTER SESSION SET NLS_DATE_LANGUAGE ='KOREAN';
--==>>Session이(가) 변경되었습니다.

--○ LAST_DAY()
--   해당 날짜가 포함되어 있는 그 달의 마지막 날을 반환한다
SELECT LAST_DAY(SYSDATE)
FROM DUAL;
--==>>2019-03-31

SELECT LAST_DAY(TO_DATE('2018-02-01','YYYY-MM-DD'))
FROM DUAL;
--==>>2018-02-28

--○ 오늘 부로... 김정규님이... 또 군대에 끌려(?)간다.
--   복무 기간은 22개월로 한다.

-- 1. 전역 일자를 구한다.
SELECT SYSDATE"현재날짜",ADD_MONTHS(SYSDATE,22)"전역날짜", (ADD_MONTHS(SYSDATE,22)-SYSDATE)*3"전역-현재날짜"
FROM DUAL;
--==>> 2021-01-29

-- 2. 하루 꼬박꼬박 3끼식사를 해야 한다고 가정하면
--    정규가 몇 끼를 먹어야 집에 보내줄까
-- 복무기간 * 3
-- -------
-- (전역일자 - 현재일자)
-- (전역일자 - 현재일자)*3
SELECT (ADD_MONTHS(SYSDATE,22)-SYSDATE)*3"먹어야하는끼니"
FROM DUAL;
--==>> 2016

--○ 현재 날짜 및 시각으로부터... 수요일(2019-07-18 18:00:00)까지
--   남은 기간을... 다음과 같은 형태로 조회할 수 있도록 한다.
/*
----------------------------------------------------------------------------------------
현재 시각              |    수료일                 |   일   |   시간  |   분   |   초   |
----------------------------------------------------------------------------------------
2019-03-29 10:37:36   | 2019-07-18 18:00:00       |   110  |     7   |  26    |   33   |
----------------------------------------------------------------------------------------
*/
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>>Session이(가) 변경되었습니다.

SELECT SYSDATE"현재시각", TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')"수료일"
     , TRUNC(TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE)"일"
     , TRUNC((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE-TRUNC(TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE))*24)"시"
     , TRUNC((((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE-TRUNC(TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE))*24)
     - TRUNC((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE-TRUNC(TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE))*24))*60)"분"
     , TRUNC((((((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE-TRUNC(TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE))*24)
     - TRUNC((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE-TRUNC(TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE))*24))*60)
     - (TRUNC((((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE-TRUNC(TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE))*24)
     - TRUNC((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE-TRUNC(TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')-SYSDATE))*24))*60)))*60)"초"
FROM DUAL;

--날짜 포멧 팁(날짜타입이 아니라 문자타입이라는 거 주의)
TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;

--선생님 풀이
--『1일 2시간 3분 4초』를 『초』로 환산하면
SELECT (1일) + (2시간) + (3분) + (4초)
FROM DUAL;

SELECT (1*24*60*60) + (2*60*60) + (3*60) + (4)
FROM DUAL;
--==>>93784

-- 『93784』초를 다시 일, 시간, 분, 초로 환산하면

SELECT MOD(93784, 60)
FROM DUAL;
--==>> 4 (초)


SELECT MOD(TRUNC(93784/60), 60)
     , MOD(93784, 60)
FROM DUAL;
--==>> 3 (분) 4 (초)

SELECT MOD(TRUNC(TRUNC(93784/60)/60), 24) -- 분을 털어버린 시간
     , MOD(TRUNC(93784/60), 60) -- 초를 털어버린 분
     , MOD(93784, 60)           -- 초
FROM DUAL;
--==>> 2시간 3 (분) 4 (초)

SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24) -- 날짜
     , MOD(TRUNC(TRUNC(93784/60)/60), 24) -- 분을 털어버린 시간
     , MOD(TRUNC(93784/60), 60) -- 초를 털어버린 분
     , MOD(93784, 60)           -- 초
FROM DUAL;
--==>> 1(일) 2(시간) 3 (분) 4 (초)

-- 수료일까지 남은 기간 확인(날짜 기준) → 단위 : 일수
SELECT 수료일자 - 현재일자
FROM DUAL;

-- 수료일자
SELECT TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')
FROM DUAL;
--==>>2019-07-18 18:00:00 → 날짜형식

-- 수료일까지 남은 기간 확인(날짜 기준)  → 일
SELECT TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE
FROM DUAL;
---==>>111.238055555555555555555555555555555556
--> 수료일까지 남은 일수

-- 수료일까지 남은 기간 확인(날짜 기준)  → 초
SELECT 수료일까지남은일수 * 하루를 구성하는 전체 초
FROM DUAL;

SELECT 수료일까지남은일수 * (24*60*60)
FROM DUAL;

SELECT (TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)
FROM DUAL;
--==>>9610808.00000000000000000000000000000003

SELECT TRUNC(TRUNC(TRUNC((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60)/24) -- 날짜
     , MOD(TRUNC(TRUNC((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60), 24) -- 분을 털어버린 시간
     , MOD(TRUNC((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60), 60) -- 초를 털어버린 분
     , MOD((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60), 60)           -- 초
FROM DUAL;

SELECT TRUNC(TRUNC(TRUNC((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60)/24)"일"
     , MOD(TRUNC(TRUNC((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60), 24)"시간"
     , MOD(TRUNC((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60), 60)"분"
     , TRUNC(MOD((TO_DATE('2019-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60), 60))"초"
FROM DUAL;



--○ 문제
--   본인이 태어나서 현재까지 얼마만큼의 일 시간 분 초를 살았는지... (살고 있는지) 조회한다.
/*
----------------------------------------------------------------------------------------
현재 시각              |    태어난 시각            |   일   |   시간  |   분   |   초   |
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

-- 1일,2시간,3분,4초
SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24) -- 날
     , MOD(TRUNC(TRUNC(93784/60)/60),24)--시
     , MOD(TRUNC(93784/60),60) --분
     , MOD(93784, 60) -- 초
FROM DUAL;

SELECT  SYSDATE"현재 시각" , TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS')"태어난 시각" 
     , TRUNC(TRUNC(TRUNC((SYSDATE-TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS'))*(24*60*60)/60)/60)/24)"일" -- 날
     , MOD(TRUNC(TRUNC((SYSDATE-TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS'))*(24*60*60)/60)/60),24)"시간"--시
     , MOD(TRUNC((SYSDATE-TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS'))*(24*60*60)/60),60)"분" --분
     , MOD((SYSDATE-TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS'))*(24*60*60), 60)"초" -- 초
FROM DUAL;
/*
현재 시각               태어난 시각              일       시간          분         초
------------------- ------------------- ---------- ---------- ---------- ----------
2019-03-29 12:51:36 1992-11-20 10:00:00       9625          2         51         36
*/

SELECT SYSDATE"현재 시각" , TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS')"태어난 시각"
     , TRUNC(TRUNC(TRUNC(TRUNC((SYSDATE-TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS'))*(24*60*60)/60)/60)/24)/365)"년"
     , MOD(TRUNC(TRUNC(TRUNC((SYSDATE-TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS'))*(24*60*60)/60)/60)/24),365)"일" -- 날
     , MOD(TRUNC(TRUNC((SYSDATE-TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS'))*(24*60*60)/60)/60),24)"시간"--시
     , MOD(TRUNC((SYSDATE-TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS'))*(24*60*60)/60),60)"분" --분
     , MOD((SYSDATE-TO_DATE('1992-11-20 10:00:00','YYYY-MM-DD HH24:MI:SS'))*(24*60*60), 60)"초" -- 초
FROM DUAL;
/*
현재 시각               태어난 시각             년         일       시간        분          초
------------------- ------------------- ---------- ---------- ---------- ---------- ----------
2019-03-29 12:51:05 1992-11-20 10:00:00         26        135          2         51          5
*/


--날짜 형식 세션 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>>Session이(가) 변경되었습니다.

--※ 날짜 데이터를 대상으로 반올림, 절삭을 수행할 수 있다.
--   위의 데이터는 날짜데이터가 아닌 숫자데이터였다.


--○ 날짜 반올림
SELECT SYSDATE"1"                   -- 2019-03-29 → 기본 현재 날짜
     , ROUND(SYSDATE, 'YEAR') "2"   -- 2019-01-01 → 년도까지 유효한 데이터(상반기, 하반기 기준)
     , ROUND(SYSDATE, 'MONTH') "3"  -- 2019-04-01 → 월까지 유효한 데이터(15일 기준)
     , ROUND(SYSDATE, 'DD') "4"     -- 2019-03-30 → 날짜까지 유효한 데이터(정오 기준, 오전 내림, 오후 올림)
     , ROUND(SYSDATE, 'DAY') "5"    -- 2019-03-31 → 날짜까지 유효한 데이터(수요일 기준)
FROM DUAL;
--==>>2019-03-29	2019-01-01	2019-04-01	2019-03-30	2019-03-31

--○ 날짜 절삭
SELECT SYSDATE"1"                   -- 2019-03-29 → 기본 현재 날짜
     , TRUNC(SYSDATE, 'YEAR') "2"   -- 2019-01-01 → 년도까지 유효한 데이터
     , TRUNC(SYSDATE, 'MONTH') "3"  -- 2019-03-01 → 월까지 유효한 데이터
     , TRUNC(SYSDATE, 'DD') "4"     -- 2019-03-29 → 날짜까지 유효한 데이터
     , TRUNC(SYSDATE, 'DAY') "5"    -- 2019-03-24 → 날짜까지 유효한 데이터(항상 전 일요일)
FROM DUAL;
--==>>2019-03-29	2019-01-01	2019-03-01	2019-03-29	2019-03-24

------------------------------------------------------------------------------------

--■■■ 변환 함수 ■■■--

--TO_CHAR()     : 숫자나 날짜 데이터를 문자 타입으로 변환시켜주는 함수
--TO_DATE()     : 문자 데이터(날짜 형식)를 날짜 타입으로 변환시켜주는 함수
--TO_NUMBER()   : 문자 데이터(숫자 형식)를 숫자 타입으로 변환시켜주는 함수

--※ 날짜나 통화 형식이 맞지 않을 경우
--   세션 설정값을 통해 설정할 수 있도록 한다.

ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN'
--==>> Session이(가) 변경되었습니다.

ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN'

ALTER SESSION SET NLS_CURRENCY ='\'; --원화설정

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>>Session이(가) 변경되었습니다.

-->> 날짜 → 문자타입
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')   -- 2019-03-29
     , TO_CHAR(SYSDATE, 'YYYY')         -- 2019
     , TO_CHAR(SYSDATE, 'YEAR')         -- TWENTY NINETEEN
     , TO_CHAR(SYSDATE, 'MM')           -- 03
     , TO_CHAR(SYSDATE, 'MONTH')        -- 3월 
     , TO_CHAR(SYSDATE, 'MON')          -- 3월 
     , TO_CHAR(SYSDATE, 'DD')           -- 29
     , TO_CHAR(SYSDATE, 'DY')           -- 금
     , TO_CHAR(SYSDATE, 'HH24')         -- 14 -- 24시기반
     , TO_CHAR(SYSDATE, 'HH')           -- 02
     , TO_CHAR(SYSDATE, 'HH AM')        -- 02 오후
     , TO_CHAR(SYSDATE, 'HH PM')        -- 02 오후
     , TO_CHAR(SYSDATE, 'MI')           -- 20 -- 분
     , TO_CHAR(SYSDATE, 'SS')           -- 08 -- 초
     , TO_CHAR(SYSDATE, 'SSSSS')        -- 51608 -- 오늘하루동안 흘러온 전체 초
     , TO_CHAR(SYSDATE, 'Q')            -- 1     -- 올해 쿼터분기
FROM DUAL;


SELECT TO_CHAR(4), '4'
FROM DUAL;
--==>>4	    4

SELECT '04', TO_NUMBER('04')
FROM DUAL;
--==>>04	4

-- 문자 좌측정렬
-- 숫자 우측정렬

SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))
FROM DUAL;
--==>>2019


--○ EXTRACT()

SELECT TO_CHAR(SYSDATE, 'YYYY')     -- 2019 → 연도를 추출하여 문자 타입으로...
     , TO_CHAR(SYSDATE, 'MM')       -- 03   → 월을 추출하여 문자 타입으로
     , TO_CHAR(SYSDATE, 'DD')       -- 29   → 일을 추출하여 문자 타입으로
     , EXTRACT(YEAR FROM SYSDATE)   -- 2019 → 연도를 추출하여 숫자 타입으로....
     , EXTRACT(MONTH FROM SYSDATE)  -- 3    → 월을 추출하여 숫자 타입으로
     , EXTRACT(DAY FROM SYSDATE)    -- 29   → 일을 추출하여 숫자 타입으로
FROM DUAL;

--> 연 월 일 이하 다른 것은 불가능

--○ TO_CHAR() 활용 → 형식 맞춤 표기 결과값 반환
SELECT 60000                        -- 60000
     , TO_CHAR(60000)               -- 60000
     , TO_CHAR(60000, '999,999')    -- 60,000
     , TO_CHAR(60000, '$99,999')    -- $60,000
     , TO_CHAR(60000, 'L99,999')    --        ￦60,000  -- LANGUAGE를 기반으로 한 통화
     , LTRIM(TO_CHAR(60000, 'L99,999')) -- ￦60,000     -- 공백때문에 이런식으로 사용
FROM DUAL;

--○ 날짜 세션 설정 정보 변경
ALTER SESSION SET NLS_DATE_FORMAT ='YYYY-MM-DD HH24:MI:SS';
--==>>Session이(가) 변경되었습니다.

--○ 현재 시간을 기준으로 1일 2시간 3분 4초 후를 조회한다.
SELECT SYSDATE
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60))
FROM DUAL;
--==>>2019-03-29 14:46:10	2019-03-30 16:49:14

--○ 현재 시간을 기준으로 1년 2개월 3일 4시간 5분 6초후를 조회한다.
--   TO_YMINTERVAL(), TO_DSINTERVAL()
SELECT SYSDATE"현재 시간"
     , SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06')
FROM DUAL;
--==>>2019-03-29 14:50:27	2020-06-01 18:55:33
-----------------------------------------------------------------------

--○ CASE 구문
/*
CASE
WHEN
THEN
ELSE
END
*/

SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2는 몰라요' END"확인"
FROM DUAL;
--==>>5+2=7

SELECT CASE 5+2 WHEN 9 THEN '5+2=7' ELSE '5+2는 몰라요' END"확인"
FROM DUAL;
--==>>5+2는 몰라요

SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+2=3'
                WHEN 4 THEN '1+2=4'
                ELSE '몰라'
                END"결과 확인"
FROM DUAL;
--==>1+1=2

SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+2=3'
                WHEN 4 THEN '1+2=4'
                ELSE '몰라'
                END"결과 확인"
FROM DUAL;

--○ DECODE() 
--   삼항연산자
SELECT DECODE(5-2,1,'5-2=1',2,'5-2=2',3,'5-2=3','5-2는 몰라') "결과확인"
FROM DUAL;
--==>>5-2=3

--○ CASE WHEN THEN ELSE END 구문 활용
SELECT CASE WHEN 5<2 THEN '5<2'
            WHEN 5>2 THEN '5>2'
            ELSE '5와2는 비교불가'
        END"결과 확인"
FROM DUAL;
--==>> 5>2
--> WHEN 이후 첫번째로 맞는 구문 출력

SELECT CASE WHEN 5<2 OR 3>1 AND 2=2 THEN '지혜만세'
            WHEN 5>2 OR 2=3 THEN '기승만세'
            ELSE '희진만세'
        END
FROM DUAL;
--==>>
/*
SELECT CASE WHEN F OR T AND T THEN '지혜만세'
            WHEN T OR F THEN '기승만세'
            ELSE '희진만세'
        END
FROM DUAL;
*/

SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '훈의만세'
            WHEN 5<2 AND 2=3 THEN '진석만세'
            ELSE '보라만세'
        END "결과 확인"
FROM DUAL;
--==>>훈의만세
/*
SELECT CASE WHEN F AND F OR T AND T THEN '훈의만세'
            WHEN T OR T AND T THEN'훈의만세'
*/

SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=2 THEN '훈의만세'
            WHEN 5<2 AND 2=3 THEN '진석만세'
            ELSE '보라만세'
        END "결과 확인"
FROM DUAL;
--==>>보라만세

SELECT *
FROM TBL_SAWON;

--○ 문제
--   TBL_SAWON 테이블을 활용하여 다음과 같은 항목들을 조회한다.
--   사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일
--   정년퇴직일, 근무일수, 남은일수, 급여, 보너스

-- 단, 현재 나이는 한국나이 계산법에 따라 연산을 수행한다.
-- 또한 정년퇴직일은 해당직원의 나이가 한국 나이로 60세가 되는 해(년도)의 
-- 그 직원의 입사 월, 일로 연산을 수행한다.
-- 그리고 보너스는 1000일 이상 2000일 미만 근무한 사원은
-- 그 사원의 원래 급여 기준 30% 지급, 
-- 2000일 이상 근무한 사원은 그 사원의 원래 급여기준 50% 지급을 할 수 있도록 처리한다.


ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>>Session이(가) 변경되었습니다.

SELECT SANO"사원번호", SANAME"사원명", JUBUN"주민번호"
     , CASE SUBSTR(JUBUN,7,1) WHEN '1' THEN '남자' WHEN '2' THEN '여자' WHEN '3' THEN '남자' WHEN '4' THEN '여자' END"성별"
     , CASE WHEN  SUBSTR(JUBUN,1,2)>00 AND  SUBSTR(JUBUN,1,2)<10 THEN TO_CHAR(SYSDATE, 'YY')- SUBSTR(JUBUN,1,2)+1
        ELSE TO_CHAR(SYSDATE, 'YY')+100 - SUBSTR(JUBUN,1,2)+1 END"현재나이"
     ,    HIREDATE"입사일"
     ,  CASE WHEN  SUBSTR(JUBUN,1,2)>00 AND  SUBSTR(JUBUN,1,2)<10 THEN ADD_MONTHS(HIREDATE, (60-(TO_CHAR(SYSDATE, 'YY')- SUBSTR(JUBUN,1,2)+1) + (2019-EXTRACT(YEAR FROM HIREDATE)))*12)
        ELSE ADD_MONTHS(HIREDATE, (60-(TO_CHAR(SYSDATE, 'YY')+100 - SUBSTR(JUBUN,1,2)+1) + (2019-EXTRACT(YEAR FROM HIREDATE)))*12) END"정년퇴직일"
     , TRUNC(SYSDATE - HIREDATE)"근무일수"
     , CASE WHEN  SUBSTR(JUBUN,1,2)>00 AND  SUBSTR(JUBUN,1,2)<10 THEN TRUNC(ADD_MONTHS(HIREDATE, (60-(TO_CHAR(SYSDATE, 'YY')- SUBSTR(JUBUN,1,2)+1) + (2019-EXTRACT(YEAR FROM HIREDATE)))*12)-SYSDATE)
        ELSE TRUNC(ADD_MONTHS(HIREDATE, (60-(TO_CHAR(SYSDATE, 'YY')+100 - SUBSTR(JUBUN,1,2)+1) + (2019-EXTRACT(YEAR FROM HIREDATE)))*12)-SYSDATE) END "남은일수"
     , SAL"급여"
     , CASE WHEN TRUNC(SYSDATE - HIREDATE)<1000 THEN 0
            WHEN TRUNC(SYSDATE - HIREDATE)<2000 THEN SAL*0.3
            ELSE SAL*0.5 END"보너스"
FROM TBL_SAWON;

--현재나이
CASE WHEN 주민 00~10 THEN 현재년 - 나이+1
ELSE THEN 현재년+100-나이+1

--정년퇴직일
CASE WHEN 주민 00~10 THEN 입사일 + ADD_MONTHS((60-현재나이) + (2019-입사년))*12
ELSE THEN 입사일 + ADD_MONTH((정년-현재나이+100)+(2019-입사년))*12

(입사일~현재) + (현재나이 ~ 60살) => 정년퇴직일

--근무일수
현재-입사일

--남은일수
CASE WHEN 주민 00~10 THEN 입사일 +  (ADD_MONTHS((60-현재나이) + (2019-입사년))*12)-현재시간
ELSE THEN 입사일 +  (ADD_MONTHS((정년-현재나이+100) + (2019-입사년))*12)-현재시간


--홍비거
SELECT SANO"사원번호",SANAME"사원명",JUBUN"주민번호",
        CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '남'
             WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여'
             ELSE '사람아님'
             END "성별"
       
        ,CASE WHEN SUBSTR(JUBUN,1,1) = 0 THEN (2019-(TO_NUMBER(SUBSTR(JUBUN,1,2))+2000)+1)
             ELSE (2019-(TO_NUMBER(SUBSTR(JUBUN,1,2))+1900)+1)
             END "현재나이"
       
        , HIREDATE "입사일"
       
        ,CASE WHEN SUBSTR(JUBUN,1,1)=0 
              THEN ADD_MONTHS(HIREDATE, 12*(  (60- (2019-(TO_NUMBER(SUBSTR(JUBUN,1,2))+2000)+1)) +  (2019-EXTRACT(YEAR FROM HIREDATE)) ) )
              ELSE ADD_MONTHS(HIREDATE, 12*(  (60- (2019-(TO_NUMBER(SUBSTR(JUBUN,1,2))+1900)+1)) +  (2019-EXTRACT(YEAR FROM HIREDATE)) ) )
              END "정년퇴직일"
       
        ,TRUNC(SYSDATE - HIREDATE) "근무일수" 
        
        ,CASE WHEN SUBSTR(JUBUN,1,1)=0 
              THEN TRUNC( ADD_MONTHS(HIREDATE, 12*(  (60- (2019-(TO_NUMBER(SUBSTR(JUBUN,1,2))+2000)+1)) +  (2019-EXTRACT(YEAR FROM HIREDATE)) ) ) - SYSDATE)
              ELSE TRUNC( ADD_MONTHS(HIREDATE, 12*(  (60- (2019-(TO_NUMBER(SUBSTR(JUBUN,1,2))+1900)+1)) +  (2019-EXTRACT(YEAR FROM HIREDATE)) ) ) - SYSDATE)
              END "남은일수"
        
        ,SAL "급여"
        
        ,CASE WHEN TRUNC(SYSDATE - HIREDATE) <1000 THEN 0
              WHEN TRUNC(SYSDATE - HIREDATE) <2000 THEN SAL*0.3
              ELSE SAL*0.5
              END "보너스"
FROM TBL_SAWON;

--○ 선생님 풀이

-- TBL_SAWON 테이블에 존재하는 사원들의
-- 입사일(HIREDATE) 컬럼에서 월, 일만 조회하기
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

--성별
SELECT CASE WHEN 주민번호 7번째자리 1개가 1 또는 3 THEN '남자'
            WHEN 주민번호 7번재자리 1개가 2 또는 4 THEN '여자'
            ELSE '성별확인불가' ★ ELSE 구문 잊지마세요
        END
FROM TBL_SAWON;

SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '남자'
            WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여자'
            ELSE '성별확인불가'
       END "성별"
FROM TBL_SAWON;

--현재나이 = 현재년도 - 태어난년도 + 1 (1900년대 생/2000년 생)
SELECT CASE WHEN 1900년대 생이라면
            THEN 현재년도 - (주민번호 앞 두자리 + 1899)
            WHEN 2000년대 생이라면
            THEN 현재년도 - (주민번호 앞 두자리 + 1999)
            ELSE 0 → ★ 데이터들 결과값은 숫자타입, ELSE 값에 '나이확인불가'를 넣으면 문자타입 → 에러발생
      END"현재나이"
FROM TBL_SAWON;

SELECT CASE WHEN 주민번호 7번째 자리 1개가 1 또는 2
            THEN 현재년도 - (주민번호 앞 두자리 + 1899)
            WHEN 주민번호 7번째 자리 1개가 3 또는 4
            THEN 현재년도 - (주민번호 앞 두자리 + 1999)
            ELSE 0
      END"현재나이"
FROM TBL_SAWON;

SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1','2')
            THEN 현재년도 - (주민번호 앞 두자리 + 1899)
            WHEN SUBSTR(JUBUN, 7, 1) IN ('3','4')
            THEN 현재년도 - (주민번호 앞 두자리 + 1999)
            ELSE 0
      END"현재나이"
FROM TBL_SAWON;

SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
            WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
            ELSE 0
        END"현재나이"
FROM TBL_SAWON;
--==>>TO_NUMBER(TO_CHAR(SYSDATE,'YYYY') 
--==>>EXTRACT(YEAR FROM SYSDATE) 같음





















