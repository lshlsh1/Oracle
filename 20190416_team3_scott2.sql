SELECT EXTRACT(YEAR FROM SYSDATE)
FROM DUAL;

SELECT 
FROM DUAL;


EXEC PRC_STU_INSERT('이일이','123456-2123451','010-2222-2222');
EXEC PRC_STU_INSERT('이이이','123456-2123452','010-3333-3333');
EXEC PRC_STU_INSERT('이삼이','123456-2123453','010-4444-4444');
EXEC PRC_STU_INSERT('이사이','123456-2123454','010-5555-5555');



SELECT *
FROM STUDENT;

CREATE OR REPLACE VIEW VIEW_STUINFO
AS;
SELECT S.STU_NAME"학생이름", C.CS_NAME"과정명", SB.SUB_NAME"수강과목" SC.ATTENDANCE--(+PERFORMANCE+WRITTEN)"수강과목총점"-- , "중도탈락여부"
FROM STUDENT S, REGISTER R, OPENCOURSE O, COURSE C, OPENSUBJECT OS, SUBJECT SB, SCORE SC
WHERE S.STU_ID = R.STU_ID(+)
 AND R.OC_ID = O.OC_ID(+)
 AND O.CS_ID = C.CS_ID(+)
 AND O.OC_ID = OS.OC_ID(+)
 AND OS.SUB_ID = SB.SUB_ID(+)
 AND R.REG_ID = SC.REG_ID;
 
SELECT *
FROM VIEW_STUINFO;

SELECT *
FROM COURSE;

SELECT *
FROM REGISTER;

, STU_SSN"주민번호", STU_TEL"전화번호", "과정명", "수강과목", "수강과목총점"

SELECT *
FROM TAB;

INSERT INTO COURSE VALUES ('CS111','웹개발과정');
INSERT INTO COURSE VALUES ('CS112','웹개발과정2');
INSERT INTO COURSE VALUES ('CS113','웹개발과정3');
INSERT INTO SUBJECT VALUES ('SB111','자바');
INSERT INTO SUBJECT VALUES ('SB112','오라클');
INSERT INTO SUBJECT VALUES ('SB113','HTML');

INSERT INTO PROFESSOR VALUES ('PR15_111','김교수','123456-1123453','010-4444-4444');
INSERT INTO CLASSROOM VALUES ('CR111','F04');
INSERT INTO OPENCOURSE VALUES ('CS111', 'OC19_111', 'CR111', SYSDATE, SYSDATE+10, 30);
INSERT INTO OPENCOURSE VALUES ('CS112', 'OC19_112', 'CR111', SYSDATE, SYSDATE+10, 30);
INSERT INTO BOOK VALUES('BK111','오라클책');
INSERT INTO OPENSUBJECT VALUES('OC19_111','OS19_1111','PR15_111','BK111','SB111',SYSDATE,SYSDATE+10);

INSERT INTO REGISTER VALUES ('S19_001','OC19_111','RG19_1111',SYSDATE);
INSERT INTO REGISTER VALUES ('S19_002','OC19_112','RG19_1112',SYSDATE);
INSERT INTO REGISTER VALUES ('S19_003','OC19_111','RG19_1113',SYSDATE);

INSERT INTO SCORE VALUES('OS19_1111','RG19_1111',20,40,40,'SC19_1111');
INSERT INTO SCORE VALUES('OS19_1112','RG19_1111',20,40,40,'SC19_1111');

INSERT INTO SCORE VALUES('OS19_1111','RG19_1112',30,60,10,'SC19_1112');

DELETE
FROM OPENCOURSE;

DELETE
FROM REGISTER;

DELETE
FROM 


EXEC PRC_STU_UPDATE('S19_009','이사이','123456-1234567','010-4444-4444');

EXEC PRC_STU_UPDATE('S19_008','이사이','123456-1234510','010-4444-4444');

EXEC PRC_STU_DELETE('S19_009');

EXEC PRC_DROPSTU_INSERT('S19_008','그냥');

SELECT *
FROM DROPSTUDENT;


EXEC PRC_STUDENT_INSERT('이일이','123456-2123451','010-1111-1111');
EXEC PRC_STUDENT_INSERT('이이이','123456-2123452','010-2222-2222');
EXEC PRC_STUDENT_INSERT('이삼이','123456-2123453','010-3333-3333');
EXEC PRC_STUDENT_INSERT('이사이','123456-2123454','010-4444-4444');

SELECT *
FROM OPENCOURSE;

EXEC PRC_REGISTER_INSERT('S19_001','OC19_001');
EXEC PRC_REGISTER_INSERT('S19_002','OC19_001');
EXEC PRC_REGISTER_INSERT('S19_003','OC19_001');

SELECT *
FROM REGISTER;

SELECT *
FROM OPENCOURSE;
