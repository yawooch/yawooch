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
 WHERE TABLE_NAME = 'MEMBER'
;

SELECT 'SELECT *  FROM ' || RPAD(TABLE_NAME || ';' , 15)|| ' -- ' || COMMENTS
--SELECT *
  FROM ALL_TAB_COMMENTS
 WHERE OWNER = 'C##KH';



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
-- WHERE TABLE_NAME IN('MEMBER', 'MEMBER_GRADE', 'EMP_COPY')
 WHERE TABLE_NAME IN('TB_RENT' , 'TB_MEMBER' , 'TB_BOOK' , 'TB_PUBLISHER')
 ORDER BY TABLE_NAME, NUM
;


/*
    <DDL(Data Definition Language)>
        데이터 정의 언어로 객체(OBJECT)를 생성하고(CREATE), 수정하고(ALTER), 삭제(DROP)하는 구문이다.

    <CREATE>
        오라클 데이터 베이스 객체(테이블, 뷰, 인덱스 등)을 생성하는 구문이다.

    <테이블 생성>
        [표현법]
        CREATE TABLE 테이블명 (
            컬럼명 자료형(크기) [DEFAULT 기본값] [제약조건],
            컬럼명 자료형(크기) [DEFAULT 기본값] [제약조건],
            ...
        );
*/

SELECT *
  FROM ALL_TAB_COLUMNS
 WHERE OWNER      = 'C##KH'
   AND TABLE_NAME = 'MEMBER'
;

SELECT *
  FROM ALL_TAB_COLUMNS
 WHERE TABLE_NAME = 'USER_TAB_COMMENTS'
;

DROP TABLE MEMBER; // 테이블 삭제
DESC MEMBER; //테이블의 구조를 표시해주는 구문이다.
CREATE TABLE MEMBER(
    NO NUMBER,
    ID VARCHAR2(20),
    PASSWORD VARCHAR2(20),
    NAME VARCHAR2(15),
    ENROLL_DATE DATE DEFAULT SYSDATE
);
COMMENT ON TABLE MEMBER              IS '멤버';
COMMENT ON COLUMN MEMBER.ID          IS '회원아이디';
COMMENT ON COLUMN MEMBER.NO          IS '회원번호';
COMMENT ON COLUMN MEMBER.PASSWORD    IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.NAME        IS '회원이름';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '회원가입일';



DESC MEMBER;
/*
데이터 딕셔너리
    자원을 효율적으로 관리하기 위해 다양한 객체들의 정보를 저장하는 시스템 테이블이다.
    데이터에 관한 데이터가 저잔되어 있다고 해서 메타 데이터라고도 한다.
*/
SELECT * FROM USER_TABLES
-- SELECT * FROM USER_TAB_COLUMNS
-- WHERE TABLE_NAME = 'MEMBER'
;-- USER_TABLES : 사용자가 가지고 있는 테이블들의 구조를 확인하는 뷰 테이블

--SELECT * FROM USER_TAB_COLUMNS
SELECT * FROM USER_COL_COMMENTS
-- WHERE TABLE_NAME = 'MEMBER'
;
-- 사용자가 가지고 있는 데이블, 컬럼과 관련된 정보를 조회하는 뷰 테이블이다.

-- 테이블에 샘플 데이터 추가(INSERT)
-- INSERT INTO 테이블명[(컬럼, 컬럼, ...)] VALUES(값, ... 값,  .... );
--
SELECT NO              AS "회원번호"
     , ID              AS "회원아이디"
     , PASSWORD        AS "회원비밀번호"
     , NAME            AS "회원이름"
     , ENROLL_DATE     AS "회원가입일"
  FROM MEMBER;         -- 멤버


INSERT INTO MEMBER VALUES(1, 'USER1', '1234', '홍길동', '2023-11-09');
INSERT INTO MEMBER(NO , ID , PASSWORD , NAME , ENROLL_DATE) VALUES(2, 'USER2', '1234', '이몽룡', '2023-11-10');
INSERT INTO MEMBER(NO , ID , PASSWORD , NAME , ENROLL_DATE) VALUES(3, 'USER3', '1234', '성춘향', DEFAULT);
INSERT INTO MEMBER(ID , PASSWORD) VALUES('USER4', '1234');

-- 메모리 버퍼에 임시 저장된 데이터를 실제 테이블에 반영한다.
COMMIT;
ROLLBACK;
SHOW AUTOCOMMIT;
--SET AUTOCOMMIT ON;
--SET AUTOCOMMIT OFF;


/*
<제약조건>
    테이블 작성시 각 컬럼에 대해 저장될 데이터에 대한 제약조건을 설정할 제약조건은 데이터 무결성 보장을 목적으로 한다.
    (데이터의 정확성과 일관성을 유지시키는것)

    * 종류 : 제약조건은 NOT NULL, UNIQUE, CHECK, PRIMARY KEY, FOREIGN KEY 제약조건이 있다.
*/
/*
    [표현법]
    -- 1) 컬럼 레벨
            CREATE TABLE 테이블명 (
                컬럼명 자료형(크기) [CONSTRAINT 제약조건명] 제약조건,
                ...
            );
    -- 2) 테이블 레벨
            CREATE TABLE 테이블명 (
                컬럼명 자료형(크기),
                ...
                [CONSTRAINT 제약조건명] 제약조건 (컬럼명)
            );
*/
/*
1. NOT NULL 제약조건
    해당 컬럼에 반드시 값이 있어야만 하는 경우에 사용한다
    NOT NULL 제약조건은 컬럼 레벨에서만 설정이 가능하다
*/

SELECT * FROM MEMBER;

-- NOT NULL 제약조건을 설정 한 테이블 생성
DROP TABLE MEMBER; // 테이블 삭제
CREATE TABLE MEMBER(
    NO NUMBER NOT NULL,
    ID VARCHAR2(20) NOT NULL,
    PASSWORD VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(15) NOT NULL,
    ENROLL_DATE DATE DEFAULT SYSDATE
);
COMMENT ON TABLE  MEMBER                  IS '멤버';
COMMENT ON COLUMN MEMBER.ID               IS '회원아이디';
COMMENT ON COLUMN MEMBER.NO               IS '회원번호';
COMMENT ON COLUMN MEMBER.PASSWORD         IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.NAME             IS '회원이름';
COMMENT ON COLUMN MEMBER.GENDER           IS '회원성별';
COMMENT ON COLUMN MEMBER.ENROLL_DATE      IS '회원가입일';
COMMENT ON COLUMN MEMBER.GRADE_ID         IS '회원등급아이디';

COMMENT ON TABLE  MEMBER_GRADE            IS '회원등급';
COMMENT ON COLUMN MEMBER_GRADE.GRADE_CODE IS '등급아이디';
COMMENT ON COLUMN MEMBER_GRADE.GRADE_NAME IS '등급이름';

-- NOT NULL 제약조건에 위배되 어 오류 발생
INSERT INTO MEMBER VALUES ( NULL , NULL , NULL , NULL , NULL);
-- NOT NULL 제약 조건이 걸려있는 컬럼에는 반드시 값이 있어야 한다.
INSERT INTO MEMBER VALUES(1, 'USER1', '1234', '국원숭', '2023-11-10');
INSERT INTO MEMBER VALUES(2, 'USER2', '1234', '문말벌', NULL);
INSERT INTO MEMBER VALUES(3, 'USER3', '1234', '도윙윙', DEFAULT);
INSERT INTO MEMBER(NO, ID, PASSWORD) VALUES(4, 'USER3', '1234', '도윙윙', DEFAULT);

/*
UPDATE MEMBER
   SET ID = NULL
 WHERE NAME = '국원숭'
;
*/

-- ********************************************************************************************************************

-- 사용자가 작성한 제약조건을 확인하는 뷰 테이블이다.
SELECT * FROM USER_CONSTRAINTS;

-- 사용자가 작성한 제약조건 컬럼을 확인하는 컬럼
SELECT UC.CONSTRAINT_NAME
     , UC.TABLE_NAME
     , UCC.COLUMN_NAME
     , UC.CONSTRAINT_TYPE
     , UC.SEARCH_CONDITION
  FROM USER_CONSTRAINTS UC
 INNER JOIN USER_CONS_COLUMNS UCC ON (UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME)
 WHERE UC.TABLE_NAME = 'EMP_COPY'
-- WHERE UC.TABLE_NAME = 'MEMBER_GRADE'
--   AND UC.CONSTRAINT_NAME = 'SYS_C008376'
;

SELECT * FROM ALL_VIEWS
 WHERE VIEW_NAME = 'USER_CONSTRAINTS'
;

COMMENT ON TABLE  MEMBER                  IS '멤버';
COMMENT ON COLUMN MEMBER.ID               IS '회원아이디';
COMMENT ON COLUMN MEMBER.NO               IS '회원번호';
COMMENT ON COLUMN MEMBER.PASSWORD         IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.NAME             IS '회원이름';
COMMENT ON COLUMN MEMBER.GENDER           IS '회원성별';
COMMENT ON COLUMN MEMBER.ENROLL_DATE      IS '회원가입일';
COMMENT ON COLUMN MEMBER.GRADE_ID         IS '회원등급아이디';

COMMENT ON TABLE  MEMBER_GRADE            IS '회원등급';
COMMENT ON COLUMN MEMBER_GRADE.GRADE_CODE IS '등급아이디';
COMMENT ON COLUMN MEMBER_GRADE.GRADE_NAME IS '등급이름';

-- ********************************************************************************************************************
/*
    2. UNIQUE 제약조건
        컬럼에 중복된 값을 저장하거나 중복된 값으로 수정할 수 없도록 한다.
        UNIQUE 제약조건은 컬럼 레벨, 테이블 레벨에서 모두 설정이 가능하다.
*/
-- 아이디가 중복되어도 성공적으로 데이터가 삽입된다.
INSERT INTO MEMBER VALUES(1, 'USER1', '1234', '임꺽정', DEFAULT);
INSERT INTO MEMBER VALUES(1, 'USER1', '1234', '임꺽정', DEFAULT);

SELECT NO              AS "회원번호"
     , ID              AS "회원아이디"
     , PASSWORD        AS "회원비밀번호"
     , NAME            AS "회원이름"
     , ENROLL_DATE     AS "회원가입일"
  FROM MEMBER;         -- 멤버

-- 컬럼레벨 방식
-- UNIQUE 제약조건을 설정한테이블설정
DROP TABLE MEMBER; // 테이블 삭제
CREATE TABLE MEMBER(
    NO NUMBER             NOT NULL UNIQUE,
    ID VARCHAR2(20)       NOT NULL UNIQUE,
    PASSWORD VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(15)     NOT NULL,
    ENROLL_DATE DATE DEFAULT SYSDATE
);

-- 아이디가 중복되 데이터가 삽입되지 않는다.
INSERT INTO MEMBER VALUES(1, 'USER1', '1234', '임꺽정', DEFAULT);
INSERT INTO MEMBER VALUES(2, 'USER2', '5678', '임옹룡', DEFAULT);


-- 테이블레벨 방식
-- UNIQUE 제약조건을 설정한테이블설정
DROP TABLE MEMBER; // 테이블 삭제
CREATE TABLE MEMBER(
    NO          NUMBER       CONSTRAINT MEMBER_NO_NN       NOT NULL,
    ID          VARCHAR2(20) CONSTRAINT MEMBER_ID_NN       NOT NULL,
    PASSWORD    VARCHAR2(20) CONSTRAINT MEMBER_PASSWORD_NN NOT NULL,
    NAME        VARCHAR2(15) CONSTRAINT MEMBER_NAME_NN     NOT NULL,
    ENROLL_DATE DATE         DEFAULT SYSDATE,
    CONSTRAINT MEMBER_NO_UQ UNIQUE(NO),
    CONSTRAINT MEMBER_ID_UQ UNIQUE(ID)
);



-- 테이블레벨 방식
-- 여러개의 컬럼을 묶어서 하나의 UNIQUE 제약조건을 설정한 테이블 생성 (묶어서 UNIQUE 해야한다.)
-- 단, 반드시 테이블 레벨로만 설정이 가능하다
-- UNIQUE 제약조건을 설정한테이블설정
DROP TABLE MEMBER; -- 테이블 삭제
CREATE TABLE MEMBER(
    NO          NUMBER       CONSTRAINT MEMBER_NO_NN       NOT NULL,
    ID          VARCHAR2(20) CONSTRAINT MEMBER_ID_NN       NOT NULL,
    PASSWORD    VARCHAR2(20) CONSTRAINT MEMBER_PASSWORD_NN NOT NULL,
    NAME        VARCHAR2(15) CONSTRAINT MEMBER_NAME_NN     NOT NULL,
    ENROLL_DATE DATE         DEFAULT SYSDATE,
    CONSTRAINT MEMBER_NO_ID_UQ UNIQUE(NO,ID)
);

-- 여러개의 컬럼을 묶어서 하나의 UNIQUE 제약조건이 설정되어 있으면
-- 제약조건이 설정되어 있는 컬럼값이 모두 중복되는 경우에만 오류 발생한다.

DROP TABLE MEMBER; -- 테이블 삭제
CREATE TABLE MEMBER(
    NO          NUMBER       CONSTRAINT MEMBER_NO_NN       NOT NULL,
    ID          VARCHAR2(20) CONSTRAINT MEMBER_ID_NN       NOT NULL,
    PASSWORD    VARCHAR2(20) CONSTRAINT MEMBER_PASSWORD_NN NOT NULL,
    NAME        VARCHAR2(15) CONSTRAINT MEMBER_NAME_NN     NOT NULL,
    ENROLL_DATE DATE         DEFAULT SYSDATE,
    CONSTRAINT MEMBER_NO_ID_UQ UNIQUE(NO,ID)
);
/*
  ┌──────────┬──────┬───────┬─────────┬────────────┐
  │CONSTRAINT_NAME     │ TABLE_NAME │ COLUMN_NAME  │ CONSTRAINT_TYPE  │ SEARCH_CONDITION       │
  ├──────────┼──────┼───────┼─────────┼────────────┤
  │ CONSTRAINT_NAME    │ TABLE_NAME │ COLUMN_NAME  │ CONSTRAINT_TYPE  │ SEARCH_CONDITION       │
  │ MEMBER_NO_NN       │ MEMBER     │ NO           │ C                │ "NO" IS NOT NULL       │
  │ MEMBER_ID_NN       │ MEMBER     │ ID           │ C                │ "ID" IS NOT NULL       │
  │ MEMBER_PASSWORD_NN │ MEMBER     │ PASSWORD     │ C                │ "PASSWORD" IS NOT NULL │
  │ MEMBER_NAME_NN     │ MEMBER     │ NAME         │ C                │ "NAME" IS NOT NULL     │
▶│ MEMBER_NO_ID_UQ    │ MEMBER     │ NO           │ U                │                        │
▶│ MEMBER_NO_ID_UQ    │ MEMBER     │ ID           │ U                │                        │
  └──────────┴──────┴───────┴─────────┴────────────┘
 */

/*
    <CHECK 제약조건>
        컬럼에 기록되는 값에 조건을 설정하고 조건을 만족하는 값만 저장하거나 수정하도록 한다.
        비교 연산자를 이용하여 조건을 설정하며 비교 값을 리터럴만 사용 가능하고 변하는 값이나 함수 사용할 수 없다.
        CHECK 제약조건은 컬럼 레벨, 테이블 레벨에서 모두 설정이 가능하다.
 */
 COMMIT;
-- CHECK 제약조건을 위한 테이블 설정
DROP TABLE MEMBER; -- 테이블 삭제
CREATE TABLE MEMBER(
    NO          NUMBER       CONSTRAINT MEMBER_NO_NN       NOT NULL,
    ID          VARCHAR2(20) CONSTRAINT MEMBER_ID_NN       NOT NULL,
    PASSWORD    VARCHAR2(20) CONSTRAINT MEMBER_PASSWORD_NN NOT NULL,
    NAME        VARCHAR2(15) CONSTRAINT MEMBER_NAME_NN     NOT NULL,
    -- GENDER      VARCHAR2(3)  CONSTRAINT MEMBER_GENDER_CK   CHECK(GENDER = '남' OR GENDER = '여'),
    GENDER      VARCHAR2(3)  CONSTRAINT MEMBER_GENDER_CK   CHECK(GENDER IN('남','여')),
    AGE         NUMBER       ,
    ENROLL_DATE DATE         DEFAULT SYSDATE,
    CONSTRAINT MEMBER_NO_UQ UNIQUE(NO),
    CONSTRAINT MEMBER_ID_UQ UNIQUE(ID),
    CONSTRAINT MEMBER_AGE_CK   CHECK(AGE >= 0)
);

/*
  ┌──────────┬──────┬───────┬─────────┬────────────┐
  │CONSTRAINT_NAME     │ TABLE_NAME │ COLUMN_NAME  │ CONSTRAINT_TYPE  │ SEARCH_CONDITION       │
  ├──────────┼──────┼───────┼─────────┼────────────┤
▶│MEMBER_NO_NN        │ MEMBER     │ NO           │ C                │ "NO" IS NOT NULL       │
▶│MEMBER_ID_NN        │ MEMBER     │ ID           │ C                │ "ID" IS NOT NULL       │
▶│MEMBER_PASSWORD_NN  │ MEMBER     │ PASSWORD     │ C                │ "PASSWORD" IS NOT NULL │
▶│MEMBER_NAME_NN      │ MEMBER     │ NAME         │ C                │ "NAME" IS NOT NULL     │
▶│MEMBER_GENDER_CK    │ MEMBER     │ GENDER       │ C                │ GENDER IN('남','여')   │
▶│MEMBER_AGE_CK       │ MEMBER     │ AGE          │ C                │ AGE >= 0               │
  │MEMBER_NO_UQ        │ MEMBER     │ NO           │ U                │                        │
  │MEMBER_ID_UQ        │ MEMBER     │ ID           │ U                │                        │
  └──────────┴──────┴───────┴─────────┴────────────┘
*/
INSERT INTO MEMBER VALUES(1, 'USER1', '1234', '홍길동', '남', 20, DEFAULT);
INSERT INTO MEMBER VALUES(2, 'USER2', '1234', '성춘향', '여', 20, DEFAULT);
INSERT INTO MEMBER VALUES(3, 'USER3', '1234', '임꺽정', '강', 20, DEFAULT);
-- GENDER 컬럼에 '남' 또는 '여' 만 입력 가능하도록 설정이 되었기 때문에 에러가 발생한다.
INSERT INTO MEMBER VALUES(3, 'USER3', '1234', '임꺽정', '남', -20, DEFAULT);
-- AGE 컬럼에 0보다 크거나 같은 값만 입력 가능하도록 설정이 되었기 때문에 에러가 발생한다.

INSERT INTO MEMBER VALUES(3, 'USER3', '1234', '임꺽정', '남', 20, DEFAULT);
/*
UPDATE MEMBER
   SET AGE = -100
 WHERE NAME     = '홍길동'
;
*/
SELECT * FROM MEMBER;
/*
<PRIMARY KEY 제약조건>
    테이블에서 한 행의 정보를 식별하기 위해 사용할 컬럼에 부여하는 제약조건이다.
    PRIMARY KEY 제약조건은 컬럼 레벨, 테이블 레벨에서 모두 설정이 가능하다.
*/

SELECT * FROM MEMBER ;

-- PRIMARY KEY 제약조건을 설정한 테이블 생성(컬럼레벨생성)
-- 오류 보고 -
-- ORA-02261: 고유 키 또는 기본 키가 이미 존재하고 있습니다
DROP TABLE MEMBER; -- 테이블 삭제
CREATE TABLE MEMBER(
    NO          NUMBER       CONSTRAINT MEMBER_NO_PK       PRIMARY KEY,
    ID          VARCHAR2(20) NOT NULL,
    PASSWORD    VARCHAR2(20) NOT NULL,
    NAME        VARCHAR2(15) NOT NULL,
    -- GENDER      VARCHAR2(3)  CONSTRAINT MEMBER_GENDER_CK   CHECK(GENDER = '남' OR GENDER = '여'),
    GENDER      VARCHAR2(3)  ,
    AGE         NUMBER       ,
    ENROLL_DATE DATE         DEFAULT SYSDATE,
    CONSTRAINT MEMBER_ID_UQ       UNIQUE(ID),
    CONSTRAINT MEMBER_GENDER_CK   CHECK(GENDER IN('남','여')),
    CONSTRAINT MEMBER_AGE_CK      CHECK(AGE >= 0)
);
-- PRIMARY KEY 제약조건을 설정한 테이블 생성(테이블레벨 생성)
DROP TABLE MEMBER; -- 테이블 삭제
CREATE TABLE MEMBER(
    NO          NUMBER,
    ID          VARCHAR2(20) NOT NULL,
    PASSWORD    VARCHAR2(20) NOT NULL,
    NAME        VARCHAR2(15) NOT NULL,
    GENDER      VARCHAR2(3)  ,
    AGE         NUMBER       ,
    ENROLL_DATE DATE         DEFAULT SYSDATE,
    CONSTRAINT MEMBER_NO_PK       PRIMARY KEY(NO),
    CONSTRAINT MEMBER_ID_UQ       UNIQUE(ID),
    CONSTRAINT MEMBER_GENDER_CK   CHECK(GENDER IN('남','여')),
    CONSTRAINT MEMBER_AGE_CK      CHECK(AGE >= 0)
);
/*
  ┌──────────┬──────┬───────┬─────────┬────────────┐
  │CONSTRAINT_NAME     │ TABLE_NAME │ COLUMN_NAME  │ CONSTRAINT_TYPE  │ SEARCH_CONDITION       │
  ├──────────┼──────┼───────┼─────────┼────────────┤
  │ SYS_C008418        │ MEMBER     │ ID           │ C                │ "ID" IS NOT NULL       │
  │ SYS_C008419        │ MEMBER     │ PASSWORD     │ C                │ "PASSWORD" IS NOT NULL │
  │ SYS_C008420        │ MEMBER     │ NAME         │ C                │ "NAME" IS NOT NULL     │
  │ MEMBER_GENDER_CK   │ MEMBER     │ GENDER       │ C                │ GENDER IN('남','여')   │
  │ MEMBER_AGE_CK      │ MEMBER     │ AGE          │ C                │ AGE >= 0               │
▶│ MEMBER_NO_PK       │ MEMBER     │ NO           │ P                │                        │
  │ MEMBER_ID_UQ       │ MEMBER     │ ID           │ U                │                        │
  └──────────┴──────┴───────┴─────────┴────────────┘
*/
SELECT * FROM MEMBER;
INSERT INTO MEMBER VALUES(1, 'USER1', '1234', '홍길동', '남', 22, DEFAULT);
INSERT INTO MEMBER VALUES(2, 'USER2', '5678', '성춘향', '여', 22, DEFAULT);

-- 기본 키 중복으로 에러 발생 : 오류 보고 - ORA-00001: 무결성 제약 조건(C##KH.MEMBER_NO_PK)에 위배됩니다
INSERT INTO MEMBER VALUES(2, 'USER3', '5678', '이몽룡', '남', 26, DEFAULT);
-- 기본 키가 NULL이므로 에러발생 : 오류 보고 - SQL 오류: ORA-01400: NULL을 ("C##KH"."MEMBER"."NO") 안에 삽입할 수 없습니다
INSERT INTO MEMBER VALUES(NULL, 'USER3', '5678', '이몽룡', '남', 26, DEFAULT);


-- 여러키를 묶어서 하나의 기본키를 생성하는 것을 복합키 라고 한다.
DROP TABLE MEMBER; -- 테이블 삭제
CREATE TABLE MEMBER(
-- 한테이블에 한개의 기본키만 설정할 수 있다.
    -- NO          NUMBER       PRIMARY KEY,
    -- ID          VARCHAR2(20) PRIMARY KEY,
    NO          NUMBER       ,
    ID          VARCHAR2(20) ,
    PASSWORD    VARCHAR2(20) NOT NULL,
    NAME        VARCHAR2(15) NOT NULL,
    GENDER      VARCHAR2(3)  ,
    AGE         NUMBER       ,
    ENROLL_DATE DATE         DEFAULT SYSDATE,
    CONSTRAINT MEMBER_NO_PK       PRIMARY KEY(NO, ID),
    CONSTRAINT MEMBER_GENDER_CK   CHECK(GENDER IN('남','여')),
    CONSTRAINT MEMBER_AGE_CK      CHECK(AGE >= 0)
);
/*
  ┌──────────┬──────┬───────┬─────────┬────────────┐
  │CONSTRAINT_NAME     │ TABLE_NAME │ COLUMN_NAME  │ CONSTRAINT_TYPE  │ SEARCH_CONDITION       │
  ├──────────┼──────┼───────┼─────────┼────────────┤
  │ SYS_C008444        │ MEMBER     │ PASSWORD     │ C                │ "PASSWORD" IS NOT NULL │
  │ SYS_C008445        │ MEMBER     │ NAME         │ C                │ "NAME" IS NOT NULL     │
  │ MEMBER_GENDER_CK   │ MEMBER     │ GENDER       │ C                │ GENDER IN('남','여')   │
  │ MEMBER_AGE_CK      │ MEMBER     │ AGE          │ C                │ AGE >= 0               │
▶│ MEMBER_NO_PK       │ MEMBER     │ NO           │ P                │                        │
▶│ MEMBER_NO_PK       │ MEMBER     │ ID           │ P                │                        │
  └──────────┴──────┴───────┴─────────┴────────────┘
*/
SELECT * FROM MEMBER;
INSERT INTO MEMBER VALUES(1, 'USER1', '1234', '홍길동', '남', 22, DEFAULT);
INSERT INTO MEMBER VALUES(2, 'USER2', '5678', '성춘향', '여', 22, DEFAULT);
INSERT INTO MEMBER VALUES(3, 'USER3', '5678', '임꺽정', '남', 30, DEFAULT);

-- 오류 보고 - ORA-00001: 무결성 제약 조건(C##KH.MEMBER_NO_PK)에 위배됩니다
INSERT INTO MEMBER VALUES(3, 'USER3', '5678', '이몽룡', '남', 26, DEFAULT);
-- 기본 키로 지정한 컬럼에 NULL 값이 있으면 에러발생 : 오류 보고 - SQL 오류: ORA-01400: NULL을 ("C##KH"."MEMBER"."NO") 안에 삽입할 수 없습니다
INSERT INTO MEMBER VALUES(NULL, 'USER4', '5678', '임꺽정', '남', 26, DEFAULT);
-- 기본 키로 지정한 컬럼에 NULL 값이 있으면 에러발생 : 오류 보고 - SQL 오류: ORA-01400: NULL을 ("C##KH"."MEMBER"."ID") 안에 삽입할 수 없습니다
INSERT INTO MEMBER VALUES(4, NULL, '5678', '임꺽정', '남', 26, DEFAULT);

/**************************************************************************************************************
    5. FOREIGN KEY 외래키 제약 조건
        외래키 역할을 하는 컬럼에 부여하는 제약 조건이다.
        FOREIGN KEY 제약조건은 컬럼 레벨, 테이블 레벨에서 모두 설정이 가능하다.
    [표현법]
    1) 컬럼 레벨
        컬럼명 자료형(크기) [CONSTRAINT 제약조건명]   REFERENCES 참조할테이블명 [(컬럼명)][삭제룰]

    2) 테이블 레벨
        [CONSTRAINT 제약조건명] [FOREIGN KEY(컬럼명)] REFERENCES 참조할테이블명 [(컬럼명)][삭제룰]
    [삭제룰]
        ON DELETE RESTRICT : 자식 테이블의 참조 키가 부모 테이블의 키값을 참조하는 경우 부모 테이블의 행을 삭제할 수 없다. (기본)
        ON DELETE SET NULL : 부모 테이블의 데이터가 삭제 시 참조하고 있는 자식 테이블의 컬럼 값이 NULL로 변경된다.
        ON DELETE CASCADE  : 부모 테이블의 데이터가 삭제 시 참조하고 있는 자식 테이블의 컬럼 값이 존재하는 행 전체가 삭제된다.
**************************************************************************************************************/
-- 회원 등급에 대한 데이터를 저장하는 테이블
CREATE TABLE MEMBER_GRADE
(
       GRADE_CODE NUMBER       PRIMARY KEY,
       GRADE_NAME VARCHAR2(20) NOT NULL
);
/*
  ┌──────────┬───────┬───────┬─────────┬─────────────┐
  │ CONSTRAINT_NAME    │ TABLE_NAME   │ COLUMN_NAME  │ CONSTRAINT_TYPE  │ SEARCH_CONDITION         │
  ├──────────┼───────┼───────┼─────────┼─────────────┤
▶│ SYS_C008454        │ MEMBER_GRADE │ GRADE_NAME   │ C                │ "GRADE_NAME" IS NOT NULL │
▶│ SYS_C008455        │ MEMBER_GRADE │ GRADE_CODE   │ P                │                          │
  └──────────┴───────┴───────┴─────────┴─────────────┘
*/
INSERT INTO MEMBER_GRADE VALUES(10, '일반회원');
INSERT INTO MEMBER_GRADE VALUES(20, '우수회원');
INSERT INTO MEMBER_GRADE VALUES(30, '특별회원');

-- FOREIGN KEY 제약조건을 설정한 테이블 생성
DROP TABLE MEMBER; -- 테이블 삭제
CREATE TABLE MEMBER(
    NO          NUMBER,
    ID          VARCHAR2(20) NOT NULL,
    PASSWORD    VARCHAR2(20) NOT NULL,
    NAME        VARCHAR2(15) NOT NULL,
    GENDER      VARCHAR2(3)  ,
    AGE         NUMBER       ,
    GRADE_ID    NUMBER       REFERENCES MEMBER_GRADE,
    ENROLL_DATE DATE         DEFAULT SYSDATE,
    CONSTRAINT MEMBER_NO_PK       PRIMARY KEY(NO),
    CONSTRAINT MEMBER_ID_UQ       UNIQUE(ID),
    CONSTRAINT MEMBER_GENDER_CK   CHECK(GENDER IN('남','여')),
    CONSTRAINT MEMBER_AGE_CK      CHECK(AGE >= 0)
);
/*
  ┌──────────┬───────┬───────┬─────────┬─────────────┐
  │ CONSTRAINT_NAME    │ TABLE_NAME   │ COLUMN_NAME  │ CONSTRAINT_TYPE  │ SEARCH_CONDITION         │
  ├──────────┼───────┼───────┼─────────┼─────────────┤
▶│ SYS_C008463        │ MEMBER       │ GRADE_ID     │ R                │                          │
  │ SYS_C008456        │ MEMBER       │ ID           │ C                │ "ID" IS NOT NULL         │
  │ SYS_C008457        │ MEMBER       │ PASSWORD     │ C                │ "PASSWORD" IS NOT NULL   │
  │ SYS_C008458        │ MEMBER       │ NAME         │ C                │ "NAME" IS NOT NULL       │
  │ MEMBER_GENDER_CK   │ MEMBER       │ GENDER       │ C                │ GENDER IN('남','여')     │
  │ MEMBER_AGE_CK      │ MEMBER       │ AGE          │ C                │ AGE >= 0                 │
  │ MEMBER_NO_PK       │ MEMBER       │ NO           │ P                │                          │
  │ MEMBER_ID_UQ       │ MEMBER       │ ID           │ U                │                          │
  └──────────┴───────┴───────┴─────────┴─────────────┘
  */

SELECT * FROM MEMBER;
INSERT INTO MEMBER VALUES(1, 'USER1', '1234', '홍길동', '남', 22, 10  , DEFAULT);
-- 50이라는 값이 MEMBER_GRADE 테이블에 GRADE_CODE 컬럼에서 제공하는 값이 아니므로 외래키 제약조건에 위배되어 에러가 발생한다
INSERT INTO MEMBER VALUES(2, 'USER2', '5678', '성춘향', '여', 22, 50  , DEFAULT);-- 오류 보고 - ORA-02291: 무결성 제약조건(C##KH.SYS_C008463)이 위배되었습니다- 부모 키가 없습니다
-- NULL 값은 허용한다.
INSERT INTO MEMBER VALUES(2, 'USER2', '5678', '성춘향', '여', 22, NULL  , DEFAULT);


-- MEMBER 테이블과 MEMBER_GRADE 테이블을 조인하여
-- ID, NAME, GRADE_NAME 조회
-- ANSI
SELECT M.ID              AS "회원아이디"
     , M.NAME            AS "회원이름"
     , GRADE_NAME        AS "등급이름"
  FROM MEMBER            M
  LEFT JOIN
       MEMBER_GRADE      G
    ON M.GRADE_ID        = G.GRADE_CODE
;
-- 오라클
SELECT M.ID              AS "회원아이디"
     , M.NAME            AS "회원이름"
     , GRADE_NAME        AS "등급이름"
  FROM MEMBER            M
     , MEMBER_GRADE      G
 WHERE M.GRADE_ID        = G.GRADE_CODE(+)
;


-- MEMBER_GRADE 테이블에서 GRADE_CODE 가 10인 데이터를 지우기
-- 오류 보고 - ORA-02292: 무결성 제약조건(C##KH.SYS_C008463)이 위배되었습니다- 자식 레코드가 발견되었습니다
-- 자식 테이블의 행들 중에 GRADE_ID 가 10 인 행이 존재하기 때문에 삭제할수 없다.
DELETE FROM MEMBER_GRADE  WHERE GRADE_CODE = '10';

-- MEMBER_GRADE 테이블에서 GRADE_CODE 가 30인 데이터를 지우기
-- 자식테이블 행들 중에 GRADE_ID 가 30인 행이 존재하지 않기 때문에 삭제할수 있다.
DELETE FROM MEMBER_GRADE  WHERE GRADE_CODE = '30'; -- > 1 행 이(가) 삭제되었습니다.



-- ON DELETE SET NULL 옵션이 추가된 자식테이블 생성
DROP TABLE MEMBER; -- 테이블 삭제
CREATE TABLE MEMBER(
    NO          NUMBER            ,
    ID          VARCHAR2(20)      NOT NULL,
    PASSWORD    VARCHAR2(20)      NOT NULL,
    NAME        VARCHAR2(15)      NOT NULL,
    GENDER      VARCHAR2(3)       ,
    AGE         NUMBER            ,
    GRADE_ID    NUMBER            ,
    ENROLL_DATE DATE              DEFAULT SYSDATE,
    CONSTRAINT MEMBER_NO_PK       PRIMARY KEY(NO),
    CONSTRAINT MEMBER_ID_UQ       UNIQUE(ID),
    CONSTRAINT MEMBER_GENDER_CK   CHECK(GENDER IN('남','여')),
    CONSTRAINT MEMBER_AGE_CK      CHECK(AGE >= 0),
    CONSTRAINT MEMBER_GRADE_ID_FK FOREIGN KEY(GRADE_ID) REFERENCES MEMBER_GRADE(GRADE_CODE) ON DELETE SET NULL
);

/*
  ┌──────────┬───────┬───────┬─────────┬─────────────┐
  │ CONSTRAINT_NAME    │ TABLE_NAME   │ COLUMN_NAME  │ CONSTRAINT_TYPE  │ SEARCH_CONDITION         │
  ├──────────┼───────┼───────┼─────────┼─────────────┤
▶│ MEMBER_GRADE_ID_FK │ MEMBER       │ GRADE_ID     │ R                │                          │
  │ SYS_C008464        │ MEMBER       │ ID           │ C                │ "ID" IS NOT NULL         │
  │ SYS_C008465        │ MEMBER       │ PASSWORD     │ C                │ "PASSWORD" IS NOT NULL   │
  │ SYS_C008466        │ MEMBER       │ NAME         │ C                │ "NAME" IS NOT NULL       │
  │ MEMBER_GENDER_CK   │ MEMBER       │ GENDER       │ C                │ GENDER IN('남','여')     │
  │ MEMBER_AGE_CK      │ MEMBER       │ AGE          │ C                │ AGE >= 0                 │
  │ MEMBER_NO_PK       │ MEMBER       │ NO           │ P                │                          │
  │ MEMBER_ID_UQ       │ MEMBER       │ ID           │ U                │                          │
  └──────────┴───────┴───────┴─────────┴─────────────┘
 */

INSERT INTO MEMBER VALUES(1, 'USER1', '1234', '홍길동', '남', 22, 10    , DEFAULT);
INSERT INTO MEMBER VALUES(2, 'USER2', '5678', '성춘향', '여', 22, NULL  , DEFAULT);


-- MEMBER_GRADE 테이블에서 GRADE_CODE 가 10인 데이터를 지우기
DELETE FROM MEMBER_GRADE  WHERE GRADE_CODE = '10';-- 1 행 이(가) 삭제되었습니다.
/* MEMBER 테이블에서도 NULL로 UPDATE된 모습
  ┌───────┬───────┬─────────┬─────┬─────┬─────┬──────┬───────┐
  │ 회원성별     │ 회원가입일   │ 회원등급아이디   │ 회원나이 │ 회원이름 │ 회원번호 │ 회원아이디 │ 회원비밀번호 │
  ├───────┼───────┼─────────┼─────┼─────┼─────┼──────┼───────┤
  │ 남           │ 23/11/13     │                  │ 22       │ 홍길동   │ 1        │ USER1      │ 1234         │
  │ 여           │ 23/11/13     │                  │ 22       │ 성춘향   │ 2        │ USER2      │ 5678         │
  └───────┴───────┴─────────┴─────┴─────┴─────┴──────┴───────┘
*/
-- ON DELETE SET CASCADE 옵션이 추가된 자식테이블 생성
DROP TABLE MEMBER; -- 테이블 삭제
CREATE TABLE MEMBER(
    NO          NUMBER            ,
    ID          VARCHAR2(20)      NOT NULL,
    PASSWORD    VARCHAR2(20)      NOT NULL,
    NAME        VARCHAR2(15)      NOT NULL,
    GENDER      VARCHAR2(3)       ,
    AGE         NUMBER            ,
    GRADE_ID    NUMBER            ,
    ENROLL_DATE DATE              DEFAULT SYSDATE,
    CONSTRAINT MEMBER_NO_PK       PRIMARY KEY(NO),
    CONSTRAINT MEMBER_ID_UQ       UNIQUE(ID),
    CONSTRAINT MEMBER_GENDER_CK   CHECK(GENDER IN('남','여')),
    CONSTRAINT MEMBER_AGE_CK      CHECK(AGE >= 0),
    CONSTRAINT MEMBER_GRADE_ID_FK FOREIGN KEY(GRADE_ID) REFERENCES MEMBER_GRADE(GRADE_CODE) ON DELETE CASCADE
);

-- MEMBER_GRADE 테이블에서 GRADE_CODE 가 10인 데이터를 지우기
DELETE FROM MEMBER_GRADE  WHERE GRADE_CODE = '10';-- 1 행 이(가) 삭제되었습니다.
/* MEMBER 테이블에서도 삭제된 모습
  ┌───────┬───────┬─────────┬─────┬─────┬─────┬──────┬───────┐
  │ 회원성별     │ 회원가입일   │ 회원등급아이디   │ 회원나이 │ 회원이름 │ 회원번호 │ 회원아이디 │ 회원비밀번호 │
  ├───────┼───────┼─────────┼─────┼─────┼─────┼──────┼───────┤
  │ 여           │ 23/11/13     │                  │ 22       │ 성춘향   │ 2        │ USER2      │ 5678         │
  └───────┴───────┴─────────┴─────┴─────┴─────┴──────┴───────┘
 */

SELECT GENDER          AS "회원성별"
     , ENROLL_DATE     AS "회원가입일"
     , GRADE_ID        AS "회원등급아이디"
     , AGE             AS "회원나이"
     , NAME            AS "회원이름"
     , NO              AS "회원번호"
     , ID              AS "회원아이디"
     , PASSWORD        AS "회원비밀번호"
  FROM MEMBER;         -- 멤버

SELECT GRADE_NAME      AS "등급이름"
     , GRADE_CODE      AS "등급아이디"
  FROM MEMBER_GRADE;   -- 회원등급
/*
<SUBQUERY 를 이용한 테이블 생성>
    서브 쿼리를 이용해서 SELECT의 조회 결과로 테이블을 생성하는 구문이다.
    컬럼명과 데이터 타입, 값이 복사되고, 제약조건은 NOT NULL만 복사된다.
*/

-- 컬럼, 데이터 타입, 값, NOT NULL 제약조건 복사
-- EMPLOYEE 테이블을 복사한 새로운 테이블 생성
-- Table EMP_COPY(가) 생성되었습니다.
CREATE TABLE EMP_COPY AS
SELECT EMP_ID
     , EMP_NAME
     , DEPT_CODE
     , JOB_CODE
     , SALARY
     , BONUS
     , HIRE_DATE
     , ENT_DATE
     , ENT_YN
     , EMP_NO
     , EMAIL
     , PHONE
     , MANAGER_ID
  FROM EMPLOYEE
;
/*
  ┌──────────┬───────┬───────┬─────────┬─────────────┐
  │ CONSTRAINT_NAME    │ TABLE_NAME   │ COLUMN_NAME  │ CONSTRAINT_TYPE  │ SEARCH_CONDITION         │
  ├──────────┼───────┼───────┼─────────┼─────────────┤
▶│ SYS_C008483        │ EMP_COPY     │ EMP_ID       │ C                │ "EMP_ID" IS NOT NULL     │
▶│ SYS_C008484        │ EMP_COPY     │ EMP_NAME     │ C                │ "EMP_NAME" IS NOT NULL   │
▶│ SYS_C008485        │ EMP_COPY     │ EMP_NO       │ C                │ "EMP_NO" IS NOT NULL     │
  └──────────┴───────┴───────┴─────────┴─────────────┘
*/

-- Table MEM_COPY이(가) 생성되었습니다.
-- MEMBER 테이블을 복사한 새로운 테이블 생성
-- 컬럼, 데이터 타입, 값, NOT NULL 제약조건 복사
CREATE TABLE MEM_COPY AS
SELECT *
  FROM MEMBER;

/*
  ┌──────────┬───────┬───────┬─────────┬─────────────┐
  │ CONSTRAINT_NAME    │ TABLE_NAME   │ COLUMN_NAME  │ CONSTRAINT_TYPE  │ SEARCH_CONDITION         │
  ├──────────┼───────┼───────┼─────────┼─────────────┤
▶│ SYS_C008486        │ MEM_COPY     │ ID           │ C                │ "ID" IS NOT NULL         │
▶│ SYS_C008487        │ MEM_COPY     │ PASSWORD     │ C                │ "PASSWORD" IS NOT NULL   │
▶│ SYS_C008488        │ MEM_COPY     │ NAME         │ C                │ "NAME" IS NOT NULL       │
  └──────────┴───────┴───────┴─────────┴─────────────┘
*/

-- EMPLOYEE 테이블을 복사한 새로운 테이블 생성
-- 컬럼, 데이터 타입, 값, NOT NULL 제약조건 복사
CREATE TABLE EMP_COPY AS
SELECT *
  FROM EMPLOYEE
 WHERE 1 = 0;


-- EMPLOYEE 테이블에서 사번, 직원명, 급여, 연봉을 저장하는 테이블을 생성
-- SELECT 절에 산술연산 또는 함수식이 기술된 경우에는 별칭을 지정해야 한다.
CREATE TABLE EMP_COPY AS
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , SALARY       AS "급여"
     , SALARY * 12  AS "연봉"
  FROM EMPLOYEE
 WHERE 1 = 1
;

---------------------------------------------------------------------
-- 실습 문제
-- 도서관리 프로그램을 만들기 위한 테이블 만들기
-- 이때, 제약조건에 이름을 부여하고, 각 컬럼에 주석 달기

-- 1. 출판사들에 대한 데이터를 담기 위한 출판사 테이블(TB_PUBLISHER)
--  1) 컬럼 : PUB_NO(출판사 번호) -- 기본 키
--           PUB_NAME(출판사명) -- NOT NULL
--           PHONE(출판사 전화번호)
CREATE TABLE TB_PUBLISHER
(
    PUB_NO     NUMBER       PRIMARY KEY,-- 기본 키
    PUB_NAME   VARCHAR2(30) NOT NULL,   -- NOT NULL
    PHONE      VARCHAR2(15)
);
COMMENT ON TABLE  TB_PUBLISHER          IS '출판사';
COMMENT ON COLUMN TB_PUBLISHER.PUB_NO   IS '출판사 번호';
COMMENT ON COLUMN TB_PUBLISHER.PUB_NAME IS '출판사명';
COMMENT ON COLUMN TB_PUBLISHER.PHONE    IS '출판사 전화번호';


--  2) 3개 정도의 샘플 데이터 추가하기
INSERT INTO TB_PUBLISHER VALUES(10, '계몽'          , '02-1111-2222');
INSERT INTO TB_PUBLISHER VALUES(20, '금성'          , '02-3333-4444');
INSERT INTO TB_PUBLISHER VALUES(30, '이지스퍼블리싱', '02-5555-6666');


-- 2. 도서들에 대한 데이터를 담기 위한 도서 테이블 (TB_BOOK)
--  1) 컬럼 : BK_NO (도서번호) -- 기본 키
--           BK_TITLE (도서명) -- NOT NULL
--           BK_AUTHOR(저자명) -- NOT NULL
--           BK_PRICE(가격)
--           BK_PUB_NO(출판사 번호) -- 외래 키(TB_PUBLISHER 테이블을 참조하도록)
--                                    이때 참조하고 있는 부모 데이터 삭제 시 자식 데이터도 삭제 되도록 옵션 지정

DROP TABLE TB_BOOK;
CREATE TABLE TB_BOOK
(
    BK_NO     NUMBER              ,         -- 기본 키
    BK_TITLE  VARCHAR2(4000)      NOT NULL, -- NOT NULL
    BK_AUTHOR VARCHAR2(4000)      NOT NULL, -- NOT NULL
    BK_PRICE  NUMBER              ,
    BK_PUB_NO NUMBER              ,         -- 외래 키(TB_PUBLISHER 테이블을 참조하도록) 이때 참조하고 있는 부모 데이터 삭제 시 자식 데이터도 삭제 되도록 옵션 지정
    CONSTRAINT TB_BOOK_BK_NO_PK     PRIMARY KEY(BK_NO),
    CONSTRAINT TB_BOOK_BK_PUB_NO_FK FOREIGN KEY(BK_PUB_NO) REFERENCES TB_PUBLISHER (PUB_NO) ON DELETE CASCADE
);
COMMENT ON TABLE  TB_BOOK           IS '도서';
COMMENT ON COLUMN TB_BOOK.BK_NO     IS '도서번호';
COMMENT ON COLUMN TB_BOOK.BK_TITLE  IS '도서명';
COMMENT ON COLUMN TB_BOOK.BK_AUTHOR IS '저자명';
COMMENT ON COLUMN TB_BOOK.BK_PRICE  IS '가격';
COMMENT ON COLUMN TB_BOOK.BK_PUB_NO IS '출판사 번호';



--  2) 5개 정도의 샘플 데이터 추가하기

INSERT INTO TB_BOOK VALUES(110, '어린완자'                          , '생쥐페리'   , 15000, 10);
INSERT INTO TB_BOOK VALUES(120, '누가 내머리에 똥쌌어'              , '베르너'     , 18000, 10);
INSERT INTO TB_BOOK VALUES(210, '누가 내 치즈를 먹었으까잉'         , '스펜서존슨' , 13500, 20);
INSERT INTO TB_BOOK VALUES(220, '데미안'                            , '헤르만헤세' , 15000, 20);
INSERT INTO TB_BOOK VALUES(310, 'DOIT JAVA 프로그래밍'              , '박은종'     , 23000, 30);

-- 3. 회원에 대한 데이터를 담기 위한 회원 테이블 (TB_MEMBER)
--  1) 컬럼 :   MEMBER_NO(회원번호)      -- 기본 키
--              MEMBER_ID(아이디)        -- 중복 금지
--              MEMBER_PWD(비밀번호)     -- NOT NULL
--              MEMBER_NAME(회원명)      -- NOT NULL
--              GENDER(성별)             -- 'M' 또는 'F'로 입력되도록 제한
--              ADDRESS(주소)
--              PHONE(연락처)
--              STATUS(탈퇴 여부)        -- 기본값으로 'N' 그리고 'Y' 혹은 'N'으로 입력되도록 제약조건
--              ENROLL_DATE(가입일)      -- 기본값으로 SYSDATE, NOT NULL
CREATE TABLE TB_MEMBER
(
    MEMBER_NO   NUMBER,                  -- 기본 키
    MEMBER_ID   VARCHAR(4000),           -- 중복 금지
    MEMBER_PWD  VARCHAR(4000) NOT NULL,  -- NOT NULL
    MEMBER_NAME VARCHAR(4000) NOT NULL,  -- NOT NULL
    GENDER      VARCHAR(2)   ,           -- 'M' 또는 'F'로 입력되도록 제한
    ADDRESS     VARCHAR(4000),
    PHONE       VARCHAR(4000),
    STATUS      VARCHAR(2)   DEFAULT 'N',-- 기본값으로 'N' 그리고 'Y' 혹은 'N'으로 입력되도록 제약조건
    ENROLL_DATE DATE         DEFAULT SYSDATE NOT NULL,  -- 기본값으로 SYSDATE, NOT NULL
    CONSTRAINT TB_MEMBER_MEMBER_NO_PK PRIMARY KEY(MEMBER_NO),
    CONSTRAINT TB_MEMBER_MEMBER_NO_UQ UNIQUE(MEMBER_ID),
    CONSTRAINT TB_MEMBER_GENDER_CK    CHECK(GENDER IN('M','F')),
    CONSTRAINT TB_MEMBER_STATUS_CK    CHECK(STATUS IN('Y','N'))
);
COMMENT ON TABLE  TB_MEMBER              IS '회원';
COMMENT ON COLUMN TB_MEMBER.MEMBER_NO    IS '회원번호';  -- 기본 키
COMMENT ON COLUMN TB_MEMBER.MEMBER_ID    IS '아이디';    -- 중복 금지
COMMENT ON COLUMN TB_MEMBER.MEMBER_PWD   IS '비밀번호';  -- NOT NULL
COMMENT ON COLUMN TB_MEMBER.MEMBER_NAME  IS '회원명';    -- NOT NULL
COMMENT ON COLUMN TB_MEMBER.GENDER       IS '성별';      -- 'M' 또는 'F'로 입력되도록 제한
COMMENT ON COLUMN TB_MEMBER.ADDRESS      IS '주소';
COMMENT ON COLUMN TB_MEMBER.PHONE        IS '연락처';
COMMENT ON COLUMN TB_MEMBER.STATUS       IS '탈퇴 여부'; -- 기본값으로 'N' 그리고 'Y' 혹은 'N'으로 입력되도록 제약조건
COMMENT ON COLUMN TB_MEMBER.ENROLL_DATE  IS '가입일';    -- 기본값으로 SYSDATE, NOT NULL

--  2) 3개 정도의 샘플 데이터 추가하기

INSERT INTO TB_MEMBER VALUES(1, 'USER1', '1234', '김삐약', 'M', '경기도 군포시 산본동 1052번지 대림아파트 724-301호', '010-1111-1111', 'Y', DEFAULT);
INSERT INTO TB_MEMBER VALUES(2, 'USER2', '1234', '이어흥', 'M', '인천광역시 남동구 구월1동 1129-5 4층'              , '010-2222-2222', 'N', DEFAULT);
INSERT INTO TB_MEMBER VALUES(3, 'USER3', '1234', '다모여', 'F', '경기도 양평군 양평읍 회현리 591-6번지'             , '010-3333-3333', 'Y', DEFAULT);

-- 4. 도서를 대여한 회원에 대한 데이터를 담기 위한 대여 목록 테이블(TB_RENT)
--  1) 컬럼 :    RENT_NO(대여번호)                         -- 기본 키
--               RENT_MEM_NO(대여 회원번호)                -- 외래 키(TB_MEMBER와 참조) 이때 부모 데이터 삭제 시 NULL 값이 되도록 옵션 설정
--               RENT_BOOK_NO(대여 도서번호)               -- 외래 키(TB_BOOK와 참조) 이때 부모 데이터 삭제 시 NULL 값이 되도록 옵션 설정
--               RENT_DATE(대여일)                         -- 기본값 SYSDATE
CREATE TABLE TB_RENT                                       
(                                                          
    RENT_NO      NUMBER,                                   -- 기본 키
    RENT_MEM_NO  NUMBER,                                   -- 외래 키(TB_MEMBER와 참조) 이때 부모 데이터 삭제 시 NULL 값이 되도록 옵션 설정
    RENT_BOOK_NO NUMBER,                                   -- 외래 키(TB_BOOK와 참조)   이때 부모 데이터 삭제 시 NULL 값이 되도록 옵션 설정
    RENT_DATE    DATE    DEFAULT SYSDATE,                  -- 기본값 SYSDATE
    CONSTRAINT TB_RENT_RENT_NO_PK      PRIMARY KEY(RENT_NO),
    CONSTRAINT TB_RENT_RENT_MEM_NO_FK  FOREIGN KEY(RENT_MEM_NO)  REFERENCES TB_MEMBER(MEMBER_NO)  ON DELETE CASCADE,
    CONSTRAINT TB_RENT_RENT_BOOK_NO_FK FOREIGN KEY(RENT_BOOK_NO) REFERENCES TB_BOOK  (BK_NO)      ON DELETE CASCADE
);
COMMENT ON TABLE  TB_RENT              IS '대여 목록';
COMMENT ON COLUMN TB_RENT.RENT_NO      IS '대여번호';      -- 기본 키
COMMENT ON COLUMN TB_RENT.RENT_MEM_NO  IS '대여 회원번호'; -- 외래 키(TB_MEMBER와 참조) 이때 부모 데이터 삭제 시 NULL 값이 되도록 옵션 설정
COMMENT ON COLUMN TB_RENT.RENT_BOOK_NO IS '대여 도서번호'; -- 외래 키(TB_BOOK와 참조)   이때 부모 데이터 삭제 시 NULL 값이 되도록 옵션 설정
COMMENT ON COLUMN TB_RENT.RENT_DATE    IS '대여일';        -- 기본값 SYSDATE

--  2) 샘플 데이터 3개 정도
INSERT INTO TB_RENT VALUES(10, 1, 120, TO_DATE('2023-10-17', 'YYYY-MM-DD'));
INSERT INTO TB_RENT VALUES(11, 1, 210, TO_DATE('2023-10-31', 'YYYY-MM-DD'));
INSERT INTO TB_RENT VALUES(12, 2, 110, TO_DATE('2023-11-10', 'YYYY-MM-DD'));

-- 5. 2번 도서를 대여한 회원의 이름, 아이디, 대여일, 반납 예정일(대여일 + 7일)을 조회하시오.
SELECT B.BK_TITLE                             AS "도서명"
     , M.MEMBER_NAME                          AS "회원명"
     , M.MEMBER_ID                            AS "아이디"
     , TO_CHAR(R.RENT_DATE    , 'YYYY-MM-DD') AS "대여일"
     , TO_CHAR(R.RENT_DATE + 7, 'YYYY-MM-DD') AS "반납예정일"
  FROM TB_RENT                                R   -- 대여 목록
 INNER JOIN
       TB_BOOK                                B   -- 도서
    ON R.RENT_BOOK_NO                         = B.BK_NO
 INNER JOIN
       TB_MEMBER                              M   -- 회원
    ON R.RENT_MEM_NO                          = M.MEMBER_NO
 WHERE R.RENT_BOOK_NO                         = '120'
;


-- 6. 회원번호가 1번인 회원이 대여한 도서들의 도서명, 출판사명, 대여일, 반납 예정일(대여일 + 7일)을 조회하시오.
SELECT B.BK_TITLE                             AS "도서명"
     , P.PUB_NAME                             AS "출판사명"
     , TO_CHAR(R.RENT_DATE    , 'YYYY-MM-DD') AS "대여일"
     , TO_CHAR(R.RENT_DATE + 7, 'YYYY-MM-DD') AS "반납예정일"
  FROM TB_RENT                                R   -- 대여 목록
 INNER JOIN
       TB_BOOK                                B   -- 도서
    ON R.RENT_BOOK_NO                         = B.BK_NO
 INNER JOIN
       TB_PUBLISHER                           P   -- 출판사
    ON B.BK_PUB_NO                            = P.PUB_NO
 WHERE R.RENT_MEM_NO = 1
;

----------------------------------------------------------------------------------------------------------------

SELECT BK_PUB_NO                             AS "출판사 번호"
     , BK_NO                                 AS "도서번호"
     , BK_TITLE                              AS "도서명"
     , BK_AUTHOR                             AS "저자명"
     , BK_PRICE                              AS "가격"
  FROM TB_BOOK;                              -- 도서

SELECT ADDRESS                               AS "주소"
     , ENROLL_DATE                           AS "가입일"
     , STATUS                                AS "탈퇴 여부"
     , PHONE                                 AS "연락처"
     , GENDER                                AS "성별"
     , MEMBER_NAME                           AS "회원명"
     , MEMBER_PWD                            AS "비밀번호"
     , MEMBER_ID                             AS "아이디"
     , MEMBER_NO                             AS "회원번호"
  FROM TB_MEMBER;                            -- 회원

SELECT PUB_NO                                AS "출판사 번호"
     , PUB_NAME                              AS "출판사명"
     , PHONE                                 AS "출판사 전화번호"
  FROM TB_PUBLISHER;                         -- 출판사

SELECT RENT_BOOK_NO                          AS "대여 도서번호"
     , RENT_MEM_NO                           AS "대여 회원번호"
     , RENT_NO                               AS "대여번호"
     , RENT_DATE                             AS "대여일"
  FROM TB_RENT;                              -- 대여 목록

/*
    <DDL(Data Definition Language)>
        데이터 정의 언어로 객체(OBJECT)를 생성하고(CREATE), 수정하고(ALTER), 삭제(DROP)하는 구문이다.

    <CREATE>
        오라클 데이터 베이스 객체(테이블, 뷰, 인덱스 등)을 생성하는 구문이다.

    <테이블 생성>
        [표현법]
        CREATE TABLE 테이블명 (
            컬럼명 자료형(크기) [DEFAULT 기본값] [제약조건],
            컬럼명 자료형(크기) [DEFAULT 기본값] [제약조건],
            ...
        );
<제약조건>
    테이블 작성시 각 컬럼에 대해 저장될 데이터에 대한 제약조건을 설정할 제약조건은 데이터 무결성 보장을 목적으로 한다.
    (데이터의 정확성과 일관성을 유지시키는것)

    * 종류 : 제약조건은 NOT NULL, UNIQUE, CHECK, PRIMARY KEY, FOREIGN KEY 제약조건이 있다.
    [표현법]
    -- 1) 컬럼 레벨
            CREATE TABLE 테이블명 (
                컬럼명 자료형(크기) [CONSTRAINT 제약조건명] 제약조건,
                ...
            );
    -- 2) 테이블 레벨
            CREATE TABLE 테이블명 (
                컬럼명 자료형(크기),
                ...
                [CONSTRAINT 제약조건명] 제약조건 (컬럼명)
            );
    1. NOT NULL 제약조건
        해당 컬럼에 반드시 값이 있어야만 하는 경우에 사용한다
        NOT NULL 제약조건은 컬럼 레벨에서만 설정이 가능하다
    2. UNIQUE 제약조건
        컬럼에 중복된 값을 저장하거나 중복된 값으로 수정할 수 없도록 한다.
        UNIQUE 제약조건은 컬럼 레벨, 테이블 레벨에서 모두 설정이 가능하다.
        
    3. CHECK 제약조건
        컬럼에 기록되는 값에 조건을 설정하고 조건을 만족하는 값만 저장하거나 수정하도록 한다.
        비교 연산자를 이용하여 조건을 설정하며 비교 값을 리터럴만 사용 가능하고 변하는 값이나 함수 사용할 수 없다.
        CHECK 제약조건은 컬럼 레벨, 테이블 레벨에서 모두 설정이 가능하다.
        
    4. PRIMARY KEY 제약조건
        테이블에서 한 행의 정보를 식별하기 위해 사용할 컬럼에 부여하는 제약조건이다.
        PRIMARY KEY 제약조건은 컬럼 레벨, 테이블 레벨에서 모두 설정이 가능하다.
        
    5. FOREIGN KEY 외래키 제약 조건
        외래키 역할을 하는 컬럼에 부여하는 제약 조건이다.
        FOREIGN KEY 제약조건은 컬럼 레벨, 테이블 레벨에서 모두 설정이 가능하다.
    [표현법]
    1) 컬럼 레벨
        컬럼명 자료형(크기) [CONSTRAINT 제약조건명]   REFERENCES 참조할테이블명 [(컬럼명)][삭제룰]

    2) 테이블 레벨
        [CONSTRAINT 제약조건명] [FOREIGN KEY(컬럼명)] REFERENCES 참조할테이블명 [(컬럼명)][삭제룰]
    [삭제룰]
        ON DELETE RESTRICT : 자식 테이블의 참조 키가 부모 테이블의 키값을 참조하는 경우 부모 테이블의 행을 삭제할 수 없다. (기본)
        ON DELETE SET NULL : 부모 테이블의 데이터가 삭제 시 참조하고 있는 자식 테이블의 컬럼 값이 NULL로 변경된다.
        ON DELETE CASCADE  : 부모 테이블의 데이터가 삭제 시 참조하고 있는 자식 테이블의 컬럼 값이 존재하는 행 전체가 삭제된다.
*/
/*
CREATE TABLE MEMBER(
    -- 기본 표현법
    컬럼명 자료형(크기) [CONSTRAINT 제약조건명] 제약조건,
    -- 컬럼 레벨 방식
    NO NUMBER NOT NULL,                                                                                              - <NOT NULL           제약조건>
    NO NUMBER CONSTRAINT MEMBER_NO_NN NOT NULL,                                                                      - <NOT NULL           제약조건>
    NO NUMBER             UNIQUE,                                                                                    - <UNIQUE             제약조건>
    GENDER      VARCHAR2(3)  CONSTRAINT MEMBER_GENDER_CK   CHECK(GENDER = '남' OR GENDER = '여'),                    - <CHECK              제약조건>
    GENDER      VARCHAR2(3)  CONSTRAINT MEMBER_GENDER_CK   CHECK(GENDER IN('남','여')),                              - <CHECK              제약조건>
    GENDER      VARCHAR2(3)  CONSTRAINT MEMBER_AGE_CK      CHECK(AGE >= 0)                                           - <CHECK              제약조건>
    NO          NUMBER       CONSTRAINT MEMBER_NO_PK       PRIMARY KEY,                                              - <PRIMARY KEY        제약조건>
    GRADE_ID    NUMBER       REFERENCES MEMBER_GRADE,                                                                - <FOREIGN KEY(외래키)제약조건>
    GRADE_ID    NUMBER       CONSTRAINT MEMBER_GRADE_ID_FK FOREIGN KEY(GRADE_ID) REFERENCES MEMBER_GRADE(GRADE_CODE) - <FOREIGN KEY(외래키)제약조건>


    -- 테이블 레벨 방식       
    GENDER      VARCHAR2(3)   
    NO          NUMBER       ,
    ID          VARCHAR2(20) ,
    AGE         NUMBER       ,
    GRADE_ID    NUMBER       ,
    CONSTRAINT MEMBER_NO_UQ       UNIQUE(NO),                                                                        - <UNIQUE             제약조건>
    CONSTRAINT MEMBER_NO_ID_UQ    UNIQUE(NO,ID),                                                                     - <UNIQUE             제약조건>
    CONSTRAINT MEMBER_AGE_CK      CHECK(AGE >= 0)                                                                    - <CHECK              제약조건> 
    CONSTRAINT MEMBER_NO_PK       PRIMARY KEY(NO),                                                                   - <PRIMARY KEY        제약조건>
    CONSTRAINT MEMBER_NO_PK       PRIMARY KEY(NO, ID),                                                               - <PRIMARY KEY        제약조건>
    CONSTRAINT MEMBER_GRADE_ID_FK FOREIGN KEY(GRADE_ID) REFERENCES MEMBER_GRADE(GRADE_CODE) [ON DELETE RESTRICT]     - <FOREIGN KEY(외래키)제약조건>
    CONSTRAINT MEMBER_GRADE_ID_FK FOREIGN KEY(GRADE_ID) REFERENCES MEMBER_GRADE(GRADE_CODE) ON DELETE SET NULL       - <FOREIGN KEY(외래키)제약조건>
    CONSTRAINT MEMBER_GRADE_ID_FK FOREIGN KEY(GRADE_ID) REFERENCES MEMBER_GRADE(GRADE_CODE) ON DELETE CASCADE        - <FOREIGN KEY(외래키)제약조건>
);
*/
/*
<SUBQUERY 를 이용한 테이블 생성>
    서브 쿼리를 이용해서 SELECT의 조회 결과로 테이블을 생성하는 구문이다.
    컬럼명과 데이터 타입, 값이 복사되고, 제약조건은 NOT NULL만 복사된다.
-- 컬럼, 데이터 타입, 값, NOT NULL 제약조건 복사
-- EMPLOYEE 테이블을 복사한 새로운 테이블 생성
CREATE TABLE EMP_COPY AS SELECT *   FROM EMPLOYEE ;              -- 데이터 복사
CREATE TABLE EMP_COPY AS SELECT *   FROM EMPLOYEE  WHERE 1 = 0;  -- 데이터 제외 복사
 */
-- INSERT INTO 테이블명[(컬럼, 컬럼, ...)] VALUES(값, ... 값,  .... );