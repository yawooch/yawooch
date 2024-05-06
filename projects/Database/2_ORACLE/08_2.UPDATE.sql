/*
  <UPDATE>
    테이블의 행의 값을 수정하는 구문이다.
*/
-- 테스트 진행할 테이블 생성
CREATE TABLE DEPT_COPY
AS SELECT *
   FROM DEPARTMENT;
   
CREATE TABLE EMP_SALARY
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY, BONUS
   FROM EMPLOYEE;
   
-- DEPT_COPY 테이블에서 DEPT_ID가 'D9'인 부서명을 '기획팀'으로 수정
UPDATE DEPT_COPY
SET DEPT_TITLE = '기획팀'
WHERE DEPT_ID = 'D9';

-- EMP_SALARY 테이블에서 노옹철 사원의 급여를 1000000원으로 변경
UPDATE EMP_SALARY
SET SALARY = 1000000
WHERE EMP_NAME = '노옹철';

-- EMP_SALARY 테이블에서 노옹철 사원의 보너스를 0.3으로 변경
UPDATE EMP_SALARY
SET BONUS = 0.3
WHERE EMP_NAME = '노옹철';

-- EMP_SALARY 테이블에서 선동일 사원의 급여를 700만원으로, 
-- 보너스를 0.2로 변경
UPDATE EMP_SALARY
SET SALARY = 7000000,
    BONUS = 0.2
WHERE EMP_NAME = '선동일';   


SELECT * FROM EMPLOYEE WHERE EMP_ID = '200';
SELECT * FROM EMPLOYEE WHERE EMP_ID = '210';

-- EMPLOYEE 테이블에서 사번이 200 번인 사원의 사번을 NULL 로 변경
UPDATE EMPLOYEE 
   SET EMP_ID = NULL  -- NOT NULL 제약조건에 위배된다.
 WHERE EMP_ID = '200';
 
-- EMPLOYEE 테이블에서 사번이 200 번인 사원의 사번을 210으로 변경
UPDATE EMPLOYEE 
   SET EMP_ID = '210' -- UNIQUE 제약조건에 위배된다.
 WHERE EMP_ID = '200';

-- EMPLOYEE 테이블에서 노옹철 사원의 부서코드를 D0 로 변경
SELECT * FROM EMPLOYEE WHERE EMP_NAME = '노옹철';
UPDATE EMPLOYEE
   SET DEPT_CODE = 'D0'     -- FOREIGN KEY 제약조건에 위배된다.
 WHERE EMP_NAME = '노옹철'; -- 오류 보고 - ORA-02291: 무결성 제약조건(C##KH.DEPT_CODE_FK)이 위배되었습니다- 부모 키가 없습니다


-- TB_MEMBER 테이블에서 MEMBER_NO 가 1인 회원의 성별을 'G'로 변경
SELECT * FROM TB_MEMBER WHERE MEMBER_NO = '1';
UPDATE TB_MEMBER
   SET GENDER = 'G'     -- CHECK 제약 조건에 위배된다.
 WHERE MEMBER_NO = '1'; -- 오류 보고 - ORA-02290: 체크 제약조건(C##KH.TB_MEMBER_GENDER_CK)이 위배되었습니다
 
COMMIT;

-- 방명수 사원의 급여와 보너스를 유재식 사원과 동일하게 변경
SELECT * FROM EMP_SALARY WHERE EMP_NAME = '방명수';
SELECT SALARY, BONUS FROM EMP_SALARY WHERE EMP_NAME = '유재식';


-- 1) 단일행 서브 쿼리를 각각의 컬럼에 적용
UPDATE EMP_SALARY
   SET SALARY = (SELECT SALARY FROM EMP_SALARY WHERE EMP_NAME = '유재식')
     , BONUS  = (SELECT BONUS  FROM EMP_SALARY WHERE EMP_NAME = '유재식')
 WHERE EMP_NAME = '방명수';

ROLLBACK;

-- 2) 다중열 서브 쿼리를 사용해서 SALARY, BONUS 컬럼을 한 번에 변경
UPDATE EMP_SALARY
   SET (SALARY , BONUS) = (SELECT SALARY, BONUS FROM EMP_SALARY WHERE EMP_NAME = '유재식')
 WHERE EMP_NAME = '방명수';
 
SELECT * FROM EMP_SALARY WHERE EMP_NAME = '방명수';

-- EMP_SALARY 테이블에서 노옹철 전형돈 정중하 하동운 사원들의 급여와 보너스를 유재식 사원과 동일하게 변경
SELECT SALARY, BONUS FROM EMP_SALARY WHERE EMP_NAME = '유재식';
UPDATE EMP_SALARY
   SET (SALARY, BONUS) = (SELECT SALARY, BONUS FROM EMP_SALARY WHERE EMP_NAME = '유재식')
 WHERE EMP_NAME IN('노옹철' ,'전형돈' ,'정중하' ,'하동운');

SELECT * FROM EMP_SALARY WHERE EMP_NAME IN('노옹철' ,'전형돈' ,'정중하' ,'하동운');