-- 문의 내용 삽입 및 확인
INSERT INTO QUESTION VALUES (SEQ_QT_NO.NEXTVAL, '분실물 문의 더미 데이터4', '분실물 문의 더미 데이터1의 내용', 1234, '010-1234-1234', '임꺽정', '분실물', 'LOST@NAVER.COM', NULL, NULL, NULL, NULL, NULL, 'admin', 'Y', '홍대', '답변 내용', SYSDATE, 'admin', '서울의봄', null);
INSERT INTO QUESTION VALUES (SEQ_QT_NO.NEXTVAL, '1대1 문의 더미 데이터4', '1대1 문의 더미 데이터1의 내용', 1234, '010-1234-1234', '임꺽정', '일대일', 'LOST@NAVER.COM', '일대일 타입', '일대일 사진', NULL, NULL, NULL, 'admin', 'Y', '신촌', '답변 내용', SYSDATE, 'admin', '서울의봄', null);
INSERT INTO QUESTION VALUES (SEQ_QT_NO.NEXTVAL, '대관 문의 더미 데이터4', '대관 문의 더미 데이터1의 내용', 1234, '010-1234-1234', '임꺽정', '대관', 'LOST@NAVER.COM', NULL, NULL, 7, SYSDATE, 30, 'admin', 'Y', '대학로', '답변 내용', SYSDATE, 'admin', '서울의봄', null);

-- 영화 삽입
INSERT INTO MOVIE 
VALUES (
    SEQ_MV_NO.NEXTVAL, 
    '서울의 봄', 
    '12.12: THE DAY', 
    'https://kobis.or.kr/common/mast/movie/2023/11/thumb_x640/thn_2d4842b5ae044adfaa2769ab51542ab8.jpg',
    '1979년 12월 12일, 수도 서울 군사반란 발생
    그날, 대한민국의 운명이 바뀌었다
    
    대한민국을 뒤흔든 10월 26일 이후, 서울에 새로운 바람이 불어온 것도 잠시
    12월 12일, 보안사령관 전두광이 반란을 일으키고
    군 내 사조직을 총동원하여 최전선의 전방부대까지 서울로 불러들인다.',
    '2D',
    '김성수',
    '드라마 / 141분',
    '12세이상관람가',
    '2023.11.22',
    '황정민, 정우성, 이성민, 박해준, 김성균, 김의성'
);
INSERT INTO MOVIE 
VALUES (
    SEQ_MV_NO.NEXTVAL, 
    '어벤져스: 에이지 오브 울트론', 
    'The Avengers: Age of Ultron', 
    'https://www.kobis.or.kr/common/mast/movie/2015/03/c26db862b6a1440bb84459b86b822727.jpg',
    '어벤져스는 끝났다! 희망은 없다!
    어벤져스를 위협하는 사상 최강의 적 ‘울트론’의 등장
    인류를 멸종시키려는 거대한 음모를 가진
    ‘울트론’과 거대한 전쟁이 시작된다!',
    '2D/3D/4D/IMAX',
    '조스 웨던',
    '액션, SF / 141분',
    '12세이상관람가',
    '2015.04.23',
    '로버트 다우니 주니어, 크리스 헴스워스, 마크 러팔로, 크리스 에반스, 스칼렛 요한슨'
);
INSERT INTO MOVIE 
VALUES (
    SEQ_MV_NO.NEXTVAL, 
    '셔터 아일랜드', 
    'Shutter Island', 
    'https://kobis.or.kr/common/mast/movie/2011/12/thumb_x640/thn_4cdb36ba99404c6d8c8f0be74d1ac9ad.jpg',
    '누군가 사라졌다
    
    보스턴 셔터아일랜드의 정신병원에서 환자가 실종되는 사건이 발생한다. 
    연방보안관 테디 다니엘스(레오나르도 디카프리오)는 수사를 위해 동료 척(마크 러팔로)과 함께 셔터아일랜드로 향한다. 
    셔터 아일랜드에 위치한 이 병원은 중범죄를 저지른 정신병자를 격리하는 병동으로 탈출 자체가 불가능하다.',
    '2D',
    '마틴 스코세이지',
    '미스터리, 스릴러 / 138분',
    '15세이상관람가',
    '2010-03-18',
    '마크 러팔로, 레오나르도 디카프리오'
);
INSERT INTO MOVIE 
VALUES (
    SEQ_MV_NO.NEXTVAL, 
    '짱구는 못말려: 엉덩이 폭탄', 
    'Crayon Shin-Chan', 
    'https://www.kobis.or.kr/upload/up_img/cleansing/70/thumb_x192/thn_mov_20090570_1.jpg',
    '제주도에서 오랜만에 평화로운 휴가를 즐기는 짱구네. 
    짱구와 즐거운 한 때를 보내던 흰둥이는 눈 깜짝 할 사이 엉덩이에 의문의 기저귀(?)가 붙어 버린다. 
    짱구네를 찾아 온 U.N.K.A.는 흰둥이 엉덩이의 기저귀가 지구를 날려버릴 폭탄이라고 말하며 흰둥이를 폭탄과 함께 우주로 보내버려야 한다고 하고, 
    짱구는 흰둥이를 보낼 수 없어 몰래 응카를 피해 도망을 친다.',
    '2D',
    '무토우 유지',
    '애니메이션, 코미디, 가족 / 102분',
    '전체관람가',
    '2009-09-24',
    ' 나라하시 미키, 후지와라 케이지, 야지마 아키코'
);
INSERT INTO MOVIE 
VALUES (
    SEQ_MV_NO.NEXTVAL, 
    '존 윅 - 리로드', 
    'John Wick Chapter Two', 
    'https://www.kobis.or.kr/common/mast/movie/2020/08/thumb_x192/thn_a9c3a0eb90ab460bb4b0a67e340f6812.jpg',
    '장전 완료! 준비는 끝났다!

    업계 최고의 레전드 킬러 ‘존 윅’은 과거를 뒤로한 채 은퇴를 선언하지만, 과거 자신의 목숨을 구했던 옛 동료와 피로 맺은 암살자들의 룰에 의해 로마로 향한다.
    ‘국제 암살자 연합’을 탈취하려는 옛 동료의 계획으로 ‘존 윅’은 함정에 빠지게 되고, 전세계 암살자들의 총구는 그를 향하는데...',
    '2D, 4D',
    '채드 스타헬스키',
    '액션, 범죄, 스릴러 / 122분',
    '청소년관람불가',
    '2017-02-22',
    '키아누 리브스, 이안 맥쉐인, 루비 로즈'
);


-- CINEMA 안들어간 부분 추가
INSERT INTO CINEMA VALUES(SEQ_CN_NO.NEXTVAL, '이수'            , '이수'            , SYSDATE);
INSERT INTO CINEMA VALUES(SEQ_CN_NO.NEXTVAL, '코엑스'          , '코엑스'          , SYSDATE);
INSERT INTO CINEMA VALUES(SEQ_CN_NO.NEXTVAL, '상암월드컵경기장', '상암월드컵경기장', SYSDATE);
INSERT INTO CINEMA VALUES(SEQ_CN_NO.NEXTVAL, '신촌'            , '신촌'            , SYSDATE);
INSERT INTO CINEMA VALUES(SEQ_CN_NO.NEXTVAL, '창동'            , '창동'            , SYSDATE);
INSERT INTO CINEMA VALUES(SEQ_CN_NO.NEXTVAL, '화곡'            , '화곡'            , SYSDATE);
INSERT INTO CINEMA VALUES(SEQ_CN_NO.NEXTVAL, '성수'            , '성수'            , SYSDATE);
INSERT INTO CINEMA VALUES(SEQ_CN_NO.NEXTVAL, '센트럴'          , '센트럴'          , SYSDATE);
INSERT INTO CINEMA VALUES(SEQ_CN_NO.NEXTVAL, '송파파크하비오'  , '송파파크하비오'  , SYSDATE);

INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '29','더 부티크 목동현대백화점 $ 더부티크(리클라이너) 107호', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '29','더 부티크 목동현대백화점 $ 더부티크(리클라이너) 108호', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '132','상암월드컵경기장 $ 3관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '132','상암월드컵경기장 $ 4관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '132','상암월드컵경기장 $ 5관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '132','상암월드컵경기장 $ 6층 3관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '132','상암월드컵경기장 $ 6관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '132','상암월드컵경기장 $ 7관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '132','상암월드컵경기장 $ 8관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '132','상암월드컵경기장 $ 9관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '132','상암월드컵경기장 $ 컴포트1관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '132','상암월드컵경기장 $ Dolby Atmos관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '133','신촌 $ 2관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '133','신촌 $ 3관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '133','신촌 $ 5관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '133','신촌 $ 6관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '133','신촌 $ 7관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '133','신촌 $ 8관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '133','신촌 $ 컴포트 1관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '133','신촌 $ 컴포트 4관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '130','이수 $ 1관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '130','이수 $ 2관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '130','이수 $ 3관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '130','이수 $ 4관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '130','이수 $ 5관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '130','이수 $ 6관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '134','창동 $ 1관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '134','창동 $ 2관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '134','창동 $ 3관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '134','창동 $ 4관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '134','창동 $ 5관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '131','코엑스 $ 컴포트 3관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '131','코엑스 $ 컴포트 6관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '131','코엑스 $ 컴포트 7관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '131','코엑스 $ 컴포트 8관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '131','코엑스 $ 컴포트 10관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '131','코엑스 $ 컴포트 11관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '131','코엑스 $ 더부티크 102호 스위트', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '131','코엑스 $ 더부티크 103호 스위트', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '131','코엑스 $ 더부티크 105호 스위트', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '131','코엑스 $ BMW 코오롱 모터스관(컴포트 5관)', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '131','코엑스 $ 자코모관(더부티크 스위트 101호)', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '131','코엑스 $ 자코모관(더부티크 스위트 104호)', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '131','코엑스 $ 2관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '131','코엑스 $ 4관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '131','코엑스 $ 스크린A', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '131','코엑스 $ 스크린B', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '131','코엑스 $ Dolby Cinema', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, 'hd' ,'홍대 $ 11층 4관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, 'hd' ,'홍대 $ 11층 5관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, 'hd' ,'홍대 $ 9층 2관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, 'hd' ,'홍대 $ 9층 3관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, 'hd' ,'홍대 $ 박건욱관(7층 1관)', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '135','화곡 $ 1관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '135','화곡 $ 2관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '135','화곡 $ 3관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '135','화곡 $ 4관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '135','화곡 $ 5관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '28' ,'ARTNINE $ 0관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '28' ,'ARTNINE $ 9관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '136','성수 $ 1관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '136','성수 $ 2관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '136','성수 $ 4관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '136','성수 $ 더부티크 101호 스위트', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '136','성수 $ 더부티크 102호 스위트', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '136','성수 $ Dolby Atmos관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '137','센트럴 $ 더부티크 101호', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '137','센트럴 $ 더부티크 102호', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '137','센트럴 $ 더부티크 103호', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '137','센트럴 $ 더부티크 104호', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '137','센트럴 $ 더부티크 105호', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '138','송파파크하비오 $ 1관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '138','송파파크하비오 $ 2관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '138','송파파크하비오 $ 3관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '138','송파파크하비오 $ 4관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '138','송파파크하비오 $ 5관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '138','송파파크하비오 $ 6관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '138','송파파크하비오 $ 7관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '138','송파파크하비오 $ 8관', 'N', '2D');
INSERT INTO THEATER                                         VALUES(SEQ_CN_NO.NEXTVAL, '138','송파파크하비오 $ 9관', 'N', '2D');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '27', '강남대로(씨티) $ 2관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '27', '강남대로(씨티) $ 1관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '26', '강동 $ 1관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '26', '강동 $ 2관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '26', '강동 $ 3관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '26', '강동 $ 5관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '26', '강동 $ 7관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '26', '강동 $ 4관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '26', '강동 $ 6관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '26', '강동 $ 8관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '26', '강동 $ 10관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '26', '강동 $ 9관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '29', '더 부티크 목동현대백화점 $ 컴포트 101호');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '29', '더 부티크 목동현대백화점 $ 더부티크(리클라이너) 108호');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '29', '더 부티크 목동현대백화점 $ 컴포트 102호');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '29', '더 부티크 목동현대백화점 $ 컴포트 106호');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '29', '더 부티크 목동현대백화점 $ 더부티크(리클라이너) 107호');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '29', '더 부티크 목동현대백화점 $ 컴포트 105호');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '29', '더 부티크 목동현대백화점 $ 컴포트 104호');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '29', '더 부티크 목동현대백화점 $ 컴포트 103호');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '24', '동대문 $ 3관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '24', '동대문 $ 4관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '24', '동대문 $ COMFORT 1관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '24', '동대문 $ 5관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '24', '동대문 $ 2관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '24', '동대문 $ 7관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '24', '동대문 $ 8관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '24', '동대문 $ 6관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '23', '마곡 $ 3관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '23', '마곡 $ 5관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '23', '마곡 $ 2관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '23', '마곡 $ 1관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '23', '마곡 $ 6관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '23', '마곡 $ 4관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '22', '목동 $ 컴포트 6관(소파석)');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '22', '목동 $ 7관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '22', '목동 $ 8관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '22', '목동 $ 9관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '22', '목동 $ 컴포트2관(소파석)');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '22', '목동 $ 4관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '22', '목동 $ Dolby Atmos관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '22', '목동 $ 컴포트5관(SideWall)');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '22', '목동 $ 3관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '21', '상봉 $ 6층 컴포트2관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '21', '상봉 $ 8층 7관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '21', '상봉 $ 4층 1관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '21', '상봉 $ 8층 6관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '21', '상봉 $ 8층 5관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '21', '상봉 $ 6층 3관');
INSERT INTO THEATER (THEATER_NO , CINEMA_ID , THEATER_TYPE) VALUES(SEQ_CN_NO.NEXTVAL, '21', '상봉 $ 6층 4관');


-- 포스터 이미지는 일단 노량 이미지로 
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '시민덕희'                                                     , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '엔드 오브 에반게리온'                                         , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '도그맨'                                                       , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '신차원! 짱구는 못말려 더 무비 초능력 대결전 ~날아라 수제김밥~', 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '외계+인 2부'                                                  , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '위시'                                                         , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '세기말의 사랑'                                                , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '괴물'                                                         , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '노량: 죽음의 바다'                                            , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '레트리뷰션'                                                   , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '에반게리온 신극장판: 파'                                      , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '에반게리온 신극장판: Q'                                       , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '류이치 사카모토: 오퍼스'                                      , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '(자막) 그대들은 어떻게 살 것인가'                             , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '덤 머니'                                                      , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '넥스트 골 윈즈'                                               , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '트롤: 밴드 투게더'                                            , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '[방학특가] 말하고 싶은 비밀'                                  , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '[F] 클럽 제로'                                                , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '쏘우 X'                                                       , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '인투 더 월드'                                                 , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '길위에 김대중'                                                , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '[F] 소녀는 졸업하지 않는다'                                   , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '[F] 일 부코'                                                  , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '울산의 별'                                                    , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '(더빙) 인투 더 월드'                                          , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '[네덜란드 국립 발레] 지젤'                                    , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '라이즈'                                                       , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '(DAY 1) 극장판 아이돌리쉬 세븐; LIVE 4bit BEYOND THE PERiOD'  , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '[F] 괴물'                                                     , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '블루 자이언트'                                                , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '(DAY 2) 극장판 아이돌리쉬 세븐; LIVE 4bit BEYOND THE PERiOD'  , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '스즈메의 문단속: 다녀왔어'                                    , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '[F] 세기말의 사랑'                                            , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '더 퍼스트 슬램덩크'                                           , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '에반게리온 신극장판: 서'                                      , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '그대들은 어떻게 살 것인가'                                    , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '[F] 나의 올드 오크'                                           , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '[F] 라이즈'                                                   , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '[F] 노 베어스'                                                , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '[F] 사랑은 낙엽을 타고'                                       , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '[에드워드 양 기획전] 하나 그리고 둘'                          , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '나의 올드 오크'                                               , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');
INSERT INTO MOVIE(MOVIE_NO , MV_KOR_NAME , MV_ENG_NAME , MV_POSTER , MV_SYNOPSIS , MV_TYPE , MV_DIRECTOR , MV_GENRE , MV_GRADE , MV_OPEN_DATE , MV_CASTINGS) VALUES(SEQ_MV_NO.NEXTVAL, '[에드워드 양 기획전] 타이페이 스토리'                         , 'EnglishName', 'https://img.megabox.co.kr/SharedImg/2023/12/21/lYCj0izHwMOIbNYHsqYj4dZHVYuq5AnW_420.jpg' , 'MV_SYNOPSIS' , 'MV_TYPE' , 'MV_DIRECTOR' , 'MV_GENRE' , 'MV_GRADE' , SYSDATE , 'MV_CASTINGS');

-- TIME_TABLE 추가
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:30', 'YYYY-MM-DD HH24:MI'), '시민덕희', '강남대로(씨티) $ 2관', TO_DATE('2024-01-28 18:33', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:50', 'YYYY-MM-DD HH24:MI'), '시민덕희', '강남대로(씨티) $ 2관', TO_DATE('2024-01-28 20:53', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:10', 'YYYY-MM-DD HH24:MI'), '시민덕희', '강남대로(씨티) $ 2관', TO_DATE('2024-01-28 23:13', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:15', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '강남대로(씨티) $ 1관', TO_DATE('2024-01-28 18:52', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:10', 'YYYY-MM-DD HH24:MI'), '도그맨', '강남대로(씨티) $ 1관', TO_DATE('2024-01-28 23:14', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:10', 'YYYY-MM-DD HH24:MI'), '신차원! 짱구는 못말려 더 무비 초능력 대결전 ~날아라 수제김밥~', '강남대로(씨티) $ 1관', TO_DATE('2024-01-28 20:54', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:20', 'YYYY-MM-DD HH24:MI'), '시민덕희', '강동 $ 1관', TO_DATE('2024-01-28 22:23', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:35', 'YYYY-MM-DD HH24:MI'), '시민덕희', '강동 $ 2관', TO_DATE('2024-01-28 18:38', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:55', 'YYYY-MM-DD HH24:MI'), '시민덕희', '강동 $ 2관', TO_DATE('2024-01-28 20:58', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:20', 'YYYY-MM-DD HH24:MI'), '시민덕희', '강동 $ 2관', TO_DATE('2024-01-28 23:23', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:25', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '강동 $ 3관', TO_DATE('2024-01-28 20:37', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:00', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '강동 $ 3관', TO_DATE('2024-01-28 23:12', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:10', 'YYYY-MM-DD HH24:MI'), '위시', '강동 $ 1관', TO_DATE('2024-01-28 19:54', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:20', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '강동 $ 5관', TO_DATE('2024-01-28 20:51', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:10', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '강동 $ 5관', TO_DATE('2024-01-28 23:41', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:10', 'YYYY-MM-DD HH24:MI'), '세기말의 사랑', '강동 $ 7관', TO_DATE('2024-01-28 20:16', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:50', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '강동 $ 4관', TO_DATE('2024-01-28 22:27', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:45', 'YYYY-MM-DD HH24:MI'), '괴물', '강동 $ 6관', TO_DATE('2024-01-28 21:01', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:55', 'YYYY-MM-DD HH24:MI'), '도그맨', '강동 $ 8관', TO_DATE('2024-01-28 20:59', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:40', 'YYYY-MM-DD HH24:MI'), '노량: 죽음의 바다', '강동 $ 7관', TO_DATE('2024-01-28 23:22', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:55', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '강동 $ 8관', TO_DATE('2024-01-28 18:35', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:20', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '강동 $ 8관', TO_DATE('2024-01-28 23:00', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:15', 'YYYY-MM-DD HH24:MI'), '에반게리온 신극장판: 파', '강동 $ 4관', TO_DATE('2024-01-28 18:17', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:40', 'YYYY-MM-DD HH24:MI'), '에반게리온 신극장판: Q', '강동 $ 4관', TO_DATE('2024-01-28 20:25', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:00', 'YYYY-MM-DD HH24:MI'), '류이치 사카모토: 오퍼스', '강동 $ 10관', TO_DATE('2024-01-28 22:53', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:00', 'YYYY-MM-DD HH24:MI'), '(자막) 그대들은 어떻게 살 것인가', '강동 $ 9관', TO_DATE('2024-01-28 23:13', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:45', 'YYYY-MM-DD HH24:MI'), '덤 머니', '강동 $ 9관', TO_DATE('2024-01-28 20:40', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:35', 'YYYY-MM-DD HH24:MI'), '넥스트 골 윈즈', '강동 $ 6관', TO_DATE('2024-01-28 18:29', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:45', 'YYYY-MM-DD HH24:MI'), '트롤: 밴드 투게더', '강동 $ 9관', TO_DATE('2024-01-28 18:26', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:30', 'YYYY-MM-DD HH24:MI'), '[방학특가] 말하고 싶은 비밀', '강동 $ 10관', TO_DATE('2024-01-28 20:30', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:10', 'YYYY-MM-DD HH24:MI'), '[F] 클럽 제로', '강동 $ 10관', TO_DATE('2024-01-28 18:10', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:20', 'YYYY-MM-DD HH24:MI'), '쏘우 X', '강동 $ 6관', TO_DATE('2024-01-28 23:28', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:45', 'YYYY-MM-DD HH24:MI'), '시민덕희', '강동 $ 1관', TO_DATE('2024-01-28 20:48', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:10', 'YYYY-MM-DD HH24:MI'), '시민덕희', '강동 $ 1관', TO_DATE('2024-01-28 23:13', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:25', 'YYYY-MM-DD HH24:MI'), '시민덕희', '강동 $ 3관', TO_DATE('2024-01-28 18:28', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:35', 'YYYY-MM-DD HH24:MI'), '시민덕희', '강동 $ 9관', TO_DATE('2024-01-28 19:38', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:00', 'YYYY-MM-DD HH24:MI'), '시민덕희', '강동 $ 9관', TO_DATE('2024-01-28 22:03', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:25', 'YYYY-MM-DD HH24:MI'), '시민덕희', '강동 $ 9관', TO_DATE('2024-01-28 00:28', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:45', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '강동 $ 3관', TO_DATE('2024-01-28 23:57', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:55', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '강동 $ 4관', TO_DATE('2024-01-28 19:07', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:10', 'YYYY-MM-DD HH24:MI'), '위시', '강동 $ 5관', TO_DATE('2024-01-28 21:54', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:55', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '강동 $ 3관', TO_DATE('2024-01-28 21:26', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:05', 'YYYY-MM-DD HH24:MI'), '인투 더 월드', '강동 $ 7관', TO_DATE('2024-01-28 18:46', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:15', 'YYYY-MM-DD HH24:MI'), '세기말의 사랑', '강동 $ 1관', TO_DATE('2024-01-28 18:21', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:35', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '강동 $ 7관', TO_DATE('2024-01-28 23:12', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:05', 'YYYY-MM-DD HH24:MI'), '괴물', '강동 $ 6관', TO_DATE('2024-01-28 00:21', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:45', 'YYYY-MM-DD HH24:MI'), '도그맨', '강동 $ 5관', TO_DATE('2024-01-28 19:49', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:15', 'YYYY-MM-DD HH24:MI'), '도그맨', '강동 $ 5관', TO_DATE('2024-01-28 00:19', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:05', 'YYYY-MM-DD HH24:MI'), '길위에 김대중', '강동 $ 7관', TO_DATE('2024-01-28 21:20', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:40', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '강동 $ 10관', TO_DATE('2024-01-28 22:20', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:35', 'YYYY-MM-DD HH24:MI'), '에반게리온 신극장판: 파', '강동 $ 8관', TO_DATE('2024-01-28 18:37', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:35', 'YYYY-MM-DD HH24:MI'), '에반게리온 신극장판: Q', '강동 $ 10관', TO_DATE('2024-01-28 20:20', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:50', 'YYYY-MM-DD HH24:MI'), '류이치 사카모토: 오퍼스', '강동 $ 6관', TO_DATE('2024-01-28 21:43', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:55', 'YYYY-MM-DD HH24:MI'), '(자막) 그대들은 어떻게 살 것인가', '강동 $ 4관', TO_DATE('2024-01-28 00:08', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:25', 'YYYY-MM-DD HH24:MI'), '[F] 소녀는 졸업하지 않는다', '강동 $ 4관', TO_DATE('2024-01-28 21:35', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:25', 'YYYY-MM-DD HH24:MI'), '넥스트 골 윈즈', '강동 $ 8관', TO_DATE('2024-01-28 23:19', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:15', 'YYYY-MM-DD HH24:MI'), '[F] 일 부코', '강동 $ 8관', TO_DATE('2024-01-28 21:02', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:25', 'YYYY-MM-DD HH24:MI'), '울산의 별', '강동 $ 6관', TO_DATE('2024-01-28 19:32', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:15', 'YYYY-MM-DD HH24:MI'), '시민덕희', '더 부티크 목동현대백화점 $ 컴포트 101호', TO_DATE('2024-01-28 18:18', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:40', 'YYYY-MM-DD HH24:MI'), '시민덕희', '더 부티크 목동현대백화점 $ 컴포트 101호', TO_DATE('2024-01-28 20:43', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:05', 'YYYY-MM-DD HH24:MI'), '시민덕희', '더 부티크 목동현대백화점 $ 컴포트 101호', TO_DATE('2024-01-28 23:08', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:25', 'YYYY-MM-DD HH24:MI'), '시민덕희', '더 부티크 목동현대백화점 $ 더부티크(리클라이너) 108호', TO_DATE('2024-01-28 19:28', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:50', 'YYYY-MM-DD HH24:MI'), '시민덕희', '더 부티크 목동현대백화점 $ 더부티크(리클라이너) 108호', TO_DATE('2024-01-28 21:53', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:15', 'YYYY-MM-DD HH24:MI'), '시민덕희', '더 부티크 목동현대백화점 $ 더부티크(리클라이너) 108호', TO_DATE('2024-01-28 00:18', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:25', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '더 부티크 목동현대백화점 $ 컴포트 102호', TO_DATE('2024-01-28 21:37', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:00', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '더 부티크 목동현대백화점 $ 컴포트 102호', TO_DATE('2024-01-28 00:12', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:30', 'YYYY-MM-DD HH24:MI'), '위시', '더 부티크 목동현대백화점 $ 컴포트 106호', TO_DATE('2024-01-28 19:14', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:35', 'YYYY-MM-DD HH24:MI'), '위시', '더 부티크 목동현대백화점 $ 컴포트 106호', TO_DATE('2024-01-28 21:19', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:40', 'YYYY-MM-DD HH24:MI'), '위시', '더 부티크 목동현대백화점 $ 컴포트 106호', TO_DATE('2024-01-28 23:24', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:30', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '더 부티크 목동현대백화점 $ 더부티크(리클라이너) 107호', TO_DATE('2024-01-28 21:01', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:20', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '더 부티크 목동현대백화점 $ 더부티크(리클라이너) 107호', TO_DATE('2024-01-28 23:51', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:45', 'YYYY-MM-DD HH24:MI'), '(더빙) 인투 더 월드', '더 부티크 목동현대백화점 $ 컴포트 105호', TO_DATE('2024-01-28 18:26', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:10', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '더 부티크 목동현대백화점 $ 컴포트 104호', TO_DATE('2024-01-28 21:47', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:35', 'YYYY-MM-DD HH24:MI'), '괴물', '더 부티크 목동현대백화점 $ 컴포트 104호', TO_DATE('2024-01-28 19:51', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:10', 'YYYY-MM-DD HH24:MI'), '도그맨', '더 부티크 목동현대백화점 $ 컴포트 103호', TO_DATE('2024-01-28 19:14', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:05', 'YYYY-MM-DD HH24:MI'), '도그맨', '더 부티크 목동현대백화점 $ 컴포트 103호', TO_DATE('2024-01-28 00:09', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:10', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '더 부티크 목동현대백화점 $ 컴포트 104호', TO_DATE('2024-01-28 23:50', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:00', 'YYYY-MM-DD HH24:MI'), '[네덜란드 국립 발레] 지젤', '더 부티크 목동현대백화점 $ 컴포트 105호', TO_DATE('2024-01-28 21:10', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:30', 'YYYY-MM-DD HH24:MI'), '덤 머니', '더 부티크 목동현대백화점 $ 컴포트 105호', TO_DATE('2024-01-28 23:25', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:35', 'YYYY-MM-DD HH24:MI'), '라이즈', '더 부티크 목동현대백화점 $ 컴포트 103호', TO_DATE('2024-01-28 21:42', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:10', 'YYYY-MM-DD HH24:MI'), '시민덕희', '동대문 $ 3관', TO_DATE('2024-01-28 20:13', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:30', 'YYYY-MM-DD HH24:MI'), '시민덕희', '동대문 $ 3관', TO_DATE('2024-01-28 22:33', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:00', 'YYYY-MM-DD HH24:MI'), '시민덕희', '동대문 $ 4관', TO_DATE('2024-01-28 19:03', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:20', 'YYYY-MM-DD HH24:MI'), '시민덕희', '동대문 $ 4관', TO_DATE('2024-01-28 21:23', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:40', 'YYYY-MM-DD HH24:MI'), '시민덕희', '동대문 $ 4관', TO_DATE('2024-01-28 23:43', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:00', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '동대문 $ COMFORT 1관', TO_DATE('2024-01-28 18:12', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:35', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '동대문 $ COMFORT 1관', TO_DATE('2024-01-28 20:47', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:10', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '동대문 $ COMFORT 1관', TO_DATE('2024-01-28 23:22', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:15', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '동대문 $ 5관', TO_DATE('2024-01-28 20:46', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:05', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '동대문 $ 5관', TO_DATE('2024-01-28 23:36', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:30', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '동대문 $ 2관', TO_DATE('2024-01-28 23:07', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:15', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '동대문 $ 7관', TO_DATE('2024-01-28 20:52', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 15:55', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '동대문 $ 8관', TO_DATE('2024-01-28 17:32', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:55', 'YYYY-MM-DD HH24:MI'), '괴물', '동대문 $ 6관', TO_DATE('2024-01-28 20:11', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:55', 'YYYY-MM-DD HH24:MI'), '도그맨', '동대문 $ 7관', TO_DATE('2024-01-28 18:59', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:10', 'YYYY-MM-DD HH24:MI'), '도그맨', '동대문 $ 7관', TO_DATE('2024-01-28 23:14', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:30', 'YYYY-MM-DD HH24:MI'), '노량: 죽음의 바다', '동대문 $ 6관', TO_DATE('2024-01-28 23:12', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:45', 'YYYY-MM-DD HH24:MI'), '[응원상영] (DAY 1) 극장판 아이돌리쉬 세븐; LIVE 4bit BEYOND THE PERiOD', '동대문 $ 8관', TO_DATE('2024-01-28 21:28', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:50', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '동대문 $ 8관', TO_DATE('2024-01-28 19:30', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:50', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '동대문 $ 8관', TO_DATE('2024-01-28 23:30', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:10', 'YYYY-MM-DD HH24:MI'), '에반게리온 신극장판: 파', '동대문 $ 2관', TO_DATE('2024-01-28 19:12', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:30', 'YYYY-MM-DD HH24:MI'), '에반게리온 신극장판: Q', '동대문 $ 2관', TO_DATE('2024-01-28 21:15', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:20', 'YYYY-MM-DD HH24:MI'), '시민덕희', '마곡 $ 3관', TO_DATE('2024-01-28 20:23', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:00', 'YYYY-MM-DD HH24:MI'), '시민덕희', '마곡 $ 5관', TO_DATE('2024-01-28 19:03', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:20', 'YYYY-MM-DD HH24:MI'), '시민덕희', '마곡 $ 5관', TO_DATE('2024-01-28 21:23', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:40', 'YYYY-MM-DD HH24:MI'), '시민덕희', '마곡 $ 5관', TO_DATE('2024-01-28 23:43', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:30', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '마곡 $ 2관', TO_DATE('2024-01-28 19:42', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:00', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '마곡 $ 2관', TO_DATE('2024-01-28 22:12', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:40', 'YYYY-MM-DD HH24:MI'), '위시', '마곡 $ 1관', TO_DATE('2024-01-28 19:24', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:00', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '마곡 $ 6관', TO_DATE('2024-01-28 20:31', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:50', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '마곡 $ 6관', TO_DATE('2024-01-28 22:27', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:10', 'YYYY-MM-DD HH24:MI'), '도그맨', '마곡 $ 4관', TO_DATE('2024-01-28 18:14', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:25', 'YYYY-MM-DD HH24:MI'), '도그맨', '마곡 $ 4관', TO_DATE('2024-01-28 22:29', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:40', 'YYYY-MM-DD HH24:MI'), '노량: 죽음의 바다', '마곡 $ 3관', TO_DATE('2024-01-28 23:22', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:30', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '마곡 $ 4관', TO_DATE('2024-01-28 20:10', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:40', 'YYYY-MM-DD HH24:MI'), '넥스트 골 윈즈', '마곡 $ 1관', TO_DATE('2024-01-28 21:34', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:50', 'YYYY-MM-DD HH24:MI'), '넥스트 골 윈즈', '마곡 $ 1관', TO_DATE('2024-01-28 23:44', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:50', 'YYYY-MM-DD HH24:MI'), '시민덕희', '목동 $ 컴포트 6관(소파석)', TO_DATE('2024-01-28 19:53', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:10', 'YYYY-MM-DD HH24:MI'), '시민덕희', '목동 $ 컴포트 6관(소파석)', TO_DATE('2024-01-28 22:13', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:30', 'YYYY-MM-DD HH24:MI'), '시민덕희', '목동 $ 컴포트 6관(소파석)', TO_DATE('2024-01-28 00:33', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:50', 'YYYY-MM-DD HH24:MI'), '시민덕희', '목동 $ 7관', TO_DATE('2024-01-28 20:53', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:10', 'YYYY-MM-DD HH24:MI'), '시민덕희', '목동 $ 7관', TO_DATE('2024-01-28 23:13', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:20', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '목동 $ 7관', TO_DATE('2024-01-28 18:32', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:30', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '목동 $ 8관', TO_DATE('2024-01-28 20:42', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:40', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '목동 $ 9관', TO_DATE('2024-01-28 21:52', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:10', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '목동 $ 9관', TO_DATE('2024-01-28 00:22', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:10', 'YYYY-MM-DD HH24:MI'), '위시', '목동 $ 컴포트2관(소파석)', TO_DATE('2024-01-28 18:54', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:10', 'YYYY-MM-DD HH24:MI'), '위시', '목동 $ 컴포트2관(소파석)', TO_DATE('2024-01-28 20:54', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 23:20', 'YYYY-MM-DD HH24:MI'), '위시', '목동 $ 컴포트2관(소파석)', TO_DATE('2024-01-28 01:04', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:30', 'YYYY-MM-DD HH24:MI'), '위시', '목동 $ 8관', TO_DATE('2024-01-28 18:14', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:10', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '목동 $ 4관', TO_DATE('2024-01-28 19:41', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:55', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '목동 $ 4관', TO_DATE('2024-01-28 22:26', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:40', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '목동 $ 4관', TO_DATE('2024-01-28 01:11', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:55', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '목동 $ Dolby Atmos관', TO_DATE('2024-01-28 20:32', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 23:00', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '목동 $ Dolby Atmos관', TO_DATE('2024-01-28 00:37', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:50', 'YYYY-MM-DD HH24:MI'), '괴물', '목동 $ 컴포트5관(SideWall)', TO_DATE('2024-01-28 22:06', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:10', 'YYYY-MM-DD HH24:MI'), '도그맨', '목동 $ 3관', TO_DATE('2024-01-28 20:14', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:30', 'YYYY-MM-DD HH24:MI'), '도그맨', '목동 $ 3관', TO_DATE('2024-01-28 22:34', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:50', 'YYYY-MM-DD HH24:MI'), '도그맨', '목동 $ 3관', TO_DATE('2024-01-28 00:54', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:50', 'YYYY-MM-DD HH24:MI'), '신차원! 짱구는 못말려 더 무비 초능력 대결전 ~날아라 수제김밥~', '목동 $ 컴포트5관(SideWall)', TO_DATE('2024-01-28 19:34', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:00', 'YYYY-MM-DD HH24:MI'), '노량: 죽음의 바다', '목동 $ 8관', TO_DATE('2024-01-28 23:42', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:10', 'YYYY-MM-DD HH24:MI'), '길위에 김대중', '목동 $ 9관', TO_DATE('2024-01-28 19:25', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:20', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '목동 $ 컴포트5관(SideWall)', TO_DATE('2024-01-28 00:00', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:50', 'YYYY-MM-DD HH24:MI'), '에반게리온 신극장판: Q', '목동 $ Dolby Atmos관', TO_DATE('2024-01-28 18:35', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:50', 'YYYY-MM-DD HH24:MI'), '류이치 사카모토: 오퍼스', '목동 $ Dolby Atmos관', TO_DATE('2024-01-28 22:43', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:10', 'YYYY-MM-DD HH24:MI'), '넥스트 골 윈즈', '목동 $ 컴포트2관(소파석)', TO_DATE('2024-01-28 23:04', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:55', 'YYYY-MM-DD HH24:MI'), '시민덕희', '상봉 $ 6층 컴포트2관', TO_DATE('2024-01-28 18:58', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:15', 'YYYY-MM-DD HH24:MI'), '시민덕희', '상봉 $ 6층 컴포트2관', TO_DATE('2024-01-28 21:18', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:35', 'YYYY-MM-DD HH24:MI'), '시민덕희', '상봉 $ 6층 컴포트2관', TO_DATE('2024-01-28 23:38', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:05', 'YYYY-MM-DD HH24:MI'), '시민덕희', '상봉 $ 8층 7관', TO_DATE('2024-01-28 20:08', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:25', 'YYYY-MM-DD HH24:MI'), '시민덕희', '상봉 $ 8층 7관', TO_DATE('2024-01-28 22:28', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:30', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '상봉 $ 4층 1관', TO_DATE('2024-01-28 19:42', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:00', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '상봉 $ 4층 1관', TO_DATE('2024-01-28 22:12', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:55', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '상봉 $ 8층 6관', TO_DATE('2024-01-28 21:07', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:25', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '상봉 $ 8층 6관', TO_DATE('2024-01-28 23:37', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:40', 'YYYY-MM-DD HH24:MI'), '위시', '상봉 $ 8층 5관', TO_DATE('2024-01-28 20:24', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:40', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '상봉 $ 8층 5관', TO_DATE('2024-01-28 23:11', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:35', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '상봉 $ 6층 3관', TO_DATE('2024-01-28 21:12', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:20', 'YYYY-MM-DD HH24:MI'), '괴물', '상봉 $ 8층 6관', TO_DATE('2024-01-28 18:36', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:35', 'YYYY-MM-DD HH24:MI'), '도그맨', '상봉 $ 6층 4관', TO_DATE('2024-01-28 18:39', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:55', 'YYYY-MM-DD HH24:MI'), '도그맨', '상봉 $ 6층 4관', TO_DATE('2024-01-28 20:59', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:15', 'YYYY-MM-DD HH24:MI'), '도그맨', '상봉 $ 6층 4관', TO_DATE('2024-01-28 23:19', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:35', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '상봉 $ 6층 3관', TO_DATE('2024-01-28 19:15', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:30', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '상봉 $ 6층 3관', TO_DATE('2024-01-28 23:10', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:00', 'YYYY-MM-DD HH24:MI'), '시민덕희', '상암월드컵경기장 $ 4관', TO_DATE('2024-01-28 20:03', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:25', 'YYYY-MM-DD HH24:MI'), '시민덕희', '상암월드컵경기장 $ 4관', TO_DATE('2024-01-28 22:28', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:50', 'YYYY-MM-DD HH24:MI'), '시민덕희', '상암월드컵경기장 $ 4관', TO_DATE('2024-01-28 00:53', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:00', 'YYYY-MM-DD HH24:MI'), '시민덕희', '상암월드컵경기장 $ 7관', TO_DATE('2024-01-28 19:03', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:45', 'YYYY-MM-DD HH24:MI'), '시민덕희', '상암월드컵경기장 $ 7관', TO_DATE('2024-01-28 23:48', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:20', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '상암월드컵경기장 $ 3관', TO_DATE('2024-01-28 18:32', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:00', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '상암월드컵경기장 $ 3관', TO_DATE('2024-01-28 21:12', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:35', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '상암월드컵경기장 $ 3관', TO_DATE('2024-01-28 23:47', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:30', 'YYYY-MM-DD HH24:MI'), '위시', '상암월드컵경기장 $ 6관', TO_DATE('2024-01-28 18:14', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:35', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '상암월드컵경기장 $ 6층 3관', TO_DATE('2024-01-28 19:15', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:30', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '상암월드컵경기장 $ 6층 3관', TO_DATE('2024-01-28 23:10', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:00', 'YYYY-MM-DD HH24:MI'), '시민덕희', '상암월드컵경기장 $ 4관', TO_DATE('2024-01-28 20:03', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:25', 'YYYY-MM-DD HH24:MI'), '시민덕희', '상암월드컵경기장 $ 4관', TO_DATE('2024-01-28 22:28', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:50', 'YYYY-MM-DD HH24:MI'), '시민덕희', '상암월드컵경기장 $ 4관', TO_DATE('2024-01-28 00:53', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:00', 'YYYY-MM-DD HH24:MI'), '시민덕희', '상암월드컵경기장 $ 7관', TO_DATE('2024-01-28 19:03', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:45', 'YYYY-MM-DD HH24:MI'), '시민덕희', '상암월드컵경기장 $ 7관', TO_DATE('2024-01-28 23:48', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:20', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '상암월드컵경기장 $ 3관', TO_DATE('2024-01-28 18:32', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:00', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '상암월드컵경기장 $ 3관', TO_DATE('2024-01-28 21:12', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:35', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '상암월드컵경기장 $ 3관', TO_DATE('2024-01-28 23:47', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:30', 'YYYY-MM-DD HH24:MI'), '위시', '상암월드컵경기장 $ 6관', TO_DATE('2024-01-28 18:14', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:10', 'YYYY-MM-DD HH24:MI'), '위시', '상암월드컵경기장 $ 8관', TO_DATE('2024-01-28 18:54', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:15', 'YYYY-MM-DD HH24:MI'), '위시', '상암월드컵경기장 $ 8관', TO_DATE('2024-01-28 20:59', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:20', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '상암월드컵경기장 $ 8관', TO_DATE('2024-01-28 23:51', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:10', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '상암월드컵경기장 $ 9관', TO_DATE('2024-01-28 20:41', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:40', 'YYYY-MM-DD HH24:MI'), '(더빙) 인투 더 월드', '상암월드컵경기장 $ 5관', TO_DATE('2024-01-28 19:21', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:20', 'YYYY-MM-DD HH24:MI'), '세기말의 사랑', '상암월드컵경기장 $ 7관', TO_DATE('2024-01-28 21:26', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 23:00', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '상암월드컵경기장 $ Dolby Atmos관', TO_DATE('2024-01-28 00:37', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:35', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '상암월드컵경기장 $ 6관', TO_DATE('2024-01-28 20:12', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:15', 'YYYY-MM-DD HH24:MI'), '[F] 괴물', '상암월드컵경기장 $ 5관', TO_DATE('2024-01-28 00:31', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:25', 'YYYY-MM-DD HH24:MI'), '도그맨', '상암월드컵경기장 $ 컴포트1관', TO_DATE('2024-01-28 21:29', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:50', 'YYYY-MM-DD HH24:MI'), '도그맨', '상암월드컵경기장 $ 컴포트1관', TO_DATE('2024-01-28 23:54', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:00', 'YYYY-MM-DD HH24:MI'), '도그맨', '상암월드컵경기장 $ Dolby Atmos관', TO_DATE('2024-01-28 18:04', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:00', 'YYYY-MM-DD HH24:MI'), '노량: 죽음의 바다', '상암월드컵경기장 $ 9관', TO_DATE('2024-01-28 23:42', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:40', 'YYYY-MM-DD HH24:MI'), '길위에 김대중', '상암월드컵경기장 $ 5관', TO_DATE('2024-01-28 21:55', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:25', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '상암월드컵경기장 $ 컴포트1관', TO_DATE('2024-01-28 19:05', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:30', 'YYYY-MM-DD HH24:MI'), '에반게리온 신극장판: 파', '상암월드컵경기장 $ 6관', TO_DATE('2024-01-28 22:32', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:20', 'YYYY-MM-DD HH24:MI'), '류이치 사카모토: 오퍼스', '상암월드컵경기장 $ Dolby Atmos관', TO_DATE('2024-01-28 20:13', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:50', 'YYYY-MM-DD HH24:MI'), '넥스트 골 윈즈', '상암월드컵경기장 $ 6관', TO_DATE('2024-01-28 00:44', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:30', 'YYYY-MM-DD HH24:MI'), '블루 자이언트', '상암월드컵경기장 $ Dolby Atmos관', TO_DATE('2024-01-28 22:40', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:40', 'YYYY-MM-DD HH24:MI'), '시민덕희', '성수 $ 1관', TO_DATE('2024-01-28 23:43', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:00', 'YYYY-MM-DD HH24:MI'), '시민덕희', '성수 $ 4관', TO_DATE('2024-01-28 20:03', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:00', 'YYYY-MM-DD HH24:MI'), '시민덕희', '성수 $ 더부티크 102호 스위트', TO_DATE('2024-01-28 23:03', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:35', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '성수 $ 1관', TO_DATE('2024-01-28 18:47', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:10', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '성수 $ 1관', TO_DATE('2024-01-28 21:22', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:05', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '성수 $ 더부티크 102호 스위트', TO_DATE('2024-01-28 20:17', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:00', 'YYYY-MM-DD HH24:MI'), '위시', '성수 $ 2관', TO_DATE('2024-01-28 21:44', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:00', 'YYYY-MM-DD HH24:MI'), '위시', '성수 $ 2관', TO_DATE('2024-01-28 23:44', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:55', 'YYYY-MM-DD HH24:MI'), '위시', '성수 $ Dolby Atmos관', TO_DATE('2024-01-28 18:39', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:45', 'YYYY-MM-DD HH24:MI'), '위시', '성수 $ 더부티크 101호 스위트', TO_DATE('2024-01-28 20:29', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:25', 'YYYY-MM-DD HH24:MI'), '세기말의 사랑', '성수 $ 더부티크 101호 스위트', TO_DATE('2024-01-28 23:31', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:20', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '성수 $ 4관', TO_DATE('2024-01-28 21:57', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:25', 'YYYY-MM-DD HH24:MI'), '괴물', '성수 $ 2관', TO_DATE('2024-01-28 19:41', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:00', 'YYYY-MM-DD HH24:MI'), '도그맨', '성수 $ Dolby Atmos관', TO_DATE('2024-01-28 21:04', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:00', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '성수 $ 4관', TO_DATE('2024-01-28 17:40', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:15', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '성수 $ 4관', TO_DATE('2024-01-28 23:55', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:25', 'YYYY-MM-DD HH24:MI'), '류이치 사카모토: 오퍼스', '성수 $ Dolby Atmos관', TO_DATE('2024-01-28 23:18', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:20', 'YYYY-MM-DD HH24:MI'), '시민덕희', '센트럴 $ 더부티크 101호', TO_DATE('2024-01-28 21:23', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:00', 'YYYY-MM-DD HH24:MI'), '시민덕희', '센트럴 $ 더부티크 102호', TO_DATE('2024-01-28 18:03', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:20', 'YYYY-MM-DD HH24:MI'), '시민덕희', '센트럴 $ 더부티크 102호', TO_DATE('2024-01-28 20:23', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:40', 'YYYY-MM-DD HH24:MI'), '시민덕희', '센트럴 $ 더부티크 102호', TO_DATE('2024-01-28 22:43', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:40', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '센트럴 $ 더부티크 103호', TO_DATE('2024-01-28 21:52', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:00', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '센트럴 $ 더부티크 104호', TO_DATE('2024-01-28 19:12', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:00', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '센트럴 $ 더부티크 104호', TO_DATE('2024-01-28 00:12', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:35', 'YYYY-MM-DD HH24:MI'), '위시', '센트럴 $ 더부티크 103호', TO_DATE('2024-01-28 19:19', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:00', 'YYYY-MM-DD HH24:MI'), '위시', '센트럴 $ 더부티크 105호', TO_DATE('2024-01-28 17:44', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:00', 'YYYY-MM-DD HH24:MI'), '위시', '센트럴 $ 더부티크 105호', TO_DATE('2024-01-28 21:44', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:30', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '센트럴 $ 더부티크 101호', TO_DATE('2024-01-28 19:01', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:40', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '센트럴 $ 더부티크 101호', TO_DATE('2024-01-28 23:17', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:10', 'YYYY-MM-DD HH24:MI'), '도그맨', '센트럴 $ 더부티크 103호', TO_DATE('2024-01-28 00:14', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:30', 'YYYY-MM-DD HH24:MI'), '길위에 김대중', '센트럴 $ 더부티크 104호', TO_DATE('2024-01-28 21:45', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:05', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '센트럴 $ 더부티크 105호', TO_DATE('2024-01-28 19:45', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:05', 'YYYY-MM-DD HH24:MI'), '넥스트 골 윈즈', '센트럴 $ 더부티크 105호', TO_DATE('2024-01-28 23:59', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:05', 'YYYY-MM-DD HH24:MI'), '시민덕희', '송파파크하비오 $ 1관', TO_DATE('2024-01-28 20:08', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:30', 'YYYY-MM-DD HH24:MI'), '시민덕희', '송파파크하비오 $ 1관', TO_DATE('2024-01-28 22:33', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:50', 'YYYY-MM-DD HH24:MI'), '시민덕희', '송파파크하비오 $ 5관', TO_DATE('2024-01-28 18:53', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:15', 'YYYY-MM-DD HH24:MI'), '시민덕희', '송파파크하비오 $ 5관', TO_DATE('2024-01-28 21:18', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:40', 'YYYY-MM-DD HH24:MI'), '시민덕희', '송파파크하비오 $ 5관', TO_DATE('2024-01-28 23:43', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:50', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '송파파크하비오 $ 2관', TO_DATE('2024-01-28 00:02', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:20', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '송파파크하비오 $ 6관', TO_DATE('2024-01-28 20:32', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:00', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '송파파크하비오 $ 6관', TO_DATE('2024-01-28 23:12', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:30', 'YYYY-MM-DD HH24:MI'), '위시', '송파파크하비오 $ 8관', TO_DATE('2024-01-28 19:14', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:30', 'YYYY-MM-DD HH24:MI'), '위시', '송파파크하비오 $ 8관', TO_DATE('2024-01-28 21:14', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:30', 'YYYY-MM-DD HH24:MI'), '위시', '송파파크하비오 $ 8관', TO_DATE('2024-01-28 23:14', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:20', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '송파파크하비오 $ 4관', TO_DATE('2024-01-28 19:51', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:10', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '송파파크하비오 $ 4관', TO_DATE('2024-01-28 22:41', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:50', 'YYYY-MM-DD HH24:MI'), '인투 더 월드', '송파파크하비오 $ 2관', TO_DATE('2024-01-28 19:31', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:50', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '송파파크하비오 $ 2관', TO_DATE('2024-01-28 21:27', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:15', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '송파파크하비오 $ 7관', TO_DATE('2024-01-28 17:52', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:50', 'YYYY-MM-DD HH24:MI'), '도그맨', '송파파크하비오 $ 7관', TO_DATE('2024-01-28 22:54', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:10', 'YYYY-MM-DD HH24:MI'), '노량: 죽음의 바다', '송파파크하비오 $ 9관', TO_DATE('2024-01-28 20:52', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:15', 'YYYY-MM-DD HH24:MI'), '노량: 죽음의 바다', '송파파크하비오 $ 9관', TO_DATE('2024-01-28 23:57', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:15', 'YYYY-MM-DD HH24:MI'), '길위에 김대중', '송파파크하비오 $ 7관', TO_DATE('2024-01-28 20:30', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:50', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '송파파크하비오 $ 3관', TO_DATE('2024-01-28 21:30', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:35', 'YYYY-MM-DD HH24:MI'), '넥스트 골 윈즈', '송파파크하비오 $ 3관', TO_DATE('2024-01-28 19:29', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:50', 'YYYY-MM-DD HH24:MI'), '넥스트 골 윈즈', '송파파크하비오 $ 3관', TO_DATE('2024-01-28 23:44', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:00', 'YYYY-MM-DD HH24:MI'), '시민덕희', '신촌 $ 컴포트 1관', TO_DATE('2024-01-28 19:03', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:25', 'YYYY-MM-DD HH24:MI'), '시민덕희', '신촌 $ 컴포트 1관', TO_DATE('2024-01-28 21:28', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:50', 'YYYY-MM-DD HH24:MI'), '시민덕희', '신촌 $ 컴포트 1관', TO_DATE('2024-01-28 23:53', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:50', 'YYYY-MM-DD HH24:MI'), '시민덕희', '신촌 $ 5관', TO_DATE('2024-01-28 22:53', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:00', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '신촌 $ 3관', TO_DATE('2024-01-28 23:12', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:30', 'YYYY-MM-DD HH24:MI'), '위시', '신촌 $ 2관', TO_DATE('2024-01-28 19:14', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:30', 'YYYY-MM-DD HH24:MI'), '위시', '신촌 $ 컴포트 4관', TO_DATE('2024-01-28 22:14', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:10', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '신촌 $ 3관', TO_DATE('2024-01-28 20:41', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:30', 'YYYY-MM-DD HH24:MI'), '세기말의 사랑', '신촌 $ 8관', TO_DATE('2024-01-28 23:36', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:40', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '신촌 $ 2관', TO_DATE('2024-01-28 21:17', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:40', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '신촌 $ 2관', TO_DATE('2024-01-28 23:17', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:35', 'YYYY-MM-DD HH24:MI'), '[F] 괴물', '신촌 $ 7관', TO_DATE('2024-01-28 22:51', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:20', 'YYYY-MM-DD HH24:MI'), '[F] 괴물', '신촌 $ 8관', TO_DATE('2024-01-28 18:36', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:25', 'YYYY-MM-DD HH24:MI'), '도그맨', '신촌 $ 6관', TO_DATE('2024-01-28 23:29', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:25', 'YYYY-MM-DD HH24:MI'), '신차원! 짱구는 못말려 더 무비 초능력 대결전 ~날아라 수제김밥~', '신촌 $ 7관', TO_DATE('2024-01-28 20:09', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:50', 'YYYY-MM-DD HH24:MI'), '노량: 죽음의 바다', '신촌 $ 5관', TO_DATE('2024-01-28 20:32', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:50', 'YYYY-MM-DD HH24:MI'), '[응원상영] (DAY 2) 극장판 아이돌리쉬 세븐; LIVE 4bit BEYOND THE PERiOD', '신촌 $ 6관', TO_DATE('2024-01-28 18:34', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:30', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '신촌 $ 컴포트 4관', TO_DATE('2024-01-28 20:10', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:25', 'YYYY-MM-DD HH24:MI'), '에반게리온 신극장판: Q', '신촌 $ 컴포트 4관', TO_DATE('2024-01-28 18:10', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:55', 'YYYY-MM-DD HH24:MI'), '스즈메의 문단속: 다녀왔어', '신촌 $ 6관', TO_DATE('2024-01-28 21:06', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:00', 'YYYY-MM-DD HH24:MI'), '[F] 소녀는 졸업하지 않는다', '신촌 $ 8관', TO_DATE('2024-01-28 21:10', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:25', 'YYYY-MM-DD HH24:MI'), '시민덕희', '이수 $ 1관', TO_DATE('2024-01-28 22:28', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:45', 'YYYY-MM-DD HH24:MI'), '시민덕희', '이수 $ 2관', TO_DATE('2024-01-28 18:48', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:10', 'YYYY-MM-DD HH24:MI'), '시민덕희', '이수 $ 2관', TO_DATE('2024-01-28 21:13', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:35', 'YYYY-MM-DD HH24:MI'), '시민덕희', '이수 $ 2관', TO_DATE('2024-01-28 23:38', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:55', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '이수 $ 1관', TO_DATE('2024-01-28 20:07', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:30', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '이수 $ 5관', TO_DATE('2024-01-28 18:42', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:00', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '이수 $ 5관', TO_DATE('2024-01-28 21:12', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:30', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '이수 $ 5관', TO_DATE('2024-01-28 23:42', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:20', 'YYYY-MM-DD HH24:MI'), '위시', '이수 $ 3관', TO_DATE('2024-01-28 19:04', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:25', 'YYYY-MM-DD HH24:MI'), '위시', '이수 $ 3관', TO_DATE('2024-01-28 21:09', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:30', 'YYYY-MM-DD HH24:MI'), '위시', '이수 $ 3관', TO_DATE('2024-01-28 23:14', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:55', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '이수 $ 4관', TO_DATE('2024-01-28 23:26', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:00', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '이수 $ 6관', TO_DATE('2024-01-28 19:37', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:55', 'YYYY-MM-DD HH24:MI'), '도그맨', '이수 $ 6관', TO_DATE('2024-01-28 21:59', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:55', 'YYYY-MM-DD HH24:MI'), '노량: 죽음의 바다', '이수 $ 4관', TO_DATE('2024-01-28 20:37', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:15', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '이수 $ 6관', TO_DATE('2024-01-28 23:55', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:10', 'YYYY-MM-DD HH24:MI'), '시민덕희', '창동 $ 2관', TO_DATE('2024-01-28 22:13', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:30', 'YYYY-MM-DD HH24:MI'), '시민덕희', '창동 $ 5관', TO_DATE('2024-01-28 18:33', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:55', 'YYYY-MM-DD HH24:MI'), '시민덕희', '창동 $ 5관', TO_DATE('2024-01-28 20:58', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:20', 'YYYY-MM-DD HH24:MI'), '시민덕희', '창동 $ 5관', TO_DATE('2024-01-28 23:23', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:50', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '창동 $ 4관', TO_DATE('2024-01-28 20:02', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:30', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '창동 $ 4관', TO_DATE('2024-01-28 22:42', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:15', 'YYYY-MM-DD HH24:MI'), '위시', '창동 $ 3관', TO_DATE('2024-01-28 20:59', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:20', 'YYYY-MM-DD HH24:MI'), '위시', '창동 $ 3관', TO_DATE('2024-01-28 23:04', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:30', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '창동 $ 1관', TO_DATE('2024-01-28 23:01', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:00', 'YYYY-MM-DD HH24:MI'), '도그맨', '창동 $ 1관', TO_DATE('2024-01-28 20:04', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:05', 'YYYY-MM-DD HH24:MI'), '노량: 죽음의 바다', '창동 $ 2관', TO_DATE('2024-01-28 19:47', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:15', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '창동 $ 3관', TO_DATE('2024-01-28 18:55', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:10', 'YYYY-MM-DD HH24:MI'), '시민덕희', '코엑스 $ 컴포트 3관', TO_DATE('2024-01-28 18:13', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:35', 'YYYY-MM-DD HH24:MI'), '시민덕희', '코엑스 $ 컴포트 3관', TO_DATE('2024-01-28 20:38', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:00', 'YYYY-MM-DD HH24:MI'), '시민덕희', '코엑스 $ 컴포트 3관', TO_DATE('2024-01-28 23:03', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 23:25', 'YYYY-MM-DD HH24:MI'), '시민덕희', '코엑스 $ 컴포트 3관', TO_DATE('2024-01-28 01:28', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:45', 'YYYY-MM-DD HH24:MI'), '시민덕희', '코엑스 $ 컴포트 6관', TO_DATE('2024-01-28 19:48', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:10', 'YYYY-MM-DD HH24:MI'), '시민덕희', '코엑스 $ 컴포트 6관', TO_DATE('2024-01-28 22:13', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:35', 'YYYY-MM-DD HH24:MI'), '시민덕희', '코엑스 $ 컴포트 6관', TO_DATE('2024-01-28 00:38', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:20', 'YYYY-MM-DD HH24:MI'), '시민덕희', '코엑스 $ 더부티크 102호 스위트', TO_DATE('2024-01-28 18:23', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:00', 'YYYY-MM-DD HH24:MI'), '시민덕희', '코엑스 $ 더부티크 102호 스위트', TO_DATE('2024-01-28 21:03', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:30', 'YYYY-MM-DD HH24:MI'), '시민덕희', '코엑스 $ 더부티크 102호 스위트', TO_DATE('2024-01-28 23:33', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 00:00', 'YYYY-MM-DD HH24:MI'), '시민덕희', '코엑스 $ 더부티크 102호 스위트', TO_DATE('2024-01-28 02:03', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:15', 'YYYY-MM-DD HH24:MI'), '시민덕희', '코엑스 $ 더부티크 105호 스위트', TO_DATE('2024-01-28 20:18', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:50', 'YYYY-MM-DD HH24:MI'), '시민덕희', '코엑스 $ 더부티크 105호 스위트', TO_DATE('2024-01-28 22:53', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:00', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '코엑스 $ BMW 코오롱 모터스관(컴포트 5관)', TO_DATE('2024-01-28 19:12', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:35', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '코엑스 $ BMW 코오롱 모터스관(컴포트 5관)', TO_DATE('2024-01-28 21:47', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:10', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '코엑스 $ BMW 코오롱 모터스관(컴포트 5관)', TO_DATE('2024-01-28 00:22', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:40', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '코엑스 $ 자코모관(더부티크 스위트 101호)', TO_DATE('2024-01-28 19:52', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:20', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '코엑스 $ 자코모관(더부티크 스위트 101호)', TO_DATE('2024-01-28 22:32', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 23:00', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '코엑스 $ 자코모관(더부티크 스위트 101호)', TO_DATE('2024-01-28 01:12', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:55', 'YYYY-MM-DD HH24:MI'), '위시', '코엑스 $ 4관', TO_DATE('2024-01-28 19:39', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:50', 'YYYY-MM-DD HH24:MI'), '위시', '코엑스 $ 4관', TO_DATE('2024-01-28 00:34', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:00', 'YYYY-MM-DD HH24:MI'), '위시', '코엑스 $ 컴포트 11관', TO_DATE('2024-01-28 17:44', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 00:15', 'YYYY-MM-DD HH24:MI'), '위시', '코엑스 $ 더부티크 103호 스위트', TO_DATE('2024-01-28 01:59', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:20', 'YYYY-MM-DD HH24:MI'), '위시', '코엑스 $ 자코모관(더부티크 스위트 104호)', TO_DATE('2024-01-28 19:04', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:00', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '코엑스 $ 4관', TO_DATE('2024-01-28 22:31', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:30', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '코엑스 $ 자코모관(더부티크 스위트 104호)', TO_DATE('2024-01-28 22:01', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:30', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '코엑스 $ 자코모관(더부티크 스위트 104호)', TO_DATE('2024-01-28 01:01', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:30', 'YYYY-MM-DD HH24:MI'), '[F] 세기말의 사랑', '코엑스 $ 스크린A', TO_DATE('2024-01-28 19:36', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 23:15', 'YYYY-MM-DD HH24:MI'), '괴물', '코엑스 $ 컴포트 10관', TO_DATE('2024-01-28 01:31', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:10', 'YYYY-MM-DD HH24:MI'), '도그맨', '코엑스 $ 2관', TO_DATE('2024-01-28 20:14', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:35', 'YYYY-MM-DD HH24:MI'), '도그맨', '코엑스 $ 2관', TO_DATE('2024-01-28 22:39', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 23:00', 'YYYY-MM-DD HH24:MI'), '도그맨', '코엑스 $ 2관', TO_DATE('2024-01-28 01:04', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:30', 'YYYY-MM-DD HH24:MI'), '도그맨', '코엑스 $ 컴포트 8관', TO_DATE('2024-01-28 19:34', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:45', 'YYYY-MM-DD HH24:MI'), '도그맨', '코엑스 $ 더부티크 103호 스위트', TO_DATE('2024-01-28 18:49', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:15', 'YYYY-MM-DD HH24:MI'), '도그맨', '코엑스 $ 더부티크 103호 스위트', TO_DATE('2024-01-28 21:19', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:15', 'YYYY-MM-DD HH24:MI'), '더 퍼스트 슬램덩크', '코엑스 $ Dolby Cinema', TO_DATE('2024-01-28 23:30', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:05', 'YYYY-MM-DD HH24:MI'), '(DAY 2) 극장판 아이돌리쉬 세븐; LIVE 4bit BEYOND THE PERiOD', '코엑스 $ Dolby Cinema', TO_DATE('2024-01-28 20:49', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 23:40', 'YYYY-MM-DD HH24:MI'), '길위에 김대중', '코엑스 $ 컴포트 7관', TO_DATE('2024-01-28 01:55', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:55', 'YYYY-MM-DD HH24:MI'), '(DAY 1) 극장판 아이돌리쉬 세븐; LIVE 4bit BEYOND THE PERiOD', '코엑스 $ Dolby Cinema', TO_DATE('2024-01-28 18:38', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:55', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '코엑스 $ 컴포트 8관', TO_DATE('2024-01-28 21:35', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:55', 'YYYY-MM-DD HH24:MI'), '레트리뷰션', '코엑스 $ 컴포트 8관', TO_DATE('2024-01-28 23:35', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:45', 'YYYY-MM-DD HH24:MI'), '에반게리온 신극장판: 파', '코엑스 $ 컴포트 10관', TO_DATE('2024-01-28 20:47', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:10', 'YYYY-MM-DD HH24:MI'), '에반게리온 신극장판: Q', '코엑스 $ 컴포트 10관', TO_DATE('2024-01-28 22:55', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:35', 'YYYY-MM-DD HH24:MI'), '에반게리온 신극장판: 서', '코엑스 $ 컴포트 10관', TO_DATE('2024-01-28 18:25', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 23:55', 'YYYY-MM-DD HH24:MI'), '그대들은 어떻게 살 것인가', '코엑스 $ Dolby Cinema', TO_DATE('2024-01-28 02:08', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:20', 'YYYY-MM-DD HH24:MI'), '[F] 나의 올드 오크', '코엑스 $ 스크린B', TO_DATE('2024-01-28 18:23', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:20', 'YYYY-MM-DD HH24:MI'), '[네덜란드 국립 발레] 지젤', '코엑스 $ 컴포트 11관', TO_DATE('2024-01-28 22:30', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:55', 'YYYY-MM-DD HH24:MI'), '스즈메의 문단속: 다녀왔어', '코엑스 $ 컴포트 7관', TO_DATE('2024-01-28 21:06', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:05', 'YYYY-MM-DD HH24:MI'), '덤 머니', '코엑스 $ 컴포트 11관', TO_DATE('2024-01-28 20:00', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:50', 'YYYY-MM-DD HH24:MI'), '덤 머니', '코엑스 $ 컴포트 11관', TO_DATE('2024-01-28 00:45', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:50', 'YYYY-MM-DD HH24:MI'), '덤 머니', '코엑스 $ 더부티크 103호 스위트', TO_DATE('2024-01-28 23:45', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:50', 'YYYY-MM-DD HH24:MI'), '[F] 라이즈', '코엑스 $ 스크린B', TO_DATE('2024-01-28 23:45', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:00', 'YYYY-MM-DD HH24:MI'), '[F] 소녀는 졸업하지 않는다', '코엑스 $ 스크린A', TO_DATE('2024-01-28 22:10', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:25', 'YYYY-MM-DD HH24:MI'), '넥스트 골 윈즈', '코엑스 $ 컴포트 7관', TO_DATE('2024-01-28 23:19', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 23:55', 'YYYY-MM-DD HH24:MI'), '넥스트 골 윈즈', '코엑스 $ 컴포트 8관', TO_DATE('2024-01-28 01:49', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 23:20', 'YYYY-MM-DD HH24:MI'), '넥스트 골 윈즈', '코엑스 $ 더부티크 105호 스위트', TO_DATE('2024-01-28 01:14', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:15', 'YYYY-MM-DD HH24:MI'), '[F] 노 베어스', '코엑스 $ 스크린B', TO_DATE('2024-01-28 23:11', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 23:30', 'YYYY-MM-DD HH24:MI'), '[F] 사랑은 낙엽을 타고', '코엑스 $ 스크린B', TO_DATE('2024-01-28 01:00', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:30', 'YYYY-MM-DD HH24:MI'), '[F] 클럽 제로', '코엑스 $ 스크린A', TO_DATE('2024-01-28 00:30', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:40', 'YYYY-MM-DD HH24:MI'), '시민덕희', '홍대 $ 11층 4관', TO_DATE('2024-01-28 19:43', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:00', 'YYYY-MM-DD HH24:MI'), '시민덕희', '홍대 $ 11층 4관', TO_DATE('2024-01-28 22:03', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:20', 'YYYY-MM-DD HH24:MI'), '시민덕희', '홍대 $ 11층 4관', TO_DATE('2024-01-28 00:23', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:10', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '홍대 $ 9층 3관', TO_DATE('2024-01-28 23:22', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:05', 'YYYY-MM-DD HH24:MI'), '위시', '홍대 $ 9층 3관', TO_DATE('2024-01-28 20:49', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:25', 'YYYY-MM-DD HH24:MI'), '위시', '홍대 $ 11층 5관', TO_DATE('2024-01-28 00:09', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:30', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '홍대 $ 9층 2관', TO_DATE('2024-01-28 19:01', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:10', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '홍대 $ 박건욱관(7층 1관)', TO_DATE('2024-01-28 17:47', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:10', 'YYYY-MM-DD HH24:MI'), '엔드 오브 에반게리온', '홍대 $ 박건욱관(7층 1관)', TO_DATE('2024-01-28 21:47', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:20', 'YYYY-MM-DD HH24:MI'), '괴물', '홍대 $ 9층 2관', TO_DATE('2024-01-28 21:36', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:55', 'YYYY-MM-DD HH24:MI'), '도그맨', '홍대 $ 9층 2관', TO_DATE('2024-01-28 23:59', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:00', 'YYYY-MM-DD HH24:MI'), '도그맨', '홍대 $ 11층 5관', TO_DATE('2024-01-28 20:04', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:10', 'YYYY-MM-DD HH24:MI'), '신차원! 짱구는 못말려 더 무비 초능력 대결전 ~날아라 수제김밥~', '홍대 $ 박건욱관(7층 1관)', TO_DATE('2024-01-28 19:54', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 22:05', 'YYYY-MM-DD HH24:MI'), '신차원! 짱구는 못말려 더 무비 초능력 대결전 ~날아라 수제김밥~', '홍대 $ 박건욱관(7층 1관)', TO_DATE('2024-01-28 23:49', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:20', 'YYYY-MM-DD HH24:MI'), '신차원! 짱구는 못말려 더 무비 초능력 대결전 ~날아라 수제김밥~', '홍대 $ 박건욱관(7층 1관)', TO_DATE('2024-01-28 22:04', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:00', 'YYYY-MM-DD HH24:MI'), '에반게리온 신극장판: Q', '홍대 $ 9층 3관', TO_DATE('2024-01-28 18:45', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:00', 'YYYY-MM-DD HH24:MI'), '시민덕희', '화곡 $ 2관', TO_DATE('2024-01-28 20:03', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:50', 'YYYY-MM-DD HH24:MI'), '시민덕희', '화곡 $ 3관', TO_DATE('2024-01-28 18:53', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:10', 'YYYY-MM-DD HH24:MI'), '시민덕희', '화곡 $ 3관', TO_DATE('2024-01-28 21:13', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:30', 'YYYY-MM-DD HH24:MI'), '시민덕희', '화곡 $ 3관', TO_DATE('2024-01-28 23:33', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:55', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '화곡 $ 1관', TO_DATE('2024-01-28 19:07', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 19:25', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '화곡 $ 1관', TO_DATE('2024-01-28 21:37', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:55', 'YYYY-MM-DD HH24:MI'), '외계+인 2부', '화곡 $ 1관', TO_DATE('2024-01-28 00:07', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:15', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '화곡 $ 5관', TO_DATE('2024-01-28 20:46', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 21:05', 'YYYY-MM-DD HH24:MI'), '서울의 봄', '화곡 $ 5관', TO_DATE('2024-01-28 23:36', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 16:00', 'YYYY-MM-DD HH24:MI'), '도그맨', '화곡 $ 4관', TO_DATE('2024-01-28 18:04', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:40', 'YYYY-MM-DD HH24:MI'), '도그맨', '화곡 $ 4관', TO_DATE('2024-01-28 22:44', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:20', 'YYYY-MM-DD HH24:MI'), '스즈메의 문단속: 다녀왔어', '화곡 $ 2관', TO_DATE('2024-01-28 22:31', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:25', 'YYYY-MM-DD HH24:MI'), '덤 머니', '화곡 $ 4관', TO_DATE('2024-01-28 20:20', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:10', 'YYYY-MM-DD HH24:MI'), '괴물', 'ARTNINE $ 0관', TO_DATE('2024-01-28 22:16', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 17:00', 'YYYY-MM-DD HH24:MI'), '[에드워드 양 기획전] 하나 그리고 둘', 'ARTNINE $ 0관', TO_DATE('2024-01-28 19:53', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 20:20', 'YYYY-MM-DD HH24:MI'), '나의 올드 오크', 'ARTNINE $ 9관', TO_DATE('2024-01-28 22:13', 'YYYY-MM-DD HH24:MI'), '');
INSERT INTO TIME_TABLE VALUES(SEQ_TK_NO.NEXTVAL, TO_DATE('2024-01-28 18:00', 'YYYY-MM-DD HH24:MI'), '[에드워드 양 기획전] 타이페이 스토리', 'ARTNINE $ 9관', TO_DATE('2024-01-28 19:59', 'YYYY-MM-DD HH24:MI'), '');
