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
 WHERE TABLE_NAME IN('DEPARTMENT')
 ORDER BY TABLE_NAME, NUM
;
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
 WHERE UC.TABLE_NAME IN('DEPT_COPY')
-- WHERE UC.TABLE_NAME = 'MEMBER_GRADE'
--   AND UC.CONSTRAINT_NAME = 'SYS_C008376'
 ORDER BY TABLE_NAME, CONSTRAINT_NAME
;

-- ********************************************************************************************************************

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
/*
<ALTER>
    오라클 데이터베이스 객체(테이블, 인덱스, 뷰 등)를 수정하는 구분이다.
*/
-- 실습에 사용할 테이블 생성
CREATE TABLE DEPT_COPY AS
SELECT *
  FROM DEPARTMENT
;
SELECT * FROM DEPT_COPY;
/*
    1. 컬럼 추가 / 수정 / 삭제 / 이름 변경
        1) 컬럼 추가
            ALTER TABLE 테이블명 ADD 컬럼명 데이터타입 [DEFAULT 기본값];
*/

-- DEPT_COPY 테이블에 CNAME 컬럼을 추가
ALTER TABLE DEPT_COPY ADD CNAME VARCHAR2(20);

-- DEPT_COPY 테이블에 LNAME 컬럼 추가 (기본값: 대한민국)
ALTER TABLE DEPT_COPY ADD LNAME VARCHAR2(20) DEFAULT '대한민국';
/*
        2) 컬럼 수정
            데이터 타입 변경
                ALTER TABLE 테이블명 MODIFY 컬럼명 변경할데이터타입;
            기본값 변경
                ALTER TABLE 테이블명 MODIFY 컬럼명 DEFAULT 변경할기본값;
*/
-- DEPT_COPY 테이블에 DEPT_ID 컬럼의 데이터 타입을 CHAR(3) 로 변경
-- 변경하려는 자료형의 크기보다 이미 큰값이 존재하면 에러가 발생
ALTER TABLE DEPT_COPY MODIFY DEPT_ID CHAR(4);

-- DEPT_COPY 테이블에 CNAME 컬럼의 데이터 타입을 NUMBER로 변경
ALTER TABLE DEPT_COPY MODIFY CNAME NUMBER;
ALTER TABLE DEPT_COPY MODIFY LNAME NUMBER; -- 오류 보고 - ORA-01439: 데이터 유형을 변경할 열은 비어 있어야 합니다

-- DEPT_COPY 테이블에 LNAME 컬럼의 기본값을 미국으로 변경
ALTER TABLE DEPT_COPY MODIFY LNAME DEFAULT '미국';
ALTER TABLE DEPT_COPY MODIFY LNAME DEFAULT NULL;

-- DEPT_COPY 테이블에 DEPT_TITLE 컬럼의 데이터 타입을 VARCHAR2(40) 로 변경
-- DEPT_COPY 테이블에 LOCATION_ID 컬럼의 데이터 타입을 VARCHAR2(2)로 변경
-- DEPT_COPY 테이블에 LNAME 컬럼의 기본값을 '한국' 변경하기
ALTER TABLE DEPT_COPY MODIFY DEPT_TITLE  VARCHAR2(40)
                      MODIFY LOCATION_ID VARCHAR2(2)
                      MODIFY LNAME       DEFAULT '한국';
/*
        3) 컬럼 삭제
            ALTER TABLE 테이블명 DROP COLUMN 컬럼명;
*/
-- DEPT_COPY 테이블에서 DEPT_ID 컬럼을 삭제
-- DDL 구문은 ROLLBACK으로 복구 불가능
ALTER TABLE DEPT_COPY DROP COLUMN DEPT_ID;
ALTER TABLE DEPT_COPY DROP COLUMN CNAME;
ALTER TABLE DEPT_COPY DROP COLUMN LNAME;
ALTER TABLE DEPT_COPY DROP COLUMN DEPT_TITLE;
ALTER TABLE DEPT_COPY DROP COLUMN LOCATION_ID;-- 오류 보고 - ORA-12983: 테이블에 모든 열들을 삭제할 수 없습니다

-- 참조되고 있는 컬럼이 있다면 삭제가 불가능하다.
ALTER TABLE MEMBER_GRADE DROP COLUMN GRADE_CODE; -- 오류 보고 - ORA-12992: 부모 키 열을 삭제할 수 없습니다

-- 아래와 같이 옵션을 지정하면 참조되고 있는 컬럼도 삭제가 가능하다
-- 단, 참조하고 있는 컬럼의 제약조건도 삭제된다.
ALTER TABLE MEMBER_GRADE DROP COLUMN GRADE_CODE CASCADE CONSTRAINTS;
/*
        4) 컬럼명 변경
            ALTER TABLE 테이블명 RENAME COLUMN 기존컬럼명 TO 변경할컬럼명;
*/
-- DEPT_COPY 테이블의 LOCATION_ID 컬럼명을 LOCATION_NAME 으로 변경
ALTER TABLE DEPT_COPY RENAME COLUMN LOCATION_ID TO LOCATION_NAME;


DROP TABLE DEPT_COPY;
DROP TABLE MEMBER;
DROP TABLE MEMBER_GRADE;
/*
    2. 제약조건 추가 / 삭제 / 이름 변경
        1) 제약조건 추가
            -- 제약조건 추가 (PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK)
            ALTER TABLE 테이블명 ADD [CONSTRAINT 제약조건명] 제약조건(컬럼명);

            -- NOT NULL 제약조건 추가
            ALTER TABLE 테이블명 MODIFY 컬럼명 [CONSTRAINT 제약조건명] NOT NULL;
*/
-- 실습에 사용할 테이블 생성
CREATE TABLE DEPT_COPY AS
SELECT *
  FROM DEPARTMENT;
/* 
┏----------┳---------------┳-----------┳---------------┳-------------------------┓
┃TABLE_NAME┃CONSTRAINT_TYPE┃COLUMN_NAME┃CONSTRAINT_NAME┃SEARCH_CONDITION         ┃
┣----------╋---------------╋-----------╋---------------╋-------------------------┫
┃DEPT_COPY ┃C              ┃DEPT_ID    ┃SYS_C008556    ┃"DEPT_ID" IS NOT NULL    ┃
┃DEPT_COPY ┃C              ┃LOCATION_ID┃SYS_C008557    ┃"LOCATION_ID" IS NOT NULL┃
┖----------┸---------------┸-----------┸---------------┸-------------------------┚
 */
-- DEPT_COPY 테이블의 DEPT_ID 컬럼에 PK 제약조건 추가
ALTER TABLE DEPT_COPY ADD CONSTRAINT DC_ID_PK PRIMARY KEY(DEPT_ID);
/* 
  ┏----------┳---------------┳-----------┳---------------┳-------------------------┓
  ┃TABLE_NAME┃CONSTRAINT_TYPE┃COLUMN_NAME┃CONSTRAINT_NAME┃SEARCH_CONDITION         ┃
  ┣----------╋---------------╋-----------╋---------------╋-------------------------┫
▶┃DEPT_COPY ┃P              ┃DEPT_ID    ┃DC_ID_PK       ┃null                     ┃
  ┃DEPT_COPY ┃C              ┃DEPT_ID    ┃SYS_C008556    ┃"DEPT_ID" IS NOT NULL    ┃
  ┃DEPT_COPY ┃C              ┃LOCATION_ID┃SYS_C008557    ┃"LOCATION_ID" IS NOT NULL┃
  ┖----------┸---------------┸-----------┸---------------┸-------------------------┚
 */

-- DEPT_COPY 테이블의 DEPT_TITLE 컬럼에 UNIQUE 제약조건 추가
ALTER TABLE DEPT_COPY ADD CONSTRAINT DC_TITLE_UQ UNIQUE(DEPT_TITLE);
/* 
  ┏----------┳---------------┳-----------┳---------------┳-------------------------┓
  ┃TABLE_NAME┃CONSTRAINT_TYPE┃COLUMN_NAME┃CONSTRAINT_NAME┃SEARCH_CONDITION         ┃
  ┣----------╋---------------╋-----------╋---------------╋-------------------------┫
  ┃DEPT_COPY ┃P              ┃DEPT_ID    ┃DC_ID_PK       ┃null                     ┃
▶┃DEPT_COPY ┃U              ┃DEPT_TITLE ┃DC_TITLE_UQ    ┃null                     ┃
  ┃DEPT_COPY ┃C              ┃DEPT_ID    ┃SYS_C008556    ┃"DEPT_ID" IS NOT NULL    ┃
  ┃DEPT_COPY ┃C              ┃LOCATION_ID┃SYS_C008557    ┃"LOCATION_ID" IS NOT NULL┃
  ┖----------┸---------------┸-----------┸---------------┸-------------------------┚
 */
-- DEPT_COPY 테이블의 DEPT_TITLE 컬럼에 NOT NULL 제약조건 추가
ALTER TABLE DEPT_COPY MODIFY DEPT_TITLE CONSTRAINT DC_TITLE_NN NOT NULL;
/*
  ┌──────────┬───────┬───────┬─────────┬─────────────┐
  │ CONSTRAINT_NAME    │ TABLE_NAME   │ COLUMN_NAME  │ CONSTRAINT_TYPE  │ SEARCH_CONDITION         │
  ├──────────┼───────┼───────┼─────────┼─────────────┤
  │ SYS_C008523        │ DEPT_COPY    │ DEPT_ID      │ C                │ "DEPT_ID" IS NOT NULL    │
  │ SYS_C008524        │ DEPT_COPY    │ LOCATION_ID  │ C                │ "LOCATION_ID" IS NOT NULL│
▶│ DC_TITLE_NN        │ DEPT_COPY    │ DEPT_TITLE   │ C                │ "DEPT_TITLE" IS NOT NULL │
  │ DC_ID_PK           │ DEPT_COPY    │ DEPT_ID      │ P                │                          │
  │ DC_TITLE_UQ        │ DEPT_COPY    │ DEPT_TITLE   │ U                │                          │
  └──────────┴───────┴───────┴─────────┴─────────────┘
*/
-- EMPLOYEE 테이블의 DEPT_CODE, JOB_CODE 컬럼에 FOREIGN KEY 제약조건을 추가
ALTER TABLE EMPLOYEE ADD CONSTRAINT DEPT_CODE_FK FOREIGN KEY(DEPT_CODE) REFERENCES DEPARTMENT(DEPT_ID);
ALTER TABLE EMPLOYEE ADD CONSTRAINT JOB_CODE_FK  FOREIGN KEY(JOB_CODE)  REFERENCES JOB(JOB_CODE);



-- MEMBER_GRADE 테이블 생성후 PK, NOT NULL 제약조건을 추가
CREATE TABLE MEMBER_GRADE
(
       GRADE_CODE NUMBER       ,
       GRADE_NAME VARCHAR2(20)
);

-- MEMBER       테이블 생성후 PK, FK, NOT NULL, UNIQUE, CHECK 제약조건을 추가
CREATE TABLE MEMBER(
    NO          NUMBER,
    ID          VARCHAR2(20) ,
    PASSWORD    VARCHAR2(20) ,
    NAME        VARCHAR2(15) ,
    GENDER      VARCHAR2(3)  ,
    AGE         NUMBER       ,
    GRADE_ID    NUMBER       ,
    ENROLL_DATE DATE         DEFAULT SYSDATE
);

/*
ALTER TABLE 테이블명 ADD [CONSTRAINT 제약조건명] 제약조건(컬럼명);
-- NOT NULL 제약조건 추가
ALTER TABLE 테이블명 MODIFY 컬럼명 [CONSTRAINT 제약조건명] NOT NULL;
 */
-- MEMBER_GRADE 테이블
-- PK       : GRADE_CODE
-- NOT NULL : GRADE_NAME
ALTER TABLE MEMBER_GRADE ADD               CONSTRAINT GRADE_CODE_PK PRIMARY KEY(GRADE_CODE);
ALTER TABLE MEMBER_GRADE MODIFY GRADE_NAME CONSTRAINT GRADE_NAME_NN NOT NULL;

INSERT INTO MEMBER_GRADE VALUES(10, '일반회원');
INSERT INTO MEMBER_GRADE VALUES(20, '우수회원');
INSERT INTO MEMBER_GRADE VALUES(30, '특별회원');


-- MEMBER 테이블
-- PK       : NO
-- FK       : GRADE_ID
-- NOT NULL : NAME , PASSWORD
-- CHECK    : AGE , GENDER
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_NO_PK       PRIMARY KEY(NO);
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_GRADE_ID_FK FOREIGN KEY(GRADE_ID) REFERENCES MEMBER_GRADE(GRADE_CODE);
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_GENDER_CK   CHECK(GENDER IN('남','여'));
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_AGE_CK      CHECK(AGE >= 0);
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_ID_UQ       UNIQUE;


ALTER TABLE MEMBER MODIFY NAME      CONSTRAINT MEMBER_NAME_NN     NOT NULL;
ALTER TABLE MEMBER MODIFY PASSWORD  CONSTRAINT MEMBER_PASSWORD_NN NOT NULL;
ALTER TABLE MEMBER MODIFY ID        CONSTRAINT MEMBER_ID_NN       NOT NULL;


INSERT INTO MEMBER VALUES(1, 'USER1', '1234', '홍길동', '남', 22, 10  , DEFAULT);
INSERT INTO MEMBER VALUES(2, 'USER2', '5678', '성춘향', '여', 22, 20  , DEFAULT);
INSERT INTO MEMBER VALUES(3, 'USER3', '5678', '임꺽정', '여', 22, 30  , DEFAULT);

/*
    2) 제약조건 삭제
        NOT NULL
            ALTER TABLE 테이블명 MODIFY 컬럼명 NULL;
        나머지
            ALTER TABLE 테이블명 DROP   CONSTRAINT 제약조건명;
*/


ALTER TABLE DEPT_COPY DROP CONSTRAINT DC_ID_PK;
ALTER TABLE DEPT_COPY DROP CONSTRAINT DC_TITLE_UQ;
ALTER TABLE DEPT_COPY MODIFY DEPT_TITLE NULL;

ALTER TABLE MEMBER DROP CONSTRAINT MEMBER_NO_PK       ;
ALTER TABLE MEMBER DROP CONSTRAINT MEMBER_GRADE_ID_FK ;
ALTER TABLE MEMBER DROP CONSTRAINT MEMBER_GENDER_CK   ;
ALTER TABLE MEMBER DROP CONSTRAINT MEMBER_AGE_CK      ;
ALTER TABLE MEMBER DROP CONSTRAINT MEMBER_ID_UQ       ;
ALTER TABLE MEMBER MODIFY NAME      NULL;
ALTER TABLE MEMBER MODIFY PASSWORD  NULL;
ALTER TABLE MEMBER MODIFY ID        NULL;


/*
    3) 제약 조건명 변경
        ALTER TABLE 테이블명 RENAME CONSTRAINT 기존제약조건명 TO 변경할제약조건명;
*/
-- DEPT_COPY 테이블에서 SYS_C008523 제약조건명을 DEPT_ID_NN로 변경
ALTER TABLE DEPT_COPY RENAME CONSTRAINT SYS_C008523 TO DEPT_ID_NN;

-- DEPT_COPY 테이블에서 SYS_C008524 제약조건명을 LOCATION_ID_NN로 변경
ALTER TABLE DEPT_COPY RENAME CONSTRAINT LOCATION_ID_NN로 TO LOCATION_ID_NN;

/* 
    3. 테이블명 변경
        ALTER TABLE 테이블명 RENAME TO 변경할 테이블명;
        RENAME 기존테이블명 TO 변경할테이블명
*/

-- DEPT_COPY 테이블의 이름을 DEPT_TEST 로 변경
ALTER TABLE DEPT_COPY RENAME TO DEPT_TEST;

-- DEPT_TEST 테이블의 이름을 DEPT_COPY 로 변경
RENAME DEPT_TEST TO DEPT_COPY;


/* 
<DROP>
    오라클에서 제공하는 객체를 삭제하는 구문이다.
*/

-- DEPT_COPY 테이블 삭제
DROP TABLE DEPT_COPY;

-- MEMBER_GRADE 테이블 삭제
-- 참조되고 있는 부모 테이블은 함부로 삭제가 되지 않는다.
SELECT * FROM MEMBER_GRADE;
DROP TABLE MEMBER_GRADE;

-- 부모테이블을 삭제하고자 한다면
-- 1) 자식테이블 먼저 삭제한 후 부모 테이블을 삭제한다.
DROP TABLE MEMBER;
DROP TABLE MEMBER_GRADE;

-- 2) 아래와 같이 옵션을 지정하면 부모 테이블을 삭제할수 있다.
-- 단, 참조하고 있는 자식 테이블의 제약 조건도 삭제된다.
DROP TABLE MEMBER_GRADE CASCADE CONSTRAINT;
DROP TABLE MEMBER_GRADE CASCADE CONSTRAINTS;
/*
<ALTER>
    오라클 데이터베이스 객체(테이블, 인덱스, 뷰 등)를 수정하는 구분이다.
    1. 컬럼 추가 / 수정 / 삭제 / 이름 변경
        1) 컬럼 추가
            ALTER TABLE 테이블명 ADD 컬럼명 데이터타입 [DEFAULT 기본값];
        2) 컬럼 수정
            데이터 타입 변경
                ALTER TABLE 테이블명 MODIFY 컬럼명 변경할데이터타입;
            기본값 변경
                ALTER TABLE 테이블명 MODIFY 컬럼명 DEFAULT 변경할기본값;
                -- 오류 보고 - ORA-01439: 데이터 유형을 변경할 열은 비어 있어야 합니다
        3) 컬럼 삭제
            ALTER TABLE 테이블명 DROP COLUMN 컬럼명;
        -- DDL 구문은 ROLLBACK으로 복구 불가능
        -- 오류 보고 - ORA-12983: 테이블에 모든 열들을 삭제할 수 없습니다
        -- 참조되고 있는 컬럼이 있다면 삭제가 불가능하다.
        -- 오류 보고 - ORA-12992: 부모 키 열을 삭제할 수 없습니다
            -- CASCADE CONSTRAINTS 옵션을 지정하면 참조되고 있는 컬럼도 삭제가 가능하다
            -- 단, 참조하고 있는 컬럼의 제약조건도 삭제된다.
        4) 컬럼명 변경
            ALTER TABLE 테이블명 RENAME COLUMN 기존컬럼명 TO 변경할컬럼명;
    2. 제약조건 추가 / 삭제 / 이름 변경
        1) 제약조건 추가
            -- 제약조건 추가 (PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK)
            ALTER TABLE 테이블명 ADD [CONSTRAINT 제약조건명] 제약조건(컬럼명);
            -- NOT NULL 제약조건 추가
            ALTER TABLE 테이블명 MODIFY 컬럼명 [CONSTRAINT 제약조건명] NOT NULL;
        2) 제약조건 삭제
            NOT NULL
                ALTER TABLE 테이블명 MODIFY 컬럼명 NULL;
            나머지
                ALTER TABLE 테이블명 DROP   CONSTRAINT 제약조건명;
    3. 제약 조건명 변경
        ALTER TABLE 테이블명 RENAME CONSTRAINT 기존제약조건명 TO 변경할제약조건명;
    4. 테이블명 변경
        ALTER TABLE 테이블명 RENAME TO 변경할 테이블명;
        RENAME 기존테이블명 TO 변경할테이블명
<DROP>
    - 오라클에서 제공하는 객체를 삭제하는 구문이다.
    - 참조되고 있는 부모 테이블은 함부로 삭제가 되지 않는다.
    부모테이블을 삭제하고자 한다면
        1) 자식테이블 먼저 삭제한 후 부모 테이블을 삭제한다.
        2) 아래와 같이 옵션을 지정하면 부모 테이블을 삭제할수 있다.
            단, 참조하고 있는 자식 테이블의 제약 조건도 삭제된다.
*/
