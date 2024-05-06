
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

SELECT * FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;
SELECT * FROM JOB;
SELECT * FROM LOCATION;
SELECT * FROM NATIONAL;
SELECT * FROM SAL_GRADE;

SELECT RPAD(', ' || COLUMN_NAME,15) || ' AS "' || COMMENTS || '"' AS CULUMNS
  FROM ALL_COL_COMMENTS
 WHERE TABLE_NAME = 'DEPARTMENT'
;
/*
<JOIN>
    1. INNER JOIN
        1) 오라클 전용구문
            SELECT 컬럼, ...
            FROM 테이블1, 테이블2
            WHERE 테이블1.컬럼 = 테이블2.컬럼
*/
SELECT *
  FROM EMPLOYEE
;

SELECT *
  FROM DEPARTMENT
;
-- 각 사원들의 사번, 직원명, 부서코드, 부서명
-- 1) 오라클 전용구문
--SELECT EMP_ID       AS "사번"
--     , EMP_NAME     AS "직원명"
--     , DEPT_ID      AS "부서코드"
--     , DEPT_TITLE   AS "부서명"
SELECT *
  FROM EMPLOYEE, DEPARTMENT
 WHERE DEPT_CODE = DEPT_ID
   AND EMP_NAME = '유재식'
;
-- 1 - 1) 연결할 두 컬럼명이 다른경우
-- EMPLOYEE 테이블과 DEPARTMENT 테이블을 조인하여 사번, 직원명, 부서코드, 부서명을 조회
-- 일치하는  값이 없는 행은 조회에서 제외된다.
-- DEPT_CODE 가 NULL 인 사원
-- DEPT_ID 가 D3, D4, D7인 부서
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_ID      AS "부서코드"
     , DEPT_TITLE   AS "부서명"
  FROM EMPLOYEE, DEPARTMENT
 WHERE DEPT_CODE = DEPT_ID
   AND EMP_NAME = '유재식';

-- 1 - 2) 연결할 두 컬럼명이 같은 경우
-- EMPLOYEE 테이블과 JOB 테이블을 조인하여 사번, 직원명, 직급코드 직급명을 조회

-- 방법 1) 테이블명을 이용하는 방법
SELECT EMP_ID           AS "사번"
     , EMP_NAME         AS "직원명"
     , JOB.JOB_CODE     AS "직급코드"
     , JOB.JOB_NAME     AS "직급명"
  FROM EMPLOYEE
     , JOB
 WHERE EMPLOYEE.JOB_CODE = JOB.JOB_CODE
;

-- 방법 2) 테이블의 별칭을 이용하는 방법
SELECT E.EMP_ID       AS "사번"
     , E.EMP_NAME     AS "직원명"
     , J.JOB_CODE     AS "직급코드"
     , J.JOB_NAME     AS "직급명"
  FROM EMPLOYEE E
     , JOB      J
 WHERE E.JOB_CODE = J.JOB_CODE
;
/*
2) ANSI 표준구문
    SELECT 컬럼, ...
    FROM 테이블1
    [INNER] JOIN 테이블2 ON 테이블1.컬럼 = 테이블2.컬럼
 */
-- 2-1) 연결할 두 컬럼명이 다른 경우
-- EMPLOYEE 테이블과 DEPARTMENT 테이블을 조인하여 사번, 직원명 부서코드, 부서명을 조회
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , DEPT_ID      AS "부서코드"
     , DEPT_TITLE   AS "부서명"
  FROM EMPLOYEE
 INNER JOIN
       DEPARTMENT
    ON EMPLOYEE.DEPT_CODE = DEPARTMENT.DEPT_ID
 ORDER BY
       DEPT_CODE
;
-- 2-2) 연결할 두컬럼명이 같은 경우
-- EMPLOYEE 테이블과 JOB 테이블을 조인하여 사번, 직원명, 직급코드, 직급명을 조회
SELECT EMPLOYEE.EMP_ID       AS "사번"
     , EMPLOYEE.EMP_NAME     AS "직원명"
     , JOB.JOB_CODE AS "직급코드"
     , JOB.JOB_NAME AS "직급명"
  FROM EMPLOYEE
 INNER JOIN
       JOB
    ON EMPLOYEE.JOB_CODE = JOB.JOB_CODE
 ORDER BY
       JOB.JOB_CODE
;

-- 방법 2) 테이블 별칭을 이용하는 방법
SELECT E.EMP_ID     AS "사번"
     , E.EMP_NAME   AS "직원명"
     , J.JOB_CODE   AS "직급코드"
     , J.JOB_NAME   AS "직급명"
  FROM EMPLOYEE E
  JOIN JOB      J
    ON E.JOB_CODE = J.JOB_CODE
 ORDER BY J.JOB_CODE
;
-- 방법 3) USING 구문을 이용하는 방법
SELECT *
  FROM EMPLOYEE
-- USING 구문을 이용하면 같은 컬럼으로 인식해서 에러가 발생하지 않는다
  JOIN JOB USING(JOB_CODE);

-- 방법 4) NATURAL JOIN을 이용하는 방법(참고)
SELECT EMP_ID     AS "사번"
     , EMP_NAME   AS "직원명"
     , JOB_CODE   AS "직급코드"
     , JOB_NAME   AS "직급명"
  FROM EMPLOYEE
NATURAL JOIN JOB
;

-- EMPLOYEE 테이블과
-- 사번 , 직원명 , 직급명 , 급여를 조회
-- 오라클
SELECT E.EMP_ID       AS "사번"
     , E.EMP_NAME     AS "직원명"
     , J.JOB_NAME     AS "직급명"
     , E.SALARY       AS "급여"
  FROM EMPLOYEE E
     , JOB      J
 WHERE E.JOB_CODE = J.JOB_CODE
   AND J.JOB_NAME = '대리'
 ORDER BY E.EMP_NAME
;

-- ANSI
SELECT *
  FROM EMPLOYEE E
 INNER JOIN JOB J
    ON E.JOB_CODE = J.JOB_CODE
 WHERE J.JOB_NAME = '대리'
 ORDER BY E.EMP_NAME
;

-- 1. DEPARTMENT 테이블과 LOCATION 테이블을 조인하여                    부서코드, 부서명, 지역코드, 지역명을 조회
-- 오라클
SELECT D.DEPT_ID       AS "부서코드"
     , D.DEPT_TITLE    AS "부서명"
     , D.LOCATION_ID   AS "지역코드"
     , L.LOCAL_NAME    AS "지역명"
  FROM DEPARTMENT D
     , LOCATION   L
 WHERE D.LOCATION_ID = L.LOCAL_CODE
 ORDER BY D.DEPT_ID
;
-- ANSI
SELECT D.DEPT_ID       AS "부서코드"
     , D.DEPT_TITLE    AS "부서명"
     , D.LOCATION_ID   AS "지역코드"
     , L.LOCAL_NAME    AS "지역명"
  FROM DEPARTMENT D
 INNER JOIN
       LOCATION   L
    ON D.LOCATION_ID = L.LOCAL_CODE
 ORDER BY D.DEPT_ID
;



-- 2. EMPLOYEE 테이블과 DEPARTMENT 테이블을 조인해서 보너스를 받는 사원들의    사번, 직원명, 보너스, 부서명을 조회
-- 오라클
SELECT EMP_ID        AS "사원번호"
     , EMP_NAME      AS "직원명"
     , BONUS         AS "보너스율"
     , DEPT_TITLE    AS "부서명"
  FROM EMPLOYEE      E
     , DEPARTMENT    D
 WHERE E.DEPT_CODE = D. DEPT_ID
   AND E.BONUS       IS NOT NULL
;
-- ANSI
SELECT EMP_ID        AS "사원번호"
     , EMP_NAME      AS "직원명"
     , BONUS         AS "보너스율"
     , DEPT_TITLE    AS "부서명"
  FROM EMPLOYEE      E
 INNER JOIN
       DEPARTMENT    D
    ON E.DEPT_CODE = D. DEPT_ID
   AND E.BONUS       IS NOT NULL
;

-- 3. EMPLOYEE 테이블과 DEPARTMENT 테이블을 조인해서 인사관리부가 아닌 사원들의       직원명, 부서명, 급여를 조회
-- 오라클
SELECT E.EMP_NAME    AS "직원명"
     , D.DEPT_TITLE  AS "부서명"
     , E.SALARY      AS "급여"
  FROM DEPARTMENT    D
     , EMPLOYEE      E
 WHERE D.DEPT_ID     = E.DEPT_CODE
   AND D.DEPT_TITLE <> '인사관리부'
 ORDER BY E.EMP_NAME
;

-- ANSI
SELECT E.EMP_NAME    AS "직원명"
     , D.DEPT_TITLE  AS "부서명"
     , E.SALARY      AS "급여"
  FROM DEPARTMENT    D
 INNER JOIN
       EMPLOYEE      E
    ON D.DEPT_ID     = E.DEPT_CODE
   AND D.DEPT_TITLE <> '인사관리부'
 ORDER BY E.EMP_NAME
;


-- 4. EMPLOYEE 테이블과 DEPARTMENT 테이블, JOB 테이블을 조인해서                사번, 직원명, 부서명, 직급명 조회
-- 오라클
SELECT E.EMP_ID        AS "사원번호"
     , E.EMP_NAME      AS "직원명"
     , D.DEPT_TITLE    AS "부서명"
     , J.JOB_NAME      AS "직급명"
  FROM EMPLOYEE    E
     , DEPARTMENT  D
     , JOB         J
 WHERE E.DEPT_CODE    = D.DEPT_ID
   AND E.JOB_CODE     = J.JOB_CODE
;
-- ANSI
SELECT E.EMP_ID        AS "사원번호"
     , E.EMP_NAME      AS "직원명"
     , D.DEPT_TITLE    AS "부서명"
     , J.JOB_NAME      AS "직급명"
  FROM EMPLOYEE    E
 INNER JOIN
       DEPARTMENT  D
    ON E.DEPT_CODE     = D.DEPT_ID
 INNER JOIN
       JOB         J
    ON E.JOB_CODE   =   J.JOB_CODE
;
-- NATURAL + NATURAL
SELECT EMP_ID        AS "사원번호"
     , EMP_NAME      AS "직원명"
     , DEPT_TITLE    AS "부서명"
     , JOB_NAME      AS "직급명"
  FROM EMPLOYEE
NATURAL JOIN DEPARTMENT
NATURAL JOIN JOB
;
-- NATURAL + USING 다중 조인 : 가능
SELECT EMP_ID        AS "사원번호"
     , EMP_NAME      AS "직원명"
     , DEPT_TITLE    AS "부서명"
     , JOB_NAME      AS "직급명"
  FROM EMPLOYEE
NATURAL JOIN DEPARTMENT
 INNER JOIN JOB USING(JOB_CODE)
;

-- NATURAL + NATURAL 다중 조인 : 가능
SELECT EMP_ID        AS "사원번호"
     , EMP_NAME      AS "직원명"
     , DEPT_TITLE    AS "부서명"
     , JOB_NAME      AS "직급명"
  FROM EMPLOYEE
NATURAL JOIN DEPARTMENT
NATURAL JOIN JOB
;
-- 같은컬럼명이 아닌 USING + USING 다중 조인 : 같은 컬럼이 아니어서 오류 : ORA-00904: "EMPLOYEE"."DEPT_ID": 부적합한 식별자
SELECT EMP_ID        AS "사원번호"
     , EMP_NAME      AS "직원명"
     , DEPT_TITLE    AS "부서명"
     , JOB_NAME      AS "직급명"
  FROM EMPLOYEE
 INNER JOIN DEPARTMENT USING(DEPT_ID)
 INNER JOIN JOB USING(JOB_CODE)
;

/*
    2) OUTER JOIN
        조인조건을 만족하지 않는 행들을 조회하기 위한 구문이다.
        단, 반드시 기준이되는 테이블(컬럼)을 지정해야한다
        (LEFT, RIGHT, FULL, (+)_
 */

-- OUTER JOIN 과 비교할 INNER JOIN 구문
-- EMPLOYEE 테이블과 DEPARTMENT 테이블을 조인해서 사원들의 사원명, 부서명, 급여, 연봉 조회
-- 부서가 지정되지 않은 사원 2명에 대한 정보가 조회되지 않는다.
-- 부서가 지정되어 있어도 DEPARTMENT 에 부서에 대한 정보가 없으면 조회되지 않는다.
-- ANSI
-- INNER JOIN
SELECT E.EMP_NAME     AS "사원명"
     , D.DEPT_TITLE   AS "부서명"
     , E.SALARY       AS "급여"
     , E.SALARY * 12  AS "연봉"
  FROM EMPLOYEE       E
 INNER JOIN
       DEPARTMENT     D
    ON E.DEPT_CODE    = D.DEPT_ID
 ORDER BY E.DEPT_CODE DESC;

-- LEFT OUTER JOIN
SELECT E.EMP_NAME     AS "사원명"
     , D.DEPT_TITLE   AS "부서명"
     , E.SALARY       AS "급여"
     , E.SALARY * 12  AS "연봉"
  FROM EMPLOYEE       E
  LEFT OUTER JOIN
       DEPARTMENT     D
    ON E.DEPT_CODE    = D.DEPT_ID
 ORDER BY E.DEPT_CODE DESC;

-- 오라클
-- INNER JOIN
SELECT E.EMP_NAME     AS "사원명"
     , D.DEPT_TITLE   AS "부서명"
     , E.SALARY       AS "급여"
     , E.SALARY * 12  AS "연봉"
  FROM EMPLOYEE       E
     , DEPARTMENT     D
 WHERE E.DEPT_CODE    = D.DEPT_ID
 ORDER BY E.DEPT_CODE DESC;

-- LEFT OUTER JOIN
SELECT E.EMP_NAME     AS "사원명"
     , D.DEPT_TITLE   AS "부서명"
     , E.SALARY       AS "급여"
     , E.SALARY * 12  AS "연봉"
  FROM EMPLOYEE       E
     , DEPARTMENT     D
 WHERE E.DEPT_CODE    = D.DEPT_ID(+)
 ORDER BY E.DEPT_CODE DESC;


-- ANSI
-- RIGHT OUTER JOIN
SELECT E.EMP_NAME     AS "사원명"
     , D.DEPT_TITLE   AS "부서명"
     , E.SALARY       AS "급여"
     , E.SALARY * 12  AS "연봉"
  FROM EMPLOYEE       E
 RIGHT OUTER JOIN
       DEPARTMENT     D
    ON E.DEPT_CODE    = D.DEPT_ID
 ORDER BY E.DEPT_CODE DESC;


-- 오라클
-- RIGHT OUTER JOIN
SELECT E.EMP_NAME     AS "사원명"
     , D.DEPT_TITLE   AS "부서명"
     , E.SALARY       AS "급여"
     , E.SALARY * 12  AS "연봉"
  FROM EMPLOYEE       E
     , DEPARTMENT     D
 WHERE E.DEPT_CODE(+) = D.DEPT_ID
 ORDER BY E.DEPT_CODE DESC;


/*
    3) FULL OUTER JOIN
        두 테이블이 가진 모든 행을 조회할때 사용한다
        단, 오라클 구문은 지원하지 않는다.
 */

SELECT E.EMP_NAME     AS "사원명"
     , D.DEPT_TITLE   AS "부서명"
     , E.SALARY       AS "급여"
     , E.SALARY * 12  AS "연봉"
  FROM EMPLOYEE       E
  FULL OUTER JOIN
       DEPARTMENT     D
    ON E.DEPT_CODE    = D.DEPT_ID
 ORDER BY E.DEPT_CODE DESC;


-- 오라클
-- FULL OUTER JOIN : 에러 발생 ORA-01468: outer-join된 테이블은 1개만 지정할 수 있습니다
SELECT E.EMP_NAME     AS "사원명"
     , D.DEPT_TITLE   AS "부서명"
     , E.SALARY       AS "급여"
     , E.SALARY * 12  AS "연봉"
  FROM EMPLOYEE       E
     , DEPARTMENT     D
-- WHERE E.DEPT_CODE(+) = D.DEPT_ID(+)
 ORDER BY E.DEPT_CODE DESC;

/*
    3. CROSS JOIN
        조인되는 모든 테이블의 각 행들이 서로 매핑된 데이터가 검색된다.
 */
SELECT E.EMP_NAME, D.DEPT_TITLE
  FROM EMPLOYEE    E
 CROSS JOIN
       DEPARTMENT  D
 ORDER BY E.EMP_NAME
;

-- 오라클
SELECT E.EMP_NAME, D.DEPT_TITLE
  FROM EMPLOYEE E, DEPARTMENT D
 ORDER BY E.EMP_NAME
;
/*
    4. NON EQUAL JOIN
        조인 조건에 등호(=)를 넣지 않는 조인문을 비등기 조인이라고한다.
 */
-- EMPLOYEE 테이블과 SAL_GRADE 테이블을 비동기 조인하여 직원명 급여, 등급조회
-- ANSI
SELECT E.EMP_NAME
     , E.SALARY
     , S.*
  FROM EMPLOYEE E
 INNER JOIN SAL_GRADE S
--    ON (E.SALARY BETWEEN S.MIN_SAL AND S.MAX_SAL);
    ON (E.SALARY >= S.MIN_SAL AND E.SALARY <= S.MAX_SAL)
 ORDER BY E.SALARY
;

-- 오라클
SELECT E.EMP_NAME
     , E.SALARY
     , S.*
  FROM EMPLOYEE E , SAL_GRADE S
 WHERE E.SALARY BETWEEN S.MIN_SAL AND S.MAX_SAL
;


-- ANSI
SELECT E.EMP_NAME
     , E.SALARY
     , S.*
  FROM EMPLOYEE E
  LEFT JOIN SAL_GRADE S
    ON (E.SALARY BETWEEN S.MIN_SAL AND S.MAX_SAL)
 ORDER BY SALARY
;


-- 오라클
SELECT E.EMP_NAME
     , E.SALARY
     , S.*
  FROM EMPLOYEE E , SAL_GRADE S
 WHERE E.SALARY BETWEEN S.MIN_SAL(+) AND S.MAX_SAL(+)
 ORDER BY SALARY
;

-- EMPLOYEE
-- ANSI
SELECT E.EMP_ID       AS "사번"
     , E.EMP_NAME     AS "사원이름"
     , E.DEPT_CODE    AS "부서코드"
     , E.MANAGER_ID   AS "사수사번"
     , M.EMP_NAME     AS "사수이름"
  FROM EMPLOYEE       E
  LEFT JOIN
       EMPLOYEE       M
    ON E.MANAGER_ID   =  M.EMP_ID
;

-- 오라클
SELECT E.EMP_ID       AS "사번"
     , E.EMP_NAME     AS "사원이름"
     , E.DEPT_CODE    AS "부서코드"
     , E.MANAGER_ID   AS "사수사번"
     , M.EMP_NAME     AS "사수이름"
  FROM EMPLOYEE       E
     , EMPLOYEE       M
 WHERE E.MANAGER_ID   =  M.EMP_ID(+)
;
-- 백성연님 쿼리
SELECT E.EMP_ID    AS "사번",
       E.EMP_NAME  AS "사원 이름",
       E.DEPT_CODE AS "부서 이름",
       --E.MANAGER_ID "사수 사번",
       M.EMP_ID    AS "사수 사번",
       M.EMP_NAME  AS "사수 이름"
  FROM EMPLOYEE E
     , EMPLOYEE M
 WHERE E.MANAGER_ID = M.EMP_ID(+)
;
/*
    6. 다중 JOIN
        여러개의 테이블을 조인하는 경우에 사용한다.
 */
-- EMPLOYEE, DEPARTMENT, LOCATION 테이블을 다중 JOIN 하여 사번, 직원명, 부서명, 지역명을 조회
-- ANSI
SELECT E.EMP_ID         AS "사번"
     , E.EMP_NAME       AS "사원명"
     , D.DEPT_TITLE     AS "부서명"
     , L.LOCAL_NAME     AS "지역명"
  FROM EMPLOYEE         E
  LEFT JOIN DEPARTMENT  D
    ON E.DEPT_CODE      = D.DEPT_ID
  LEFT JOIN LOCATION    L
    ON D.LOCATION_ID    = L.LOCAL_CODE
 ORDER BY E.DEPT_CODE DESC
;


-- 오라클
SELECT E.EMP_ID         AS "사번"
     , E.EMP_NAME       AS "사원명"
     , D.DEPT_TITLE     AS "부서명"
     , L.LOCAL_NAME     AS "지역명"
  FROM EMPLOYEE         E
     , DEPARTMENT       D
     , LOCATION         L
 WHERE E.DEPT_CODE      = D.DEPT_ID(+)
   AND D.LOCATION_ID    = L.LOCAL_CODE(+)
 ORDER BY E.DEPT_CODE DESC
;


------------------------------- 다중 조인 실습 문제 ----------------------------


SELECT * FROM EMPLOYEE;     -- DEPT_CODE                                    SALARY
SELECT * FROM DEPARTMENT;   -- DEPT_ID      LOCATION_ID
SELECT * FROM LOCATION;     --              LOCAL_CODE      NATIONAL_CODE
SELECT * FROM NATIONAL;     --                              NATIONAL_CODE
SELECT * FROM SAL_GRADE;    --                                              MIN_SAL, MAX_SAL

-- 1. 사번(EMP_ID), 직원명(EMP_NAME), 부서명(DEPT_TITLE), 지역명(LOCAL_NAME), 국가명(NATIONAL_NAME), 조회
-- ANSI 표준 구문
SELECT E.EMP_ID          AS "사번"
     , E.EMP_NAME        AS "직원명"
     , D.DEPT_TITLE      AS "부서명"
     , L.LOCAL_NAME      AS "지역명"
     , N.NATIONAL_NAME   AS "국가명"
  FROM EMPLOYEE          E
 INNER JOIN
       DEPARTMENT        D
    ON E.DEPT_CODE       = D.DEPT_ID
 INNER JOIN
       LOCATION          L
    ON D.LOCATION_ID     = L.LOCAL_CODE
 INNER JOIN
       NATIONAL          N
    ON L.NATIONAL_CODE   = N.NATIONAL_CODE;


-- 오라클 구문
SELECT E.EMP_ID          AS "사번"
     , E.EMP_NAME        AS "직원명"
     , D.DEPT_TITLE      AS "부서명"
     , L.LOCAL_NAME      AS "지역명"
     , N.NATIONAL_NAME   AS "국가명"
  FROM EMPLOYEE          E
     , DEPARTMENT        D
     , LOCATION          L
     , NATIONAL          N
 WHERE E.DEPT_CODE       = D.DEPT_ID
   AND D.LOCATION_ID     = L.LOCAL_CODE
   AND L.NATIONAL_CODE   = N.NATIONAL_CODE
;

-- 2. 사번(EMP_ID), 직원명(EMP_NAME), 부서명(DEPT_TITLE), 지역명(LOCAL_NAME), 국가명(NATIONAL_NAME), 급여 등급(SAL_LEVEL) 조회
-- ANSI 표준 구문
SELECT E.EMP_ID        AS "사번"
     , E.EMP_NAME      AS "직원명"
     , D.DEPT_TITLE    AS "지역명"
     , N.NATIONAL_NAME AS "국가명"
     , S.SAL_LEVEL     AS "급여등급"
  FROM EMPLOYEE        E
 INNER JOIN
       DEPARTMENT      D
    ON E.DEPT_CODE     = D.DEPT_ID
 INNER JOIN
       LOCATION        L
    ON D.LOCATION_ID   = L.LOCAL_CODE
 INNER JOIN
       NATIONAL        N
    ON L.NATIONAL_CODE = N.NATIONAL_CODE
 INNER JOIN
       SAL_GRADE       S
    ON E.SALARY        BETWEEN S.MIN_SAL AND S.MAX_SAL
;



-- 오라클 구문
SELECT E.EMP_ID        AS "사번"
     , E.EMP_NAME      AS "직원명"
     , D.DEPT_TITLE    AS "지역명"
     , N.NATIONAL_NAME AS "국가명"
     , S.SAL_LEVEL     AS "급여등급"
  FROM EMPLOYEE        E
     , DEPARTMENT      D
     , LOCATION        L
     , NATIONAL        N
     , SAL_GRADE       S
 WHERE E.DEPT_CODE     = D.DEPT_ID
   AND D.LOCATION_ID   = L.LOCAL_CODE
   AND L.NATIONAL_CODE = N.NATIONAL_CODE
   AND E.SALARY        BETWEEN S.MIN_SAL AND S.MAX_SAL
;
------------------------------- 조인 종합 실습 문제 ----------------------------
-- 1. 직급이 대리이면서 ASIA 지역에서 근무하는 직원들의 사번, 직원명, 직급명, 부서명, 근무지역, 급여를 조회하세요.
-- ANSI 구문
SELECT E.EMP_ID        AS "사원번호"
     , E.EMP_NAME      AS "직원명"
     , J.JOB_NAME      AS "직급명"
     , D.DEPT_TITLE    AS "부서명"
     , L.LOCAL_NAME    AS "근무지역"
     , E.SALARY        AS "급여"
  FROM EMPLOYEE        E
 INNER JOIN
       DEPARTMENT      D
    ON E.DEPT_CODE     = D.DEPT_ID
 INNER JOIN
       LOCATION        L
    ON D.LOCATION_ID   = L.LOCAL_CODE
 INNER JOIN
       JOB             J
    ON E.JOB_CODE      = J.JOB_CODE
 WHERE J.JOB_NAME      = '대리'
   AND L.LOCAL_NAME    LIKE 'ASIA%'
;
-- 오라클 구문
SELECT E.EMP_ID        AS "사원번호"
     , E.EMP_NAME      AS "직원명"
     , J.JOB_NAME      AS "직급명"
     , D.DEPT_TITLE    AS "부서명"
     , L.LOCAL_NAME    AS "근무지역"
     , E.SALARY        AS "급여"
  FROM EMPLOYEE        E
     , DEPARTMENT      D
     , LOCATION        L
     , JOB             J
 WHERE E.DEPT_CODE     = D.DEPT_ID
   AND D.LOCATION_ID   = L.LOCAL_CODE
   AND E.JOB_CODE      = J.JOB_CODE
   AND J.JOB_NAME      = '대리'
   AND L.LOCAL_NAME    LIKE 'ASIA%'
;
-- 2. 70년대생 이면서 여자이고, 성이 전 씨인 직원들의 직원명, 주민번호, 부서명, 직급명을 조회하세요.
-- ANSI 구문
SELECT E.EMP_NAME             AS "직원명"
     , E.EMP_NO               AS "주민번호"
     , D.DEPT_TITLE           AS "부서명"
     , J.JOB_NAME             AS "직급명"
  FROM EMPLOYEE               E
 INNER JOIN                   
       DEPARTMENT             D
    ON E.DEPT_CODE            = D.DEPT_ID
 INNER JOIN                   
       JOB                    J
    ON E.JOB_CODE             = J.JOB_CODE
 WHERE SUBSTR(E.EMP_NO, 1,1)  = '7'
   AND SUBSTR(E.EMP_NO, 8,1)  IN ('2','4')
   AND E.EMP_NAME             LIKE '전%'
;

-- 오라클 구문
SELECT E.EMP_NAME             AS "직원명"
     , E.EMP_NO               AS "주민번호"
     , D.DEPT_TITLE           AS "부서명"
     , J.JOB_NAME             AS "직급명"
  FROM EMPLOYEE               E
     , DEPARTMENT             D
     , JOB                    J
 WHERE E.DEPT_CODE            = D.DEPT_ID
   AND E.JOB_CODE             = J.JOB_CODE
   AND SUBSTR(E.EMP_NO, 1,1)  = '7'
   AND SUBSTR(E.EMP_NO, 8,1)  IN ('2','4')
   AND E.EMP_NAME             LIKE '전%'
;

-- 3. 보너스를 받는 직원들의 직원명, 보너스, 연봉, 부서명, 근무지역을 조회하세요.
--    단, 부서 코드가 없는 사원도 출력될 수 있게 OUTER JOIN 사용
-- ANSI 구문
SELECT E.EMP_NAME       AS "직원명"
     , E.BONUS          AS "보너스"
     , E.SALARY * 12    AS "연봉"
     , D.DEPT_TITLE     AS "부서명"
     , LOCAL_NAME       AS "근무지역"
  FROM EMPLOYEE         E
  LEFT JOIN
       DEPARTMENT       D
    ON E.DEPT_CODE      = D.DEPT_ID
  LEFT JOIN
       LOCATION         L
    ON D.LOCATION_ID    = L.LOCAL_CODE
 WHERE E.BONUS          IS NOT NULL
;


-- 오라클 구문
SELECT E.EMP_NAME       AS "직원명"
     , E.BONUS          AS "보너스"
     , E.SALARY * 12    AS "연봉"
     , D.DEPT_TITLE     AS "부서명"
     , LOCAL_NAME       AS "근무지역"
  FROM EMPLOYEE         E
     , DEPARTMENT       D
     , LOCATION         L
 WHERE E.DEPT_CODE      = D.DEPT_ID(+)
   AND D.LOCATION_ID    = L.LOCAL_CODE(+)
   AND E.BONUS          IS NOT NULL
;

-- 4. 한국과 일본에서 근무하는 직원들의 직원명, 부서명, 근무지역, 근무 국가를 조회하세요.
-- ANSI 구문
SELECT E.EMP_NAME       AS "직원명"
     , D.DEPT_TITLE     AS "부서명"
     , L.LOCAL_NAME     AS "근무지역"
     , N.NATIONAL_NAME  AS "근무국가"
  FROM EMPLOYEE         E
 INNER JOIN
       DEPARTMENT       D
    ON E.DEPT_CODE      = D.DEPT_ID
 INNER JOIN
       LOCATION         L
    ON D.LOCATION_ID    = L.LOCAL_CODE
 INNER JOIN
       NATIONAL         N
    ON L.NATIONAL_CODE  = N.NATIONAL_CODE
 WHERE E.BONUS          IS NOT NULL
   AND N.NATIONAL_NAME  IN('한국', '일본')
;

-- 오라클 구문
SELECT E.EMP_NAME       AS "직원명"
     , D.DEPT_TITLE     AS "부서명"
     , L.LOCAL_NAME     AS "근무지역"
     , L.NATIONAL_CODE  AS "근무국가"
  FROM EMPLOYEE         E
     , DEPARTMENT       D
     , LOCATION         L
 WHERE E.DEPT_CODE      = D.DEPT_ID
   AND D.LOCATION_ID    = L.LOCAL_CODE
   AND E.BONUS          IS NOT NULL
   AND L.NATIONAL_CODE  IN('KO','JP')
;

-- 5. 각 부서별 평균 급여를 조회하여 부서명, 평균 급여(정수 처리)를 조회하세요.
--    단, 부서 배치가 안된 사원들의 평균도 같이 나오게끔 해주세요^^
-- ANSI 구문
SELECT NVL(E.DEPT_CODE , '부서없음') AS "부서코드"
     , NVL(D.DEPT_TITLE, '부서없음') AS "부서명"
     , ROUND(AVG(SALARY))            AS "평균 급여"
  FROM EMPLOYEE                      E
  LEFT JOIN
       DEPARTMENT                    D
    ON E.DEPT_CODE                   = D.DEPT_ID
 GROUP BY
       E.DEPT_CODE
     , D.DEPT_TITLE
;

-- 오라클 구문
SELECT NVL(E.DEPT_CODE , '부서없음') AS "부서코드"
     , NVL(D.DEPT_TITLE, '부서없음') AS "부서명"
     , ROUND(AVG(SALARY))            AS "평균 급여"
  FROM EMPLOYEE                      E
     , DEPARTMENT                    D
 WHERE E.DEPT_CODE                   = D.DEPT_ID(+)
 GROUP BY
       E.DEPT_CODE
     , D.DEPT_TITLE
;

-- 6. 각 부서별 총 급여의 합이 1000만원 이상인 부서명, 급여의 합을 조회하시오.
-- ANSI 구문
SELECT D.DEPT_TITLE   AS "부서명"
     , SUM(E.SALARY)  AS "급여"
  FROM EMPLOYEE       E
 INNER JOIN
       DEPARTMENT     D
    ON E.DEPT_CODE    = D.DEPT_ID
 GROUP BY
       D.DEPT_TITLE
HAVING SUM(E.SALARY)/10000 >= 1000
;

-- 오라클 구문
SELECT D.DEPT_TITLE   AS "부서명"
     , SUM(E.SALARY)  AS "급여"
  FROM EMPLOYEE       E
     , DEPARTMENT     D
 WHERE E.DEPT_CODE    = D.DEPT_ID
 GROUP BY
       D.DEPT_TITLE
HAVING SUM(E.SALARY)/10000 >= 1000
;

-- 7. 사번, 직원명, 직급명, 급여 등급, 구분을 조회
--    이때 구분에 해당하는 값은 아래와 같이 조회 되도록 하시오.
--    급여 등급이 S1, S2인 경우 '고급'
--    급여 등급이 S3, S4인 경우 '중급'
--    급여 등급이 S5, S6인 경우 '초급'
-- ANSI 구문
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , J.JOB_NAME   AS "직급명"
     , S.SAL_LEVEL  AS "급여 등급"
     , CASE WHEN S.SAL_LEVEL IN('S1', 'S2') THEN '고급'
            WHEN S.SAL_LEVEL IN('S3', 'S4') THEN '중급'
            WHEN S.SAL_LEVEL IN('S5', 'S6') THEN '초급'
        END         AS "구분"
  FROM EMPLOYEE     E
 INNER JOIN
       JOB          J
    ON E.JOB_CODE    = J.JOB_CODE
 INNER JOIN
       SAL_GRADE    S
    ON E.SALARY BETWEEN S.MIN_SAL AND S.MAX_SAL
 WHERE 1 = 1
;

-- 오라클 구문
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , J.JOB_NAME   AS "직급명"
     , CASE WHEN S.SAL_LEVEL IN('S1', 'S2') THEN '고급'
            WHEN S.SAL_LEVEL IN('S3', 'S4') THEN '중급'
            WHEN S.SAL_LEVEL IN('S5', 'S6') THEN '초급'
        END         AS "급여 등급"
  FROM EMPLOYEE     E
     , JOB          J
     , SAL_GRADE    S
 WHERE E.JOB_CODE   = J.JOB_CODE
   AND E.SALARY     BETWEEN S.MIN_SAL AND S.MAX_SAL
;

-- 8. 보너스를 받지 않는 직원들 중 직급 코드가 J4 또는 J7인 직원들의 직원명, 직급명, 급여를 조회하시오.
-- ANSI 구문
SELECT E.EMP_NAME     AS "직원명"
     , J.JOB_NAME     AS "직급명"
     , E.SALARY       AS "급여"
  FROM EMPLOYEE       E
 INNER JOIN
       JOB            J
    ON E.JOB_CODE     = J.JOB_CODE
 WHERE 1 = 1
   AND E.JOB_CODE     IN ('J4','J7')
   AND E.BONUS        IS NULL
;
-- 오라클 구문
SELECT E.EMP_NAME     AS "직원명"
     , J.JOB_NAME     AS "직급명"
     , E.SALARY       AS "급여"
  FROM EMPLOYEE       E
     , JOB            J
 WHERE E.JOB_CODE     = J.JOB_CODE
   AND E.JOB_CODE     IN ('J4','J7')
   AND E.BONUS        IS NULL
;

-- 9. 부서가 있는 직원들의 직원명, 직급명, 부서명, 근무 지역을 조회하시오.
-- ANSI 구문
SELECT E.EMP_NAME       AS "직원명"
     , J.JOB_NAME       AS "직급명"
     , D.DEPT_TITLE     AS "부서명"
     , L.LOCAL_NAME     AS "근무지역"
  FROM EMPLOYEE         E
 INNER JOIN
       JOB              J
    ON E.JOB_CODE       = J.JOB_CODE
 INNER JOIN
       DEPARTMENT       D
    ON E.DEPT_CODE      = D.DEPT_ID
 INNER JOIN
       LOCATION         L
    ON D.LOCATION_ID    = L.LOCAL_CODE
 WHERE 1 = 1
;

-- 오라클 구문
SELECT E.EMP_NAME       AS "직원명"
     , J.JOB_NAME       AS "직급명"
     , D.DEPT_TITLE     AS "부서명"
     , L.LOCAL_NAME     AS "근무지역"
  FROM EMPLOYEE         E
     , JOB              J
     , DEPARTMENT       D
     , LOCATION         L
 WHERE E.JOB_CODE       = J.JOB_CODE
   AND E.DEPT_CODE      = D.DEPT_ID
   AND D.LOCATION_ID    = L.LOCAL_CODE
;
-- 10. 해외영업팀에 근무하는 직원들의 직원명, 직급명, 부서 코드, 부서명을 조회하시오.
-- ANSI 구문
SELECT E.EMP_NAME     AS "직원명"
     , E.JOB_CODE     AS "직급명"
     , E.DEPT_CODE    AS "부서코드"
     , D.DEPT_TITLE   AS "부서명"
  FROM EMPLOYEE       E
     , JOB            J
     , DEPARTMENT     D
 WHERE E.JOB_CODE     = J.JOB_CODE
   AND D.DEPT_CODE    = D.DEPT_ID
   AND D.DEPT_TITLE   LIKE '해외영업%'
;

-- 오라클 구문
SELECT E.EMP_NAME     AS "직원명"
     , E.JOB_CODE     AS "직급명"
     , E.DEPT_CODE    AS "부서코드"
     , D.DEPT_TITLE   AS "부서명"
  FROM EMPLOYEE       E
 INNER JOIN
       JOB            J
    ON E.JOB_CODE     = J.JOB_CODE
 INNER JOIN
       DEPARTMENT     D
    ON E.DEPT_CODE    = D.DEPT_ID
 WHERE D.DEPT_TITLE   LIKE '해외영업%'
;

-- 11. 이름에 '형'자가 들어있는 직원들의 사번, 직원명, 직급명을 조회하시오.
-- ANSI 구문
SELECT E.EMP_ID       AS "사번"
     , E.EMP_NAME     AS "직원명"
     , J.JOB_NAME     AS "직급명"
  FROM EMPLOYEE       E
 INNER JOIN
       JOB            J
    ON E.JOB_CODE     = J.JOB_CODE
 WHERE E.EMP_NAME     LIKE '%형%'

-- 오라클 구문
SELECT E.EMP_ID       AS "사번"
     , E.EMP_NAME     AS "직원명"
     , J.JOB_NAME     AS "직급명"
  FROM EMPLOYEE       E
     , JOB            J
 WHERE E.JOB_CODE     = J.JOB_CODE
   AND E.EMP_NAME     LIKE '%형%'
;