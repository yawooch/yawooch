-- C##SAMPLE 계정에서 실행
-- 3-1. SAMPLE 계정에서 테이블 생성
CREATE TABLE TEST
(
    TNO NUMBER
);
-- 3-1. 오류 보고 - ORA-01031: 권한이 불충분합니다
-- 3-2. Table TEST이(가) 생성되었습니다.

-- 생성된 테이블은 조작이 가능하다.
SELECT * FROM TEST;
INSERT INTO TEST VALUES(1); -- 오류 보고 - SQL 오류: ORA-01950: 테이블스페이스 'USERS'에 대한 권한이 없습니다.
-- 4. 생성 이후 DML 이 가능하다.
UPDATE TEST SET TNO = 2;
DELETE FROM TEST WHERE TNO = 2;

-- 5-1. SAMPLE 계정 C##KH 계정의 EMPLOYEE 테이블을 조회
SELECT * FROM C##KH.EMPLOYEE; -- 5-1. ORA-00942: 테이블 또는 뷰가 존재하지 않습니다
SELECT * FROM C##KH.EMPLOYEE;

-- 6. SAMPLE 계정에서 C##KH.DEPARTMENT 테이블을 조회할 수 있는 권한 부여
SELECT * FROM C##KH.DEPARTMENT;

-- 7-1. SAMPLE 계정에서 KH 계정의 DEPARTMENT 테이블에 데이터 추가
INSERT INTO C##KH.DEPARTMENT VALUES('D0','개발부', 'L2');
ROLLBACK;

SELECT * FROM USER_SYS_PRIVS;  -- 계정의 PRIVILEGES 를 확인할 수 있는 테이블
SELECT * FROM USER_ROLE_PRIVS; -- 계정의 ROLE       을 확인할 수 있는 테이블

-- 참조 사이트 : https://blog.naver.com/hj_kim97/222430045367