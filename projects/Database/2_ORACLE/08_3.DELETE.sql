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
<DELETE>
    테이블의 행을 삭제하는 구문이다
*/
COMMIT;

-- EMPLOYEE 테이블에서 EMP_ID 이 200 인 사원의 데이터를 지우기
SELECT * FROM EMPLOYEE WHERE EMP_ID = '200';
DELETE FROM EMPLOYEE WHERE EMP_ID = '200';

-- EMPLOYEE 테이블에서 DEPT_CODE 가 'D5' 인 직원들을 삭제
SELECT * FROM EMPLOYEE WHERE DEPT_CODE = 'D5';
DELETE FROM EMPLOYEE
 WHERE DEPT_CODE = 'D5';

ROLLBACK;

-- DEPARTMENT 테이블에서 DEPT_ID D1 인 부서를 삭제
SELECT * FROM DEPARTMENT WHERE DEPT_ID = 'D1';
DELETE   FROM DEPARTMENT WHERE DEPT_ID = 'D1';
-- D1 값을 참조하는 데이터가 있기 때문에 삭제 불가능



/* 
<TRUNCATE>
    테이블의 전체 행을 삭제하는 구문이다.
*/

CREATE TABLE DEPT_COPY AS
SELECT *
  FROM DEPARTMENT;
  
TRUNCATE TABLE DEPT_COPY;

SELECT * FROM DEPT_COPY;
