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

SELECT RPAD(', ' || COLUMN_NAME, 17) || ' AS "' || COMMENTS || '"'
  FROM ALL_COL_COMMENTS
 WHERE TABLE_NAME = 'EMPLOYEE'
;

SELECT 'SELECT *  FROM ' || TABLE_NAME || ';'
  FROM ALL_TABLES
 WHERE OWNER = 'C##KH';


SELECT * FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;
SELECT * FROM JOB;
SELECT * FROM LOCATION;
SELECT * FROM NATIONAL;
SELECT * FROM SAL_GRADE;

SELECT 'SELECT * FROM ' || TABLE_NAME || ';'
  FROM ALL_TABLES WHERE OWNER = 'C##KH';

SELECT * FROM ALL_TAB_COLUMNS
 WHERE TABLE_NAME = 'EMPLOYEE'
;
/*
<SUBQUERY>
    하나의 SQL 문 안에 포함된 또 다른 SQL 문장을 서브 쿼리라 한다.
 */
-- SUBQUERY 예시
-- 1. 노옹철 사원과 같은 부서원들을 조회
--      1) 노옹철 사원의 부서코드 조회
SELECT DEPT_CODE
  FROM EMPLOYEE
 WHERE EMP_NAME = '노옹철'
;
--      2) 부서코드가 노옹철 사원의 부서코드와 동일한 사원들을 조회
SELECT EMP_NAME
     , DEPT_CODE
  FROM EMPLOYEE
 WHERE DEPT_CODE = 'D9'
;

--      3) SUBQUERY 를 사용하여 하나의 쿼리문으로 작성
SELECT EMP_NAME
     , DEPT_CODE
  FROM EMPLOYEE
 WHERE DEPT_CODE = (
                   SELECT DEPT_CODE
                     FROM EMPLOYEE
                    WHERE EMP_NAME = '노옹철'
                   )
;
-- 2. 전 직원의 평균 급여보다 더 많은 급여를 받고 있는 사원들의 사번, 직원명, 직급코드, 급여를 조회
--      1) 전직원의 평균 급여조회
SELECT AVG(NVL(SALARY, 0)) AS "급여"
  FROM EMPLOYEE;

--      2) 평균급여보다 더 많은 급여를 받고 있는 직원들을 조회
SELECT EMP_NAME
     , EMP_ID
     , JOB_CODE
     , SALARY
  FROM EMPLOYEE
 WHERE SALARY >= 3047662.60869565217391304347826086956522
;
--      3) SUBQUERY 를 사용하여 하나의 쿼리문으로 작성
SELECT EMP_NAME
     , EMP_ID
     , JOB_CODE
     , SALARY
  FROM EMPLOYEE
 WHERE SALARY >= (
                 SELECT AVG(NVL(SALARY, 0)) AS SALARY
                   FROM EMPLOYEE
                 )
;
/*
<SUBQUERY 구분>
    SUBQUERY는 SUBQUERY를 수행한 결과 값의 행과 열의 개수에 따라서 분류할 수 있다.

    1.단일행 서브쿼리
        서브쿼리의 조회 결과 값의 개수가 1개일때
*/

-- 최저급여를 받는 직원의 사번, 직원명, 직급코드 , 급여, 입사일 조회
--  1) 최저급여 조회
SELECT MIN(SALARY)   FROM EMPLOYEE;

--  2) 최저급여를 받는 직원을 조회
SELECT EMP_NO
     , EMP_NAME
     , JOB_CODE
     , SALARY
     , HIRE_DATE
  FROM EMPLOYEE
 WHERE SALARY = 1380000;
--  3) SUBQUERY 를 사용하여 하나의 쿼리문으로 작성
SELECT EMP_NO
     , EMP_NAME
     , JOB_CODE
     , SALARY
     , HIRE_DATE
  FROM EMPLOYEE
 WHERE SALARY = ( SELECT MIN(SALARY)   FROM EMPLOYEE );


-- 노옹철 사원의 급여보다 더 많이 받는 사원의 사번, 직원명, 부서명, 급여 조회
SELECT E.EMP_NAME       AS "사번"
     , E.EMP_NAME       AS "직원명"
     , D.DEPT_TITLE     AS "부서명"
     , E.SALARY         AS "급여"
  FROM EMPLOYEE         E
 INNER JOIN
       DEPARTMENT       D
    ON E.DEPT_CODE      = D.DEPT_ID
 WHERE SALARY           > (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME = '노옹철');



-- 오라클 구문
SELECT E.EMP_NAME       AS "사번"
     , E.EMP_NAME       AS "직원명"
     , D.DEPT_TITLE     AS "부서명"
     , E.SALARY         AS "급여"
  FROM EMPLOYEE         E
     , DEPARTMENT       D
 WHERE E.DEPT_CODE      = D.DEPT_ID
   AND SALARY           > (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME = '노옹철');

-- 전지연 사원이 속해있는 부서의 부서원들의 사번, 직원명, 전화번호, 직급명, 부서명, 입사일 조회
-- 단, 전지연 사원은 제외

--  1) 전지연 사원이 속해있는 부서조회
--  2) 전지연 사원이 속해있는 부서원들 조회

-- AMERICAN NATIONAL STANDARDS INSTITUTE
SELECT E.EMP_NO         AS "사번"
     , E.EMP_NAME       AS "직원명"
     , E.PHONE          AS "전화번호"
     , J.JOB_NAME       AS "직급명"
     , D.DEPT_TITLE     AS "부서명"
     , E.HIRE_DATE      AS "입사일"
  FROM EMPLOYEE         E
 INNER JOIN
       JOB              J
    ON E.JOB_CODE       = J.JOB_CODE
 INNER JOIN
       DEPARTMENT       D
    ON E.DEPT_CODE      = D.DEPT_ID
 WHERE DEPT_CODE        = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '전지연')
   AND EMP_NAME         <> '전지연';

-- 오라클
SELECT E.EMP_NO         AS "사번"
     , E.EMP_NAME       AS "직원명"
     , E.PHONE          AS "전화번호"
     , J.JOB_NAME       AS "직급명"
     , D.DEPT_TITLE     AS "부서명"
     , E.HIRE_DATE      AS "입사일"
  FROM EMPLOYEE         E
     , JOB              J
     , DEPARTMENT       D
 WHERE E.JOB_CODE       = J.JOB_CODE
   AND E.DEPT_CODE      = D.DEPT_ID
   AND DEPT_CODE        = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '전지연')
   AND EMP_NAME         <> '전지연';

-- 부서별 급여의 합이 가장 큰 부서의 부서코드, 급여의 합 조회
-- 1) 부서별 급여의 합
SELECT DEPT_CODE AS "부서코드"
     , SUM(SALARY) AS "급여"
  FROM EMPLOYEE
 GROUP BY DEPT_CODE;

-- 2) 부서별 급여중 가장 큰 값
SELECT MAX(SUM(SALARY)) AS "급여"
  FROM EMPLOYEE
 GROUP BY DEPT_CODE;

-- 3) 부서별 급여의 합이 가장 큰 부서의 부서코드, 급여의 합 조회
SELECT DEPT_CODE   AS "부서코드"
     , SUM(SALARY) AS "급여"
  FROM EMPLOYEE
 GROUP BY DEPT_CODE
HAVING SUM(SALARY) = ( SELECT MAX(SUM(SALARY)) AS "급여"   FROM EMPLOYEE  GROUP BY DEPT_CODE)
;
/*
    2. 다중행 서브쿼리
        서브쿼리의 조회 결과 값의 개수가 여러행 일 때

    ANY : 여러개의 값들 중에서 조건을 한개라도 만족하면 TRUE 리턴한다.
            SALARY > ANY(...) : 최솟값보다 크면         TRUE 리턴한다.
            SALARY < ANY(...) : 최댓값보다 작으면       TRUE 리턴한다.

    ALL : 여러개의 값들 중에서 조건을 모두 만족하면     TRUE 리턴한다.
            SALARY > ALL (...) : 최댓값보다 크면        TRUE 리턴한다.
            SALARY < ALL (...) : 최솟값보다 작으면      TRUE 리턴한다.
*/
-- 각 부서별 최고 급여를 받는 직원의 사원명, 직급코드, 부서코드, 급여
-- 각 부서별 최고 급여 조회
SELECT MAX(SALARY)
  FROM EMPLOYEE
 GROUP BY DEPT_CODE;

-- 위 급여를 받는 사원들을 조회
SELECT EMP_NAME
     , JOB_CODE
     , DEPT_CODE
     , SALARY
  FROM EMPLOYEE
 WHERE SALARY IN(SELECT MAX(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE)
ORDER BY DEPT_CODE
;


-- 전체 직원에 대해 사번, 이름, 부서코드, 구분(사수/사원) 조회
-- 사수에 해당하는 사번을 조회
SELECT *
  FROM EMPLOYEE
 WHERE EMP_ID IN(
SELECT DISTINCT MANAGER_ID FROM EMPLOYEE
 WHERE MANAGER_ID IS NOT NULL);

SELECT *
  FROM EMPLOYEE
 WHERE EMP_ID NOT IN(
SELECT DISTINCT MANAGER_ID FROM EMPLOYEE
 WHERE MANAGER_ID IS NOT NULL)
   AND MANAGER_ID IS NULL
;

-- 사번이 위와 같은 사원들의 사번, 이름, 부서코드, 구분(사수/사원) 조회

SELECT EMP_ID    AS "사번"
     , EMP_NAME  AS "이름"
     , DEPT_CODE AS "부서코드"
     , '사수'    AS "구분"
  FROM EMPLOYEE
 WHERE EMP_ID    IN(SELECT DISTINCT MANAGER_ID FROM EMPLOYEE  WHERE MANAGER_ID IS NOT NULL)
UNION
SELECT EMP_ID    AS "사번"
     , EMP_NAME  AS "이름"
     , DEPT_CODE AS "부서코드"
     , '사원'    AS "구분"
  FROM EMPLOYEE
 WHERE EMP_ID    NOT IN(SELECT DISTINCT MANAGER_ID FROM EMPLOYEE  WHERE MANAGER_ID IS NOT NULL)
;














-- SELECT 절에 서브쿼리 사용하는 방법
SELECT EMP_ID    AS "사번"
     , EMP_NAME  AS "이름"
     , DEPT_CODE AS "부서코드"
     , CASE WHEN EMP_ID IN(SELECT DISTINCT MANAGER_ID FROM EMPLOYEE  WHERE MANAGER_ID IS NOT NULL) THEN '사수'
            ELSE '사원'
        END      AS "구분"
  FROM EMPLOYEE
;

-- SELECT 절에 서브쿼리 사용하는 방법
SELECT EMP_ID    AS "사번"
     , EMP_NAME  AS "이름"
     , DEPT_CODE AS "부서코드"
     , CASE WHEN EMP_ID IN(SELECT DISTINCT MANAGER_ID FROM EMPLOYEE  WHERE MANAGER_ID IS NOT NULL) THEN '사수'
            ELSE '사원'
        END      AS "구분"
  FROM EMPLOYEE
;





-- 대리 직급임에도 과장 직급들의 최소 급여보다 많이 받는 직원의 사번, 직원명, 직급코드, 급여 조회
-- 과장 직급들의 최소급여 조회

SELECT * FROM JOB ;

SELECT SALARY
  FROM EMPLOYEE
 WHERE JOB_CODE = 'J5';

-- 직급이 대리인 직원들 중에서 위의 목록 값 중 하나라도 큰 경우
SELECT *
  FROM EMPLOYEE
 WHERE JOB_CODE = 'J6'
   AND SALARY > ANY(SELECT SALARY FROM EMPLOYEE WHERE JOB_CODE = 'J5')
 ORDER BY SALARY
;

-- 과장 직급임에도 차장 직급들의 최대 급여보다 더 많이 받는 사원들의 사번, 직원명, 직급코드, 급여 조회
-- 차장 직급들의 급여 조회

SELECT * FROM JOB ; --J4
--J4	차장
--J5	과장


SELECT SALARY
  FROM EMPLOYEE
 WHERE JOB_CODE = 'J4';

SELECT EMP_NO
     , EMP_NAME
     , JOB_CODE
     , SALARY
  FROM EMPLOYEE
 WHERE JOB_CODE = 'J5'
   AND SALARY >= ALL(SELECT SALARY FROM EMPLOYEE WHERE JOB_CODE = 'J4')
;

/*
    3. 다중열 서브 쿼리
        서브 쿼리의 조회 결과 값은 한 행이지만 컬럼의 수가 여러개 일 때
 */
-- 하이유 사원과 같은 부서코드, 같은 직급 코드에 해당하는 사원들을 조회
SELECT *
  FROM EMPLOYEE
 WHERE EMP_NAME = '하이유'
;
-- 부서코드가 D5 이면서, 직급코드가 J5인 사원들을 조회
SELECT EMP_NAME
     , DEPT_CODE
     , JOB_CODE
  FROM EMPLOYEE
 WHERE (DEPT_CODE , JOB_CODE) IN(SELECT DEPT_CODE , JOB_CODE FROM EMPLOYEE WHERE EMP_NAME = '하이유')
;


-- 박나라 사원관 직급코드가 일치하면서 같은 사수를 가지고 있는 사원의 사번, 직원명, 직급코드, 사수 사번 조회
-- 박나라 사원의 직급코드, 사수 사번을 조회
SELECT JOB_CODE
     , MANAGER_ID
  FROM EMPLOYEE
 WHERE EMP_NAME = '박나라'
;

-- 박나라 사원과 직급 코드가 일치하면서 같은 사수를 가지고 있는 사원 조회
SELECT EMP_ID                  AS "사번"
     , EMP_NAME                AS "직원명"
     , JOB_CODE                AS "직급코드"
     , MANAGER_ID              AS "사수사번"
  FROM EMPLOYEE
 WHERE (JOB_CODE, MANAGER_ID)  IN(SELECT JOB_CODE , MANAGER_ID
                                    FROM EMPLOYEE
                                   WHERE EMP_NAME = '박나라')
;
/*
    4. 다중행 다중열 서브쿼리
        서브쿼리의 조회 결과 값이 여러행, 여러열일 경우
 */
-- 각 직급별로 최소 급여를 받는 사원들의 사번, 직원명, 직급코드, 급여 조회
-- 각 직급별 최소급여 조회
SELECT JOB_CODE
     , MIN(SALARY)
  FROM EMPLOYEE
 GROUP BY JOB_CODE
;
-- 각 직급별로 최소급여를 받는 사원 조회
SELECT EMP_ID
     , EMP_NAME
     , JOB_CODE
     , SALARY
  FROM EMPLOYEE
 WHERE (JOB_CODE, SALARY) IN(SELECT JOB_CODE
                                  , MIN(SALARY)
                               FROM EMPLOYEE
                              GROUP BY JOB_CODE)
 ORDER BY JOB_CODE;


-- 각 부서별 최소 급여를 받는 사원들의 사번, 사원명, 부서코드, 급여 조회
-- 각 부서별 최소 급여 조회
SELECT DEPT_CODE
     , MIN(SALARY)
  FROM EMPLOYEE
 GROUP BY DEPT_CODE;

-- 다중행 다중열 서브쿼리를 사용해서 조회
SELECT EMP_ID
     , EMP_NAME
     , NVL(DEPT_CODE, '부서없음')
     , SALARY
  FROM EMPLOYEE
 WHERE (NVL(DEPT_CODE, '부서없음'), SALARY) IN(SELECT NVL(DEPT_CODE, '부서없음')
                                                    , MIN(SALARY)
                                                 FROM EMPLOYEE
                                                GROUP BY NVL(DEPT_CODE, '부서없음'))
 ORDER BY DEPT_CODE;
/*
    <인라인 뷰>
        FROM 절에 서브 쿼리를 제시하고, 서브 쿼리를 수행한 결과를 테이블 대신에 사용한다.
 */
-- 전 직원 중 급여가 가장 높은 사원 5명 순위, 이름, 급여 조회
-- ROWNUM : 오라클에서제공하는 컬럼, 조회된 순서대로 1부터 순번을 부여하는 컬럼이다.
-- FROM -> SELECT(순번(ROWNUM)이 정해진다.) -> ORDER BY
SELECT ROWNUM
     , EMP_NAME AS "사원명"
     , SALARY   AS "급여"
  FROM EMPLOYEE
 WHERE ROWNUM   <= 5
 ORDER BY SALARY DESC
;
-- 이미 순번이 정해진 다음에 정렬이 되었다.

SELECT ROWNUM
     , E.EMP_NAME
     , E.SALARY
  FROM (
       SELECT EMP_NAME
            , SALARY
         FROM EMPLOYEE
        WHERE ROWNUM   <= 5
        ORDER BY SALARY DESC
       ) E
;

-- 부서별 평균 급여가 높은 3개의 부서의 부서 코드, 평균급여 조회
SELECT ROWNUM
     , DEPT_TITLE AS "부서명"
     , S."평균 급여"
  FROM (
       SELECT NVL(DEPT_CODE, '부서없음') AS "부서 코드"
            , FLOOR(AVG(NVL(SALARY, 0))) AS "평균 급여"
         FROM EMPLOYEE
        GROUP BY DEPT_CODE
        ORDER BY FLOOR(AVG(NVL(SALARY, 0))) DESC
       )  S
 INNER JOIN
       DEPARTMENT D
    ON S."부서 코드" = D.DEPT_ID
;

-- WITH 를 사용하는 방법
  WITH TOPN_SALARY AS(
       SELECT NVL(DEPT_CODE, '부서없음') AS "부서 코드"
            , FLOOR(AVG(NVL(SALARY, 0))) AS "평균 급여"
         FROM EMPLOYEE
        GROUP BY DEPT_CODE
        ORDER BY FLOOR(AVG(NVL(SALARY, 0))) DESC
)
SELECT ROWNUM
     , "부서 코드"
     , "평균 급여"
  FROM TOPN_SALARY
 WHERE ROWNUM <= 3
;

/* 
    <RANK 함수>
        RANK() OVER(정렬기준) / DENSE_RANK() OVER(정렬기준)
*/
-- 사원 별 급여가 순서대로 순위 매겨서 순의 직원명, 급여 조회

-- 공동 19위 2명 뒤에 순위 는 21위 
SELECT RANK() OVER(ORDER BY SALARY DESC) AS "순위"
     , EMP_NAME AS "직원명"
     , SALARY   AS "급여"
  FROM EMPLOYEE
;
-- 공동 19위 2명 뒤에 순위 는 20위 
SELECT DENSE_RANK() OVER(ORDER BY SALARY DESC) AS "순위"
     , EMP_NAME AS "직원명"
     , SALARY   AS "급여"
  FROM EMPLOYEE
;

-- ********************************* 상위 5명만 조회 ***********************************************
SELECT DENSE_RANK() OVER(ORDER BY SALARY DESC) AS "순위"
     , EMP_NAME AS "직원명"
     , SALARY   AS "급여"
  FROM EMPLOYEE
-- WHERE DENSE_RANK() OVER(ORDER BY SALARY DESC) <= 5
-- RANK함수는 WHERE 절에 사용할 수 없다.
;
SELECT "순위"
     , "직원명"
     , "급여"
  FROM (
SELECT DENSE_RANK() OVER(ORDER BY SALARY DESC) AS "순위"
     , EMP_NAME AS "직원명"
     , SALARY   AS "급여"
  FROM EMPLOYEE
)
 WHERE "순위" <= 5
;
-- ********************************************************************************