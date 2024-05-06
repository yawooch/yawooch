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

-- [Additional SELECT - Option]

-- 1. 학생이름과 주소지를 표시하시오. 단, 출력 헤더는 "학생 이름", "주소지"로 하고,
-- 정렬은 이름으로 오름차순 표시하도록 핚다.
-- 학생 이름 주소지
------------------ ----------------------------------------------------------
-- 감현제 서울강서등촌동691-3부영@102-505
-- 강동연 경기도 의정부시 민락동 694 산들마을 대림아파트 404-1404
-- …
-- 황형철 전남 순천시 생목동 현대ⓐ 106/407 T.061-772-2101
-- 황효종 인천시서구 석남동 564-4번지
-- 588 rows selected
SELECT STUDENT_NAME       AS "학생 이름"
     , STUDENT_ADDRESS    AS "주소지"
  FROM TB_STUDENT      -- "학생"
 ORDER BY STUDENT_NAME DESC;



-- 2. 휴학중인 학생들의 이름과 주민번호를 나이가 적은 순서로 화면에 출력하시오.
-- STUDENT_NAME STUDENT_SSN
------------------ --------------
-- 릴희권 871222-1124648
-- 황효종 871125-1129980
-- 전효선 871030-2176192
-- 김진호 871013-1140536
-- …
-- …
-- 91 rows selected
SELECT STUDENT_NAME
     , STUDENT_SSN
  FROM TB_STUDENT
 ORDER BY STUDENT_SSN DESC;


-- 3. 주소지가 강원도나 경기도인 학생들 중 1900 년대 학번을 가진 학생들의 이름과 학번,
-- 주소를 이름의 오름차순으로 화면에 출력하시오. 단, 출력헤더에는 "학생이름","학번",
-- "거주지 주소" 가 출력되도록 핚다.
-- 학생이름 학번 거주지 주소
------------------ ---------- -------------------------------------------------------------
-- 김계영 9919024 경기도 용인시 수지구 풍덕천2동 싞정마을 임광 305-1703호
-- 박규상 9931111 경기도 성남시 분당구 탑마을 526 경남아파트 710-1302
-- 송귺우 9931165 경기도 부천시 원미구 중2동 386-1186 복사골아파트 1701-405
-- 송정삼 9995148 경기도 남양주시 도농동 부영그린타운 306-2304
-- 이기범 9931248 경기도 군포시 산본동 핚양목련아파트1224-2002
-- 이춘평 9811176 경기도 고양시 일산구 일산동1107후곡마을1209-705
-- 전기성 9931277 경기도 용인시 수지구 풍덕천동 239-3 중앙빌딩 3층
-- 정기웅 9931285 경기도 성남시 분당구 야탑동 기산아파트 307-801호
-- 조기환 9931312 경기도 시흥시 매화동 194-1 동진아파트 1-305
-- 9 rows selected
SELECT STUDENT_NAME       AS "학생이름"
     , STUDENT_NO         AS "학번"
     , STUDENT_ADDRESS    AS "거주지 주소"
  FROM TB_STUDENT
 WHERE SUBSTR(STUDENT_NO, 1,1) <> 'A'
   AND SUBSTR(STUDENT_ADDRESS, 1, 3) IN('강원도', '경기도')
 ORDER BY
       STUDENT_NAME DESC
;


-- 4. 현재 법학과 교수 중 가장 나이가 많은 사람부터 이름을 확인할 수 있는 SQL 문장을
-- 작성하시오. (법학과의 '학과코드'는 학과 테이블(TB_DEPARTMENT)을 조회해서 찾아
-- 내도록 하자)
-- PROFESSOR_NAME PROFESSOR_SSN
------------------ --------------
-- 홍남수 540304-1112251
-- 김선희 551030-2159000
-- 임진숙 640125-1143548
-- 이미경 741016-2103506
SELECT PROFESSOR_NAME
     , PROFESSOR_SSN
  FROM TB_PROFESSOR
 WHERE DEPARTMENT_NO = '005'
 ORDER BY
       SUBSTR(PROFESSOR_SSN, 1,2)
;


-- 5. 2004 년 2 학기에 'C3118100' 과목을 수강한 학생들의 학점을 조회하려고 한다. 학점이
-- 높은 학생부터 표시하고, 학점이 같으면 학번이 낮은 학생부터 표시하는 구문을
-- 작성해보시오.
-- STUDENT_NO POINT
-------- -----
-- A352017 4.00
-- A115270 3.50
-- A215247 3.00
-- A417074 3.00
-- A131046 2.50
-- A219089 2.50
-- A331076 2.00
-- 7 rows selected
SELECT STUDENT_NO
     , POINT
  FROM TB_GRADE
 WHERE TERM_NO  = '200402'
   AND CLASS_NO = 'C3118100'
 ORDER BY
       POINT DESC
     , STUDENT_NO;


-- 6. 학생 번호, 학생 이름, 학과 이름을 학생 이름으로 오름차순 정렬하여 출력하는 SQL
-- 문을 작성하시오.
-- STUDENT_NO STUDENT_NAME DEPARTMENT_NAME
-------- -------------------- --------------------
-- A213046 서가람 중어중문학과
-- A445008 남가영 경제학과
-- …
-- …
-- A241056 이희진 서반아어학과
-- A241004 김희훈 생태시스템공학과
-- 588 rows selected

SELECT S.DEPARTMENT_NO    AS "학과 번호"
     , S.STUDENT_NAME     AS "학생 이름"
     , D.DEPARTMENT_NAME  AS "학과 이름"
  FROM TB_STUDENT         S
 INNER JOIN
       TB_DEPARTMENT      D
    ON S.DEPARTMENT_NO    = D.DEPARTMENT_NO
 ORDER BY S.STUDENT_NAME DESC;


-- 7. 춘 기술대학교의 과목 이름과 과목의 학과 이름을 출력하는 SQL 문장을 작성하시오.
-- CLASS_NAME DEPARTMENT_NAME
---------------------------- --------------------
-- 고전시가론특강 국어국문학과
-- 국어어휘론특강 국어국문학과
-- 국어음성학연구 국어국문학과
-- …
-- …
-- 논문지도1 체육학과
-- 논문지도2 체육학과
-- 882 rows selected
SELECT C.CLASS_NAME      AS "과목 이름"
     , D.DEPARTMENT_NAME AS "학과 이름"
  FROM TB_CLASS          C
 INNER JOIN
       TB_DEPARTMENT     D
    ON C.DEPARTMENT_NO   = D.DEPARTMENT_NO;


-- 8. 과목별 교수 이름을 찾으려고 한다. 과목 이름과 교수 이름을 출력하는 SQL 문을
-- 작성하시오.
-- CLASS_NAME PROFESSOR_NAME
---------------------------- --------------------
-- 고전시가론특강 김선정
-- 국어어휘론특강 김선정
-- 국어음성학연구 김선정
-- …
-- …
-- 논문지도1 백은정
-- 776 rows selected
SELECT C.CLASS_NAME          AS "과목 이름"
     , PROFESSOR_NAME        AS "교수 이름"
  FROM TB_CLASS_PROFESSOR    CP
 INNER JOIN
       TB_CLASS              C
    ON CP.CLASS_NO           = C.CLASS_NO
 INNER JOIN
       TB_PROFESSOR          P
    ON CP.PROFESSOR_NO       = P.PROFESSOR_NO;

-- 9. 8 번의 결과 중 ‘인문사회’ 계열에 속한 과목의 교수 이름을 찾으려고 한다. 이에
-- 해당하는 과목 이름과 교수 이름을 출력하는 SQL 문을 작성하시오.
-- CLASS_NAME PROFESSOR_NAME
---------------------------- --------------------
-- 고전시가론특강 김선정
-- 국어어휘론특강 김선정
-- …
-- …
-- 논문지도2 강혁
-- 197 rows selected
SELECT C.CLASS_NAME          AS "과목 이름"
     , P.PROFESSOR_NAME      AS "교수 이름"
     , C.CLASS_TYPE
  FROM TB_CLASS_PROFESSOR    CP
 INNER JOIN
       TB_CLASS              C
    ON CP.CLASS_NO           = C.CLASS_NO
 INNER JOIN
       TB_PROFESSOR          P
    ON CP.PROFESSOR_NO       = P.PROFESSOR_NO
 INNER JOIN
       TB_DEPARTMENT          D
    ON D.DEPARTMENT_NO       = P.DEPARTMENT_NO
 WHERE D.CATEGORY            = '인문사회';


-- 10. ‘음악학과’ 학생들의 평점을 구하려고 한다. 음악학과 학생들의 "학번", "학생 이름",
-- "전체 평점"을 출력하는 SQL 문장을 작성하시오. (단, 평점은 소수점 1 자리까지만
-- 반올림하여 표시한다.)
-- 학번 학생 이름 전체 평점
-------- -------------------- ----------
-- 9931310 조기현 4.1
-- A354020 양재영 3.5
-- A411116 박현화 3.6
-- A415245 조지선 3.2
-- A431021 구병훈 3.9
-- A431358 조상진 3.7
-- A557031 이정범 3.3
-- A612052 싞광현 4.1
-- 8 rows selected
SELECT G.STUDENT_NO          AS "학번"
     , S.STUDENT_NAME        AS "학생 이름"
     , ROUND(AVG(G.POINT),1) AS "전체평점"
  FROM TB_GRADE  G
 INNER JOIN
       TB_STUDENT S
    ON S.STUDENT_NO    = G.STUDENT_NO
   AND S.DEPARTMENT_NO = '059'
 GROUP BY
       G.STUDENT_NO
     , S.STUDENT_NAME
 ORDER BY
       G.STUDENT_NO
     , S.STUDENT_NAME;

-- 11. 학번이 A313047 인 학생이 학교에 나오고 있지 않다. 지도 교수에게 내용을 전달하기
-- 위한 학과 이름, 학생 이름과 지도 교수 이름이 필요하다. 이때 사용할 SQL 문을
-- 작성하시오. 단, 출력헤더는 ‚학과이름‛, ‚학생이름‛, ‚지도교수이름‛으로
-- 출력되도록 한다.
-- 학과이름 학생이름 지도교수이름
------------------ -------------------- --------------------
-- 경제학과 손건영 박태환


SELECT D.DEPARTMENT_NAME    AS "학과이름"
     , S.STUDENT_NAME       AS "학생이름"
     , P.PROFESSOR_NAME     AS "지도교수이름"
  FROM TB_STUDENT           S
 INNER JOIN
       TB_DEPARTMENT        D
    ON S.DEPARTMENT_NO      = D.DEPARTMENT_NO
 INNER JOIN
       TB_PROFESSOR         P
    ON S.COACH_PROFESSOR_NO = P.PROFESSOR_NO
 WHERE S.STUDENT_NO         = 'A313047';

-- 12. 2007 년도에 '인간관계론' 과목을 수강한 학생을 찾아 학생이름과 수강학기를 표시하는
-- SQL 문장을 작성하시오.
-- STUDENT_NAME TERM_NAME
------------------ --------------------
-- 김혜원 200701
-- 오진형 200701
-- 이정호 200703

SELECT S.STUDENT_NAME
     , G.TERM_NO
  FROM TB_GRADE               G
 INNER JOIN
       TB_STUDENT             S
    ON S.STUDENT_NO           = G.STUDENT_NO
 WHERE SUBSTR(G.TERM_NO, 1,4) = '2007'
   AND G.CLASS_NO             = 'C2604100'
 ORDER BY S.STUDENT_NAME;

-- 13. 예체능 계열 과목 중 과목 담당교수를 한 명도 배정받지 못한 과목을 찾아 그 과목
-- 이름과 학과 이름을 출력하는 SQL 문장을 작성하시오.
-- CLASS_NAME DEPARTMENT_NAME
---------------------------- --------------------
-- 드로잉 미술학과
-- 미술시장,경영론 미술학과
-- …
-- …
-- 운동처방연구 체육학과
-- 해부학실험 체육학과
-- 44 rows selected
SELECT C.CLASS_NAME
     , D.DEPARTMENT_NAME
     , C.CLASS_NO
     , D.DEPARTMENT_NO
  FROM TB_CLASS      C
 INNER JOIN
       TB_DEPARTMENT D
    ON C.DEPARTMENT_NO = D.DEPARTMENT_NO
  LEFT JOIN
       TB_CLASS_PROFESSOR CP
    ON C.CLASS_NO = CP.CLASS_NO
 WHERE D.CATEGORY      = '예체능'
   AND CP.PROFESSOR_NO IS NULL
 ORDER BY
       D.DEPARTMENT_NO
     , C.CLASS_NO DESC
     , CP.PROFESSOR_NO DESC
;



-- 14. 춘 기술대학교 서반아어학과 학생들의 지도교수를 게시하고자 한다. 학생이름과
-- 지도교수 이름을 찾고 만일 지도 교수가 없는 학생일 경우 "지도교수 미지정‛으로
-- 표시하도록 하는 SQL 문을 작성하시오. 단, 출력헤더는 ‚학생이름‛, ‚지도교수‛로
-- 표시하며 고학번 학생이 먼저 표시되도록 한다.
-- 학생이름 지도교수
------------------ --------------------
-- 주하나 허문표
-- 이희진 남명길
-- …
-- …
-- 최철현 백양임
-- 14 rows selected
SELECT S.STUDENT_NAME                            AS "학생이름"
     , NVL(P.PROFESSOR_NAME, '지도교수 미지정')  AS "지도교수"
  FROM TB_STUDENT S
  LEFT JOIN
       TB_PROFESSOR P
    ON S.COACH_PROFESSOR_NO = P.PROFESSOR_NO
  LEFT JOIN
       TB_DEPARTMENT D
    ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
 WHERE D.DEPARTMENT_NAME LIKE '%서반아어학과%'
 ORDER BY S.STUDENT_NO;


-- 15. 휴학생이 아닌 학생 중 평점이 4.0 이상인 학생을 찾아 그 학생의 학번, 이름, 학과
-- 이름, 평점을 출력하는 SQL 문을 작성하시오.
-- 학번 이름 학과 이름 평점
-------- -------------------- -------------------- ----------
-- 9811251 김충원 건축공학과 4.11111111
-- 9817035 김소라 토목공학과 4
-- 9931310 조기현 음악학과 4.05
-- …
-- …
-- 19 rows selected
SELECT S.STUDENT_NO       AS "학번"
     , S.STUDENT_NAME     AS "이름"
     , D.DEPARTMENT_NAME  AS "학과 이름"
     , G.POINT            AS "평점"
  FROM TB_STUDENT     S
 INNER JOIN
       (
       SELECT STUDENT_NO
            , ROUND(AVG(POINT), 8) AS POINT
         FROM TB_GRADE
        GROUP BY STUDENT_NO
       HAVING AVG(POINT) >= 4.0
       )       G
    ON S.STUDENT_NO = G.STUDENT_NO
 INNER JOIN
       TB_DEPARTMENT  D
    ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
 WHERE S.ABSENCE_YN = 'N'
 ORDER BY S.STUDENT_NO;


-- 16. 환경조경학과 전공과목들의 과목 별 평점을 파악할 수 있는 SQL 문을 작성하시오.
-- CLASS_NO CLASS_NAME AVG(POINT)
-------- ------------------------------ ----------
-- C3016200 전통계승방법론 3.67857142
-- C3081300 조경계획방법론 3.69230769
-- C3087400 조경세미나 3.90909090
-- C4139300 환경보전및관리특론 3.02777777
-- C4477600 조경시학 3.17647058
-- C5009300 단지계획및설계스튜디오 3.375
-- 6 rows selected

SELECT C.CLASS_NO
     , C.CLASS_NAME
     , AVG(G.POINT)
  FROM TB_CLASS     C
 INNER JOIN
       TB_GRADE     G
    ON C.CLASS_NO = G.CLASS_NO
 WHERE C.DEPARTMENT_NO = (SELECT DEPARTMENT_NO FROM TB_DEPARTMENT WHERE DEPARTMENT_NAME LIKE '%환경조경학과%')
   AND C.CLASS_TYPE    LIKE '전공%'
 GROUP BY
       C.CLASS_NO
     , C.CLASS_NAME
 ORDER BY C.CLASS_NO;


-- 17. 춘 기술대학교에 다니고 있는 최경희 학생과 같은 과 학생들의 이름과 주소를 출력하는
-- SQL 문을 작성하시오.
-- STUDENT_NAME STUDENT_ADDRESS
------------------ ----------------------------------------------------------
-- 최경희 대구광역시 달서구 월성동 277-3 동서타운아파트 101-1403호
-- 정기원 서울시 송파구 가락2동 극동아파트 4-1505
-- …
-- …
-- 김희훈 인천시 부평구 십정 1동 323- 19호
-- 17 rows selected

SELECT STUDENT_NAME
     , STUDENT_ADDRESS
  FROM TB_STUDENT
 WHERE DEPARTMENT_NO = (
                        SELECT DEPARTMENT_NO
                        FROM TB_STUDENT
                        WHERE STUDENT_NAME = '최경희'
                       );

-- 18. 국어국문학과에서 총 평점이 가장 높은 학생의 이름과 학번을 표시하는 SQL 문을
-- 작성하시오.
-- STUDENT_NO STUDENT_NAME
-------- --------------------
-- 9931165 송근우

SELECT STUDENT_NO
     , STUDENT_NAME
  FROM TB_STUDENT
 WHERE STUDENT_NO = (
                    SELECT STUDENT_NO
                     FROM (
                          SELECT S.STUDENT_NO
                               , AVG(POINT) AS AVG_POINT
                            FROM TB_STUDENT    S
                           INNER JOIN
                                 TB_GRADE      G
                              ON S.STUDENT_NO = G.STUDENT_NO
                           INNER JOIN
                                 TB_DEPARTMENT D
                              ON S.DEPARTMENT_NO = D.DEPARTMENT_NO
                           WHERE D.DEPARTMENT_NAME = '국어국문학과'
                           GROUP BY S.STUDENT_NO
                           ORDER BY AVG(POINT) DESC 
                          )
                    WHERE ROWNUM = 1
                    );

SELECT *
  FROM TB_GRADE  
;

-- 19. 춘 기술대학교의 "환경조경학과"가 속한 같은 계열 학과들의 학과 별 전공과목 평점을
-- 파악하기 위한 적절한 SQL 문을 찾아내시오. 단, 출력헤더는 "계열 학과명",
-- "전공평점"으로 표시되도록 하고, 평점은 소수점 한 자리까지만 반올림하여 표시되도록
-- 한다.
-- 계열 학과명 전공평점
------------------ --------
-- 간호학과 3.3
-- 물리학과 3.3
-- …
-- …
-- 환경조경학과 3.4
-- 20 rows selected


SELECT D.DEPARTMENT_NAME
     , G.AVG_POINT
  FROM TB_DEPARTMENT D
 INNER JOIN
       (
       SELECT D.DEPARTMENT_NO
            , ROUND(AVG(G.POINT), 1) AS AVG_POINT
         FROM TB_GRADE   G
        INNER JOIN
              TB_CLASS   C
           ON G.CLASS_NO = C.CLASS_NO
          AND C.CLASS_TYPE LIKE '전공%'
        INNER JOIN
              TB_DEPARTMENT  D
           ON C.DEPARTMENT_NO = D.DEPARTMENT_NO
        GROUP BY
              D.DEPARTMENT_NO
       ) G
    ON D.DEPARTMENT_NO = G.DEPARTMENT_NO
 WHERE D.DEPARTMENT_NO IN (
                          SELECT DEPARTMENT_NO
                            FROM TB_DEPARTMENT
                           WHERE CATEGORY = (
                                            SELECT CATEGORY FROM TB_DEPARTMENT
                                             WHERE DEPARTMENT_NAME = '환경조경학과'
                                            )
                          );
                          

SELECT DEPARTMENT_NAME "계열 학과명", ROUND(AVG(POINT),1) 전공평점
FROM TB_DEPARTMENT 
JOIN TB_CLASS USING(DEPARTMENT_NO)
JOIN TB_GRADE USING(CLASS_NO)
WHERE CATEGORY = (SELECT CATEGORY
                  FROM TB_DEPARTMENT
                  WHERE DEPARTMENT_NAME = '환경조경학과')
    AND CLASS_TYPE LIKE '%전공%' --> 얘 추가해줘야 결과값 같다!!
GROUP BY DEPARTMENT_NAME
ORDER BY 1; 