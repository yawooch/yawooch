SELECT 
       CINEMA.CINEMA_OPEN_DATE    /* 극장개점일*/
     , CINEMA.CINEMA_NAME         /* 극장지점명*/
     , CINEMA.CINEMA_AREA         /* 극장지역  */
     , CINEMA.CINEMA_ID           /* 극장아이디*/
  FROM CINEMA      ; /* 극장         */
SELECT 
       FAQ.FAQ_NO              /* 문의번호   */
     , FAQ.FAQ_TITLE           /* 문의제목   */
     , FAQ.MEMBER_ID           /* 멤버아이디 */
     , FAQ.FAQ_CONTENT         /* 문의내용   */
     , FAQ.FAQ_CATEGORY        /* 문의필드   */
  FROM FAQ         ; /* 자주묻는질문 */
SELECT 
       LIKE_EVAL.BOARD_NO            /* 게시물번호 */
     , LIKE_EVAL.MEMBER_ID           /* 멤버아이디 */
  FROM LIKE_EVAL   ; /* 좋아요평가   */
SELECT 
       MOVIE.MOVIE_NO            /* 영화번호         */
     , MOVIE.MV_KOR_NAME         /* 영화한글명       */
     , MOVIE.MV_CASTINGS         /* 출연진           */
     , MOVIE.MV_OPEN_DATE        /* 영화개봉일       */
     , MOVIE.MV_GRADE            /* 등급(시청연령)   */
     , MOVIE.MV_ENG_NAME         /* 영화영문명       */
     , MOVIE.MV_POSTER           /* 영화포스터이미지 */
     , MOVIE.MV_INTRO_CONT       /* 영화한줄소개     */
     , MOVIE.MV_TYPE             /* 영화타입         */
     , MOVIE.MV_DIRECTOR         /* 영화감독         */
     , MOVIE.MV_GENRE            /* 장르             */
  FROM MOVIE       ; /* 영화         */
SELECT 
       MOVIE_STEAL.MV_STEAL_NAME       /* 스틸컷이름 */
     , MOVIE_STEAL.MOVIE_NO            /* 영화번호   */
     , MOVIE_STEAL.MV_STEAL_NO         /* 스틸컷번호 */
     , MOVIE_STEAL.MV_STEAL_PATH       /* 스틸컷경로 */
  FROM MOVIE_STEAL ; /* 영화스틸컷   */
SELECT 
       MOVIE_VIDEO.VIDEO_THUMB         /* 동영상썸네일 */
     , MOVIE_VIDEO.VIDEO_TITLE         /* 동영상제목   */
     , MOVIE_VIDEO.MOVIE_NO            /* 영화번호     */
     , MOVIE_VIDEO.VIDEO_NO            /* 동영상번호   */
     , MOVIE_VIDEO.VIDEO_PATH          /* 동영상경로   */
  FROM MOVIE_VIDEO ; /* 영화동영상   */
SELECT 
       NOTICE.NOTICE_CONTENT      /* 공지내용   */
     , NOTICE.NOTICE_TITLE        /* 공지제목   */
     , NOTICE.NOTICE_NO           /* 공지번호   */
     , NOTICE.CINEMA_ID           /* 극장아이디 */
     , NOTICE.NOTICE_REG_DATE     /* 공지등록일 */
     , NOTICE.NOTICE_TYPE         /* 공지구분   */
  FROM NOTICE      ; /* 공지사항     */
SELECT 
       QUESTION.QUEST_DIVISION      /* 문의구분(분실물 / 일대일 / 대관)  */
     , QUESTION.QUEST_EMAIL         /* 분실물문의용컬럼                  */
     , QUESTION.QUEST_TYPE          /* 일대일문의용컬럼                  */
     , QUESTION.QUEST_NAME          /* 이름                              */
     , QUESTION.QUEST_PHONE         /* 휴대전화번호                      */
     , QUESTION.QUEST_PASS_NO       /* 문의글비밀번호                    */
     , QUESTION.QUEST_CONTENT       /* 문의내용                          */
     , QUESTION.QUEST_TITLE         /* 문의제목                          */
     , QUESTION.QUEST_NO            /* 문의번호                          */
     , QUESTION.PICTR_FILE          /* 일대일문의용컬럼                  */
     , QUESTION.ANSW_MEMBER_ID      /* 답변아이디                        */
     , QUESTION.ANSW_REG_DTTM       /* 답변등록일시                      */
     , QUESTION.ANSW_CONTENT        /* 답변내용                          */
     , QUESTION.CINEMA_ID           /* 극장아이디                        */
     , QUESTION.LOST_CINEMA_ID      /* 극장아이디                        */
     , QUESTION.VISIT_NUM           /* 대관문의용컬럼                    */
     , QUESTION.RENTAL_DATE         /* 대관일(대관문의용컬럼)            */
     , QUESTION.RENTAL_TIME         /* 대관시간(대관문의용)              */
     , QUESTION.MEMBER_ID           /* 등록아이디                        */
  FROM QUESTION    ; /* 문의         */
SELECT 
       TIME_TABLE.SCRN_NO             /* 상영시간표번호      */
     , TIME_TABLE.SCRN_END_DTTM       /* 상영종료일시        */
     , TIME_TABLE.THEATER_NO          /* 상영관번호          */
     , TIME_TABLE.MOVIE_NO            /* 영화번호            */
     , TIME_TABLE.SCRN_STR_DTTM       /* 상영시작일시        */
     , TIME_TABLE.DISCOUNT_DV         /* 할인구분(조조/심야) */
  FROM TIME_TABLE  ; /* 상영시간표   */
