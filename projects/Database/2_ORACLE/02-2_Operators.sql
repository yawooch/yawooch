
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
 WHERE 1 = 1
;
*/
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
<연산연결자>
    여러 컬럼 값들을 하나의 컬럼인 것처럼 연결하고나,
    컬럼과 리터럴을 연결할 수 있는 연산자이다
*/
-- EMPLOYEE 테이블에서 사번, 직원명, 급여를 연결해서 조회
SELECT EMP_ID || EMP_NAME || SALARY AS "사번, 직원명, 급여"
  FROM EMPLOYEE;

SELECT EMP_NAME || '의 월급은 '  || SALARY || '원 입니다.' AS "직원명 급여"
  FROM EMPLOYEE;
/*
<논리연산자>
*/
-- EMPLOYEE 테이블에서 부서코드가 D6 이면서 급여가 300만원 이상 인 직원들의 사번, 직원명, 부서코드, 급여 조회
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
 WHERE DEPT_CODE = 'D6'
   AND SALARY    >= 3000000;

-- 1. EMPLOYEE 테이블에서 부서코드 가 D5 이거나 급여가 500 만원 이상인 직원들의 사번, 직원명, 부서코드, 급여 조회
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
 WHERE DEPT_CODE    = 'D5'
    OR SALARY       >= 5000000;

-- 2. EMPLOYEE 테이블에서 부서코드 가 D6 이 아니고 급여가 200 만원 미만인 직원들의 사번, 직원명, 부서코드, 급여 조회
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
 WHERE 1 = 1
   AND DEPT_CODE    != 'D6'
   AND SALARY       < 2000000;

-- EMPLOYEE 테이블에서 급여가 350만원 이상 600 만원 이하를 받는 직원의 사번, 직원명, 부서코드, 급여조회
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
 WHERE SALARY       >= 3500000
   AND SALARY       <= 6000000
 ORDER BY SALARY
;

-- EMPLOYEE 테이블에서 급여가 350 만원 이상 600 만원 이하를 받는 직원의 사번, 직원명, 부서코드, 급여 조회(BETWEEN AND 연산자 사용)
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
 WHERE SALARY/10000  BETWEEN 350 AND 600
 ORDER BY SALARY
;
-- EMPLOYEE 테이블에서 급여가 350 만원 이상 600 만원 이하 가 아닌 직원의 사번, 직원명, 부서코드, 급여 조회(NOT BETWEEN AND 연산자 사용)
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
-- NOT 연산자는 컬럼명 앞 또는 BETWEEN 앞에 사용가능
-- WHERE SALARY/10000 NOT BETWEEN 350 AND 600
 WHERE NOT SALARY/10000 NOT BETWEEN 350 AND 600
 ORDER BY SALARY
;
-- EMPLOYEE 테이블에서 입사일이 '90/01/01' ~ '01/01/01' 인 사원들의 모든 컬럼 조회
SELECT EMP_ID       AS "사번"
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
 WHERE HIRE_DATE BETWEEN '90/01/01' AND  '01/01/01'
 ORDER BY HIRE_DATE DESC
;
-- EMPLOYEE 테이블에서 입사일이 '90/01/01' ~ '01/01/01' 이 아닌 사원들의 모든 컬럼 조회
SELECT EMP_ID       AS "사번"
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
 WHERE HIRE_DATE NOT BETWEEN '90/01/01' AND  '01/01/01'
 ORDER BY HIRE_DATE DESC
;

/*
<LIKE>
    [표현법]
    WHERE 컬럼 LIKE '패턴'
        - 비교하려는 컬럼의 값이 지정된 패턴을 만족할 경우 검색 대상이 된다.
        - 패턴에는 '%', '_'를 와일드카드로 사용할 수 있다.
            '%' : 0글자 이상
                ex) 컬럼  LIKE '문자%'   =>  컬럼값중에 '문자'로 시작하는     모든 행을 조회한다.
                    컬럼  LIKE '%문자'   =>  컬럼값중에 '문자'로 끝나는       모든 행을 조회한다.
                    컬럼  LIKE '%문자%'  =>  컬럼값중에 '문자'가 포함되어있는 모든 행을 조회한다.
            '_' : 1글자
                ex) 컬럼  LIKE '_문자'   =>  컬럼값중에 '문자'앞에 무조건 한글자가 오는 모든 행을 조회한다.
                    컬럼  LIKE '__문자'  =>  컬럼값중에 '문자'앞에 무조건 두글자가 오는 모든 행을 조회한다.
*/

-- EMPLOYEE 테이블에서 성이 전 씨인 사원의 직원명, 급여, 입사일 조회
SELECT EMP_NAME     AS "직원명"
     , SALARY       AS "급여"
     , HIRE_DATE    AS "입사일"
  FROM EMPLOYEE
 WHERE EMP_NAME LIKE '전%'
;
-- EMPLOYEE 테이블에서 김 씨 성이 아닌 사원의 사번, 직원명, 입사일 조회
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , HIRE_DATE    AS "입사일"
  FROM EMPLOYEE
-- WHERE EMP_NAME NOT LIKE '김%'
-- WHERE NOT EMP_NAME LIKE '김%'
-- WHERE NOT EMP_NAME NOT LIKE '김%'
 ORDER BY EMP_NAME
;

-- EMPLOYEE 테이블에서 이름중에 '하' 가 포함된 사원의 직원명, 주민번호, 부서코드 조회
SELECT EMP_NAME     AS "직원명"
     , EMP_NO       AS "주민등록번호"
     , DEPT_CODE    AS "부서코드"
  FROM EMPLOYEE
-- WHERE EMP_NAME LIKE '_%하%'
 WHERE EMP_NAME LIKE '하__'
    OR EMP_NAME LIKE '_하_'
    OR EMP_NAME LIKE '__하'
    OR EMP_NAME LIKE '___하'
;

-- EMPLOYEE 테이블에서 전화번호 4번째 자리가 9로 시작하는 사원의 사번, 직원명, 전화번호, 이메일 조회한다
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , BONUS        AS "보너스율"
     , PHONE        AS "전화번호"
     , EMAIL        AS "이메일"
  FROM EMPLOYEE
 WHERE PHONE        LIKE '___9%'
-- WHERE PHONE        LIKE '___9_______'
--    OR PHONE        LIKE '____9______'
--    OR PHONE        LIKE '_____9_____'
--    OR PHONE        LIKE '______9____'
--    OR PHONE        LIKE '_______9___'
--    OR PHONE        LIKE '________9__'
--    OR PHONE        LIKE '_________9_'
--    OR PHONE        LIKE '__________9'
;

SELECT * FROM ALL_COL_COMMENTS
 WHERE TABLE_NAME = 'EMPLOYEE'
;


SELECT EMP_ID     AS "사원번호"
     , EMP_NAME   AS "직원명"
     , EMP_NO     AS "주민등록번호"
     , EMAIL      AS "이메일"
     , PHONE      AS "전화번호"
     , DEPT_CODE  AS "부서코드"
     , JOB_CODE   AS "직급코드"
     , SALARY     AS "급여"
     , BONUS      AS "보너스율"
     , MANAGER_ID AS "관리자사번"
     , HIRE_DATE  AS "입사일"
     , ENT_DATE   AS "퇴사일"
     , ENT_YN     AS "퇴직여부"
  FROM EMPLOYEE
 WHERE EMAIL LIKE '___$_%' ESCAPE '$'
;

--  EMPLOYEE 테이블에서 이름이 '연'으로 끝나는 사원의 직원명, 입사일 조회
SELECT EMP_NAME    AS "직원명"
     , HIRE_DATE   AS "입사일"
  FROM EMPLOYEE
 WHERE EMAIL LIKE '%연'
;

-- EMPLOYEE 테이블에서 전화번호 처음 3자리가 010이 아닌 사원의 직원명, 전화번호 조회
SELECT EMP_NAME    AS "직원명"
     , PHONE       AS "전화번호"
  FROM EMPLOYEE
 WHERE PHONE NOT LIKE '010%'
;

-- DEPARTMENT 테이블에서 해외영업부 에 대한 모든 컬럼 조회
SELECT DEPT_ID     AS "부서코드"
     , DEPT_TITLE  AS "부서명"
     , LOCATION_ID AS "지역코드"
  FROM DEPARTMENT
 WHERE DEPT_TITLE LIKE '해외영업%'
;
/*
<IS NULL>
    컬럼 값에 NULL이 있을 경우 NULL 값 비교에 사용된다.
*/

-- EMPLOYEE 테이블에서 보너스를 받지 않는 사원의 사번, 직원명, 급여, 보너스를 조회
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , SALARY       AS "급여"
     , BONUS        AS "보너스율"
  FROM EMPLOYEE
 -- WHERE BONUS = NULL -- NULL 은 비교 연산자로 비교할 수 없다.
 WHERE BONUS IS NULL
;

-- EMPLOYEE 테이블에서 관리자가 없는 사원의 직원
SELECT EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , MANAGER_ID   AS "관리자사번"
  FROM EMPLOYEE
 WHERE MANAGER_ID IS NULL
;

-- 1. EMPLOYEE 테이블에서 관리자도 없고, 부서도 배치 받지 않는 사원의 직원명, 부서코드, 관리자사번 조회
SELECT EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , MANAGER_ID   AS "관리자사번"
  FROM EMPLOYEE
 WHERE MANAGER_ID   IS NULL
   AND DEPT_CODE    IS NULL
;

-- 2. EMPLOYEE 테이블에서 부서를 배치 받진 않았지만 보너스를 받는 사원의 직원명, 부서코드, 보너스 조회
SELECT EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , BONUS        AS "보너스율"
  FROM EMPLOYEE
 WHERE DEPT_CODE    IS NULL
   AND BONUS        IS NOT NULL
;


/*
<IN>
    비교하려는 값과 일치하는 값이 목록에 있는지 확인하는 연산자이다
*/
-- EMPLOYEE 테이블에서 부서코드 가 'D5', 'D6', 'D8' 인 사원들의 직원명, 부서코드, 급여 조회
SELECT EMP_NAME     AS "직원명"
     , DEPT_CODE    AS "부서코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
-- WHERE DEPT_CODE = 'D5'
--    OR DEPT_CODE = 'D6'
--    OR DEPT_CODE = 'D8'
 WHERE DEPT_CODE IN('D5','D6', 'D8')
 ORDER BY DEPT_CODE
;

/*
<연산자 우선순위>
*/
-- EMPLOYEE 테이블에서 직급코드 가 'J4' 또는 'J7' 사원들 중 급여가 200만원 이상인 사원들의 직원명, 직급코드, 급여 조회
SELECT EMP_NAME     AS "직원명"
     , JOB_CODE     AS "직급코드"
     , SALARY       AS "급여"
  FROM EMPLOYEE
-- OR 보다 AND 먼저 실행된다.
-- WHERE JOB_CODE    IN('J4','J7')
-- WHERE (JOB_CODE    = 'J4'     OR JOB_CODE    = 'J7')    AND SALARY/10000>= 200
 WHERE JOB_CODE    IN('J4', 'J7')    AND SALARY/10000>= 200
 ORDER BY
       JOB_CODE
     , SALARY
;