/*
SELECT
, DEPARTMENT_NO    AS "학과 번호"
, DEPARTMENT_NAME  AS "학과 이름"
, CATEGORY         AS "계열"
, OPEN_YN          AS "개설 여부"
, CAPACITY         AS "정원"
FROM TB_DEPARTMENT -- "학과"
;
SELECT
, CLASS_NO              AS "과목 번호"
, DEPARTMENT_NO         AS "학과 번호"
, PREATTENDING_CLASS_NO AS "선수 과목 번호"
, CLASS_NAME            AS "과목 이름"
, CLASS_TYPE            AS "과목 구분"
FROM TB_CLASS           -- "과목"
;
SELECT
, PROFESSOR_NO          AS "교수 번호"
, PROFESSOR_NAME        AS "교수 이름"
, PROFESSOR_SSN         AS "교수 주민번호"
, PROFESSOR_ADDRESS     AS "교수 주소"
, DEPARTMENT_NO         AS "학과 번호"
FROM TB_PROFESSOR       -- "교수"
;

SELECT
, CLASS_NO               AS "과목 번호"
, PROFESSOR_NO           AS "교수 번호"
FROM TB_CLASS_PROFESSOR  -- "과목 교수"
;

SELECT
, STUDENT_NO         AS "학생 번호"
, DEPARTMENT_NO      AS "학과 번호"
, STUDENT_NAME       AS "학생 이름"
, STUDENT_SSN        AS "학생 주민번호"
, STUDENT_ADDRESS    AS "학생 주소"
, ENTRANCE_DATE      AS "입학 년도"
, ABSENCE_YN         AS "휴학 여부"
, COACH_PROFESSOR_NO AS "지도 교수 번호"
FROM TB_STUDENT      -- "학생"
;
SELECT
, TERM_NO            AS "학기 번호"
, STUDENT_NO         AS "학생 번호"
, CLASS_NO           AS "과목 번호"
, POINT              AS "학점"
FROM TB_GRADE        -- "성적"
;
*/

-- [DDL]
-- 1. 계열 정보를 저장할 카테고리 테이블을 만들려고 한다. 다음과 같은 테이블을
-- 작성하시오.
-- 테이블 이름
-- TB_CATEGORY
-- 컬럼
-- NAME, VARCHAR2(10)
-- USE_YN, CHAR(1), 기본값은 Y 가 들어가도록
CREATE TABLE TB_CATEGORY
(
    NAME   VARCHAR2(10),
    USE_YN CHAR(1) DEFAULT 'Y'
);


-- 2. 과목 구분을 저장할 테이블을 만들려고 한다. 다음과 같은 테이블을 작성하시오.
-- 테이블이름
-- TB_CLASS_TYPE
-- 컬럼
-- NO, VARCHAR2(5), PRIMARY KEY
-- NAME , VARCHAR2(10)

CREATE TABLE TB_CLASS_TYPE
(
    NO   VARCHAR2(5) CONSTRAINT CLASSTYPE_NO_PK PRIMARY KEY,
    NAME VARCHAR2(10)
);


-- 3. TB_CATEGORY 테이블의 NAME 컬럼에 PRIMARY KEY 를 생성하시오.
-- (KEY 이름을 생성하지 않아도 무방함. 만일 KEY 이를 지정하고자 한다면 이름은 본인이
-- 알아서 적당한 이름을 사용한다.)

ALTER TABLE TB_CATEGORY ADD CONSTRAINT CATEGORY_NAME_PK PRIMARY KEY(NAME);


-- 4. TB_CLASS_TYPE 테이블의 NAME 컬럼에 NULL 값이 들어가지 않도록 속성을 변경하시오.

ALTER TABLE TB_CLASS_TYPE MODIFY NAME NOT NULL;


-- 5. 두 테이블에서 컬럼 명이 NO 인 것은 기존 타입을 유지하면서 크기는 10 으로, 컬럼명이
-- NAME 인 것은 마찬가지로 기존 타입을 유지하면서 크기 20 으로 변경하시오.
ALTER TABLE TB_CATEGORY	  MODIFY NAME	VARCHAR2(20);
ALTER TABLE TB_CLASS_TYPE MODIFY NAME	VARCHAR2(20);
ALTER TABLE TB_CLASS_TYPE MODIFY NO     VARCHAR2(10);




-- 6. 두 테이블의 NO 컬럼과 NAME 컬럼의 이름을 각 각 TB_ 를 제외한 테이블 이름이 앞에
-- 붙은 형태로 변경한다.
-- (ex. CATEGORY_NAME)

ALTER TABLE TB_CATEGORY   RENAME COLUMN NAME TO CATEGORY_NAME;
ALTER TABLE TB_CLASS_TYPE RENAME COLUMN NAME TO CLASS_TYPE_NAME;
ALTER TABLE TB_CLASS_TYPE RENAME COLUMN NO   TO CLASS_TYPE_NO;



-- 7. TB_CATAGORY 테이블과 TB_CLASS_TYPE 테이블의 PRIMARY KEY 이름을 다음과 같이
-- 변경하시오.
-- Primary Key 의 이름은 ‚PK_ + 컬럼이름‛으로 지정하시오. (ex. PK_CATEGORY_NAME )

ALTER TABLE TB_CATEGORY RENAME CONSTRAINT CATEGORY_NAME_PK TO PK_CATEGORY_NAME;



-- 8. 다음과 같은 INSERT 문을 수행한다.
-- INSERT INTO TB_CATEGORY VALUES ('공학','Y');
-- INSERT INTO TB_CATEGORY VALUES ('자연과학','Y');
-- INSERT INTO TB_CATEGORY VALUES ('의학','Y');
-- INSERT INTO TB_CATEGORY VALUES ('예체능','Y');
-- INSERT INTO TB_CATEGORY VALUES ('인문사회','Y');
-- COMMIT;


-- 9.TB_DEPARTMENT 의 CATEGORY 컬럼이 TB_CATEGORY 테이블의 CATEGORY_NAME 컬럼을 부모
-- 값으로 참조하도록 FOREIGN KEY 를 지정하시오. 이 때 KEY 이름은
-- FK_테이블이름_컬럼이름으로 지정한다. (ex. FK_DEPARTMENT_CATEGORY )

ALTER TABLE TB_DEPARTMENT ADD CONSTRAINT CATEGORY_NAME_FK       FOREIGN KEY(CATEGORY) REFERENCES TB_CATEGORY(CATEGORY_NAME);


-- 10. 춘 기술대학교 학생들의 정보만이 포함되어 있는 학생일반정보 VIEW 를 만들고자 한다.
-- 아래 내용을 참고하여 적절한 SQL 문을 작성하시오.
-- 뷰 이름
-- VW_학생일반정보
-- 컬럼
-- 학번
-- 학생이름
-- 주소
GRANT CREATE VIEW TO C##STUDY;

CREATE VIEW VW_학생일반정보 AS
SELECT STUDENT_NO      AS "학번"
     , STUDENT_NAME    AS "학생이름"
     , STUDENT_ADDRESS AS "주소"
  FROM TB_STUDENT;

SELECT * FROM VW_학생일반정보;


-- 11. 춘 기술대학교는 1 년에 두 번씩 학과별로 학생과 지도교수가 지도 면담을 진행한다.
-- 이를 위해 사용할 학생이름, 학과이름, 담당교수이름 으로 구성되어 있는  를 만드시오.
-- 이때 지도 교수가 없는 학생이 있을 수 있음을 고려하시오 (단, 이 VIEW 는 단순 SELECT
-- 만을 할 경우 학과별로 정렬되어 화면에 보여지게 만드시오.)
-- 뷰 이름
-- VW_지도면담
-- 컬럼
-- 학생이름
-- 학과이름
-- 지도교수이름

CREATE VIEW VW_지도면담 AS
SELECT S.STUDENT_NAME                          AS "학생이름"
     , D.DEPARTMENT_NAME                       AS "학과이름"
     , NVL(P.PROFESSOR_NAME, '지도교수없음')   AS "지도교수이름"
  FROM TB_STUDENT              S -- "학생"
  LEFT JOIN
       TB_PROFESSOR            P -- "교수"
    ON S.COACH_PROFESSOR_NO    = P.PROFESSOR_NO
 INNER JOIN
       TB_DEPARTMENT           D -- "학과"
    ON S.DEPARTMENT_NO         = D.DEPARTMENT_NO
 ORDER BY D.DEPARTMENT_NAME
;

SELECT * FROM VW_지도면담;

-- 12. 모든 학과의 학과별 학생 수를 확인할 수 있도록 적절한 VIEW 를 작성해 보자.
-- 뷰 이름
-- VW_학과별학생수
-- 컬럼
-- DEPARTMENT_NAME
-- STUDENT_COUNT
CREATE VIEW VW_학과별학생수 AS
SELECT D.DEPARTMENT_NAME    AS DEPARTMENT_NAME
     , COUNT(S.STUDENT_NO)  AS STUDENT_COUNT
  FROM TB_STUDENT           S -- "학생"
 INNER JOIN
       TB_DEPARTMENT        D -- "학과"
    ON S.DEPARTMENT_NO      = D.DEPARTMENT_NO
 GROUP BY D.DEPARTMENT_NAME
;

SELECT * FROM VW_학과별학생수;

-- 13. 위에서 생성한 학생일반정보 View 를 통해서 학번이 A213046 인 학생의 이름을 본인
-- 이름으로 변경하는 SQL 문을 작성하시오.

SELECT * FROM VW_학생일반정보 WHERE 학번 = 'A213046';
UPDATE VW_학생일반정보 SET VW_학생일반정보.학생이름 = '양우찬' WHERE 학번 = 'A213046';

-- 14. 13 번에서와 같이 VIEW 를 통해서 데이터가 변경될 수 있는 상황을 막으려면 VIEW 를
-- 어떻게 생성해야 하는지 작성하시오.

CREATE VIEW VW_학생일반정보 AS
SELECT STUDENT_NO      AS "학번"
     , STUDENT_NAME    AS "학생이름"
     , STUDENT_ADDRESS AS "주소"
  FROM TB_STUDENT
  WITH READ ONLY;


-- WITH READ ONLY 옵션을 준다.


-- 15. 춘 기술대학교는 매년 수강신청 기간만 되면 특정 인기 과목들에 수강 신청이 몰려
-- 문제가 되고 있다. 최근 3 년을 기준으로 수강인원이 가장 많았던 3 과목을 찾는 구문을
-- 작성해보시오.
-- 과목번호 과목이름 누적수강생수(명)
-------- ------------------------------ ----------------
-- C1753800 서어방언학 29
-- C1753400 서어문체론 23
-- C2454000 원예작물번식학특론 22
-- 왜 5년 해야 맞지...? 
SELECT "과목번호"
     , "과목이름"
     , "누적수강생수(명)"
  FROM (
       SELECT C.CLASS_NO          AS "과목번호"
            , C.CLASS_NAME        AS "과목이름"
            , COUNT(G.STUDENT_NO) AS "누적수강생수(명)"
         FROM TB_GRADE G
        INNER JOIN
              TB_CLASS C
           ON G.CLASS_NO = C.CLASS_NO  
        WHERE SUBSTR(TERM_NO,1,4) >= (SELECT MAX(SUBSTR(TERM_NO,1,4))- 4 FROM TB_GRADE)
        GROUP BY
              C.CLASS_NO
            , C.CLASS_NAME
        ORDER BY
              COUNT(G.STUDENT_NO) DESC
       )
  WHERE ROWNUM <= 3
;