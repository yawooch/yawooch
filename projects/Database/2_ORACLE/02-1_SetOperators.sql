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

/*
<집합 연산자>
    여러 개의 쿼리문을 하나의 쿼리문으로 만드는 연산자이다.
    여러 개의 쿼리문에서 조회하려고 하는 컬럼의 개수와 이름이 같아야 한다.
*/
-- EMPLOYEE 테이블에서 부서코드가 D5인       사원들의 사번, 직원명, 부서코드, 급여를 조회
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
 WHERE DEPT_CODE    = 'D5';


-- EMPLOYEE 테이블에서 급여가 300만원 초과인 사원들의 사번, 직원명, 부서코드, 급여를 조회
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
 WHERE SALARY/10000 > 300;






/*
    1) UNION
        두쿼리문을 수행한 결과값을 하나로 합쳐서 추출한다.
        중복된 행은 제거된다.
*/

-- EMPLOYEE 테이블에서 부서코드가 D5인       사원들의 사번, 직원명, 부서코드, 급여를 조회
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
 WHERE DEPT_CODE    = 'D5'
 UNION
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
 WHERE SALARY/10000 > 300
;
-------------------------<같은결과다른방법>---------------------------------------
-- 위 쿼리문은 WHERE 절에 OR 연산자를 사용해서 조회가 가능하다
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
 WHERE DEPT_CODE    = 'D5'
    OR SALARY/10000 > 300/









/*
    2) UNION ALL
        두쿼리문을 수행한 결과값을 하나로 합쳐서 조회한다.
        중복된 행은 제거되지 않는다.
*/
-- EMPLOYEE 테이블에서 부서코드가 D5인       사원들의 사번, 직원명, 부서코드, 급여를 조회
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
 WHERE DEPT_CODE    = 'D5'
 UNION ALL
-- EMPLOYEE 테이블에서 급여가 300만원 초과인 사원들의 사번, 직원명, 부서코드, 급여를 조회
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
 WHERE SALARY/10000 > 300;


/*
    3) INTERSECT
        두쿼리문을 샐행한 결과값에 중복된 결과값만 조회한다.
*/
-- EMPLOYEE 테이블에서 부서코드가 D5 이면서 급여가 300만원 초과인 사원들의 사번, 직원명, 부서코드, 급여를 조회
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
 WHERE DEPT_CODE    = 'D5'
INTERSECT
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
 WHERE SALARY/10000 > 300;

--------------------------<같은결과다른방법>---------------------------------------
-- 위 쿼리문 WHERE 절에 AND 연산자를 사용해서 조회가 가능하다
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
 WHERE DEPT_CODE    = 'D5'
   AND SALARY/10000 > 300;








/*
    4) MINUS
        선행 쿼리문의 결과값에서 후행 쿼리문의 결과값을 뺀 나머지 결과값만 조회한다.
 */
-- 급여가 300만원 초과인 사원들을 제외해서 조회
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
 WHERE DEPT_CODE    = 'D5'
 MINUS
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
 WHERE SALARY/10000 > 300;

--------------------------<같은결과다른방법>---------------------------------------
-- 위 쿼리문 WHERE 절에 AND 연산자를 사용해서 조회가 가능하다
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
 WHERE DEPT_CODE    = 'D5'
   AND SALARY/10000 <= 300;

/*
    <GROUPING SETS>
        그룹별로 처리된 여러개의 SELELCT 문을 하나로 합친 결과를 만들때 사용한다.
 */

 -- 부서별 사원수
SELECT DEPT_CODE
     , COUNT(*)
  FROM EMPLOYEE
 GROUP BY DEPT_CODE;

-- 직급별 사원수
SELECT JOB_CODE
     , COUNT(*)
  FROM EMPLOYEE
 GROUP BY JOB_CODE;

-- 위 두 개의 쿼리 결과를 한 번에 출력한다.

-- 방법 1
SELECT DEPT_CODE
     , COUNT(*)
  FROM EMPLOYEE
 GROUP BY DEPT_CODE
 UNION ALL
SELECT JOB_CODE
     , COUNT(*)
  FROM EMPLOYEE
 GROUP BY JOB_CODE
 ORDER BY DEPT_CODE;

-- 방법 2 - GROUPING SETS 함수 사용
SELECT DEPT_CODE
     , JOB_CODE
     , COUNT(*)
  FROM EMPLOYEE
 GROUP BY GROUPING SETS(DEPT_CODE, JOB_CODE)
 ORDER BY DEPT_CODE, JOB_CODE NULLS FIRST;
 
 