-- SYS AS SYSDBA 계정으로 접속 해서 실행
/*
<DCL(Data Control Language>
    데이터를 제어하는 구문으로 계정에게 시스템 권한 또는 객체에 대한 접근 권한을 부여(GRANT)하거나 회수(REVOKE)하는 구문이다.
<시스템 권한>
    데이터베이스에 접근하는 권한, 오라클에서 제공하는 객체를 생성/삭제할 수 있는 권한이다
*/
-- 1. SAMPLE 계정 생성
CREATE USER C##SAMPLE IDENTIFIED BY SAMPLE;-- USER 만 생성해서는 DBMS에 접속할수 없다. (CREATE SESSION 권한을 주지 않았기 때문)
-- 오라클 특정 버전 부터는 일반 유저를 CREATE 할때 앞에 'C##'을 붙여 주어야 계정을 생성할수 있다.

-- 2. 계정에 접속하기 위해서 CREATE SESSION 권한 부여
GRANT CREATE SESSION TO C##SAMPLE; -- Grant을(를) 성공했습니다.


-- 3-2. SAMPLE 계정에서 테이블을 생성할 수 있도록 CREATE TABLE 권한 부여
GRANT CREATE TABLE TO C##SAMPLE; -- Grant을(를) 성공했습니다.

-- 4. SAMPLE 계정에 테이블 스페이스(테이블, 뷰, 인덱스 등 객체들이 저장되는 공간) 할당
ALTER USER C##USER QUOTA 2M ON USERS;


/* 
<객체 접근 권한>
    특정객체를 조작할수 있는 권한
*/

-- 5-2. SAMPLE 계정 C##KH 계정의 EMPLOYEE 테이블을 조회할 수 있는 권한 부여
GRANT SELECT ON C##KH.EMPLOYEE TO C##SAMPLE;

-- 6. SAMPLE 계정에서 C##KH.DEPARTMENT 테이블을 조회할 수 있는 권한 부여
GRANT SELECT ON C##KH.DEPARTMENT TO C##SAMPLE;

-- 7-2. SAMPLE 계정에서 C##KH.DEPARTMENT 테이블에 데이터를 추가할 수 있는 권한 부여
GRANT INSERT ON C##KH.DEPARTMENT TO C##SAMPLE;


-- 8. SAMPLE 계정에서 C##KH.DEPARTMENT 테이블을 조회 하는 권한, 데이터를 추가하는 권한을 회수
REVOKE SELECT, INSERT ON C##KH.DEPARTMENT FROM C##SAMPLE;

/*
<ROLE>
    특정 권한들을 하나의 집합으로 모아놓은 것을 롤(ROLE)이라 한다.
*/
SELECT * FROM ROLE_SYS_PRIVS
-- WHERE ROLE = 'CONNECT'
-- WHERE ROLE = 'RESOURCE
 WHERE ROLE = 'DBA'
;
SELECT * FROM USER_SYS_PRIVS;  -- 계정의 PRIVILEGES 를 확인할 수 있는 테이블
SELECT * FROM USER_ROLE_PRIVS; -- 계정의 ROLE       을 확인할 수 있는 테이블