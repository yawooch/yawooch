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


-- [Basic SELECT]
-- 1. 춘 기술대학교의 학과 이름과 계열을 표시하시오. 단, 출력 헤더는 "학과 명", "계열" 
-- 으로 표시하도록 한다.
-- 학과 명 계열
------------------ --------------------
-- 국어국문학과 인문사회
-- 영어영문학과 인문사회
-- 사학과 인문사회
-- 철학과 인문사회
-- 법학과 인문사회
-- 행정학과 인문사회
-- …
-- …
-- 체육학과 예체능
-- 63 rows selected
SELECT DEPARTMENT_NAME  AS "학과 이름"
     , CATEGORY         AS "계열"
  FROM TB_DEPARTMENT;

-- 2. 학과의 학과 정원을 다음과 같은 형태로 화면에 출력한다.
-- 학과별 정원
----------------------------------------------
-- 국어국문학과의 정원은 20 명 입니다.
-- 영어영문학과의 정원은 36 명 입니다. 
-- 사학과의 정원은 28 명 입니다.
-- 철학과의 정원은 28 명 입니다. 
-- ...
-- ... 
-- 63 rows selected
SELECT DEPARTMENT_NAME || '의 정원은'
     , CAPACITY || ' 명 입니다.'        AS "학과 정원"
  FROM TB_DEPARTMENT;


-- 3. "국어국문학과" 에 다니는 여학생 중 현재 휴학중인 여학생을 찾아달라는 요청이
-- 들어왔다. 누구인가? (국문학과의 '학과코드'는 학과 테이블(TB_DEPARTMENT)을 조회해서
-- 찾아 내도록 하자)
-- STUDENT_NAME
------------------
-- 한수현
SELECT STUDENT_NAME
  FROM TB_STUDENT
 WHERE DEPARTMENT_NO = '001'
   AND ABSENCE_YN    = 'Y'
   AND SUBSTR(STUDENT_SSN, 8, 1)  = '2';


-- 4. 도서관에서 대출 도서 장기 연체자 들을 찾아 이름을 게시하고자 한다. 그 대상자들의
-- 학번이 다음과 같을 때 대상자들을 찾는 적절한 SQL 구문을 작성하시오.
-- A513079, A513090, A513091, A513110, A513119
-- STUDENT_NAME
------------------
-- 홍경희
-- 최경희
-- 정경훈
-- 정경환
-- 이경환
SELECT STUDENT_NAME
  FROM TB_STUDENT
 WHERE STUDENT_NO IN('A513079', 'A513090', 'A513091' , 'A513110' , 'A513119');


-- 5. 입학정원이 20 명 이상 30 명 이하인 학과들의 학과 이름과 계열을 출력하시오.
-- DEPARTMENT_NAME CATEGORY
------------------ --------------------
-- 국어국문학과 인문사회
-- 사학과 인문사회
-- 철학과 인문사회
-- …
-- …
-- 미술학과 예체능
-- 산업디자인학과 예체능
-- 체육학과 예체능
-- 24 rows selected
SELECT DEPARTMENT_NAME  AS "학과 이름"
     , CATEGORY         AS "계열"
  FROM TB_DEPARTMENT
 WHERE CAPACITY         BETWEEN 20 AND 30;


-- 6. 춘 기술대학교는 총장을 제외하고 모든 교수들이 소속 학과를 가지고 있다. 그럼 춘
-- 기술대학교 총장의 이름을 알아낼 수 있는 SQL 문장을 작성하시오.
-- PROFESSOR_NAME
------------------
-- 임해정
SELECT PROFESSOR_NAME    AS "교수 이름"
  FROM TB_PROFESSOR
 WHERE DEPARTMENT_NO IS NULL;

-- 7. 혹시 전산상의 착오로 학과가 지정되어 있지 않은 학생이 있는지 확인하고자 한다. 
-- 어떠한 SQL 문장을 사용하면 될 것인지 작성하시오.
SELECT *
  FROM TB_STUDENT
 WHERE DEPARTMENT_NO IS NOT NULL;
  

-- 8. 수강신청을 하려고 한다. 선수과목 여부를 확인해야 하는데, 선수과목이 존재하는
-- 과목들은 어떤 과목인지 과목번호를 조회해보시오.
-- CLASS_NO
--------
-- C0405500
-- C0409000
-- C3745400
-- C0432500
-- C3051900
-- C3221500 
-- 6 rows selected
SELECT CLASS_NO              AS "과목 번호"
  FROM TB_CLASS    
 WHERE PREATTENDING_CLASS_NO IS NOT NULL;


-- 9. 춘 대학에는 어떤 계열(CATEGORY)들이 있는지 조회해보시오.
-- CATEGORY
------------------
-- 공학
-- 예체능
-- 의학
-- 인문사회
-- 자연과학
SELECT DISTINCT CATEGORY
  FROM TB_DEPARTMENT;

-- 10. 02 학번 전주 거주자들의 모임을 만들려고 한다. 휴학한 사람들은 제외한 재학중인
-- 학생들의 학번, 이름, 주민번호를 출력하는 구문을 작성하시오.
-- STUDENT_NO STUDENT_NAME STUDENT_SSN
-------- -------------------- --------------
-- A217005 고수현 821119-2122202
-- …
-- …
-- A211375 최허현 841102-1154425 
-- 11 rows selected
SELECT STUDENT_NO
     , STUDENT_NAME
     , STUDENT_SSN
  FROM TB_STUDENT
 WHERE ABSENCE_YN = 'N'
   AND SUBSTR(STUDENT_NO, 1,2) = 'A2'
   AND STUDENT_ADDRESS LIKE '%전주%';