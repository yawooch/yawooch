
SELECT * FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;
SELECT * FROM JOB;
SELECT * FROM LOCATION;
SELECT * FROM NATIONAL;
SELECT * FROM SAL_GRADE;
/*
SELECT
     , EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , EMP_NO       AS "주민등록번호"
     , EMAIL        AS "이메일"
     , PHONE        AS "전화번호"
     , DEPT_CODE    AS "부서코드"
     , JOB_CODE     AS "직급코드"
     , SALARY       AS "급여"
     , BONUS        AS "보너스율"
     , MANAGER_ID   AS "관리자사번"
     , HIRE_DATE    AS "입사일"
     , ENT_DATE     AS "퇴사일"
     , ENT_YN       AS "퇴직여부"
  FROM EMPLOYEE
*/


SELECT OWNER ,
       TABLE_NAME ,
       COLUMN_NAME ,
       COMMENTS ,
       ORIGIN_CON_ID
  FROM ALL_COL_COMMENTS
 WHERE TABLE_NAME = 'EMPLOYEE';
/*
<SELECT>
    [표현법]
        SELECT 컬럼[, 컬럼, ...]
          FROM 테이블명;
    - 테이블에서 데이터를 조회할때 사용하는 SQL 구문이다.
    - SELECT 를 통해서 조회된 결과를 RESULT SET이라고 한다.

    - 조회하고자 하는 컬럼들은 반드시 FROM절에 기술한 테이블에 존재하는 컬럼이어야한다.
    - 모든 컬럼의 데이터를 조회할 경우에는 컬럼명 대신 * (아스테리스크)를 넣어준다.
*/

SELECT EMP_ID
     , EMP_NAME
     , EMP_NO
     , EMAIL
     , PHONE
     , DEPT_CODE
     , JOB_CODE
     , SALARY
     , BONUS
     , MANAGER_ID
     , HIRE_DATE
     , ENT_DATE
     , ENT_YN
  FROM EMPLOYEE;

--쿼리는 대소문자를 가리지 않지만 관례상 대문자로 작성한다.
select * from employee;

-- EMPLOYEE 테이블에서 전체 사원의 모든 컬럼 정보 조회
SELECT * FROM EMPLOYEE;

----------------------- 실습 문제 -------------------------
-- 1. JOB 테이블의 직급명 컬럼만 조회
SELECT JOB_NAME FROM JOB;
-- 2. JOB테이블의 모든 컬럼 정보조회
SELECT * FROM JOB;
-- 3. DEPARTMENT 테이블의 모든 컬럼 정보조회
SELECT * FROM DEPARTMENT;
-- 4. EMPLOYEE 테이블의 직원명, 이메일, 전화번호, 입사일 정보만조회
SELECT EMP_NAME , EMAIL , PHONE , HIRE_DATE FROM EMPLOYEE;

-----------------------------------------------------------
/*
<컬럼의 산술연산>
    SELECT 절에 컬럼명 입력 부분에서 산술 연산자를 사용하여 결과를 조회할수 있다.
*/
-- EMPLOYEE테이블에서 직원명, 급여, 연봉(급여*12) 조회
SELECT EMP_NAME
     , SALARY     /10000
     , SALARY * 12/10000
  FROM EMPLOYEE;
-- EMPLOYEE테이블에서 직원명, 급여, 연봉(급여*12) 조회
-- 보너스가 포함된 연봉((급여 + 급여 * 보너스율)*12) 조회
SELECT EMP_NAME
     , SALARY     /10000
     , SALARY * 12/10000
     , (SALARY + SALARY * BONUS) * 12/10000
  FROM EMPLOYEE;

-- 산술 연산중 NULL 값이 존재할 경우 산술 연산의 결과는 무조건 NULL 이다
SELECT NVL(3000000, 0), NVL(NULL, 0) FROM DUAL;

-- NVL() 함수를 이용하여 NULL처리를 한다.
SELECT EMP_NAME
     , SALARY     /10000
     , SALARY * 12/10000
     , (SALARY + SALARY * NVL(BONUS, 0)) * 12/10000
  FROM EMPLOYEE;


-- EMPLOYEE 테이블에서 직원명 , 입사일 ,근무일수(오늘날짜 - 입사일)
-- SYSDATE 는 현재 날짜를 출력한다.
SELECT SYSDATE FROM DUAL;

-- DATE 타입도 연산이 가능하다
SELECT EMP_NAME
     , HIRE_DATE
     , SYSDATE - HIRE_DATE
  FROM EMPLOYEE;

SELECT CEIL(123.456)  FROM DUAL;-- 124
SELECT ROUND(123.456) FROM DUAL;-- 123
--  FLOOR 함수는 매개값으로 전달되는 수를 버림하는 함수이다
SELECT FLOOR(123.456) FROM DUAL;-- 123


SELECT EMP_NAME
     , HIRE_DATE
     , FLOOR(SYSDATE - HIRE_DATE)
  FROM EMPLOYEE;


/*
<컬럼 별칭>
    [표현식](ALIAS)
        컬럼 AS / 컬럼 AS "별칭" / 컬럼 별칭 / 컬럼 "별칭"
*/
-- EMPLOYEE 테이블에서 직원명 , 급여, 연봉, 보너스가 포함된 연봉조회
SELECT EMP_NAME                                     AS 직원명
     , SALARY     /10000                            AS "급여(만원)"
     , SALARY * 12/10000                               연붱만원
     , (SALARY + SALARY * NVL(BONUS, 0)) * 12/10000    "총 소득(원)"
  FROM EMPLOYEE;
/*
<리터럴>
    SELECT 절에 리터를을 사용하면 테이블에 존재하는 데이터처럼 조회가 가능하다
*/
-- EMPLOYEE 테이블에서 사번, 직원명, 급여, 단위(원) 조회
SELECT EMP_ID           AS "사번"
     , EMP_NAME         AS "직원명"
     , SALARY / 10000   AS "급여"
     , '만원'           AS "단위(만원)"
  FROM EMPLOYEE;
/*
<DISTINCT>
    - 컬럼에 포함된 중복값을 한번씩만 표시하고자 할때 사용한다
    - 조회하는 컬럼이 여러개이면 컬럼값들이 모두 동일해야 중복으로 판단되어 중복이 제거된다.
*/
-- EMPLOYEE 테이블에서 직급 코드 조회
SELECT DISTINCT JOB_CODE
  FROM EMPLOYEE
 ORDER BY JOB_CODE;


-- EMPLOYEE 테이블에서 부서코드           조회
SELECT DEPT_CODE
  FROM EMPLOYEE
 ORDER BY DEPT_CODE;

-- EMPLOYEE 테이블에서 부서코드(중복제거) 조회
SELECT DISTINCT NVL(DEPT_CODE, 'D0') AS DEPT_CODE
  FROM EMPLOYEE
 ORDER BY DEPT_CODE DESC;

/*
DISTINCT 는 SELECT 절에 한번만 기술할 수 있다.
--  SELECT DISTINCT JOB_CODE, DISTINCT DEPT_CODE
SELECT JOB_CODE
     , DISTINCT DEPT_CODE
  FROM EMPLOYEE;
*/
SELECT DISTINCT JOB_CODE
     , DEPT_CODE
  FROM EMPLOYEE
 ORDER BY
       JOB_CODE
     , DEPT_CODE;

/*
<WHERE>
    [표현법]
        SELECT 컬럼[, 컬럼, ...]
          FROM 테이블명;
         WHERE 조건식;
     <비교 연산자>
     >, >=, < , <= : 대소 비교
     =, !=, ^=, <> : 동등 비교
*/
-- 1. EMPLOYEE 테이블에서 부서코드가 D9와 일치하는 사원들의 모든 컬럼 조회
SELECT *
  FROM EMPLOYEE
 WHERE DEPT_CODE = 'D9';

-- 2. EMPLOYEE 테이블에서 DEPT_CODE 부서코드가 D9와 일치하지 않는 사원들의 사번, 직원명, 부서 코드 조회
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "사원명"
     , DEPT_CODE    AS "부서코드"
  FROM EMPLOYEE
-- WHERE DEPT_CODE != 'D9';
-- WHERE DEPT_CODE ^= 'D9';
-- WHERE DEPT_CODE <> 'D9';
-- WHERE DEPT_CODE IS NULL;
 WHERE DEPT_CODE    != 'D9' OR DEPT_CODE IS NULL
 ORDER BY
       EMP_ID;

-- 1. EMPLOYEE 테이블에서 직급 코드가 J1 과 일치하는 사원들의 직원명, 부서코드 조회
SELECT EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
  FROM EMPLOYEE
 WHERE JOB_CODE     = 'J1';

-- 2. EMPLOYEE 테이블에서 급여가 400만원 이상 인 사원들의 직원명, 부서코드, 급여 조회
SELECT EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
 WHERE SALARY       >= 4000000;

-- 3. EMPLOYEE 테이블에서 재직중 인 사원들의 사번, 직원명, 입사일 조회
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , HIRE_DATE    AS "입사일"
  FROM EMPLOYEE
 WHERE ENT_YN       = 'N';

-- 4. EMPLOYEE 테이블에서 급여가 300만원 이상 인 사원들의 직원명, 급여, 입사일 조회
SELECT EMP_NAME     AS "직원명"
     , SALARY       AS "급여"
     , HIRE_DATE    AS "입사일"
  FROM EMPLOYEE
 WHERE SALARY       >= 3000000;

-- 5. EMPLOYEE 테이블에서 연봉이 5000만원 이상 인 사원들의 직원명, 급여, 연봉, 입사일 조회
SELECT EMP_NAME     AS "직원명"
     , SALARY       AS "급여"
     , SALARY * 12  AS "연봉"
     , HIRE_DATE    AS "입사일"
  FROM EMPLOYEE
 WHERE SALARY * 12  >= 50000000;

/*

<SELECT 구문이 실행(해석)되는 순서>
 1. FROM     절
 2. WHERE    절
 3. SELECT   절
 4. ORDER BY 절

*/

-- EMPLOYEE 테이블에서 BONUS 오름차순 정렬
SELECT EMP_NAME     AS "직원명"
     , BONUS        AS "보너스율"
  FROM EMPLOYEE
-- ORDER BY BONUS;
-- ORDER BY BONUS ASC; -- 오름차순 정렬은 기본적으로 NULLS LAST
-- ORDER BY BONUS ASC NULLS LAST;
 ORDER BY BONUS ASC NULLS FIRST;
-- NULL이 정렬의 마지막에 온다.

-- EMPLOYEE 테이블에서 BONUS 내림차순 정렬
-- 단, BONUS 값이 일치하는 경우에는 SALARY 오름차순 정렬
SELECT EMP_NAME     AS "직원명"
     , BONUS        AS "보너스율"
     , SALARY       AS "급여"
  FROM EMPLOYEE
-- ORDER BY BONUS DESC; -- 내림차순 정렬은 기본적으로 NULLS FIRST
-- ORDER BY BONUS DESC NULLS LAST;
 ORDER BY
       BONUS NULLS LAST
     , SALARY;

SELECT EMP_NAME     AS "직원명"
     , SALARY *12   AS "연봉"
  FROM EMPLOYEE
-- ORDER BY (SALARY * 12)  DESC; -- DESC
-- ORDER BY 2;                   -- 컬럼 순번 사용
 ORDER BY "연봉" DESC;         -- 별칭 사용