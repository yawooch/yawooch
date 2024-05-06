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



-- [Additional SELECT - 함수]




-- 1. 영어영문학과(학과코드 002) 학생들의 학번과 이름, 입학 년도를 입학 년도가 빠른
-- 순으로 표시하는 SQL 문장을 작성하시오.( 단, 헤더는 "학번", "이름", "입학년도" 가
-- 표시되도록 한다.)
-- 학번 이름 입학년도
-------- -------------------- -----------
-- 9973003 김용귺 1999-03-01
-- A473015 배용원 2004-03-01
-- A517105 이신열 2005-03-01
SELECT STUDENT_NO         AS "학생 번호"
     , STUDENT_NAME       AS "학생 이름"
     , ENTRANCE_DATE      AS "입학 년도"
  FROM TB_STUDENT
 WHERE DEPARTMENT_NO = '002'
 ORDER BY
       STUDENT_NO
     , STUDENT_NAME
     , ENTRANCE_DATE;


-- 2. 춘 기술대학교의 교수 중 이름이 세 글자가 아닌 교수가 한 명 있다고 한다. 그 교수의
-- 이름과 주민번호를 화면에 출력하는 SQL 문장을 작성해 보자. (* 이때 올바르게 작성한 SQL
-- 문장의 결과 값이 예상과 다르게 나올 수 있다. 원인이 무엇일지 생각해볼 것)
-- PROFESSOR_NAME PROFESSOR_SSN
------------------ --------------
-- 강혁 601004-1100528
-- 박강아름 681201-2134896
SELECT PROFESSOR_NAME        AS "교수 이름"
     , PROFESSOR_SSN         AS "교수 주민번호"
  FROM TB_PROFESSOR
 WHERE PROFESSOR_NAME NOT LIKE '___'
;


-- 3. 춘 기술대학교의 남자 교수들의 이름과 나이를 출력하는 SQL 문장을 작성하시오. 단
-- 이때 나이가 적은 사람에서 맋은 사람 순서로 화면에 출력되도록 맊드시오. (단, 교수 중
-- 2000 년 이후 출생자는 없으며 출력 헤더는 "교수이름", "나이"로 한다. 나이는 ‘만’으로
-- 계산한다.)
-- 교수이름 나이
------------------ ----------
-- 제상철 28
-- 주영상 28
-- 김명석 30
-- 싞영호 30
-- 박지평 32
-- …
-- 75 rows selected
SELECT PROFESSOR_NAME        AS "교수 이름"
     , 123 - SUBSTR(PROFESSOR_SSN, 1, 2)         AS "교수 나이"
     , PROFESSOR_NO          AS "교수 번호"
     , PROFESSOR_SSN         AS "교수 주민번호"
     , PROFESSOR_ADDRESS     AS "교수 주소"
     , DEPARTMENT_NO         AS "학과 번호"
  FROM TB_PROFESSOR
 WHERE SUBSTR(PROFESSOR_SSN, 8, 1) = '1'
 ORDER BY
       123 - SUBSTR(PROFESSOR_SSN, 1, 2)
;


-- 4. 교수들의 이름 중 성을 제외한 이름맊 출력하는 SQL 문장을 작성하시오. 출력 헤더는
-- 이름‛ 이 찍히도록 한다. (성이 2 자인 경우는 교수는 없다고 가정하시오)
-- 이름
------------------------------------
-- 진영
-- 윤필
-- …
-- …
-- 해원
-- 혁호
-- 114 rows selected
SELECT SUBSTR(PROFESSOR_NAME, 2,2)         AS "이름"
--     , PROFESSOR_NO          AS "교수 번호"
--     , PROFESSOR_NAME        AS "교수 이름"
--     , PROFESSOR_SSN         AS "교수 주민번호"
--     , PROFESSOR_ADDRESS     AS "교수 주소"
--     , DEPARTMENT_NO         AS "학과 번호"
  FROM TB_PROFESSOR;



-- 5. 춘 기술대학교의 재수생 입학자를 구하려고 한다. 어떻게 찾아낼 것인가? 이때,
-- 19 살에 입학하면 재수를 하지 않은 것으로 간주한다.
-- STUDENT_NO STUDENT_NAME
-------- --------------------
-- A513035 박경애
-- A513065 이경택
-- …
-- …
-- A241053 이희수
-- A241056 이희진
-- 204 rows selected
SELECT STUDENT_NO         AS "학생 번호"
     , DEPARTMENT_NO      AS "학과 번호"
--     , STUDENT_NAME       AS "학생 이름"
--     , STUDENT_SSN        AS "학생 주민번호"
--     , LPAD(SUBSTR(SUBSTR(STUDENT_SSN,1, 2) + 19, -1, 2), 2, '0')        AS "19년후"
--     , SUBSTR(ENTRANCE_DATE, 1, 2)      AS "년도"
--     , ENTRANCE_DATE      AS "입학 년도"
--     , STUDENT_ADDRESS    AS "학생 주소"
--     , ABSENCE_YN         AS "휴학 여부"
--     , COACH_PROFESSOR_NO AS "지도 교수 번호"
  FROM TB_STUDENT
 WHERE LPAD(SUBSTR(SUBSTR(STUDENT_SSN,1, 2) + 19, -1, 2), 2, '0') < SUBSTR(ENTRANCE_DATE, 1, 2);
-- 예시는 204ROWS 인데 왜 실제는 209ROWS...?

-- 6. 2020 년 크리스마스는 무슨 요일인가?
SELECT TO_CHAR(TO_DATE('2020-12-25'), 'day') FROM DUAL;


-- 7. TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD') 은 각각 몇 년 몇
-- 월 몇 일을 의미할까? 또 TO_DATE('99/10/11','RR/MM/DD'),
-- TO_DATE('49/10/11','RR/MM/DD') 은 각각 몇 년 몇 월 몇 일을 의미할까?
SELECT TO_CHAR(TO_DATE('99/10/11','YY/MM/DD'), 'YYYY-MM-DD') AS "DATE1-1"-- 2099년 10월 11일
     , TO_CHAR(TO_DATE('49/10/11','YY/MM/DD'), 'YYYY-MM-DD') AS "DATE1-2"-- 2049년 10월 11일
     , TO_CHAR(TO_DATE('99/10/11','RR/MM/DD'), 'YYYY-MM-DD') AS "DATE2-1"-- 1999년 10월 11일
     , TO_CHAR(TO_DATE('49/10/11','RR/MM/DD'), 'YYYY-MM-DD') AS "DATE2-2"-- 2049년 10월 11일
  FROM DUAL;

-- 8. 춘 기술대학교의 2000 년도 이후 입학자들은 학번이 A 로 시작하게 되어있다. 2000 년도
-- 이전 학번을 받은 학생들의 학번과 이름을 보여주는 SQL 문장을 작성하시오.
-- STUDENT_NO STUDENT_NAME
-------- --------------------
-- 9919024 김계영
-- 9831163 이권민
-- …
-- …
-- 9811251 김충원
-- 9911206 임충헌
-- 52 rows selected
SELECT STUDENT_NO         AS "학생 번호"
     , STUDENT_NAME       AS "학생 이름"
  FROM TB_STUDENT
 WHERE SUBSTR(STUDENT_NO, 1,1) != 'A'
;


-- 9. 학번이 A517178 인 한아름 학생의 학점 총 평점을 구하는 SQL 문을 작성하시오. 단,
-- 이때 출력 화면의 헤더는 "평점" 이라고 찍히게 하고, 점수는 반올림하여 소수점 이하 한
-- 자리까지만 표시한다.
-- 평점
--------
 -- 3.6
-- 1 개의 행이 선택되었습니다.
SELECT
       TERM_NO            AS "학기 번호"
     , STUDENT_NO         AS "학생 번호"
     , CLASS_NO           AS "과목 번호"
     , POINT              AS "학점"
  FROM TB_GRADE
 WHERE STUDENT_NO = 'A517178'
;
SELECT ROUND(AVG(POINT), 1) AS "평점"
  FROM TB_GRADE
 WHERE STUDENT_NO = 'A517178'
;


-- 10. 학과별 학생수를 구하여 "학과번호", "학생수(명)" 의 형태로 헤더를 만들어 결과값이
-- 출력되도록 하시오.
-- 학과번호 학생수(명)
-------- ----------
-- 001 14
-- 002 3
-- …
-- …
-- 061 7
-- 062 8
-- 62 rows selected
SELECT DEPARTMENT_NO      AS "학과 번호"
     , COUNT(*)           AS "학생수(명)"
  FROM TB_STUDENT
 GROUP BY
       DEPARTMENT_NO
 ORDER BY
       DEPARTMENT_NO;

-- 11. 지도 교수를 배정받지 못한 학생의 수는 몇 명 정도 되는 알아내는 SQL 문을
-- 작성하시오.
-- COUNT(*)
-- 9
--------
SELECT COUNT(*)
  FROM TB_STUDENT
 WHERE COACH_PROFESSOR_NO IS NULL;

-- 12. 학번이 A112113 인 김고운 학생의 년도 별 평점을 구하는 SQL 문을 작성하시오. 단,
-- 이때 출력 화면의 헤더는 "년도", "년도 별 평점" 이라고 찍히게 하고, 점수는 반올림하여
-- 소수점 이하 한 자리까지만 표시한다.
-- 년도 년도 별 평점
------ ------------
-- 2001 2.8
-- 2002 2.3
-- 2003 4
-- 2004 3.5
SELECT SUBSTR(TERM_NO, 1, 4)  AS "년도"
     , ROUND(AVG(POINT), 1)   AS "년도별평점"
  FROM TB_GRADE
 WHERE STUDENT_NO = 'A112113'
 GROUP BY
       SUBSTR(TERM_NO, 1, 4)
 ORDER BY
       SUBSTR(TERM_NO, 1, 4);



-- 13. 학과 별 휴학생 수를 파악하고자 한다. 학과 번호와 휴학생 수를 표시하는 SQL 문장을
-- 작성하시오.
-- 학과코드명 휴학생 수
----------- ------------------------------
-- 001 2
-- 002 0
-- 003 1
-- 061 2
-- 062 2
-- 62 rows selected
SELECT DEPARTMENT_NO AS "학과코드명"
     , COUNT(*)      AS "휴학생 수"
  FROM TB_STUDENT
 WHERE ABSENCE_YN = 'Y'
 GROUP BY
       DEPARTMENT_NO
 ORDER BY
       DEPARTMENT_NO;
-- 예시 ROWS 수와 일치하지 않는다


-- 14. 춘 대학교에 다니는 동명이인 학생들의 이름을 찾고자 한다. 어떤 SQL
-- 문장을 사용하면 가능하겠는가?
-- 동일이름 동명인 수
------------------ ----------
-- 김경민 2
-- 김명철 2
-- …
-- …
-- 조기현 2
-- 최효정 2
-- 20 rows selected
-- 15. 학번이 A112113 인 김고운 학생의 년도, 학기 별 평점과 년도 별 누적 평점 , 총
-- 평점을 구하는 SQL 문을 작성하시오. (단, 평점은 소수점 1 자리까지만 반올림하여
-- 표시한다.)
-- 년도 학기 평점
------ ---- ------------
-- 2001 01 2.5
-- 2001 02 3
-- 2001 2.8
-- 2002 01 2
-- 2002 02 2.5
-- 2002 2.3
-- 2003 01 3.5
-- 2003 02 4.5
-- 2003 03 4
-- 2003 4
-- 2004 01 4
-- 2004 02 3
-- 2004 3.5
-- 3.2
SELECT DECODE(GROUPING(SUBSTR(TERM_NO, 1, 4)), 1, '총점',SUBSTR(TERM_NO, 1, 4))   AS "년도"
     , DECODE(GROUPING(SUBSTR(TERM_NO, 5, 2)), 1, '연총점',SUBSTR(TERM_NO, 5, 2)) AS "학기"
     , ROUND(AVG(POINT), 1)   AS "평점"
  FROM TB_GRADE        -- "성적"
 WHERE STUDENT_NO = 'A112113'
 GROUP BY 
       ROLLUP(
              SUBSTR(TERM_NO, 1, 4)
            , SUBSTR(TERM_NO, 5, 2))
 ORDER BY 
       SUBSTR(TERM_NO, 1, 4)
     , SUBSTR(TERM_NO, 5, 2)
;