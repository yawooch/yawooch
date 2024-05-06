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
-- [DML]
-- 1. 과목유형 테이블(TB_CLASS_TYPE)에 아래와 같은 데이터를 입력하시오.
-- 번호, 유형이름
----------
-- 01, 전공필수
-- 02, 전공선택
-- 03, 교양필수
-- 04, 교양선택
-- 05. 논문지도

INSERT INTO TB_CLASS_TYPE VALUES('01', '전공필수');
INSERT INTO TB_CLASS_TYPE VALUES('02', '전공선택');
INSERT INTO TB_CLASS_TYPE VALUES('03', '교양필수');
INSERT INTO TB_CLASS_TYPE VALUES('04', '교양선택');
INSERT INTO TB_CLASS_TYPE VALUES('05', '논문지도');


-- 2. 춘 기술대학교 학생들의 정보가 포함되어 있는 학생일반정보 테이블을 만들고자 한다. 
-- 아래 내용을 참고하여 적절한 SQL 문을 작성하시오. (서브쿼리를 이용하시오)
-- 테이블이름
-- TB_학생일반정보
-- 컬럼
-- 학번
-- 학생이름
-- 주소

CREATE TABLE TB_학생일반정보 AS
SELECT STUDENT_NO            AS "학번"
     , STUDENT_NAME          AS "학생이름"
     , STUDENT_ADDRESS       AS "주소"
  FROM TB_STUDENT;

SELECT * FROM TB_학생일반정보;


-- 3. 국어국문학과 학생들의 정보만이 포함되어 있는 학과정보 테이블을 만들고자 한다. 
-- 아래 내용을 참고하여 적절한 SQL 문을 작성하시오. (힌트 : 방법은 다양함, 소신껏
-- 작성하시오)
-- 테이블이름
-- TB_국어국문학과
-- 컬럼
-- 학번
-- 학생이름
-- 출생년도 <= 네자리 년도로 표기
-- 교수이름

CREATE TABLE TB_국어국문학과 AS
SELECT S.STUDENT_NO                                                 AS "학번"
     , S.STUDENT_NAME                                               AS "학생이름"
     , EXTRACT(YEAR FROM TO_DATE(SUBSTR(S.STUDENT_SSN, 1,2), 'RR')) AS "출생년도"
     , P.PROFESSOR_NAME                                             AS "교수이름"
  FROM TB_STUDENT  S
 INNER JOIN
       TB_PROFESSOR P
    ON S.COACH_PROFESSOR_NO = P.PROFESSOR_NO
 WHERE S.DEPARTMENT_NO      = (
                              SELECT DEPARTMENT_NO
                                FROM TB_DEPARTMENT
                               WHERE DEPARTMENT_NAME = '국어국문학과'
                              );
SELECT * FROM TB_국어국문학과;
    




-- 4. 현 학과들의 정원을 10% 증가시키게 되었다. 이에 사용할 SQL 문을 작성하시오. (단, 
-- 반올림을 사용하여 소수점 자릿수는 생기지 않도록 한다)

UPDATE TB_DEPARTMENT
   SET CAPACITY = ROUND(CAPACITY * 1.1);

SELECT * FROM TB_DEPARTMENT;


-- 5. 학번 A413042 인 박건우 학생의 주소가 "서울시 종로구 숭인동 181-21 "로 변경되었다고
-- 한다. 주소지를 정정하기 위해 사용할 SQL 문을 작성하시오.
-- 경기도 파주시 적성면 장현2리 산65번지
UPDATE TB_STUDENT
   SET STUDENT_ADDRESS = '서울시 종로구 숭인동 181-21'
 WHERE STUDENT_NO = 'A413042'
;
SELECT * FROM TB_STUDENT WHERE STUDENT_NO = 'A413042';


-- 6. 주민등록번호 보호법에 따라 학생정보 테이블에서 주민번호 뒷자리를 저장하지 않기로
-- 결정하였다. 이 내용을 반영할 적절한 SQL 문장을 작성하시오.
-- (예. 830530-2124663 ==> 830530 )

UPDATE TB_STUDENT
   SET STUDENT_SSN = SUBSTR(STUDENT_SSN, 1,6);
   
SELECT * FROM TB_STUDENT;


-- 7. 의학과 김명훈 학생은 2005 년 1 학기에 자신이 수강할 '피부생리학' 점수가
-- 잘못되었다는 것을 발견하고는 정정을 요청하였다. 담당 교수의 확인 받은 결과 해당
-- 과목의 학점을 3.5 로 변경키로 결정되었다. 적절한 SQL 문을 작성하시오.
--POINT = 1.5
UPDATE TB_GRADE
   SET POINT      = 3.5
 WHERE TERM_NO    = '200501'
   AND STUDENT_NO = (
                    SELECT STUDENT_NO FROM TB_STUDENT
                    WHERE STUDENT_NAME  = '김명훈'
                      AND DEPARTMENT_NO = (SELECT DEPARTMENT_NO FROM TB_DEPARTMENT WHERE DEPARTMENT_NAME = '의학과')
                    );


-- 8. 성적 테이블(TB_GRADE) 에서 휴학생들의 성적항목을 제거하시오

SELECT COUNT(*) FROM TB_GRADE;
DELETE FROM TB_GRADE
 WHERE STUDENT_NO IN(
 SELECT STUDENT_NO FROM TB_STUDENT WHERE ABSENCE_YN = 'Y'
);