
SELECT * FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;
SELECT * FROM JOB;
SELECT * FROM LOCATION;
SELECT * FROM NATIONAL;
SELECT * FROM SAL_GRADE;
/*
SELECT
     , EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , EMP_NO       AS "주민등록번호"
     , EMAIL        AS "이메일"
     , PHONE        AS "전화번호"
     , DEPT_CODE    AS "부서코드"
     , JOB_CODE     AS "직급코드"
     , SALARY       AS "급여"
     , BONUS        AS "보너스율"
     , MANAGER_ID   AS "관리자사번"
     , HIRE_DATE    AS "입사일"
     , ENT_DATE     AS "퇴사일"
     , ENT_YN       AS "퇴직여부"
  FROM EMPLOYEE
 WHERE 1 = 1
;
*/
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

SELECT RPAD(', ' || COLUMN_NAME,15) || ' AS "' || COMMENTS || '"' AS CULUMNS
  FROM ALL_COL_COMMENTS
 WHERE TABLE_NAME = 'EMPLOYEE'
;

SELECT OWNER ,
       TABLE_NAME ,
       COLUMN_NAME ,
       COMMENTS ,
       ORIGIN_CON_ID
  FROM ALL_COL_COMMENTS
 WHERE TABLE_NAME = 'EMPLOYEE';

SELECT * FROM ALL_TABLES;
SELECT * FROM ALL_TAB_COLUMNS
 WHERE TABLE_NAME = 'EMPLOYEE'
;

/*
<함수>
    단일행 함수
        - N 개의 값을 읽어서 N 개의 값을 반환한다.
        - 매행 함수 실행 결과를 반환한다.
    그룹함수
        - N 개의 값을 읽어서 1개의 값을 반환한다.
        - 하나의 그룹별로 함수 실핼 결과를 반환한다.
    <단일행 함수>
    <문자처리 함수>
        1) LENGTH / LENGTHB
            LENGTH(CHARACTER)  : 글자 수 반환
            LENGTHB(CHARACTER) : 글자의 BYTE 수 반환

            영문자, 숫자, 특수문자 한글자 -> 1BYTE
            한글 한글자                   -> 3BYTE
*/
-- UTF-8을 사용하지만 오라클은 그냥 한글을 3BYTE로 표현한다.
SELECT LENGTH('오라클')   , LENGTHB('오라클')   FROM DUAL ;
SELECT LENGTH('ORACLE')   , LENGTHB('ORACLE')   FROM DUAL ;
SELECT LENGTH('ORA클')    , LENGTHB('ORA클')    FROM DUAL ;
SELECT LENGTH('오 라 클') , LENGTHB('오 라 클') FROM DUAL ;

SELECT EMP_NAME, LENGTH(EMP_NAME), LENGTHB(EMP_NAME)
     , EMAIL   , LENGTH(EMAIL)   , LENGTHB(EMAIL)
  FROM EMPLOYEE;
/*
        2) INSTR
            INSTR(CHARACTER1, CHARACTER2[,POSITION, OCCURRENCE])
                CHARACTER1 : 문자열
                CHARACTER2 : 찾아야할 문자열
                POSITION   : 찾기 시작할 위치 (음수는 오른쪽부터 찾는다.)
                OCCURRENCE : 발생 위치 (찾아야할 문자열이 여러개일때 가능, 찾을 대상을 OCCURRENCE 번째 위치를 반환)
*/
SELECT INSTR('AABAACAABBAA', 'B')        FROM DUAL; -- 처음시작하는 자리인 3을 리턴(숫자카운트는 1부터 시작한다.)
SELECT INSTR('AABAACAABBAA', 'D')        FROM DUAL; -- 못찾았을 경우       0을 리턴
SELECT INSTR('AABAACAABBAA', 'B',  1)    FROM DUAL; -- 첫번째 자리부터 찾는 B 의 위치 : 3
SELECT INSTR('AABAACAABBAA', 'B',  4)    FROM DUAL; -- 첫번째 자리부터 찾는 B 의 위치 : 9
SELECT INSTR('AABAACAABBAA', 'B', -1)    FROM DUAL; -- 뒤에서 1번째 자리부터 찾는 B 의 위치  : 10
SELECT INSTR('AABAACAABBAA', 'B', -5)    FROM DUAL; -- 뒤에서 5번째 자리부터 찾는 B 의 위치  : 3
SELECT INSTR('AABAACAABBAA', 'B',  1, 2) FROM DUAL; -- 첫번째 자리부터 찾는 B 중에서의 2번째 위치 : 9

SELECT EMAIL                    AS "이메일",
       INSTR(EMAIL, '@')        AS "@ 위치",
       INSTR(EMAIL, 's',  1, 2) AS "두번째 s 위치"
  FROM EMPLOYEE;
/*
        3) LPAD / RPAD
            LPAD / RPAD(CHARHACTER, NUMBER[, CHARCTER])
*/

SELECT LENGTHB(LPAD('HELLO', 10)     ) FROM DUAL; -- 10 = 5 + 5    :     HELLO
SELECT LENGTHB(LPAD('HELLO', 10, '*')) FROM DUAL; -- 10 = 5 + 5    :*****HELLO
SELECT LENGTHB(LPAD('헬로', 10)      ) FROM DUAL; -- 12 = 6 + 6    :      헬로
SELECT LENGTHB(LPAD('헬로', 10, '*') ) FROM DUAL; -- 12 = 6 + 6    :******헬로
SELECT LENGTH(LPAD('헬로', 10, '*') ) FROM DUAL; -- 12 = 6 + 6    :******헬로





SELECT LENGTHB('헬로') FROM DUAL;   -- 6
SELECT LENGTHB('******') FROM DUAL; -- 6

SELECT RPAD('991231-1', 14, '*') FROM DUAL;

SELECT EMP_NO
     , RPAD(LPAD(EMP_NO,8),14,'*')
  FROM EMPLOYEE
;


SELECT EMP_NAME
     , RPAD(RPAD(EMP_NAME,2),4, '*') AS EMP_NAME_BLUR
     , EMP_NO
     , RPAD(LPAD(EMP_NO,8),14,'*')   AS EMP_NO_BLUR
  FROM EMPLOYEE
;
SELECT EMP_NAME
     , RPAD(RPAD(EMP_NAME, 3),5, '*') AS EMP_NAME_BLUR
     , EMP_NO
     , RPAD(LPAD(EMP_NO,8),14, '*')   AS EMP_NO_BLUR
  FROM EMPLOYEE
;

SELECT PARAMETER
     , VALUE
  FROM NLS_DATABASE_PARAMETERS
 WHERE PARAMETER = 'NLS_CHARACTERSET';

/*
        4) LTRIM / RTRIM
            LTRIM / RTRIM(CHARACTER1[, CHARACTER2)
                CHARACTER1 : 문자열(CHARACTER2 인자 없을 시 왼쪽에 있는 공백을 지운다.)
                CHARACTER2 : 문자열 과 일치하는 값들을 모두 지운다
*/
SELECT LTRIM('     K  H'        ) FROM DUAL;
SELECT LTRIM('000123456' , '0'  ) FROM DUAL;
SELECT LTRIM('123123456' , '123') FROM DUAL;
SELECT LTRIM('123123456' , '321') FROM DUAL; -- '312' 문자열 안에 있는 문자를 하나씩 확인해서 지우는 방식이기에 위와 같은 결과가 나온다.

SELECT RTRIM(LTRIM('      KH     '))           FROM DUAL;
SELECT RTRIM(LTRIM('000000KH00000', '0'), '0') FROM DUAL;

/*
        5) TRIM
            TRIM(TRIM([LEADING|TRAILING|BOTH] [CHARACTER] FROM STR)
*/

-- 같은 결과를 출력하는 세가지 방법
SELECT TRIM(              '      KH     ')  FROM DUAL;
SELECT TRIM(     ' ' FROM '      KH     ')  FROM DUAL;
SELECT TRIM(BOTH ' ' FROM '      KH     ')  FROM DUAL;
-- 앞(왼)쪽에 있는 공백을 제거한다.
SELECT TRIM(LEADING ' ' FROM '      KH     ')     FROM DUAL;
-- 뒤(오른)쪽에 있는 공백을 제거한다.
SELECT TRIM(TRAILING  ' ' FROM '      KH     ')    FROM DUAL;
-- 문자열을 감싸고 있는 문자를 제거한다.
SELECT TRIM('ㅋ'          FROM  'ㅋㅋㅋㅋKHㅋㅋㅋㅋ') FROM DUAL;
-- ORA-30001: 트림 설정은 하나 문자만 가지고 있어야 합니다
SELECT TRIM('ㅋㅋㅋ'      FROM  'ㅋㅋㅋㅋKHㅋㅋㅋㅋ') FROM DUAL;

SELECT TRIM(BOTH     'ㅋ' FROM  'ㅋㅋㅋㅋKHㅋㅋㅋㅋ') FROM DUAL;
SELECT TRIM(LEADING  'ㅋ' FROM  'ㅋㅋㅋㅋKHㅋㅋㅋㅋ') FROM DUAL;
SELECT TRIM(TRAILING 'ㅋ' FROM  'ㅋㅋㅋㅋKHㅋㅋㅋㅋ') FROM DUAL;

/*
        6) SUBSTR
            SUBSTR(CHARACTER, POSITION[, LENGTH]
*/
SELECT SUBSTR('SHOWMETHEMONEY'   ,  7)    FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY'   ,  7, 3) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY'   ,  1, 6) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY'   , -8, 3) FROM DUAL;
SELECT SUBSTR('SHOW ME THE MONEY',  1, 7) FROM DUAL;

-- EMPLOYEE 테이블에서 주민번호에 성별을 나타내는 부분만 잘라서 조회
SELECT EMP_NO
     , SUBSTR(EMP_NO, 8, 1)   AS "성별 코드"
     , EMP_NAME
     , SUBSTR(EMP_NAME, 2, 1) AS "이름"
  FROM EMPLOYEE
 WHERE SUBSTR(EMP_NO, 8, 1)   = '1'
;
-- EMPLOYEE 테이블에서 주민번호 첫번째 자리부터 성별코드 까지 추출한 결과값 오른쪽에 * 문자를 채워서 14글자로 조회

SELECT EMP_NO
     , RPAD(SUBSTR(EMP_NO,1,8),14,'*')
  FROM EMPLOYEE
;

-- EMPLOYEE 테이블에서 직원명, 이메일, 아이디(이메일에서 '@' 문자값만 출력) 조회
SELECT EMP_NAME                              AS "직원명"
     , EMAIL                                 AS "이메일"
     , SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')-1) AS "아이디"
     , SUBSTR(EMAIL, -9, 9)                  AS "메일주소"
     , RTRIM(EMAIL,SUBSTR(EMAIL, -9, 9))     AS "아이디2"
  FROM EMPLOYEE
;
/*
        7) LOWER / UPPER / INITCAP
            LOWER/UPPER/INITCAP(CHARACTER)
*/
SELECT LOWER(   'SHOW ME THE MONKEY') FROM DUAL;
SELECT UPPER(   'show me the monkey') FROM DUAL;
SELECT INITCAP( 'show me the monkey') FROM DUAL;
/*
        8) CONCAT
           CONCAT(CHARACTER1, CHARACTER2)
*/
SELECT CONCAT('가나다라', '마바사아') FROM DUAL;
SELECT CONCAT('익스펙토', '팩트로눔') FROM DUAL;
SELECT '익스펙토' || '팩트로눔'       FROM DUAL;
-- 차이점
SELECT CONCAT('익스펙토', '팩트로눔','익스펠리아르무스')   FROM DUAL; -- ORA-00909: 인수의 개수가 부적합합니다
SELECT '익스펙토' || '팩트로눔' || '익스펠리아르무스'      FROM DUAL;

SELECT CONCAT('익스펙토', CONCAT('팩트로눔','익스펠리아르무스'))   FROM DUAL;
SELECT CONCAT(CONCAT('익스펙토', '팩트로눔'),'익스펠리아르무스')   FROM DUAL;


SELECT CONCAT(EMP_NAME , CONCAT('의 월급은 ',CONCAT(SALARY ,'원 입니다.')))   AS "직원의 급여입니다1"
     , CONCAT(CONCAT(CONCAT(EMP_NAME , '의 월급은 '),SALARY ),'원 입니다.')   AS "직원의 급여입니다2"
     , CONCAT (CONCAT(EMP_NAME, '의 급여는 '), CONCAT(SALARY, '원 입니다.'))  AS "직원의 급여입니다3"
  FROM EMPLOYEE;
/*
        9) REPLACE
            REPLACE(CHARACTER1, CHARACTER2, CHARACTER3)
*/
-- EMPLOYEE 테이블에서 이메일의 @kh.or.kr 을 @gmail.com 로 변경해서 조회
--  @kh.or.kr -> @gmail.com

SELECT REPLACE('sun_di@kh.or.kr', 'kh.or.kr','gmail.com')
  FROM DUAL;
SELECT EMAIL
     , REPLACE(EMAIL, '@kh.or.kr','@gmail.com') AS CONVERT_EMAIL
     , REPLACE(EMAIL, '@kh.or.kr','')           AS EXTRACT_ID
  FROM EMPLOYEE;
/*
<숫자처리함수>
    1) ABS
        ABS(NUMBER)
*/
SELECT ABS(10), ABS(-10) FROM DUAL;
SELECT ABS(10.9), ABS(-10.9) FROM DUAL;
/*
        2)MOD
            MOD(NUMBER1, NUMBER2)
*/
SELECT MOD(7,3)     FROM DUAL;
SELECT MOD(10,-3)   FROM DUAL;
SELECT MOD(10.9,3)  FROM DUAL;
SELECT MOD(-10.9,3) FROM DUAL;
/*
        3) ROUND
            ROUND(NUMBER[, POSITION])
                : 지정한 자리수로 반올림하는 함수(기본 1(POSITION = 0)의 자리에서 음수지정시 양수쪽으로 올라감)
*/
SELECT ROUND(123.456)     FROM DUAL;
SELECT ROUND(123.456, 1)  FROM DUAL;
SELECT ROUND(123.456, -1) FROM DUAL;
SELECT ROUND(123.456, 2)  FROM DUAL;
SELECT ROUND(123.456, -2) FROM DUAL;
/*
        4) CEIL
            CEIL(NUMBER)
                : 1의 자리까지만 올림하는 함수
*/
SELECT CEIL(123.456) FROM DUAL;
/*
        5) FLOOR
            FLOOR(NUMBER)
                : 1의 자리까지(소수점) 버림하는 함수
*/
SELECT FLOOR(123.456) FROM DUAL;
SELECT FLOOR(456.789) FROM DUAL;
/*
        6) TRUNC
            TRUNC(NUMBER[, POSITION])
*/
SELECT TRUNC(123.456)     FROM DUAL;
SELECT TRUNC(456.789)     FROM DUAL;
SELECT TRUNC(456.789, 1)  FROM DUAL;
SELECT TRUNC(456.789, -1) FROM DUAL;
/*
    <날짜 처리 함수>
        1) SYSDATE
*/
SELECT SYSDATE FROM DUAL;

-- 날짜 출력 포맷 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH:MI:SS';
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
/*
        2) MONTHS_BETWEEN
            MONTHS_BETWEEN(DATE, DATE)
                : 숫자 타입의 결과를 반환한다.
*/
SELECT FLOOR(MONTHS_BETWEEN(SYSDATE, '20230525')) || '개월'AS DIFF FROM DUAL;

-- EMPLOYEE 테이블에서 직원명, 입사일, 근무 개월 수 조회
SELECT
       EMP_NAME     AS "직원명"
     , HIRE_DATE    AS "입사일"
     , FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS "개월수"
     , LPAD((FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12))||'년 ',5) || LPAD((MOD(FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)), 12)) || '개월', 6) AS "근무개월 수"
  FROM EMPLOYEE
 ORDER BY
       FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) DESC;
/*
        3) ADD_MONTHS
            ADD_MONTHS(DATE, NUMBER)
*/
SELECT ADD_MONTHS(SYSDATE, 6) FROM DUAL;
SELECT TO_CHAR(ADD_MONTHS(SYSDATE, 6), 'YYYY-MM-DD') FROM DUAL;

-- EMPLOYEE 테이블에서 직원명, 입사일, 입사 후 3개월이 된 날짜를 조회
SELECT EMP_NAME     AS "직원명"
     , HIRE_DATE    AS "입사일"
     , ADD_MONTHS(HIRE_DATE, 3)    AS "입사 후 3개월"
  FROM EMPLOYEE;
/*
        4) NEXT_DAY
            NEXT_DAY(DATE, CHARACTER|NUMBER)
                1 : 일요일 , 2 : 월요일, 3 : 화요일, 4 : 수요일, 5 : 목요일, 6 : 금요일, 7 : 토요일
*/
SELECT NEXT_DAY(SYSDATE, 3)        FROM DUAL;
SELECT NEXT_DAY(SYSDATE, '화')     FROM DUAL;
SELECT NEXT_DAY(SYSDATE, '화요일') FROM DUAL;

SELECT NEXT_DAY(SYSDATE, 'SUNDAY') FROM DUAL; -- ORA-01846: 지정한 요일이 부적합합니다.

-- 언어변경
ALTER SESSION SET NLS_LANGUAGE = AMERICAN;
ALTER SESSION SET NLS_LANGUAGE = KOREAN;
ALTER SESSION SET NLS_LANGUAGE = 'AMERICAN';
ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';
/*
        5) LAST_DAY
            LAST_DAY(DATE) :  마지막 날짜의 요일을 반환
*/
SELECT LAST_DAY(SYSDATE)    FROM DUAL;
SELECT LAST_DAY('20200201') FROM DUAL;
-- 급여일(매달 마지막날) 조회

-- EMPLOYEE 테이블에서 직원명, 입사일, 입사월의 마지말 날짜조회
-- 급여월(매달 마지막 날)조회
SELECT EMP_NAME             AS "직원명"
     , HIRE_DATE            AS "입사일"
     , LAST_DAY(HIRE_DATE)  AS "입사월"
     , LAST_DAY(SYSDATE)    AS "급여월"
  FROM EMPLOYEE;
/*
        6) EXTRACT
            EXTRACT(YEAR|MONTH|DAY FROM DATE)
*/
SELECT EXTRACT(YEAR FROM SYSDATE)
     , EXTRACT(MONTH FROM SYSDATE)
     , EXTRACT(DAY FROM SYSDATE)
  FROM DUAL;

-- EMPLOYEE 테이블에서 직원명, 입사년도, 입사월, 입사일 조회
SELECT EMP_NAME                         AS "직원명"
     , EXTRACT(YEAR  FROM HIRE_DATE)    AS "입사년도"
     , EXTRACT(MONTH FROM HIRE_DATE)    AS "입사월"
     , EXTRACT(DAY   FROM HIRE_DATE)    AS "입사일"
  FROM EMPLOYEE
 ORDER BY HIRE_DATE;

/*
<형변환 함수>
    1) TO_CHAR
        TO_CHAR(NUMBER|DATE[, FORMAT])

*/
-- 참고 사이트 : https://docs.oracle.com/cd/B19306_01/server.102/b14200/sql_elements004.htm
-- 숫자 -> 문자
SELECT TO_CHAR(1234)                      FROM DUAL;
SELECT TO_CHAR(1234)                      FROM DUAL;
-- 6칸의 공간을 확보, 오른쪽 정렬, 빈칸 공백으로 채운다.
SELECT TO_CHAR(1234, '999999')            FROM DUAL;
SELECT TO_CHAR(1234, '99')                FROM DUAL; -- ### : 포맷의 자리수에 안맞으면 ###으로 출력 됨
-- 6칸의 공간을 확보, 오른쪽 정렬, 빈칸 0으로 채운다.
SELECT TO_CHAR(-1234, '000000')           FROM DUAL;
SELECT TO_CHAR(-1234, '00')               FROM DUAL; -- ### : 포맷의 자리수에 안맞으면 ###으로 출력 됨
SELECT TO_CHAR(20000000, '99,999,999')    FROM DUAL; -- 자리수 구분
-- 현재 설정된 나라(LOCAL)의 화폐단위
SELECT TO_CHAR(20000000, 'L99,999,999')   FROM DUAL; -- L  = 통화기호 삽입
SELECT TO_CHAR(20000000, 'FML99,999,999') FROM DUAL; -- FM = 앞자리 공백을 없애준다

-- EMPLOYEE 테이블에서 직원명, 급여 연봉 조회
SELECT EMP_NAME                                AS "직원명"
     , TO_CHAR(SALARY   , 'FML999,999,999')    AS "급여"
     , TO_CHAR(SALARY*12, 'FML999,999,999')    AS "연봉"
  FROM EMPLOYEE
 ORDER BY
       SALARY;

-- 날짜 -> 문자
SELECT SYSDATE                               FROM DUAL;
SELECT TO_CHAR(SYSDATE)                      FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'AM HH:MI:SS')       FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS')        FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MONTH DAY, YYYY')   FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON DY, YYYY')      FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD(DY)')    FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD(DAY)')   FROM DUAL;

-- EMPLOYEE 테이블에서 직원명, 입사일(ex. 2023-05-25)
SELECT EMP_NAME                         AS "직원명"
     , TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') AS "입사일"
  FROM EMPLOYEE
 ORDER BY
       HIRE_DATE;

-- 연도에 대한 포맷 문자
SELECT TO_CHAR(SYSDATE, 'YYYY')
     , TO_CHAR(SYSDATE, 'YY')
     , TO_CHAR(SYSDATE, 'RRRR')
     , TO_CHAR(SYSDATE, 'RR')
     , TO_CHAR(SYSDATE, 'YEAR')
  FROM DUAL;

-- 월에 대한 포맷 문자
SELECT TO_CHAR(SYSDATE, 'MM')
     , TO_CHAR(SYSDATE, 'MON')
     , TO_CHAR(SYSDATE, 'MONTH')
     , TO_CHAR(SYSDATE, 'RM')  -- 로마 숫자로 월을 표현한다.
  FROM DUAL;

-- 일에 대한 포맷 문자
SELECT TO_CHAR(SYSDATE, 'D')   -- 주에 대해서 표시 (요일)
     , TO_CHAR(SYSDATE, 'DD')  -- 월에 대해서 표시 (달의몇일)
     , TO_CHAR(SYSDATE, 'DDD') -- 년에 대해서 표시 (년의몇일)
  FROM DUAL;

-- 요일에 대한 포맷 문자
SELECT TO_CHAR(SYSDATE, 'DAY')
     , TO_CHAR(SYSDATE, 'DY')
  FROM DUAL;


-- EMPLOYEE 테이블에서 직원명, 입사일(ex. 2023년 05월 25일)
SELECT EMP_NAME                               AS "직원명"
--     , TO_CHAR(HIRE_DATE, 'YYYY년MM월DD일') AS "입사일" -- ORA-01821: 날짜 형식이 부적합합니다
     , TO_CHAR(HIRE_DATE, 'YYYY"년" MM"월" DD"일", DAY') AS "입사일"
  FROM EMPLOYEE
 ORDER BY
       HIRE_DATE;
/*
        2) TO_DATE
            TO_DATE(NUMBER|CHARACTER[, FORMAT])
*/
-- 숫자 -> 날짜
SELECT TO_DATE(20231106)
--     , TO_DATE(20231106124130) -- 기본적으로 설정되어있는 포맷을 확인한다.  NLS_DATE_FORMAT = 'YYYY-MM-DD HH:MI:SS' 이면 가능.
     , TO_DATE(20231106124130, 'YYYYMMDDHHMISS')
  FROM DUAL;

--  문자 -> 날짜
SELECT TO_DATE('20231106') FROM DUAL;
-- 20231106140630 시간을 날짜로 표현하는 방법
-- 1. 기본 날짜포맷을 바꾼다
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYYMMDDHH24MISS';
SELECT TO_DATE('20231106140630') FROM DUAL;
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
-- 2. 함수 입력 포맷을 지정해준다.
SELECT TO_DATE('20231106140630', 'YYYYMMDDHH24MISS') FROM DUAL;
/*
YY와 RR
- YY는 무조건 현재 세기를 반영한다.
- RR은 50 미만이면 현재 세기를 반영하고, 50이상이면 이전세기를 반영한다.
*/
SELECT TO_DATE('231106', 'YYMMDD') FROM DUAL;
SELECT TO_DATE('991106', 'YYMMDD') FROM DUAL;
SELECT TO_DATE('231106', 'RRMMDD') FROM DUAL;
SELECT TO_DATE('991106', 'RRMMDD') FROM DUAL;


-- EMPLOYEE 테이블에서 1998년 1월 1일 이후에 입사한 인원, 사번, 직원명,입사일 조회
SELECT EMP_ID       AS "사번"
     , EMP_NAME     AS "직원명"
     , HIRE_DATE    AS "입사일"
  FROM EMPLOYEE
-- WHERE HIRE_DATE    > TO_DATE('19980101', 'RRRRMMDD')
-- WHERE HIRE_DATE    > TO_DATE('19980101', 'RRRRMMDD')
-- WHERE HIRE_DATE    > '19980101'
-- ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
-- WHERE HIRE_DATE    > '980101'
 ORDER BY HIRE_DATE
;

/*
        3) TO_NUMBER
            TO_NUMBER(CHARACTER[, FORMAT])
*/
SELECT TO_NUMBER('0123456789') FROM DUAL;
SELECT TO_NUMBER('6,000,000', '9,999,999') FROM DUAL;

SELECT '123' + '456'  FROM DUAL; -- 자동으로 숫자 타입으로 현변환 뒤 연산처리를 한다.
SELECT '123' + '456A' FROM DUAL; -- ORA-01722: 수치가 부적합합니다

SELECT '10,000,000' - '500,000' FROM DUAL; -- ORA-01722: 수치가 부적합합니다
SELECT TO_CHAR(TO_NUMBER('10,000,000', '99,999,999')
       - TO_NUMBER('500,000', '999,999'), '9,999,999')
  FROM DUAL;

SELECT '￦9,000,000' FROM DUAL;
SELECT TO_NUMBER('￦9,000,000', 'L9,999,999') FROM DUAL;
/*
<NULL 처리함수>
    1) NVL
        NVL(P1,P2)
 */
-- EMPLOYEE 테이블에서 직원명, 보너스 조회
SELECT EMP_NAME       AS "직원명"
     , NVL(BONUS, 0)  AS "보너스"
  FROM EMPLOYEE
 ORDER BY "보너스";

-- EMPLOYEE 테이블에서 직원명, 부서코드를 조회
-- (단, 부서 코드가 NULL이면 '부서없음' 출력)
SELECT EMP_NAME                   AS "직원명"
     , NVL(DEPT_CODE, '부서없음') AS "부서코드"
  FROM EMPLOYEE
 WHERE 1 = 1
 ORDER BY
       DEPT_CODE NULLS FIRST;
/*
        2) NVL2
            NVL2(P1,P2,P3)
*/

-- EMPLOYEE 테이블에서 보너스를 0.1로 동결하여 직원명, 보너스, 동결된 보너스, 보너스가 포함된 연봉조회
SELECT EMP_NAME                                AS "직원명"
     , NVL(BONUS, 0)                           AS "보너스"
     , NVL2(BONUS, 0.1, 0)                     AS "동결된 보너스"
     , (SALARY + (SALARY * NVL2(BONUS, 0.1, 0))) * 12 AS "보너스가 포함된 연봉"
     , (SALARY * (1 + NVL2(BONUS, 0.1, 0))) * 12 AS "보너스가 포함된 연봉2"
  FROM EMPLOYEE
 ORDER BY
       EMP_NAME;
/*
        3) NULLIF
            NULLIF(P1, P2)
                : P1, P2 (NUMBER|CHARACTER|DATE) P1과 P2 를 비교하여 두 값이 같으면 NULL을 반환, 같지 않으면 P1을 반환
*/
SELECT NULLIF(123, 123)     FROM DUAL; -- NULL
SELECT NULLIF(123, 456)     FROM DUAL; -- 123
SELECT NULLIF(456, 123)     FROM DUAL; -- 456
SELECT NULLIF(123, '123')   FROM DUAL; -- ORA-00932: 일관성 없는 데이터 유형: NUMBER이(가) 필요하지만 CHAR임
SELECT NULLIF('123', 123)   FROM DUAL; -- ORA-00932: 일관성 없는 데이터 유형: CHAR이(가) 필요하지만 NUMBER임
/*
    <선택함수>
        1) DECODE
            DECODE(컬럼명|계산식,조건1, 결과1[, 조건2,결과2]...)
                : 비교하고자 하는 값 또는 컬럼이 조건식과 같으면 결과값을 반환한다.
 */
-- EMPLOYEE 테이블에서 사번, 직원명, 주민번호 성별(남자,여자) 조회
SELECT EMP_ID                                         AS "사번"
     , EMP_NAME                                       AS "직원명"
     , DECODE(SUBSTR(EMP_NO, 8, 1), 1, '남자','여자') AS "성별"
  FROM EMPLOYEE;


-- EMPLOYEE 테이블에서 직원명, 직급코드, 기존급여, 인상된 급여 조회
-- 직급코드가 J7인 사원은 급여를 10% 인상
-- 직급코드가 J6인 사원은 급여를 15% 인상
-- 직급코드가 J5인 사원은 급여를 20% 인상
-- 그 외 직급의    사원은 급여를  5% 인상
SELECT EMP_NAME                                          AS "직원명"
     , JOB_CODE                                          AS "직급코드"
     , DECODE(JOB_CODE, 'J7', 10 ,'J6', 15 ,'J5', 20 ,5) AS "인상률"
     , TO_CHAR(SALARY, '99,999,999')                      AS "기존급여"
     , TO_CHAR(SALARY * DECODE(JOB_CODE, 'J7', 1.1 ,'J6', 1.15 ,'J5', 1.2 ,1.05), '99,999,999') AS "인상된급여"
  FROM EMPLOYEE
 ORDER BY
       "인상률"     DESC
     , "인상된급여" DESC;


/*
        2) CASE
            CASE WHEN 조건1 THEN 결과1
                 WHEN 조건2 THEN 결과2
                 ELSE 그외결과
             END
*/
-- EMPLOYEE 테이블에서 사번, 직원명, 주민번호, 성별(남자,여자) 조회
SELECT EMP_ID                                         AS "사번"
     , EMP_NAME                                       AS "직원명"
     , EMP_NO                                         AS "주민번호"
     , CASE  WHEN SUBSTR(EMP_NO, 8, 1) IN('1', '3') THEN '남자'
             WHEN SUBSTR(EMP_NO, 8, 1) IN('2', '4') THEN '여자'
             ELSE '잘못된 주민번호 입니다.'
        END    AS "성별"
  FROM EMPLOYEE;

SELECT * FROM EMPLOYEE
 WHERE SUBSTR(EMP_NO, 8, 1) = 1;

-- EMPLOYEE 테이블에서 직원명, 급여, 급여등급(S1 ~ S4) 조회
-- SALARY 값이 5000000 초과일경우 S1
-- SALARY 값이 5000000 이하, 3500000 초과일경우 S2
-- SALARY 값이 3500000 이하, 2000000 초과일경우 S3
-- 그외의 경우 S4

SELECT EMP_NAME                      AS "직원명"
     , TO_CHAR(SALARY, '99,999,999') AS "급여"
     , CASE WHEN SALARY > 5000000 THEN 'S1'
            WHEN SALARY > 3500000 THEN 'S2'
            WHEN SALARY > 2000000 THEN 'S3'
            ELSE 'S4'
        END                          AS  "급여등급"
  FROM EMPLOYEE
 ORDER BY
       SALARY DESC;

/*
    <그룹함수>
        1) SUM
            SUM(NUMBER 타입의 컬럼)
*/
-- EMPLOYEE 테이블에서 전 사원의 총 급여의 합계를 조회
SELECT TO_CHAR(SUM(SALARY), '999,999,999')          AS "총급여"
  FROM EMPLOYEE
;

-- EMPLOYEE 테이블에서 전 사원의 연봉의 총 합계를 조회
SELECT TO_CHAR(SUM(SALARY * 12), '999,999,999')     AS "연봉 총 합계"
  FROM EMPLOYEE
;

-- EMPLOYEE 테이블에서 여자사원의 급여의 합계를 조회
SELECT TO_CHAR(SUM(SALARY), '999,999,999')          AS "급여"
  FROM EMPLOYEE
 WHERE SUBSTR(EMP_NO, 8, 1) IN ('2','4')
;

-- EMPLOYEE 테이블에서 부서코드가 'D5' 인 사원들의 연봉의 합계를 조회
SELECT TO_CHAR(SUM(SALARY*12), '999,999,999')       AS "급여"
  FROM EMPLOYEE
 WHERE DEPT_CODE = 'D5'
;
/*
        2) AVG
            AVG(NUMBER)
*/
-- EMPLOYEE 테이블에서 전체 사원의 급여 평균
SELECT TO_CHAR(ROUND(AVG(NVL(SALARY,0)), 3), '999,999,999.999') AS SALARY
  FROM EMPLOYEE
;

-- EMPLOYEE 테이블에서 전체 사원의 보너스 평균 조회
SELECT ROUND(AVG(NVL(BONUS,0)),2) AS BONUS_ALL
     , ROUND(AVG(BONUS),2)        AS BONUS_NNL
  FROM EMPLOYEE;
-- AVG 함수가 실행될때 NULL인 값들은 제외하고 연산을 시작한다.

/*
        3) MIN / MAX
            MIN|MAX(모든타입)
*/
SELECT MIN(SALARY)     AS "최저급여"
     , MAX(SALARY)     AS "최고급여"
     , MIN(EMP_NAME)   AS "이름 상위"
     , MAX(EMP_NAME)   AS "이름 하위"
     , MIN(BONUS)      AS "보너스 상위"
     , MAX(BONUS)      AS "보너스 하위"
     , MIN(HIRE_DATE)  AS "입사일 상위"
     , MAX(HIRE_DATE)  AS "입사일 하위"
  FROM EMPLOYEE;
/* 
        4) COUNT
            COUNT(*)
*/
SELECT COUNT(*) AS CNT
  FROM EMPLOYEE
;
-- EMPLOYEE 테이블에서 남자 사원의 수를 조회
SELECT COUNT(*) AS CNT
  FROM EMPLOYEE
-- WHERE SUBSTR(EMP_NO, 8,1) IN('1','3')
-- WHERE SUBSTR(EMP_NO, 8,1) IN('2','4')
 WHERE SUBSTR(EMP_NO, 8,1) NOT IN('1','3','2','4');


-- EMPLOYEE 테이블에서 보너스를 받는 직원의 수를 조회
SELECT COUNT(*) AS CNT
  FROM EMPLOYEE
 WHERE BONUS IS NOT NULL
;
SELECT COUNT(BONUS) AS CNT
  FROM EMPLOYEE
;

-- EMPLOYEE 테이블에서 퇴사한 사원의 수 조회
-- 방법 1)
SELECT COUNT(*) AS CNT
  FROM EMPLOYEE
 WHERE ENT_YN = 'Y';
-- 방법 2)
SELECT COUNT(ENT_DATE)
  FROM EMPLOYEE;

-- 방법 3)
SELECT COUNT(*)
  FROM EMPLOYEE
 WHERE ENT_DATE IS NOT NULL;

-- EMPLOYEE 테이블에서 현재 사원들이 속해있는 부서의 수를 조회
-- DISTINCT 키워드를 사용하면 중복제거 개수를 구할수있다.
SELECT COUNT(DISTINCT DEPT_CODE)
  FROM EMPLOYEE
;

-- EMPLOYEE 테이블에서 현재 사원들이 분포되어 있는 직급의 수를 조회
SELECT COUNT(DISTINCT JOB_CODE)
  FROM EMPLOYEE
;