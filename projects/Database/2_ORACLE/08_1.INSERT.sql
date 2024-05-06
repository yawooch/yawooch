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
 WHERE TABLE_NAME IN('EMP_TEST')
 ORDER BY TABLE_NAME, NUM
;
/*
    <INSERT>
    테이블에 새로운 행을 추가하는 구문이다
*/
-- 테스트에 사용할 테이블 생성
CREATE TABLE EMP_TEST(
    EMP_ID     NUMBER PRIMARY KEY,
    EMP_NAME   VARCHAR2(20) NOT NULL,
    DEPT_TITLE VARCHAR2(30),
    HIRE_DATE  DATE DEFAULT SYSDATE
);


INSERT INTO EMP_TEST VALUES(100, '홍길동','서비스 개발팀',DEFAULT);
-- 모든 컬럼에 값을 지정하지 않아서 에러발생
INSERT INTO EMP_TEST VALUES(200, '이몽룡','개발 지원팀');

-- 에러는 발생하지 않지만 데이터가 잘못 저장된다.
INSERT INTO EMP_TEST VALUES(200,'개발 지원팀', '이몽룡');

-- 컬럼 순서와 데이터 타입이 맞지 않아서 에러 발생
INSERT INTO EMP_TEST VALUES(DEFAULT, 200,'개발 지원팀','이몽룡'); -- 오류 보고 - ORA-01400: NULL을 ("C##KH"."EMP_TEST"."EMP_ID") 안에 삽입할 수 없습니다

SELECT * FROM EMP_TEST;





-- 표현법 2)
INSERT INTO EMP_TEST(EMP_ID, EMP_NAME, DEPT_TITLE, HIRE_DATE)
VALUES (300, '성춘향', '인사팀', NULL);

INSERT INTO EMP_TEST(EMP_ID, EMP_NAME)
VALUES(400, '임꺽정');

-- EMP_NAME 컬럼에 NOT NULL 제약조건으로 인해서 에러 발생
INSERT INTO EMP_TEST(EMP_ID, DEPT_TITLE)
VALUES(500, '보안팀');

INSERT INTO EMP_TEST(EMP_ID, EMP_NAME, DEPT_TITLE)
VALUES(500, '김철수', '보안팀');

-- 표현법 3)
-- EMPLOYEE 테이블과 DEPARTMENT 테이블을 조인하여
-- 사원들의 사번, 직원명, 부서명, 입사일을 조회해서 EMP_TEST 테이블에 
-- INSERT 하시오.
INSERT INTO EMP_TEST (
    SELECT E.EMP_ID, 
           E.EMP_NAME, 
           D.DEPT_TITLE, 
           E.HIRE_DATE
    FROM EMPLOYEE E
    INNER JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
);

-- 테이블 컬럼의 순서와 서브쿼리 조회 결과의 순서가 맞지 않아서 에러 발생
INSERT INTO EMP_TEST (
    SELECT E.EMP_NAME,
           E.EMP_ID,
           D.DEPT_TITLE, 
           E.HIRE_DATE
    FROM EMPLOYEE E
    INNER JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
);

-- 서브쿼리로 조회한 데이터의 컬럼의 개수가 테이블의 컬럼 개수보다 
-- 많아서 에러 발생
INSERT INTO EMP_TEST (
    SELECT E.EMP_ID, 
           E.EMP_NAME, 
           D.DEPT_TITLE, 
           E.HIRE_DATE,
           D.DEPT_ID
    FROM EMPLOYEE E
    INNER JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
);

-- EMPLOYEE 테이블에서 사원들의 사번, 직원명을 EMP_TEST 테이블에 
-- INSERT 하시오.
INSERT INTO EMP_TEST(EMP_ID, EMP_NAME)(
    SELECT EMP_ID,
           EMP_NAME
    FROM EMPLOYEE       
);

DELETE FROM EMP_TEST;

SELECT * FROM EMP_TEST;

DROP TABLE EMP_TEST;

/*
  <INSERT ALL>
    두 개 이상의 테이블에 각각 INSERT 하는데 동일한 서브 쿼리가 
    사용되는 경우 INSERT ALL을 이용해서 여러 테이블에 한 번에 데이터 삽입이 가능하다.
*/
-- 표현법 1)
-- 테스트할 테이블 만들기 (테이블 구조만 복사)
CREATE TABLE EMP_DEPT
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE
   FROM EMPLOYEE
   WHERE 1 = 0;
   
CREATE TABLE EMP_MANAGER
AS SELECT EMP_ID, EMP_NAME, MANAGER_ID
   FROM EMPLOYEE
   WHERE 1 = 0;

-- EMP_DEPT 테이블에 부서 코드가 D1인 직원들의 
-- 사번, 직원명, 부서 코드, 입사일 삽입하고 
-- EMP_MANAGER 테이블에 부서 코드가 D1인 직원들의
-- 사번, 직원명, 관리자 사번을 조회하여 삽입한다.
INSERT ALL
INTO EMP_DEPT VALUES(EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE)
INTO EMP_MANAGER VALUES(EMP_ID, EMP_NAME, MANAGER_ID)
    SELECT EMP_ID, EMP_NAME, DEPT_CODE, MANAGER_ID, HIRE_DATE
    FROM EMPLOYEE
    WHERE DEPT_CODE = 'D1';

SELECT * FROM EMP_DEPT;
SELECT * FROM EMP_MANAGER;

DROP TABLE EMP_DEPT;
DROP TABLE EMP_MANAGER;

-- 표현법 2)
-- 테스트할 테이블 만들기 (테이블 구조만 복사)
CREATE TABLE EMP_OLD
AS SELECT EMP_ID, EMP_NAME, SALARY, HIRE_DATE
   FROM EMPLOYEE
   WHERE 1 = 0;

CREATE TABLE EMP_NEW
AS SELECT EMP_ID, EMP_NAME, SALARY, HIRE_DATE
   FROM EMPLOYEE
   WHERE 1 = 0;
   
-- EMPLOYEE 테이블의 입사일을 기준으로
-- 2000년 1월 1일 이전에 입사한 사원의 정보는 EMP_OLD 테이블에 삽입하고
-- 2000년 1월 1일 이후에 입사한 사원의 정보는 EMP_NEW 테이블에 삽입한다.
INSERT ALL
WHEN HIRE_DATE < '2000/01/01' THEN
    INTO EMP_OLD VALUES(EMP_ID, EMP_NAME, SALARY, HIRE_DATE)
WHEN HIRE_DATE >= '2000/01/01' THEN
    INTO EMP_NEW VALUES(EMP_ID, EMP_NAME, SALARY, HIRE_DATE)
SELECT EMP_ID, EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE;

SELECT * FROM EMP_OLD;
SELECT * FROM EMP_NEW;
   
DROP TABLE EMP_OLD;
DROP TABLE EMP_NEW;