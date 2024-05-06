/*
<VIEW>
    VIEW는 오라클에서 제공하는 객체로 가상의 테이블이다.
*/
-- '한국'에서 근무하는 사원들의 사번, 직원명, 부서명, 급여, 근무 국가명을 조회

SELECT QUERY
  FROM (
SELECT TABLE_NAME                                                       AS TABLE_NAME
     , '1'                                                              AS NUM
     , 'SELECT'                                                         AS QUERY
  FROM USER_COL_COMMENTS
 UNION
SELECT TABLE_NAME                                                       AS TABLE_NAME
     , '2'                                                              AS NUM
     , RPAD('     , ' || COLUMN_NAME, 22) || ' AS "' || COMMENTS || '"' AS QUERY
  FROM USER_COL_COMMENTS
 UNION
SELECT TABLE_NAME                                                       AS TABLE_NAME
     , '3'                                                              AS NUM
     , '  FROM ' || RPAD(TABLE_NAME || ';' , 15)|| ' -- ' || COMMENTS   AS QUERY
  FROM USER_TAB_COMMENTS
)
 WHERE TABLE_NAME IN('TB_STUDENT','TB_DEPARTMENT', 'TB_')
 ORDER BY TABLE_NAME, NUM
;
SELECT E.EMP_ID          AS "사원번호"
     , E.EMP_NAME        AS "직원명"
     , D.DEPT_TITLE      AS "부서명"
     , E.SALARY          AS "급여"
     , N.NATIONAL_NAME   AS "근무 국가명"
  FROM EMPLOYEE          E     -- 사원정보
 INNER JOIN
       DEPARTMENT        D     -- 부서
    ON E.DEPT_CODE       = D.DEPT_ID
 INNER JOIN
       LOCATION          L     -- 지역
    ON D.LOCATION_ID     = L.LOCAL_CODE
 INNER JOIN
       NATIONAL          N     -- 국가
    ON N.NATIONAL_CODE   = L.NATIONAL_CODE
 WHERE N.NATIONAL_NAME   = '러시아'
;
/*
    1. VIEW 생성
        CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW 뷰명
        AS 서브 쿼리
        [WITH CHECK OPTION]
        [WITH READ ONLY];
*/
CREATE VIEW V_EMPLOYEE AS
SELECT EMP_ID
     , EMP_NAME
     , HIRE_DATE
  FROM EMPLOYEE; -- 오류 보고 - ORA-01031: 권한이 불충분합니다

-- 처음 뷰를 생성시 관리자 계정으로 CREATE VIEW 권한을 주어야한다.
-- SYS 계정으로 변경후
GRANT CREATE VIEW TO C##KH;

-- 가상테이블로 실제 데이터가 담겨있는 것은 아니다.
SELECT * FROM V_EMPLOYEE;

-- 접속한 계정이 가지고 있는 VIEW에 정보를 조회하는 뷰 테이블이다.
SELECT * FROM USER_VIEWS;

-- OR REPLACE 옵션 : 기존에 동일한 뷰가 있을 경우 덮어쓰고, 존재하지 않으면 뷰를 새로 생성한다.
CREATE OR REPLACE VIEW V_EMPLOYEE AS
SELECT E.EMP_ID          -- "사원번호"
     , E.EMP_NAME        -- "직원명"
     , D.DEPT_TITLE      -- "부서명"
     , E.SALARY          -- "급여"
     , N.NATIONAL_NAME   -- "근무 국가명"
  FROM EMPLOYEE          E     -- 사원정보
 INNER JOIN
       DEPARTMENT        D     -- 부서
    ON E.DEPT_CODE       = D.DEPT_ID
 INNER JOIN
       LOCATION          L     -- 지역
    ON D.LOCATION_ID     = L.LOCAL_CODE
 INNER JOIN
       NATIONAL          N     -- 국가
    ON N.NATIONAL_CODE   = L.NATIONAL_CODE;

-- '한국'에서 근무하는 사원들의 정보를 조회
SELECT *
  FROM V_EMPLOYEE
 WHERE NATIONAL_NAME = '일본'
;
/*
┏--------┳------┳-------┳----------┳-------------┓
┃EMP_NAME┃EMP_ID┃SALARY ┃DEPT_TITLE┃NATIONAL_NAME┃
┣--------╋------╋-------╋----------╋-------------┫
┃선동일  ┃   200┃8000000┃총무부    ┃한국         ┃
┃송종기  ┃   201┃6000000┃총무부    ┃한국         ┃
┃노옹철  ┃   202┃3700000┃총무부    ┃한국         ┃
┃방명수  ┃   214┃1380000┃인사관리부┃한국         ┃
┃차태연  ┃   216┃2780000┃인사관리부┃한국         ┃
┃전지연  ┃   217┃3660000┃인사관리부┃한국         ┃
┃임시환  ┃   219┃1550000┃회계관리부┃한국         ┃
┃이중석  ┃   220┃2490000┃회계관리부┃한국         ┃
┃유하진  ┃   221┃2480000┃회계관리부┃한국         ┃
┖--------┸------┸-------┸----------┸-------------┚
*/

/*
    2. 뷰 컬럼에 별칭 부여
*/
-- 모든 사원들의 사번, 직원명, 성별, 근무년수, 연봉을 조회할수 있는 뷰 생성
-- 1) 서브쿼리에 별칭을 부여하는 방법
CREATE OR REPLACE VIEW V_EMPLOYEE AS
SELECT EMP_ID                                                     AS "사번"
     , EMP_NAME                                                   AS "직원명"
     , SUBSTR(EMP_NO, 8,1)                                        AS "성별 코드"
     , EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)  AS "근무 년수"
     , SALARY * 12                                                AS "연봉"
  FROM EMPLOYEE                                                   -- 사원정보
;

SELECT * FROM V_EMPLOYEE
 WHERE "근무 년수" > 20
;

-- 2) 뷰생성시 모든 컬럼에 별칭을 부여하는 방법(모든 컬럼에 별칭을 부여해주어야한다.)
CREATE OR REPLACE VIEW V_EMPLOYEE("사번", "직원명", "성별 코드", "근무 년수", "연봉") AS
SELECT EMP_ID
     , EMP_NAME
     , SUBSTR(EMP_NO, 8,1)
     , EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)
     , SALARY * 12
  FROM EMPLOYEE                                                   -- 사원정보
;

SELECT * FROM V_EMPLOYEE
 WHERE "근무 년수" > 20
;
SELECT * FROM USER_VIEWS;
SELECT EMP_ID
     , EMP_NAME
     , SUBSTR(EMP_NO, 8,1)
     , EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)
     , SALARY * 12
  FROM EMPLOYEE                                                   -- 사원정보
;
-- 뷰 삭제
DROP VIEW V_EMPLOYEE;
/*
    3. VIEW 를 이용해서 DML(INSERT, UPDATE, DELETE) 사용
*/

CREATE VIEW V_JOB AS
SELECT *
  FROM JOB
;
-- VIEW 를 SELECT
SELECT * FROM V_JOB;

-- VIEW에 INSERT
INSERT INTO V_JOB VALUES('J8','알바');

-- VIEW에 UPDATE
UPDATE V_JOB SET JOB_NAME = '이이잉턴' WHERE JOB_CODE = 'J8';

-- VIEW에 DELETE
DELETE FROM V_JOB WHERE JOB_CODE = 'J8';

/*
    4. DML 구문으로 VIEW 조작이 불가능한 경우
        - 뷰 정의에 포함되지 않은 컬럼을 조작하는 경우
        - 뷰에 포함되지 않는 컬럼 중에 기본 테이블 상에 NOT NULL 제약조건이 지정된 경우
        - 산술 표현식으로 정의된 경우
        - 그룹 함수나 GROUP BY 절을 포함한 경우
        - DISTINCT를 포함한 경우
        - JOIN을 이용해 여러 테이블을 연결한 경우
*/
-- 1) 뷰 정의에 포함되지 않은 컬럼을 조작하는 경우
CREATE OR REPLACE VIEW V_JOB AS
SELECT JOB_CODE
  FROM JOB;

-- 1) 확인 테스트 : INSERT
INSERT INTO V_JOB VALUES('J8', '이잉턴'); -- 오류 보고 - SQL 오류: ORA-00913: 값의 수가 너무 많습니다
INSERT INTO V_JOB VALUES('J8');           -- 가능

-- 1) 확인 테스트 : UPDATE
UPDATE V_JOB SET JOB_NAME = '인턴' WHERE JOB_CODE = 'J8'; -- 오류 보고 - SQL 오류: ORA-00904: "JOB_NAME": 부적합한 식별자
UPDATE V_JOB SET JOB_CODE = 'J0'   WHERE JOB_CODE = 'J8'; -- 가능

-- 1) 확인 테스트 : DELETE
DELETE FROM V_JOB WHERE JOB_NAME IS NULL;-- 오류 보고 - SQL 오류: ORA-00904: "JOB_NAME": 부적합한 식별자

DELETE FROM V_JOB WHERE JOB_CODE = 'J0'; -- 가능


-- 2) 뷰에 포함되지 않는 컬럼 중에 NOT NULL 제약조건이 지정된 경우
CREATE OR REPLACE VIEW V_JOB AS
SELECT JOB_NAME
  FROM JOB;

-- 2) 확인 테스트 : INSERT
INSERT INTO V_JOB VALUES ('인턴'); -- 오류 보고 - ORA-01400: NULL을 ("C##KH"."JOB"."JOB_CODE") 안에 삽입할 수 없습니다


-- 3) 산술 표현식으로 정의된 경우
-- 사원의 연봉 정보를 조회하는 뷰
CREATE VIEW V_EMP_SAL AS
SELECT EMP_ID
     , EMP_NAME
     , EMP_NO
     , SALARY
     , SALARY * 12 AS "연봉"
  FROM EMPLOYEE;

-- 3) 확인 테스트 : INSERT
-- 산술연산으로 정의된 컬럼은 데이터 삽입불가
INSERT INTO V_EMP_SAL VALUES ('100', '홍길동','231115-3333333', 3000000, 36000000);-- 오류 보고 - SQL 오류: ORA-01733: 가상 열은 사용할 수 없습니다

-- 산술연산정의 컬럼이 아닌 컬럼은 데이터 삽입가능
INSERT INTO V_EMP_SAL(EMP_ID, EMP_NAME, EMP_NO, SALARY) VALUES ('100', '홍길동','231115-3333333', 3000000);-- 가능

-- 3) 확인 테스트 : UPDATE
UPDATE V_EMP_SAL SET "연봉" = 50000000 WHERE EMP_ID = '100';-- 오류 보고 - SQL 오류: ORA-01733: 가상 열은 사용할 수 없습니다
UPDATE V_EMP_SAL SET SALARY = 5000000  WHERE EMP_ID = '100'; -- 가능

-- 3) 확인 테스트 : DELETE
DELETE FROM V_EMP_SAL WHERE "연봉" = 60000000;-- 가능


-- 4) 그룹 함수나 GROUP BY 절을 포함한 경우
-- 부서별 급여의 합계, 급여 평균을 조회하는 뷰를 생성
CREATE OR REPLACE VIEW V_EMP_SAL("부서 코드" , "급여 합계" , "급여 평균") AS
SELECT DEPT_CODE
     , SUM(SALARY)
     , AVG(SALARY)
  FROM EMPLOYEE
 GROUP BY DEPT_CODE;


-- 4) 확인 테스트 : INSERT
INSERT INTO V_EMP_SAL VALUES('D0',800000,4000000);-- 오류 보고 - SQL 오류: ORA-01733: 가상 열은 사용할 수 없습니다
INSERT INTO V_EMP_SAL("부서 코드") VALUES('D0');  -- 오류 보고 - ORA-01400: NULL을 ("C##KH"."EMPLOYEE"."EMP_ID") 안에 삽입할 수 없습니다
---> NOT NULL 제약조건이 없으면 INSERT 되는 케이스

-- 4) 확인 테스트 : UPDATE
UPDATE V_EMP_SAL SET "급여 합계" = 12000000 WHERE "부서 코드" = 'D1';-- 오류 보고 - SQL 오류: ORA-01732: 뷰에 대한 데이터 조작이 부적합합니다
UPDATE V_EMP_SAL SET "부서 코드" = 'D0'     WHERE "부서 코드" = 'D1';    -- 오류 보고 - SQL 오류: ORA-01732: 뷰에 대한 데이터 조작이 부적합합니다

-- 4) 확인 테스트 : DELETE
DELETE FROM V_EMP_SAL WHERE "부서 코드" = 'D1';-- 오류 보고 - SQL 오류: ORA-01732: 뷰에 대한 데이터 조작이 부적합합니다

-- 5) DISTINCT를 포함한 경우
CREATE VIEW V_EMP_JOB AS
SELECT DISTINCT JOB_CODE
  FROM EMPLOYEE;

-- 5) 확인 테스트 : INSERT
INSERT INTO V_EMP_JOB VALUES('J8');

-- 5) 확인 테스트 : UPDATE
UPDATE V_EMP_JOB SET  JOB_CODE = 'J8' WHERE JOB_CODE = 'J7';

-- 5) 확인 테스트 : DELETE
DELETE FROM  V_EMP_JOB WHERE JOB_CODE = 'J7';


-- 6) JOIN을 이용해 여러 테이블을 연결한 경우
-- 직원들의 사번 직원명, 주민번호, 부서명 조회하는 뷰를 생성
CREATE OR REPLACE VIEW V_EMP_DEPT AS
SELECT E.EMP_ID
     , E.EMP_NAME
     , E.EMP_NO
     , D.DEPT_TITLE
  FROM EMPLOYEE    E
 INNER JOIN
       DEPARTMENT  D
    ON E.DEPT_CODE = D.DEPT_ID;


-- 6) 확인 테스트 : INSERT
INSERT INTO V_EMP_DEPT VALUES ('100', '홍길동', '941115-1111111', '인사부');                    -- 오류 보고 - SQL 오류: ORA-01776: 조인 뷰에 의하여 하나 이상의 기본 테이블을 수정할 수 없습니다.
INSERT INTO V_EMP_DEPT(EMP_ID,	EMP_NAME,	EMP_NO) VALUES ('100', '홍길동', '941115-1111111'); -- 가능
INSERT INTO V_EMP_DEPT(DEPT_TITLE) VALUES ('인사부');                                           -- 오류 보고 - SQL 오류: ORA-01779: 키-보존된것이 아닌 테이블로 대응한 열을 수정할 수 없습니다

-- 6) 확인 테스트 : UPDATE
UPDATE V_EMP_DEPT SET DEPT_TITLE = '개발팀' WHERE EMP_ID = '200'; -- 한테이블씩 업데이트는 가능
UPDATE V_EMP_DEPT SET EMP_NAME   = '개발팀' WHERE EMP_ID = '200'; -- 한테이블씩 업데이트는 가능

-- 수정할 컬럼이 두테이블 이상이면 업데이트 불가능
UPDATE V_EMP_DEPT
   SET DEPT_TITLE = '개발팀'
     , EMP_NAME   = '개발팀'
 WHERE EMP_ID = '200'; -- 오류 보고 - SQL 오류: ORA-01776: 조인 뷰에 의하여 하나 이상의 기본 테이블을 수정할 수 없습니다.

-- 6) 확인 테스트 : DELETE
-- 서브쿼리의 FROM 절에 기술한 테이블에만 영향을 미친다.
DELETE FROM V_EMP_DEPT WHERE EMP_ID     = '200';    -- 가능 : 부모테이블에 해당하는 테이블의 데이터는 지우지 않는다.
DELETE FROM V_EMP_DEPT WHERE DEPT_TITLE = '총무부'; -- 가능

/*
    5. VIEW 옵션
        CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW 뷰명
        AS 서브 쿼리
        [WITH CHECK OPTION]
        [WITH READ ONLY];
        ┏-----------------┳-------------------------------------------------------------------------------┓
        ┃옵션             ┃설명                                                                           ┃
        ┣-----------------╋-------------------------------------------------------------------------------┫
        ┃OR REPLACE       ┃기존에 동일한 뷰가 있을 경우 덮어쓰고, 존재하지 않으면 뷰를 새로 생성한다.     ┃
        ┃FORCE            ┃서브 쿼리에 기술된 테이블이 존재하지 않는 테이블이어도 뷰가 생성된다.          ┃
        ┃NOFORCE          ┃서브 쿼리에 기술된 테이블이 존재해야만 뷰가 생성된다. (기본값)                 ┃
        ┃WITH CHECK OPTION┃서브 쿼리에 기술된 조건에 부합하지 않는 값으로 수정하는 경우 오류를 발생시킨다.┃
        ┃WITH READ ONLY   ┃뷰에 대해 조회만 가능하다. (DML 수행 불가)                                     ┃
        ┖-----------------┸-------------------------------------------------------------------------------┚
*/
-- 1) OR REPLACE
CREATE OR REPLACE VIEW V_EMP_SAL AS
SELECT EMP_NAME, SALARY, HIRE_DATE
  FROM EMPLOYEE;

SELECT * FROM V_EMP_SAL;
SELECT * FROM USER_VIEWS;

-- 2) NOFORCE / FORCE

CREATE /* NOFORCE */ VIEW V_TEST_01 AS
SELECT * FROM TEST; -- 오류 보고 - ORA-00942: 테이블 또는 뷰가 존재하지 않습니다

-- TEST 테이블을 생성하지 않아도 VIEW 를 생성할 수 있다.
CREATE FORCE   VIEW V_TEST_02 AS
SELECT * FROM TEST; -- View V_TEST_02이(가) 생성되었습니다.

-- TEST 테이블을 생성한 이후부터 VIEW 조회 가능
SELECT * FROM V_TEST_02; -- ORA-04063: view "C##KH.V_TEST_02"에 오류가 있습니다

CREATE TABLE TEST
(
    TNO NUMBER,
    TNAME VARCHAR2(20)
);
INSERT INTO TEST VALUES(1, '고길동');


-- 3) WITH CHECK OPTION
CREATE VIEW V_EMP AS
SELECT *
  FROM EMPLOYEE
 WHERE SALARY >= 3000000;

-- 사번이 200인 사원의 급여를 200만원으로 변경
-- 서브쿼리의 조건에 부합하지 않아도 변경이 가능하다
UPDATE V_EMP SET SALARY = 2000000 WHERE EMP_ID = '200';

SELECT * FROM V_EMP;

CREATE OR REPLACE VIEW V_EMP AS
SELECT *
  FROM EMPLOYEE
 WHERE SALARY >= 3000000
  WITH CHECK OPTION;

UPDATE V_EMP SET SALARY = 2000000 WHERE EMP_ID = '200';-- 오류 보고 - SQL 오류: ORA-01402: 뷰의 WITH CHECK OPTION의 조건에 위배 됩니다


-- 4) WITH READ ONLY
CREATE VIEW V_DEPT AS
SELECT *
  FROM DEPARTMENT
  WITH READ ONLY;

-- 4) 확인 테스트 : INSERT
INSERT INTO V_DEPT VALUES('D0', '개발부', 'L2');             -- 오류 보고 - SQL 오류: ORA-42399: 읽기 전용 뷰에서는 DML 작업을 수행할 수 없습니다.
-- 4) 확인 테스트 : UPDATE
UPDATE V_DEPT SET DEPT_TITLE = '개발부' WHERE DEPT_ID = 'D9';-- 오류 보고 - SQL 오류: ORA-42399: 읽기 전용 뷰에서는 DML 작업을 수행할 수 없습니다.
-- 4) 확인 테스트 : DELETE
DELETE FROM V_DEPT WHERE DEPT_ID = 'D9';                     -- 오류 보고 - SQL 오류: ORA-42399: 읽기 전용 뷰에서는 DML 작업을 수행할 수 없습니다.


/*
    6. VIEW 삭제
*/
DROP VIEW V_JOB;
DROP VIEW V_EMP_SAL;
DROP VIEW V_EMP_JOB;
DROP VIEW V_EMP_DEPT;
DROP VIEW V_TEST_02;
DROP VIEW V_TEST_01;
DROP VIEW V_EMP;
DROP VIEW V_DEPT;

/*
    <SEQUENCE>
        EQUENCE는 오라클에서 제공하는 객체로 순차적으로 정수 값을 자동으로 생성한다.
*/
-- 1. SEQUENCE 생성
-- TB_MEMBER 테이블의 PK 값을 생성할 SEQUENCE 생성
CREATE SEQUENCE SEQ_MNO
START WITH 300
INCREMENT BY 5
MAXVALUE 310
NOCYCLE
NOCACHE;
DROP SEQUENCE SEQ_MNO;

-- 현재 계정이 가지고 있는 시퀀스들에 대한 정보를 조회하는 테이블이다.
SELECT * FROM USER_SEQUENCES;

-- 2. SEQUENCE 사용

SELECT SEQ_MNO.CURRVAL FROM DUAL;-- ORA-08002: 시퀀스 SEQ_MNO.CURRVAL은 이 세션에서는 정의 되어 있지 않습니다
-- NEXTVAL 을 한번이라도 수행하지 않은 상태에서 CURRVAL를 가져올수 없다.
-- CURRVAL는 마지막으로 수행된 NEXTVAL 값을 저장해서 보여주는 값이다.
SELECT SEQ_MNO.NEXTVAL FROM DUAL;-- 300
SELECT SEQ_MNO.CURRVAL FROM DUAL;-- 300
SELECT SEQ_MNO.NEXTVAL FROM DUAL;-- 305
SELECT SEQ_MNO.NEXTVAL FROM DUAL;-- 310
SELECT SEQ_MNO.NEXTVAL FROM DUAL;-- ORA-08004: 시퀀스 SEQ_MNO.NEXTVAL exceeds MAXVALUE은 사례로 될 수 없습니다
SELECT SEQ_MNO.CURRVAL FROM DUAL;-- 310
/*
    3. SEQUENCE 수정
        SEQUENCE 수정 시 ALTER 구문을 사용해서 수정한다.
        단, START WITH 값 변경은 불가하기 때문에 변경하려면 삭제 후 다시 생성해야 한다.
        ALTER SEQUENCE 시퀀스명
        [INCREMENT BY 숫자]
        [MAXVALUE 숫자]
        [MINVALUE 숫자]
        [CYCLE | NOCYCLE]
        [CACHE | NOCACHE]
*/
ALTER SEQUENCE SEQ_MNO START WITH 200; -- 오류 보고 - ORA-02283: 시퀀스 시작 번호는 변경할 수 없습니다.
ALTER SEQUENCE SEQ_MNO INCREMENT BY 10 MAXVALUE 400;

SELECT SEQ_MNO.NEXTVAL FROM DUAL;-- 320
SELECT SEQ_MNO.NEXTVAL FROM DUAL;-- 330
SELECT SEQ_MNO.NEXTVAL FROM DUAL;-- 340
SELECT SEQ_MNO.CURRVAL FROM DUAL;-- 340

-- 4. SEQUENCE 예시
-- 매번 새로운 회원번호를 생성하는 시퀀스를 사용해서 INSERT 작성
INSERT INTO TB_MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_NAME) VALUES(SEQ_MNO.NEXTVAL, 'YAWOOCH', '1234', '고길동');
SELECT * FROM TB_MEMBER;

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'TB_MEMBER';

INSERT INTO TB_MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_NAME) VALUES(SEQ_MNO.NEXTVAL, 'AWOOCH', '5678', '홍길동');

-- 5. SEQUENCE 삭제
DROP SEQUENCE SEQ_MNO;


/*
<INDEX>
    INDEX 는 오라클에서 제공하는 객체이다.
    SQL 명령문의 처리 속도를 향상시키기 위해서 행들의 위치 정보를 가지고 있다. (내부 구조는 B-트리 형식으로 구성)
*/

SELECT *
  FROM TB_STUDENT
 WHERE STUDENT_NAME = '한효종'
;

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'TB_GRADE';

-- 고유 인덱스 생성
-- 중복된 값이 없는 컬럼으로 고유 인덱스 생성가능
CREATE UNIQUE INDEX IDX_STUDENT_SSN
ON TB_STUDENT(STUDENT_SSN); -- INDEX IDX_STUDENT_SSN이(가) 생성되었습니다.

-- 중복된 값을 갖는 컬럼으로 고유 인덱스를생성시 에러발생
CREATE UNIQUE INDEX IDX_DEPARTMENT_NO
ON TB_STUDENT(DEPARTMENT_NO); -- 오류 보고 - ORA-01452: 중복 키가 있습니다. 유일한 인덱스를 작성할 수 없습니다

SELECT * FROM TB_STUDENT;

-- 비고유 인덱스 생성
CREATE INDEX IDX_STUDENT_NAME
ON TB_STUDENT(STUDENT_NAME);


-- 결합 인덱스 생성
-- TB_GRADE 테이블에 설정되어 있는 인덱스 사용
SELECT *
  FROM TB_GRADE
 WHERE TERM_NO    = '200301'
   AND STUDENT_NO = 'A241056'
   AND CLASS_NO   = 'C1753800';


-- 일부의 컬럼만 사용해서 검색을 하면 인덱스 사용하지 않음
SELECT *
  FROM TB_GRADE
 WHERE STUDENT_NO = 'A241056'
   AND CLASS_NO   = 'C1753800';



CREATE INDEX IDX_STUDENT_CLASS
ON TB_GRADE(STUDENT_NO, CLASS_NO);
-- INDEX 삭제
DROP INDEX IDX_STUDENT_CLASS;
DROP INDEX IDX_STUDENT_SSN;
DROP INDEX IDX_DEPARTMENT_NO;
DROP INDEX IDX_STUDENT_NAME;

/*
 <INDEX 재생성>
    빈번한 DML 작업을 수행한 경우 제거된 인덱스가 필요 없는 공간을 차지하고 있지 않도록 인덱스를 재생성한다
    ALTER INDEX 인덱스명 REBUILD;
*/


/* 
    <SYNONYM>
        SYNONYM은 오라클에서 제공하는 객체로 데이터베이스 객체에 별칭을 생성한다.
*/
-- 1. 비공개 SYNONYM
-- 1-1. 관리자 계정으로 KH 계정에 SYNONYM 생성 권한을 부여
GRANT CREATE SYNONYM TO C##KH;


-- 1-2. KH 계정으로 비공개 SYNONYM 생성
CREATE SYNONYM EMP FOR EMPLOYEE; -- PUBLIC 명령어는 관리자만 실행 할 수 있다.

SELECT * FROM EMP;

-- 1-3. KH 계정으로 비공개 SYNONYM 삭제
DROP SYNONYM EMP;


-- 2. 공개 SYNONYM
-- 2-1. 관리자 계정으로 KH DEPARTMENT 테이블에 SYNONYM 생성
CREATE PUBLIC SYNONYM DEPT FOR C##KH.DEPARTMENT;

SELECT * FROM C##KH.DEPARTMENT;
SELECT * FROM DEPT;

-- 2-2. 관리자 계정으로 SAMPLE 계정에 C##KH.DEPARTMENT 조회 권한 부여
GRANT SELECT ON C##KH.DEPARTMENT TO C##SAMPLE;

-- 2-3. C##SAMPLE 계정으로 SELECT 
SELECT * FROM DEPT;

-- 2-4. 관리자 계정으로 KH DEPARTMENT 테이블에 SYNONYM 삭제
DROP SYNONYM DEPT;


