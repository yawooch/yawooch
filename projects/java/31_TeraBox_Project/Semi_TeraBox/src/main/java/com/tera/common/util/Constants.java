package com.tera.common.util;
import java.text.DecimalFormat;
import java.util.regex.Pattern;

/**
 * <PRE>
 *  상수정의
 *  KSC5601
 *  한글 완성형 표준(한글 2,350자 표현)
 *  한국공업표준 정보처리분야(C)의 5601번 표준안
 *
 *  KSC5636
 *  영문자에 대한 표준
 *  한국공업표준 정보처리분야(C)의 5636번 표준안
 *  기존 ASCII Code에서 역슬래쉬(\)를 원(\) 표시로 대체
 *
 *  EUC-KR
 *  Bell Laboratories에서 유닉스 상에서 영문자 이외의 문자를 지원하기 위해 제안한 확장 유닉스 코드(Extend UNIX Code)중 한글 인코딩 방식
 *  영문은 KSC5636로 처리하고 한글은 KSC5601로 처리
 *
 *  EUC-KR = KSC5601 + KSC5636
 *  // 현재 시스템의 프로퍼티는 아래와 같이 가져옴
 *  SYSTEM_PROPERTIES      = System.getProperties();
 *
 *  ASCII 시스템에서는 새줄 문자로
 *  라인 피드(line feed, LF, '\n', 0x0A),
 *  캐리지 리턴(carriage return, CR, '\r', 0x0D)이 주로 사용된다.
 *  라인 피드는 프린터에서 종이가 한 줄씩 인쇄되며 나오는 것을 뜻한다.
 *  캐리지 리턴은 프린터에서 실제 인쇄를 수행하는 장치가 한 줄의 끝에서 시작 위치로 돌아가는 것을 뜻한다.
 *  새줄 문자로 드물게 RS(record separator, 0x1E)를 쓰는 시스템도 있었다.
 *  ─━│┃┌┍┎┏┐┑┒┓└┕┖┗┘┙┚┛├┝┞┟┠┡┢┣┤┥┦┧┨┩┪┫┬┭┮┯┰┱┲┳┴┵┶┷┸┹┺┻┼┽┾┿╀╁╂╃╄╅╆╇╈╉╊╋
 *  LF    "\n"    멀틱스, 유닉스, 리눅스, 제닉스, AIX, OS X, FreeBSD
 *  CR+LF "\r\n"  DEC TOPS-10, RT-11, CP/M, MP/M, 도스, OS/2, 윈도, 심비안 OS, 팜 OS
 *  CR    "\r"    코모도어 8비트 머신, TRS-80, 애플 II, 맥 OS (버전 9 이하), OS-9
 *  RS  POSIX 이전의 QNX
 * </PRE>
 */
public class Constants
{
    private Constants()
    {
        throw new IllegalStateException("Utility class");
    }
    public static final char[]   NOT_ZORO_NUMBERS      = { '1', '2', '3', '4', '5', '6', '7', '8', '9' };
    public static final char[]   NUMBERS               = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
    public static final char[]   SPECIAL_CAHR          = { '~', '`', '!', '@', '#', '$', '%', '^', '&', '(', ')', '=', '-', '+', '{', '}', '[', ']', ';', '_' };
    public static final char[]   UPER_CHARS            = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
    public static final char[]   LOWER_CHARS           = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };
    public static final char[]   CHARS                 = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
    public static final char[]   DIGITS                = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
    public static final String[] TABLE_STRING          = { "┏", "┳", "┓", "┃", "┣", "┫", "╋", "┖", "┸", "┚", "-"}; // "?", "?", "?", "?", "?", "?", "?", "?", "?", "?", "?" // "+", "+", "+", "|", "+", "+", "+", "+", "+", "+", "-"
    public static final String[] WORDS_OF_REX          = { ".", "*", "+", "?", "|", "(", ")", "[", "]", "{", "}", "\\" };
    public static final String[] CICLE_CHARS           = { "①","②","③","④","⑤","⑥","⑦","⑧","⑨","⑩","⑪","⑫","⑬","⑭","⑮","?","?","?","?","?","ⓐ","ⓑ","ⓒ","ⓓ","ⓔ","ⓕ","ⓖ","ⓗ","ⓘ","ⓙ","ⓚ","ⓛ","ⓜ","ⓝ","ⓞ","ⓟ","ⓠ","ⓡ","ⓢ","ⓣ","ⓤ","ⓥ","ⓦ","ⓧ","ⓨ","ⓩ"};
    public static final String   WORKSPACE_DIR         = "C:\\eclipse-jee-mars-1-win32-x86_64\\workspace\\";
    public static final String   BUSINESS_DIR          = "H:\\work\\업무\\";
    public static final String   FILE_ENCODING         = System.getProperty("file.encoding");
    public static final String   TAB_SPACE             = "    ";
    public static final String   SPACE                 = " ";
    public static final String   NEW_LINE              = "\n";
    public static final String   DELIMITER             = "\r\n";
    public static final String   NULL_STR              = "null";
    public static final String   SIDE_CHAR             = Character.toString((char) 127);
    public static final String   UTF8_BOM              = "\uFEFF";
    public static final String   REX_COLUMN            = "[a-zA-Z0-9_]+"; // CP_D_OD_PGS, USE_YN 등 컬럼명
    public static final String   REX_PARAM             = "[#@](?:\\s+)?\\{(?:\\s+)?(@?[a-zA-Z0-9_ ]+)(?:\\s+)?\\}"; //#{ARG_INP}, @{ARG_INP}, #{@ARG_INP} 이런형태의 문자 # input param @ PROCEDURE등에서 output param
    public static final String   REX_DYNAMIC           =  "\\$(?:\\s+)?\\{(?:\\s+)?(@?[a-zA-Z0-9_ ]+)(?:\\s+)?\\}"; //${DYN_PRM}, ${@DYN_PRM} 이런형태의 문자
    public static final String   REX_NEW_LINE          = "\r\n|\r|\n";
    public static final String   REX_TAB               = "\t";
    public static final String   REX_ONEMORE_SPACE     = "\\s+";
    public static final String   REX_END_SPACE         = "\\s*$";
    public static final String   REX_END_LINE          = "\\s*(?=\n)";
    public static final String   REX_JAVA_COMMENT      = "//[^\r\n]*";
    public static final String   REX_SQL_COMMENT       = "[^']--[^+][^\r\n]*"; // --+ 는 제외함 oracle에서는 힌트임 '-- 도제외함 정규식의 시작
    public static final String   REX_MULTILINE_COMMENT = "(?:/\\*(?:[^*]|(?:\\*+[^*/]))*\\*+/)|(?://.*)";
    public static final String   REX_NOT_CHAR          = "[^A-Za-z0-9\uAC00-\uD7A3]";
    public static final String   REX_CHAR              = "[A-Za-z0-9\uAC00-\uD7A3]";
    public static final String   REX_2BYTE_CHAR        = "[\u1100-\uFFE6]";
    public static final String   REX_DB_OBJECT         = "[a-zA-Z0-9\uAC00-\uD7A3_]+";
    public static final String   REX_HTML_LINK_TAG     = "(?i)<a([^>]+)>(.+?)</a>";
    public static final String   REX_HTML_TAG          = "(?i)<\\s*\\w+[^>]*>(.*?)<\\s*/\\s*\\w+>"; //대소문자안가리고
    public static final String   REX_PHONE_NO          = "(([(]?(\\d{2,4})[)]?)|(\\d{2,4})|([+1-9]+\\d{1,2}))?[-\\s]?(\\d{2,3})?[-\\s]?((\\d{7,8})|(\\d{3,4}[-\\s]\\d{3,4}))";
    public static final String   REX_HTML_HREF         = "\\s*(?i)href\\s*=\\s*(\"([^\"]*\")|'[^']*'|([^'\">\\s]+))"; // \\s* 공백이 1개이상, (?i)href 대소문자안가리고href
    public static final String   REX_TAG_WITH_ATTR     = "<\\w+\\s([^>]*\\w+=\"([^\"]*\")|'[^']*'|([^'\">\\s]+))[^>]*>"; // 태그중 속성이 있는것만
    public static final String   REX_EMAIL             = "[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})";
    public static final String   REX_HTML_IMG          = "(<img(?:\\s+\\p{Alnum}*=[^>]*)*\\s*src[\\s=\"']*)([\\p{Alnum}]+://[\\p{Alnum}_.\\-%&=?!:;@\\/\uAC00-\uD7A3]*)";
    public static final String   REX_LINE              = "(?m)^.*$"; // By default, ^ and $ match the start- and end-of-input respectively. You'll need to enable MULTI-LINE mode with (?m), which causes ^ and $ to match the start- and end-of-line
    public static final String   REX_PEM               = "-+BEGIN\\s+.*[^-]*-+(?:\\s|\\r|\\n)+([a-z0-9+/=\\r\\n]+)-+END\\s+.*[^-]*-+"; // Rsa Pem 포맷
    public static final String   REX_FILE_FORBIDDEN    = "[\\\\/:*?\"<>|]"; // 파일명으로쓸수없는문자
    public static final String   EMPTY                 = "";
    public static final String   PIPE                  = "|";
    public static final String   GREATER               = ">";
    public static final String   LESS                  = "<";
    public static final String   EURO_SIGN             = String.valueOf('\u20ac');
    public static final String   COLUMN_DELIMITER      = "_"; // 컬럼의 단어의 구분자 기본으로 _이다
    public static final String   UTF_8                 = "UTF-8";
    public static final String   EUC_KR                = "EUC-KR";
    public static final String   ISO_8859_1            = "ISO-8859-1";
    public static final String   X_WINDOWS_949         = "X-WINDOWS-949";
    public static final String   MS949                 = "MS949";
    public static final String   KSC5601               = "KSC5601";
    public static final String   ROW_STR_NUM           = "ROW_STR_NUM"; //페이징쿼리의 시작 컬럼 > 보다크다.
    public static final String   ROW_END_NUM           = "ROW_END_NUM"; //페이징쿼리의 종료 컬럼 <= 작거나같다
    public static final String   ERR_MSG               = "ERR_MSG"    ; //에러메시지
    public static final String   ERR_TYPE              = "ERR_TYPE"   ; //에러타입을 정의한다.
    public static final String   SUCC_YN               = "SUCC_YN"    ; //성공여부
    public static final String   TOT_CNT               = "TOT_CNT"    ; //페이징 쿼리등에서 총 게시물수 키값
    public static final String   STRM_OUT_YN           = "STRM_OUT_YN"; //스트림출력여부
    public static final Pattern  PATTERN_HTML_IMG      = Pattern.compile(REX_HTML_IMG ,     Pattern.CASE_INSENSITIVE);
    public static final Pattern  PATTERN_HTML_HREF     = Pattern.compile(REX_HTML_HREF,     Pattern.CASE_INSENSITIVE);
    public static final Pattern  PATTERN_HTML_LINK_TAG = Pattern.compile(REX_HTML_LINK_TAG, Pattern.CASE_INSENSITIVE);
    public static final Pattern  PATTERN_PHONE_NO      = Pattern.compile(REX_PHONE_NO,      Pattern.CASE_INSENSITIVE);
    public static final Pattern  PATTERN_EMAIL         = Pattern.compile(REX_EMAIL,         Pattern.CASE_INSENSITIVE);
    public static final Pattern  PATTERN_LINE          = Pattern.compile(REX_LINE,          Pattern.MULTILINE       );
    public static final int      MAX_ORACL_OBJECT_NAME = 30;
    public static final int      KILO                  = 1024;
    public static final int      MEGA                  = KILO * 1024;
    public static final int      GIGA                  = MEGA * 1024;
    public static final long     TERA                  = GIGA * 1024l;
    public static final int      SEC                   = 1000;
    public static final int      MIN                   = SEC  * 60 ;
    public static final int      HOUR                  = MIN  * 60 ;
    public static final int      DAY                   = HOUR * 24 ;
    public static final long     YEAR                  = DAY  * 365l;
    public static final int      XLSX_MAX_ROW          = (int) Math.pow(2D, 20D);
    public static final int      LOG_LENGTH            = 120;
    public static final int      LOG_STRING_SIZE       = 80; // 로그를 남길때 기본 컬럼열 수
    public static final DecimalFormat MONEY_FORMAT     = new DecimalFormat("#,###.###"); // 소수점6자리까지 유효하게함

    public static int BUFFER_SIZE     = KILO * 64;//버퍼크기 64kb 보다크고 10MB보다 작아야함

    /*--------------------------------------------------------------------------------------------------------------
     * 아래와 같은 패턴
     * AND A.PROD_CD = COALESCE(#{PROD_CD}, A.PROD_CD)
     * AND B.PSIC_NM LIKE COALESCE('%' + #{SEARCH_PSIC_NM} + '%', B.PSIC_NM) // LIKE 패턴추가함
        -- Java 에서는 \ 를  \\ 로 변견하면됨
        (?i)                       -> 대소문자 안가림
        (and|where)                -> and 나 where 절만해당
        (?:\\s+)?                  -> 공백이 1개이상 있거나 없거나
        (([a-z]+\.)?[a-zA-Z0-9_]+) -> 컬럼명 A.PROD_CD
        ?:                         -> 변수 담지 않기

        [#@](?:\\s+)?\\{(?:\\s+)?([a-zA-Z0-9_ ]+)(?:\\s+)?\\}     -> 정적변수명

        1. 대소문자 구분없이 and 로 시작해서
        2. 공백이 1개이상있으며
        3. 컬럼명이 있고
        4. LIKE 나 = 문자 주위로 공백이 있거나 없고
        5. COALESCE(#{SEARCH_RTM_HSPT_CD} 나 COALESCE('%' + #{SEARCH_PSIC_NM} + '%' 와 같은패턴
        6. , 주위로 공백이 있거나 없고
        7. 컬럼명이 있고
        8. ) 로 끝나는 패턴
     *------------------------------------------------------------------------------------------------------------*/
    public static final String   REX_DYNAMIC_PARAM     = "(?i)(and|where)\\s+((?:[a-z]+\\.)?[a-zA-Z0-9_]+)(?:\\s+)?(LIKE|=)(?:\\s+)?(?i)(?:COALESCE|NVL)(?:\\s+)?\\((?:\\s+)?((?:\\s+)?(?:'%'(?:\\s+)?(?:\\+|\\|\\|)(?:\\s+)?#|#|@)(?:\\s+)?\\{([a-zA-Z0-9_ ]+)(?:\\s+)?\\}(?:(?:\\s+)?(?:\\+|\\|\\|)(?:\\s+)?'%')?)(?:\\s+)?,(?:\\s+)?(([a-z]+\\.)?[a-zA-Z0-9_]+)(?:\\s+)?\\)";

    /*--------------------------------------------------------------------------------------------------------------
     * 웹프로젝트 참조 정보 DB인수로 역확은 못함
     *----------------------------------------------------------------------------------------------------------------*/
    public static final String CONTENT_TYPE  = "@CONTENT_TYPE";
    public static final String REQUEST_URI   = "@REQUEST_URI";  //호출경로
    public static final String USER_AGENT    = "@USER_AGENT";
    public static final String REFERER       = "@REFERER";
    public static final String CURRENT_DATE  = "@CURRENT_DATE";
    public static final String REMOTE_HOST   = "@REMOTE_HOST";
    public static final String UPLOAD_FILES  = "@UPLOAD_FILES";
    public static final String UPLOAD_PATH   = "@UPLOAD_PATH";
    public static final String BASE64_IMAGES = "@BASE64_IMAGES";

    /*--------------------------------------------------------------------------------------------------------------
     * 웹프로젝트 환경변수
     *----------------------------------------------------------------------------------------------------------------*/
    public static final String   MULTI_FORM_DATA       = "multipart/form-data";
    public static final String   BIZ_TASK_ID           = "BIZ_TASK_ID"        ; // 비즈타스크아이디
    public static final String   DATA_REG_ID           = "DATA_REG_ID"        ; // 데이터등록아이디
    public static final String   DATA_MDF_ID           = "DATA_MDF_ID"        ; // 데이터수정아이디
    public static final String   DATA_REG_DTTM         = "DATA_REG_DTTM"      ; // 데이터등록일시
    public static final String   DATA_MDF_DTTM         = "DATA_MDF_DTTM"      ; // 데이터수정일시
    public static final String   ERR_STACK_TRACE       = "ERR_STACK_TRACE"    ; // 에러스택
    public static final String   DELETE_FILE_YN        = "DELETE_FILE_YN"     ; // 파일삭제여부
    public static final String   FILE_NAME             = "FILE_NAME"          ; // 파일이름
    public static final String   FILE_PATH             = "FILE_PATH"          ; // 파일패스
    public static final String   ENC_FILE_NAME         = "ENC_FILE_NAME"      ; // 암호화된파일이름
    public static final String   ENC_                  = "ENC_"               ; // 암호화된파일접두사
    public static final String   ORI_FILE_NAME         = "ORI_FILE_NAME"      ; // 원본파일이름
    public static final String   USE_YN                = "USE_YN"             ; // 사용여부
    public static final String   SMGR_YN               = "SMGR_YN"            ; // 시스템관리자여부
    public static final String   MNGR_YN               = "MNGR_YN"            ; // 관리자여부
    public static final String   USER_ID               = "USER_ID"            ; // 사용자아이디
    public static final String   USER_PW               = "USER_PW"            ; // 사용자패스워드
    public static final String   USER_NM               = "USER_NM"            ; // 사용자명
    public static final String   USER_INFO             = "USER_INFO"          ; // 사용자정보
    public static final String   LOGIN_TIME            = "LOGIN_TIME"         ; // 로그인시간 System.currentTimeMillis()
    public static final String   MENU_ROLE             = "MENU_ROLE"          ; // 메뉴롤
    public static final String   MENU_GR_ID            = "MENU_GR_ID"         ; // 메뉴그룹아이디

    /*--------------------------------------------------------------------------------------------------------------
     * 트랜젝션Audit 관련 보통 SID는 16자리를 사용한다.
     *----------------------------------------------------------------------------------------------------------------*/
    public static final String   TRANSACTION_SID       = "TRANSACTION_SID";// 트랜젝션시드값
    public static final String   TRANSACTION_ID        = "TRANSACTION_ID"; // 트랜젝션아이디
}
