/*  자주쓰는 컬럼
SELECT
     , EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , JOB_CODE     AS "직급코드"
     , SALARY       AS "급여"
     , BONUS        AS "보너스율"
     , HIRE_DATE    AS "입사일"
     , ENT_DATE     AS "퇴사일"
     , ENT_YN       AS "퇴직여부"
     , EMP_NO       AS "주민등록번호"
     , EMAIL        AS "이메일"
     , PHONE        AS "전화번호"
     , MANAGER_ID   AS "관리자사번"
  FROM EMPLOYEE
 WHERE 1 = 1
;
*/

SELECT ', ' || COLUMN_NAME || ' AS "' || COMMENTS || '"'
  FROM ALL_COL_COMMENTS
 WHERE TABLE_NAME = 'EMPLOYEE'
;

SELECT OWNER ,
       TABLE_NAME ,
       COLUMN_NAME ,
       COMMENTS ,
       ORIGIN_CON_ID
  FROM ALL_COL_COMMENTS
 WHERE TABLE_NAME = 'EMPLOYEE';

SELECT * FROM ALL_TABLES;
SELECT * FROM ALL_TAB_COLUMNS
 WHERE TABLE_NAME = 'EMPLOYEE'
;

/*
    <GROUP BY>
        그룹 기준을제시할 수 있는 구문이다
        여러개의 값들을 하나의 그룹으로 묶어서 처리할 목적으로 사용한다.
*/
-- EMPLOYEE 테이블에서 부서별 급여의 합계를 조회
SELECT DEPT_CODE
     , SUM(SALARY)
  FROM EMPLOYEE
 GROUP BY DEPT_CODE
 ORDER BY DEPT_CODE
;

-- EMPLOYEE 테이블에서 직급별 급여의 합계를 조회(단, 직급별 내림차수 정렬)
SELECT JOB_CODE    AS "직급"
     , SUM(SALARY) AS SALARY
  FROM EMPLOYEE
 GROUP BY JOB_CODE
 ORDER BY JOB_CODE DESC;

-- EMPLOYEE 테이블에서 부서별 사원의 수를 조회
SELECT NVL(DEPT_CODE, '부서없음')  AS "부서"
     , COUNT(*)                    AS COUNT
  FROM EMPLOYEE
 GROUP BY DEPT_CODE
 ORDER BY DEPT_CODE;

-- EMPLOYEE 테이블에서 직급별 사원의 수를 조회(단, 직급별 내림차수 정렬)
SELECT JOB_CODE    AS "직급"
     , COUNT(*)    AS COUNT
  FROM EMPLOYEE
 GROUP BY JOB_CODE
 ORDER BY JOB_CODE DESC;

-- EMPLOYEE 테이블에서 부서별 보너스를 받는 사원의 수를 조회
SELECT NVL(DEPT_CODE, '부서없음')  AS "부서"
     , COUNT(BONUS)                AS COUNT
  FROM EMPLOYEE
-- WHERE BONUS IS NOT NULL
 GROUP BY DEPT_CODE
 ORDER BY DEPT_CODE;


-- EMPLOYEE 테이블에서 직급별 보너스를 받는 사원의 수를 조회(단, 직급별 내림차수 정렬)
SELECT JOB_CODE       AS "직급"
     , COUNT(BONUS)   AS COUNT
  FROM EMPLOYEE
-- WHERE BONUS IS NOT NULL
 GROUP BY JOB_CODE
 ORDER BY JOB_CODE DESC;


-- EMPLOYEE 테이블에서 직급별 급여의 평균을 조회
SELECT JOB_CODE              AS JOB_CODE
     , ROUND(AVG(SALARY), 2) AS SALARY
  FROM EMPLOYEE
 GROUP BY JOB_CODE
 ORDER BY JOB_CODE;


--- 한용근님 쿼리
SELECT NVL(DEPT_CODE,'부서 없음'),
TO_CHAR(ROUND(AVG(NVL(SALARY,0)), 3),'FML999,999,999') AS "급여 평균"
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE
;
-- EMPLOYEE 테이블에서 부서별 사원의 수, 보너스를 받는 사원의 수, 급여의 합, 평균급여, 최고급여, 최저급여를 조회(부서별 내림차순)
SELECT NVL(DEPT_CODE, '부서없음')                                         AS "부서"
     , COUNT(*)                                                           AS CNT
     , COUNT(BONUS)                                                       AS "보너스를 받는 사원의 수"
     , '￦' || LPAD(TO_CHAR(SUM(SALARY)         , 'FM99,999,999.99'), 15) AS SUM_SAL
     , '￦' || LPAD(TO_CHAR(ROUND(AVG(SALARY),2), 'FM99,999,999.99'), 15) AS AVG_SAL
     , '￦' || LPAD(TO_CHAR(MAX(SALARY)         , 'FM99,999,999.99'), 15) AS MAX_SAL
     , '￦' || LPAD(TO_CHAR(MIN(SALARY)         , 'FM99,999,999.99'), 15) AS MIN_SAL
  FROM EMPLOYEE
 GROUP BY DEPT_CODE
 ORDER BY DEPT_CODE DESC
;
--- 송은정님 쿼리
SELECT NVL(DEPT_CODE, '부서없음')                 AS "부서 코드",
       COUNT(*)                                   AS "사원 수",
       COUNT(BONUS)                               AS "보너스를 받는 사원의 수",
       TO_CHAR(SUM(SALARY)       , '999,999,999') AS "부서별 급여의 합",
       TO_CHAR(ROUND(AVG(SALARY)), '999,999,999') AS "부서별 평균 급여",
       TO_CHAR(MAX(SALARY)       , '999,999,999') AS "부서별 최고 급여",
       TO_CHAR(MIN(SALARY)       , '999,999,999') AS "부서별 최저 급여"
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE DESC;

-- EMPLOYEE 테이블에서 성별 별 사원의 수를 조회
SELECT DECODE(SUBSTR(EMP_NO, 8,1), 1, '남자', 2, '여자',3, '남자',4, '여자', '외계인') AS "성별"
     , COUNT(*)                                                                        AS CNT
  FROM EMPLOYEE
 GROUP BY DECODE(SUBSTR(EMP_NO, 8,1), 1, '남자', 2, '여자',3, '남자',4, '여자', '외계인')
 ORDER BY "성별"
;

-- EMPLOYEE 테이블에서 부서코드와 직급코드가 같은 사원의 수, 급여의 합 조회
SELECT DEPT_CODE
     , JOB_CODE
     , COUNT(*)
     , SUM(SALARY)
  FROM EMPLOYEE
 GROUP BY DEPT_CODE, JOB_CODE
 ORDER BY DEPT_CODE, JOB_CODE;

/* 
    <HAVING>
        그룹에 대한 조건을제시할때 사용하는 구문이다.
        GROUP BY 절 이전이든 이후이든 어느곳에 위치해도 상관없다.
    <쿼리 실행순서>
        5. SELECT
        1. FROM
        2. WHERE
        3. GROUP BY
        4. HAVING
        6. ORDER BY
*/

-- EMPLOYEE 테이블에서 부서별로 급여가 300만원 이상인 직원의 평균 급여를 조회
SELECT DEPT_CODE   AS "부서"
     , AVG(SALARY) AS "평균급여"
  FROM EMPLOYEE
 WHERE SALARY/10000 >=  300
 GROUP BY DEPT_CODE
 ORDER BY DEPT_CODE
;

-- EMPLOYEE 테이블에서 부서별 평균 급여가 300만원 이상인 부서의 부서코드와 평균급여를 조회
SELECT DEPT_CODE   AS "부서"
     , TO_CHAR(TRUNC(AVG(SALARY), -1), '999,999,999') AS "평균급여"
  FROM EMPLOYEE
 GROUP BY DEPT_CODE
HAVING AVG(SALARY) > 3000000
 ORDER BY DEPT_CODE
;

-- EMPLOYEE 테이블에서 직급별 총 급여의 합이 10000000 이상인 직급의 직급코드, 급여의 합을 조회
  SELECT JOB_CODE                                               AS "직급코드"
       , '￦' || LPAD(TO_CHAR(SUM(SALARY), 'FM999,999,999'),12) AS "급여"
    FROM EMPLOYEE
GROUP BY JOB_CODE
  HAVING SUM(SALARY) > 10000000
ORDER BY JOB_CODE;

-- EMPLOYEE 테이블에서 부서별 보너스를 받는 사원이 없는 부서의 부서코드를 조회
SELECT NVL(DEPT_CODE, '부서없음')    AS "부서코드"
     , COUNT(BONUS)                  AS "보너스받는사람수"
  FROM EMPLOYEE
 GROUP BY
       NVL(DEPT_CODE, '부서없음')
HAVING COUNT(BONUS) > 0
 ORDER BY 
       DEPT_CODE;
       
-- EMPLOYEE 테이블에서 직급별 급여의 합계를 조회
SELECT DEPT_CODE   AS DEPT_CODE
     , SUM(SALARY) AS SALARY
  FROM EMPLOYEE
-- GROUP BY ROLLUP(DEPT_CODE)
 GROUP BY CUBE(DEPT_CODE)
 ORDER BY DEPT_CODE;

-- EMPLOYEE 테이블에서 직급코드와 부서 코드가 같은 사원들의 급여 합계를 조회
SELECT DEPT_CODE    AS "부서코드"
     , JOB_CODE     AS "직급코드"
     , TO_CHAR(SUM(SALARY), '999,999,999')  AS "급여"
  FROM EMPLOYEE
 WHERE DEPT_CODE IS NOT NULL
 GROUP BY
       ROLLUP(DEPT_CODE, JOB_CODE)
 ORDER BY
       DEPT_CODE
     , JOB_CODE 
;
SELECT GROUPING(DEPT_CODE)    AS "부서코드"
     , DECODE(GROUPING(JOB_CODE), 1, '직급소계',JOB_CODE)     AS "직급코드"
     , TO_CHAR(SUM(SALARY), '999,999,999')  AS "급여"
  FROM EMPLOYEE
 WHERE DEPT_CODE IS NOT NULL
-- ROLLUP(컬럼 1,컬럼 2, ...)   -> 컬럼 1을 가지고 중간집계를 내는 함수
-- CUBE(컬럼 1,컬럼 2, ...)     -> 전달되는 모든 컬럼을 가지고 중간집계를 내는 함수
 GROUP BY
       CUBE(DEPT_CODE, JOB_CODE)
 ORDER BY
       DEPT_CODE
     , JOB_CODE 
;

