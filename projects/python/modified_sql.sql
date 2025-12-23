2025-02-27 01:11:12 DEBUG [org.sdream.comm.service.impl.TraceServiceImpl] [saveLog] TraceDTO [seq=null
     , connDtTm=null
     , sessId=BA56432068070106FE766BFCD8F45124
     , hostNm=localhost
     , pathNm=test
     , pageNm=/m/drmFstMy19/L215
     , param=[dbwls176];
--------------------------------------------------
{
PROG_GRP_CD=[PGC084]}
     , fullUrl=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36
     , rfrr=http://localhost:8080/m/ann21l/L0
     , connIp=0:0:0:0:0:0:0:1
     , mdfDtTm=null]2025-02-27 01:11:12  INFO [jdbc.sqltiming] 
/* customInsertTrace  */
INSERT INTO TRACE ( SESS_ID 
     , CONN_DT_TM 
     , HOST_NM 
     , PATH_NM 
     , PAGE_NM 
     , PARAM 
     , FULL_URL 
     , RFRR 
     , CONN_IP 
     , MDF_DT_TM ) VALUES ( IFNULL('BA56432068070106FE766BFCD8F45124'
     , '') 
     , NOW() 
     , 'localhost' 
     , 'test' 
     , '/m/drmFstMy19/L215' 
     , '[dbwls176];
--------------------------------------------------
{
PROG_GRP_CD=[PGC084]}' 
     , 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36' 
     , 'http://localhost:8080/m/ann21l/L0' 
     , '0:0:0:0:0:0:0:1' 
     , NOW() );
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:11:12  INFO [jdbc.sqltiming] 
/* selectPageAuth2List  */
SELECT PAGE_URI 
     , MENU_EXP_CD 
     , FUNC_EXPL 
     , USED_DT_TM 
     , DEL_YN 
     , MDF_PRS_SID 
     , MDF_DT_TM
  FROM PAGE_AUTH_2
 WHERE 1=1
   AND PAGE_URI = '/m/drmFstMy19/L215'
   AND DEL_YN = 'N';
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:11:12  INFO [jdbc.sqltiming] /* selectMtBizReqMbrInfByMypage - BIZ_REQ_MBR_INF테이블 마이페이지 선정자 확인 */SELECT B.BIZ_YR AS bizYr
     , B.BIZ_ID AS bizId
     , B.BIZ_TYPE_ID AS bizTypeId
     , B.PROD AS prod
     , S.SCHL_NM AS schlNm
     , M.MBR_ID AS mbrId
     , M.BIRTH AS birth
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , BRMI.REQ_NO AS reqNo
     , BRMI.MBR_SID AS mbrSid
     , BRMI.MBR_DIV AS mbrDiv
     , BRMI.LOG_SEQ AS logSeq
     , DEC2(BRMI.NM) AS nm
     , DEC2(BRMI.PHN_NO) AS phnNo
     , DEC2(BRMI.MOPHN_NO) AS mophnNo
     , BRMI.SCHL_SID AS schlSid
     , BRMI.GRADE AS grade
     , BRMI.FML_REL_CD AS fmlRelCd
     , BRMI.BANK AS bank
     , DEC2(BRMI.ACCNT) AS accnt
     , BRMI.REG_PRS_SID AS regPrsSid
     , BRMI.REG_DT_TM AS regDtTm
     , BRMI.REG_PRS_IP AS regPrsIp
     , BRMI.MDF_PRS_SID AS mdfPrsSid
     , BRMI.MDF_DT_TM AS mdfDtTm
     , BRMI.DEL_YN AS delYn
     , BRMI.CHK_YN AS chkYn
     , BRMI.CHK_DT_TM AS chkDtTm
     , BRMI.MBR_MOD_DT_TM AS mbrModDtTm
     , BRMI.PROG_SVY_1_DT_TM AS progSvy1DtTm
     , BRMI.PROG_SVY_2_DT_TM AS progSvy2DtTm
     , DEC2(BRMI.UGT_CTT) AS ugtCtt
  FROM BIZ_REQ_MBR_INF BRMI
 INNER JOIN
       BIZ_REQ BR
    ON BRMI.REQ_NO = BR.REQ_NO
   AND BR.DEL_YN = 'N'
 INNER JOIN
       BIZ B
    ON BR.BIZ_ID = B.BIZ_ID
   AND B.DEL_YN = 'N' LEFT JOIN SCHL S
    ON BRMI.SCHL_SID = S.SCHL_SID LEFT JOIN MBR M
    ON BRMI.MBR_SID = M.MBR_SID
 WHERE B.BIZ_STAT_CD = 'BSC050' /* 사업상태-진행중 */
   AND BRMI.MBR_DIV = 'RRC010' /* 멘토
     , 멘티 */
   AND BRMI.MBR_SID = 'MBR2411794' 
/* SID 
 */
   AND B.BIZ_TYPE_ID IN ('MT01'
     , 'MT02') 
/* 사업그룹  */
   AND BR.BIZ_REQ_STAT_CD = 'BRS020' /* 멘토 - 선정 */;
--------------------------------------------------
{
executed in 12 msec}2025-02-27 01:11:12  INFO [jdbc.sqltiming] /* selectMtProgByMypage - PROG테이블 마이페이지 조회 */SELECT P.PROG_SID AS progSid
     , P.PROG_GRP_CD AS progGrpCd
     , P.PROG_YR AS progYr
     , P.PROG_DIV_NM AS progDivNm
     , P.PROG_PROD AS progProd
     , P.ALIG_NUM AS aligNum
     , P.PROG_NM AS progNm
     , P.ATT_PRD_CTN AS attPrdCtn
     , P.DT_TM_CTN AS dtTmCtn
     , P.LOC_CTN AS locCtn
     , P.DTL_CTN AS dtlCtn
     , P.HDCNT AS hdcnt
     , P.WTNG_CNT AS wtngCnt
     , P.EXP_YN AS expYn
     , P.OPEN_YN AS openYn
     , P.REG_DIV AS regDiv
     , P.GDCC_EXP_YN AS gdccExpYn
     , P.MDF_YN AS mdfYn
     , P.FILE_SID AS fileSid
     , P.ST_TIME AS stTime
     , P.END_TIME AS endTime
     , P.REG_PRS_SID AS regPrsSid
     , P.REG_DT_TM AS regDtTm
     , P.REG_PRS_IP AS regPrsIp
     , P.MDF_PRS_SID AS mdfPrsSid
     , P.MDF_DT_TM AS mdfDtTm
     , P.DIV_CD_1 AS divCd1
     , P.UNV_PROG_ADM_YN AS unvProgAdmYn
     , P.PROG_STAT_CD AS progStatCd
  FROM PROG P
 WHERE P.PROG_GRP_CD = 'PGC084'
   AND P.PROG_YR = '2025';
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:11:12  INFO [jdbc.sqltiming] /* selectMtProgReqByMypage - PROG_REQ테이블 마이페이지 프로그램 신청확인 */SELECT P.PROG_PROD AS progProd
     , P.PROG_NM AS progNm
     , P.DT_TM_CTN AS dtTmCtn
     , PRAF.ATT_FILE_SID AS attFileSid
     , SUBSTRING_INDEX(DEC2(PR.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(PR.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , GETCDNM(PR.REQ_STAT_CD) AS reqStatCdNm
     , PR.PROG_REQ_SID AS progReqSid
     , PR.PROG_SID AS progSid
     , DEC2(PR.REQ_PRS_NM) AS reqPrsNm
     , PR.BIRTH AS birth
     , PR.GRADE AS grade
     , PR.AFL AS afl
     , PR.POS AS pos
     , DEC2(PR.PHN_NO) AS phnNo
     , DEC2(PR.EMAIL) AS email
     , PR.PO_YN AS poYn
     , PR.POST_NO AS postNo
     , PR.NUM_ADDR AS numAddr
     , PR.ROAD_ADDR AS roadAddr
     , PR.DTL_ADDR AS dtlAddr
     , PR.REQ_YN AS reqYn
     , PR.STD_REQ_YN AS stdReqYn
     , PR.SEX_CD AS sexCd
     , PR.ATTD_YN AS attdYn
     , PR.COMPL_YN AS complYn
     , PR.REQ_CTN_1 AS reqCtn1
     , PR.REQ_CTN_2 AS reqCtn2
     , PR.DIV_CD_1 AS divCd1
     , PR.DIV_CD_2 AS divCd2
     , PR.BIZ_REQ_SEQ AS bizReqSeq
     , PR.BUT_BIZ_TYPE_CD AS butBizTypeCd
     , PR.BUT_BIZ_DTL_PART_CD AS butBizDtlPartCd
     , PR.REQ_STAT_NUM AS reqStatNum
     , PR.REQ_STAT_CD AS reqStatCd
     , PR.ETC_NUM_NM AS etcNumNm
     , PR.REG_PRS_SID AS regPrsSid
     , PR.REG_DT_TM AS regDtTm
     , PR.REG_PRS_IP AS regPrsIp
     , PR.MDF_PRS_SID AS mdfPrsSid
     , PR.MDF_DT_TM AS mdfDtTm
     , PR.CNCL_YN AS cnclYn
     , PR.RSDN_TYPE_CD AS rsdnTypeCd
     , PR.RAT_DIV AS ratDiv
     , PR.RST_CTN AS rstCtn
     , DEC2(PR.MOPHN_NO) AS mophnNo
     , DEC2(PR.IHIDNUM) AS ihidnum
     , PR.PRD AS prd
     , PR.MAJ AS maj
     , PR.SCRE_DIV_NM_1 AS screDivNm1
     , PR.SCRE_CRD_1 AS screCrd1
     , PR.SCRE_MAX_SCR_1 AS screMaxScr1
     , PR.SCRE_DIV_NM_2 AS screDivNm2
     , PR.SCRE_CRD_2 AS screCrd2
     , PR.SCRE_MAX_SCR_2 AS screMaxScr2
     , PR.REQ_CTN_3 AS reqCtn3
     , PR.YR AS yr
     , PR.REQ_NO AS reqNo
     , PR.RD10_REQ_NO AS rd10ReqNo
     , DEC2(PR.BANK_NM) AS bankNm
     , DEC2(PR.ACCNT_NO) AS accntNo
     , DEC2(PR.DEP_OWN) AS depOwn
     , PR.BANK_DIV AS bankDiv
     , PR.BANK_CD AS bankCd
     , PR.BANK_ADDR AS bankAddr
     , PR.EVAL_CMN_SID_1 AS evalCmnSid1
     , PR.EVAL_1_A AS eval1A
     , PR.EVAL_1_B AS eval1B
     , PR.EVAL_1_C AS eval1C
     , PR.EVAL_SCR_1 AS evalScr1
     , PR.EVAL_CTN_1 AS evalCtn1
     , PR.EVAL_CMN_SID_2 AS evalCmnSid2
     , PR.EVAL_2_A AS eval2A
     , PR.EVAL_2_B AS eval2B
     , PR.EVAL_2_C AS eval2C
     , PR.EVAL_SCR_2 AS evalScr2
     , PR.EVAL_CTN_2 AS evalCtn2
     , PR.NAT AS nat
     , PR.REQ_CTN_7 AS reqCtn7
     , PR.REQ_CTN_6 AS reqCtn6
     , PR.REQ_CTN_5 AS reqCtn5
     , PR.REQ_CTN_4 AS reqCtn4
     , PR.REQ_PRS_SID AS reqPrsSid
     , PR.CALC_YN AS calcYn
     , (SELECT PROG_YR
  FROM PROG P
 WHERE PROG_SID = PR.PROG_SID ) AS progYr
  FROM PROG_REQ PR
 INNER JOIN
       PROG P
    ON PR.PROG_SID = P.PROG_SID LEFT JOIN PROG_REQ_ATT_FILE PRAF
    ON PRAF.PROG_REQ_SID = PR.PROG_REQ_SID
 WHERE P.PROG_GRP_CD = 'PGC084'
   AND P.PROG_YR = '2025'
   AND PR.REG_PRS_SID = 'MBR2411794';
--------------------------------------------------
{
executed in 12 msec}2025-02-27 01:11:12  INFO [jdbc.sqltiming] /* selectMtProgMentoClubAplByPk - PROG_MENTO_CLUB_APL테이블 PK로 조회 */SELECT GETCDNM(PMCA.BANK_CD) AS bankCdNm
     , IFNULL(FORMAT(PMCA.REQ_AOM
     , 0)
     , 0) AS reqAomCom
     , IFNULL(FORMAT(PMCA.SAM_AOM
     , 0)
     , 0) AS samAomCom
     , (SELECT FILE_NM
  FROM FILE_MGT FM
 WHERE FM.FILE_SID = PMCA.PO_FILE_SID
   AND FM.DEL_YN = 'N') AS poFileNm
     , PMCA.PROG_REQ_SID AS progReqSid
     , PMCA.AFL_SCHL_SID AS aflSchlSid
     , DEC2(PMCA.MOPHN_NO) AS mophnNo
     , PMCA.ACTV_SUB_CTN AS actvSubCtn
     , PMCA.ACTV_ST_DT AS actvStDt
     , PMCA.ACTV_END_DT AS actvEndDt
     , PMCA.MENTO_ACTV_HDCNT AS mentoActvHdcnt
     , PMCA.TCH_ACTV_HDCNT AS tchActvHdcnt
     , PMCA.EXPT_EFCT_CTN AS exptEfctCtn
     , DEC2(PMCA.DEP_OWN) AS depOwn
     , DEC2(PMCA.ACCNT_NO) AS accntNo
     , PMCA.BANK_CD AS bankCd
     , PMCA.PO_FILE_SID AS poFileSid
     , PMCA.SELT_YN AS seltYn
     , PMCA.REQ_AOM AS reqAom
     , PMCA.SAM_AOM AS samAom
     , PMCA.GDCC_CTN AS gdccCtn
     , PMCA.DEL_YN AS delYn
     , PMCA.REG_PRS_SID AS regPrsSid
     , PMCA.REG_DT_TM AS regDtTm
     , PMCA.MDF_PRS_SID AS mdfPrsSid
     , PMCA.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_APL PMCA
 WHERE PMCA.DEL_YN = 'N'
   AND PMCA.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:11:12  INFO [jdbc.sqltiming] /* selectMtProgMentoClubVrfByPk - PROG_MENTO_CLUB_VRF테이블 PK로 조회 */SELECT PMCV.PROG_REQ_SID AS progReqSid
     , PMCV.DOC_CMN_1_SID AS docCmn1Sid
     , PMCV.DOC_CMN_2_SID AS docCmn2Sid
     , PMCV.INV_CMN_1_SID AS invCmn1Sid
     , PMCV.INV_CMN_2_SID AS invCmn2Sid
     , PMCV.DOC_CMN_1_EVAL_SCR AS docCmn1EvalScr
     , PMCV.DOC_CMN_2_EVAL_SCR AS docCmn2EvalScr
     , PMCV.INV_CMN_1_EVAL AS invCmn1Eval
     , PMCV.INV_CMN_2_EVAL AS invCmn2Eval
     , PMCV.DOC_CMN_1_GNRV AS docCmn1Gnrv
     , PMCV.DOC_CMN_2_GNRV AS docCmn2Gnrv
     , PMCV.INV_CMN_1_GNRV AS invCmn1Gnrv
     , PMCV.INV_CMN_2_GNRV AS invCmn2Gnrv
     , PMCV.DOC_CMN_1_UNQ AS docCmn1Unq
     , PMCV.DOC_CMN_2_UNQ AS docCmn2Unq
     , PMCV.INV_CMN_1_UNQ AS invCmn1Unq
     , PMCV.INV_CMN_2_UNQ AS invCmn2Unq
     , PMCV.DOC_CMN_1_RVW_DT_TM AS docCmn1RvwDtTm
     , PMCV.DOC_CMN_2_RVW_DT_TM AS docCmn2RvwDtTm
     , PMCV.INV_CMN_1_RVW_DT_TM AS invCmn1RvwDtTm
     , PMCV.INV_CMN_2_RVW_DT_TM AS invCmn2RvwDtTm
     , PMCV.VRF_REQ_NO AS vrfReqNo
     , PMCV.PART_PROG AS partProg
     , PMCV.UNQ AS unq
     , PMCV.RVW_TRG_YN AS rvwTrgYn
     , PMCV.DOC_RST_CD AS docRstCd
     , PMCV.INV_TM AS invTm
     , PMCV.DEL_YN AS delYn
     , PMCV.REG_PRS_SID AS regPrsSid
     , PMCV.REG_DT_TM AS regDtTm
     , PMCV.MDF_PRS_SID AS mdfPrsSid
     , PMCV.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_VRF PMCV
 WHERE PMCV.DEL_YN = 'N' 
   AND PMCV.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:11:12  INFO [jdbc.sqltiming] /* selectMtProgMentoClubRstRptByPk - PROG_MENTO_CLUB_RST_RPT테이블 PK로 조회 */SELECT (SELECT FM.FILE_NM 
  FROM FILE_MGT FM
 WHERE FM.FILE_SID = PMCRR.SETT_FILE_SID
   AND FM.DEL_YN = 'N') AS settFileNm
     , SUBSTRING_INDEX(DEC2(PMCRR.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(PMCRR.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , PMCRR.PROG_REQ_SID AS progReqSid
     , PMCRR.AFL_SCHL_SID AS aflSchlSid
     , DEC2(PMCRR.MOPHN_NO) AS mophnNo
     , PMCRR.ACTV_RST_CTN AS actvRstCtn
     , PMCRR.SETT_FILE_SID AS settFileSid
     , PMCRR.COMM_STAT_CD AS commStatCd
     , PMCRR.REG_PRS_SID AS regPrsSid
     , PMCRR.REG_DT_TM AS regDtTm
     , PMCRR.MDF_PRS_SID AS mdfPrsSid
     , PMCRR.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_RST_RPT PMCRR 
WHERE PMCRR.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:13:10 DEBUG [org.sdream.comm.service.impl.TraceServiceImpl] [saveLog] TraceDTO [seq=null
     , connDtTm=null
     , sessId=BA56432068070106FE766BFCD8F45124
     , hostNm=localhost
     , pathNm=test
     , pageNm=/m/drmFstMy20/L215
     , param=[dbwls176] 
     , fullUrl=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36
     , rfrr=http://localhost:8080/m/drmFstMy19/L215?PROG_GRP_CD=PGC084
     , connIp=0:0:0:0:0:0:0:1
     , mdfDtTm=null]2025-02-27 01:13:10  INFO [jdbc.sqltiming] 
/* customInsertTrace  */
INSERT INTO TRACE ( SESS_ID 
     , CONN_DT_TM 
     , HOST_NM 
     , PATH_NM 
     , PAGE_NM 
     , PARAM 
     , FULL_URL 
     , RFRR 
     , CONN_IP 
     , MDF_DT_TM ) VALUES ( IFNULL('BA56432068070106FE766BFCD8F45124'
     , '') 
     , NOW() 
     , 'localhost' 
     , 'test' 
     , '/m/drmFstMy20/L215' 
     , '[dbwls176] ' 
     , 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36' 
     , 'http://localhost:8080/m/drmFstMy19/L215?PROG_GRP_CD=PGC084' 
     , '0:0:0:0:0:0:0:1' 
     , NOW() );
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:13:10  INFO [jdbc.sqltiming] 
/* selectPageAuth2List  */
SELECT PAGE_URI 
     , MENU_EXP_CD 
     , FUNC_EXPL 
     , USED_DT_TM 
     , DEL_YN 
     , MDF_PRS_SID 
     , MDF_DT_TM
  FROM PAGE_AUTH_2
 WHERE 1=1
   AND PAGE_URI = '/m/drmFstMy20/L215'
   AND DEL_YN = 'N';
--------------------------------------------------
{
executed in 14 msec}2025-02-27 01:13:10  INFO [jdbc.sqltiming] /* selectMtBizReqMbrInfByMypage - BIZ_REQ_MBR_INF테이블 마이페이지 선정자 확인 */SELECT B.BIZ_YR AS bizYr
     , B.BIZ_ID AS bizId
     , B.BIZ_TYPE_ID AS bizTypeId
     , B.PROD AS prod
     , S.SCHL_NM AS schlNm
     , M.MBR_ID AS mbrId
     , M.BIRTH AS birth
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , BRMI.REQ_NO AS reqNo
     , BRMI.MBR_SID AS mbrSid
     , BRMI.MBR_DIV AS mbrDiv
     , BRMI.LOG_SEQ AS logSeq
     , DEC2(BRMI.NM) AS nm
     , DEC2(BRMI.PHN_NO) AS phnNo
     , DEC2(BRMI.MOPHN_NO) AS mophnNo
     , BRMI.SCHL_SID AS schlSid
     , BRMI.GRADE AS grade
     , BRMI.FML_REL_CD AS fmlRelCd
     , BRMI.BANK AS bank
     , DEC2(BRMI.ACCNT) AS accnt
     , BRMI.REG_PRS_SID AS regPrsSid
     , BRMI.REG_DT_TM AS regDtTm
     , BRMI.REG_PRS_IP AS regPrsIp
     , BRMI.MDF_PRS_SID AS mdfPrsSid
     , BRMI.MDF_DT_TM AS mdfDtTm
     , BRMI.DEL_YN AS delYn
     , BRMI.CHK_YN AS chkYn
     , BRMI.CHK_DT_TM AS chkDtTm
     , BRMI.MBR_MOD_DT_TM AS mbrModDtTm
     , BRMI.PROG_SVY_1_DT_TM AS progSvy1DtTm
     , BRMI.PROG_SVY_2_DT_TM AS progSvy2DtTm
     , DEC2(BRMI.UGT_CTT) AS ugtCtt
  FROM BIZ_REQ_MBR_INF BRMI
 INNER JOIN
       BIZ_REQ BR
    ON BRMI.REQ_NO = BR.REQ_NO
   AND BR.DEL_YN = 'N'
 INNER JOIN
       BIZ B
    ON BR.BIZ_ID = B.BIZ_ID
   AND B.DEL_YN = 'N' LEFT JOIN SCHL S
    ON BRMI.SCHL_SID = S.SCHL_SID LEFT JOIN MBR M
    ON BRMI.MBR_SID = M.MBR_SID
 WHERE B.BIZ_STAT_CD = 'BSC050' /* 사업상태-진행중 */
   AND BRMI.MBR_DIV = 'RRC010' /* 멘토
     , 멘티 */
   AND BRMI.MBR_SID = 'MBR2411794' 
/* SID 
 */
   AND B.BIZ_TYPE_ID IN ('MT01'
     , 'MT02') 
/* 사업그룹  */
   AND BR.BIZ_REQ_STAT_CD = 'BRS020' /* 멘토 - 선정 */;
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:13:10  INFO [jdbc.sqltiming] /* selectMtProgByMypage - PROG테이블 마이페이지 조회 */SELECT P.PROG_SID AS progSid
     , P.PROG_GRP_CD AS progGrpCd
     , P.PROG_YR AS progYr
     , P.PROG_DIV_NM AS progDivNm
     , P.PROG_PROD AS progProd
     , P.ALIG_NUM AS aligNum
     , P.PROG_NM AS progNm
     , P.ATT_PRD_CTN AS attPrdCtn
     , P.DT_TM_CTN AS dtTmCtn
     , P.LOC_CTN AS locCtn
     , P.DTL_CTN AS dtlCtn
     , P.HDCNT AS hdcnt
     , P.WTNG_CNT AS wtngCnt
     , P.EXP_YN AS expYn
     , P.OPEN_YN AS openYn
     , P.REG_DIV AS regDiv
     , P.GDCC_EXP_YN AS gdccExpYn
     , P.MDF_YN AS mdfYn
     , P.FILE_SID AS fileSid
     , P.ST_TIME AS stTime
     , P.END_TIME AS endTime
     , P.REG_PRS_SID AS regPrsSid
     , P.REG_DT_TM AS regDtTm
     , P.REG_PRS_IP AS regPrsIp
     , P.MDF_PRS_SID AS mdfPrsSid
     , P.MDF_DT_TM AS mdfDtTm
     , P.DIV_CD_1 AS divCd1
     , P.UNV_PROG_ADM_YN AS unvProgAdmYn
     , P.PROG_STAT_CD AS progStatCd
  FROM PROG P
 WHERE P.PROG_GRP_CD = 'PGC084'
   AND P.PROG_YR = '2025';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:13:10  INFO [jdbc.sqltiming] /* selectMtProgReqByMypage - PROG_REQ테이블 마이페이지 프로그램 신청확인 */SELECT P.PROG_PROD AS progProd
     , P.PROG_NM AS progNm
     , P.DT_TM_CTN AS dtTmCtn
     , PRAF.ATT_FILE_SID AS attFileSid
     , SUBSTRING_INDEX(DEC2(PR.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(PR.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , GETCDNM(PR.REQ_STAT_CD) AS reqStatCdNm
     , PR.PROG_REQ_SID AS progReqSid
     , PR.PROG_SID AS progSid
     , DEC2(PR.REQ_PRS_NM) AS reqPrsNm
     , PR.BIRTH AS birth
     , PR.GRADE AS grade
     , PR.AFL AS afl
     , PR.POS AS pos
     , DEC2(PR.PHN_NO) AS phnNo
     , DEC2(PR.EMAIL) AS email
     , PR.PO_YN AS poYn
     , PR.POST_NO AS postNo
     , PR.NUM_ADDR AS numAddr
     , PR.ROAD_ADDR AS roadAddr
     , PR.DTL_ADDR AS dtlAddr
     , PR.REQ_YN AS reqYn
     , PR.STD_REQ_YN AS stdReqYn
     , PR.SEX_CD AS sexCd
     , PR.ATTD_YN AS attdYn
     , PR.COMPL_YN AS complYn
     , PR.REQ_CTN_1 AS reqCtn1
     , PR.REQ_CTN_2 AS reqCtn2
     , PR.DIV_CD_1 AS divCd1
     , PR.DIV_CD_2 AS divCd2
     , PR.BIZ_REQ_SEQ AS bizReqSeq
     , PR.BUT_BIZ_TYPE_CD AS butBizTypeCd
     , PR.BUT_BIZ_DTL_PART_CD AS butBizDtlPartCd
     , PR.REQ_STAT_NUM AS reqStatNum
     , PR.REQ_STAT_CD AS reqStatCd
     , PR.ETC_NUM_NM AS etcNumNm
     , PR.REG_PRS_SID AS regPrsSid
     , PR.REG_DT_TM AS regDtTm
     , PR.REG_PRS_IP AS regPrsIp
     , PR.MDF_PRS_SID AS mdfPrsSid
     , PR.MDF_DT_TM AS mdfDtTm
     , PR.CNCL_YN AS cnclYn
     , PR.RSDN_TYPE_CD AS rsdnTypeCd
     , PR.RAT_DIV AS ratDiv
     , PR.RST_CTN AS rstCtn
     , DEC2(PR.MOPHN_NO) AS mophnNo
     , DEC2(PR.IHIDNUM) AS ihidnum
     , PR.PRD AS prd
     , PR.MAJ AS maj
     , PR.SCRE_DIV_NM_1 AS screDivNm1
     , PR.SCRE_CRD_1 AS screCrd1
     , PR.SCRE_MAX_SCR_1 AS screMaxScr1
     , PR.SCRE_DIV_NM_2 AS screDivNm2
     , PR.SCRE_CRD_2 AS screCrd2
     , PR.SCRE_MAX_SCR_2 AS screMaxScr2
     , PR.REQ_CTN_3 AS reqCtn3
     , PR.YR AS yr
     , PR.REQ_NO AS reqNo
     , PR.RD10_REQ_NO AS rd10ReqNo
     , DEC2(PR.BANK_NM) AS bankNm
     , DEC2(PR.ACCNT_NO) AS accntNo
     , DEC2(PR.DEP_OWN) AS depOwn
     , PR.BANK_DIV AS bankDiv
     , PR.BANK_CD AS bankCd
     , PR.BANK_ADDR AS bankAddr
     , PR.EVAL_CMN_SID_1 AS evalCmnSid1
     , PR.EVAL_1_A AS eval1A
     , PR.EVAL_1_B AS eval1B
     , PR.EVAL_1_C AS eval1C
     , PR.EVAL_SCR_1 AS evalScr1
     , PR.EVAL_CTN_1 AS evalCtn1
     , PR.EVAL_CMN_SID_2 AS evalCmnSid2
     , PR.EVAL_2_A AS eval2A
     , PR.EVAL_2_B AS eval2B
     , PR.EVAL_2_C AS eval2C
     , PR.EVAL_SCR_2 AS evalScr2
     , PR.EVAL_CTN_2 AS evalCtn2
     , PR.NAT AS nat
     , PR.REQ_CTN_7 AS reqCtn7
     , PR.REQ_CTN_6 AS reqCtn6
     , PR.REQ_CTN_5 AS reqCtn5
     , PR.REQ_CTN_4 AS reqCtn4
     , PR.REQ_PRS_SID AS reqPrsSid
     , PR.CALC_YN AS calcYn
     , (SELECT PROG_YR
  FROM PROG P
 WHERE PROG_SID = PR.PROG_SID ) AS progYr
  FROM PROG_REQ PR
 INNER JOIN
       PROG P
    ON PR.PROG_SID = P.PROG_SID LEFT JOIN PROG_REQ_ATT_FILE PRAF
    ON PRAF.PROG_REQ_SID = PR.PROG_REQ_SID
 WHERE P.PROG_GRP_CD = 'PGC084'
   AND P.PROG_YR = '2025'
   AND PR.REG_PRS_SID = 'MBR2411794';
--------------------------------------------------
{
executed in 14 msec}2025-02-27 01:13:10  INFO [jdbc.sqltiming] /* selectMtProgMentoClubAplByPk - PROG_MENTO_CLUB_APL테이블 PK로 조회 */SELECT GETCDNM(PMCA.BANK_CD) AS bankCdNm
     , IFNULL(FORMAT(PMCA.REQ_AOM
     , 0)
     , 0) AS reqAomCom
     , IFNULL(FORMAT(PMCA.SAM_AOM
     , 0)
     , 0) AS samAomCom
     , (SELECT FILE_NM
  FROM FILE_MGT FM
 WHERE FM.FILE_SID = PMCA.PO_FILE_SID
   AND FM.DEL_YN = 'N') AS poFileNm
     , PMCA.PROG_REQ_SID AS progReqSid
     , PMCA.AFL_SCHL_SID AS aflSchlSid
     , DEC2(PMCA.MOPHN_NO) AS mophnNo
     , PMCA.ACTV_SUB_CTN AS actvSubCtn
     , PMCA.ACTV_ST_DT AS actvStDt
     , PMCA.ACTV_END_DT AS actvEndDt
     , PMCA.MENTO_ACTV_HDCNT AS mentoActvHdcnt
     , PMCA.TCH_ACTV_HDCNT AS tchActvHdcnt
     , PMCA.EXPT_EFCT_CTN AS exptEfctCtn
     , DEC2(PMCA.DEP_OWN) AS depOwn
     , DEC2(PMCA.ACCNT_NO) AS accntNo
     , PMCA.BANK_CD AS bankCd
     , PMCA.PO_FILE_SID AS poFileSid
     , PMCA.SELT_YN AS seltYn
     , PMCA.REQ_AOM AS reqAom
     , PMCA.SAM_AOM AS samAom
     , PMCA.GDCC_CTN AS gdccCtn
     , PMCA.DEL_YN AS delYn
     , PMCA.REG_PRS_SID AS regPrsSid
     , PMCA.REG_DT_TM AS regDtTm
     , PMCA.MDF_PRS_SID AS mdfPrsSid
     , PMCA.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_APL PMCA
 WHERE PMCA.DEL_YN = 'N'
   AND PMCA.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:13:10  INFO [jdbc.sqltiming] /* selectMtProgMentoClubAplActvDtlListBySidList - PROG_MENTO_CLUB_APL_ACTV_DTL_LIST테이블 SID로 리스트 조회 */SELECT IFNULL(FORMAT(PMCAADL.REQ_AOM
     , 0)
     , '') AS reqAomCom
     , PMCAADL.PROG_REQ_SID AS progReqSid
     , PMCAADL.ACTV_SEQ AS actvSeq
     , PMCAADL.ACTV_DTL_SUB_CTN AS actvDtlSubCtn
     , PMCAADL.ACTV_DTL_ST_DT AS actvDtlStDt
     , PMCAADL.ACTV_DTL_END_DT AS actvDtlEndDt
     , PMCAADL.ACTV_PLAN_CTN AS actvPlanCtn
     , PMCAADL.REQ_AOM AS reqAom
     , PMCAADL.REG_PRS_SID AS regPrsSid
     , PMCAADL.REG_DT_TM AS regDtTm
     , PMCAADL.MDF_PRS_SID AS mdfPrsSid
     , PMCAADL.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_APL_ACTV_DTL_LIST PMCAADL
 WHERE PMCAADL.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:13:10  INFO [jdbc.sqltiming] /* selectMtProgMentoClubAplActvExpListBySidList - PROG_MENTO_CLUB_APL_ACTV_EXP_LIST테이블 SID로 리스트 조회 */SELECT IFNULL(FORMAT(PMCAAEL.UTPC
     , 0)
     , '') AS utpcCom
     , IFNULL(FORMAT(PMCAAEL.REQ_AOM
     , 0)
     , '') AS reqAomCom
     , PMCAAEL.PROG_REQ_SID AS progReqSid
     , PMCAAEL.ACTV_SEQ AS actvSeq
     , PMCAAEL.ACTV_EXP_SEQ AS actvExpSeq
     , PMCAAEL.ACTV_EXP_CTN AS actvExpCtn
     , PMCAAEL.UTPC AS utpc
     , PMCAAEL.QTT AS qtt
     , PMCAAEL.REQ_AOM AS reqAom
     , PMCAAEL.REG_PRS_SID AS regPrsSid
     , PMCAAEL.REG_DT_TM AS regDtTm
     , PMCAAEL.MDF_PRS_SID AS mdfPrsSid
     , PMCAAEL.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_APL_ACTV_EXP_LIST PMCAAEL
 WHERE PMCAAEL.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:14:29 DEBUG [org.sdream.comm.service.impl.TraceServiceImpl] [saveLog] TraceDTO [seq=null
     , connDtTm=null
     , sessId=BA56432068070106FE766BFCD8F45124
     , hostNm=localhost
     , pathNm=test
     , pageNm=/m/drm218gV/L213
     , param=[dbwls176] 
     , fullUrl=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36
     , rfrr=http://localhost:8080/m/drmFstMy20/L215
     , connIp=0:0:0:0:0:0:0:1
     , mdfDtTm=null]2025-02-27 01:14:29  INFO [jdbc.sqltiming] 
/* customInsertTrace  */
INSERT INTO TRACE ( SESS_ID 
     , CONN_DT_TM 
     , HOST_NM 
     , PATH_NM 
     , PAGE_NM 
     , PARAM 
     , FULL_URL 
     , RFRR 
     , CONN_IP 
     , MDF_DT_TM ) VALUES ( IFNULL('BA56432068070106FE766BFCD8F45124'
     , '') 
     , NOW() 
     , 'localhost' 
     , 'test' 
     , '/m/drm218gV/L213' 
     , '[dbwls176] ' 
     , 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36' 
     , 'http://localhost:8080/m/drmFstMy20/L215' 
     , '0:0:0:0:0:0:0:1' 
     , NOW() );
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:14:29  INFO [jdbc.sqltiming] 
/* selectPageAuth2List  */
SELECT PAGE_URI 
     , MENU_EXP_CD 
     , FUNC_EXPL 
     , USED_DT_TM 
     , DEL_YN 
     , MDF_PRS_SID 
     , MDF_DT_TM
  FROM PAGE_AUTH_2
 WHERE 1=1
   AND PAGE_URI = '/m/drm218gV/L213'
   AND DEL_YN = 'N';
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:14:29  INFO [jdbc.sqltiming]SELECT TBR.REQ_NO 
     , TB.BIZ_NM 
     , DEC2((SELECT NM
  FROM BIZ_REQ_MBR_INF
 WHERE TBR.REQ_NO = REQ_NO 
   AND MBR_DIV = 'RRC020'
   AND DEL_YN = 'N' LIMIT 1)) NM_2 
     , (SELECT COUNT(*)
  FROM BIZ_REQ_RCD
 WHERE REQ_NO = TBR.REQ_NO
   AND BIZ_RCD_PRD_SID = 'RRC02005') RRC02005_CNT 
     , (SELECT COUNT(*)
  FROM BIZ_REQ_RCD 
WHERE REQ_NO = TBR.REQ_NO
   AND BIZ_RCD_PRD_SID = 'RRC02010') RRC02010_CNT 
     , IFNULL((SELECT SND_YN 
  FROM BIZ_REQ_RCD
 WHERE REQ_NO = TBR.REQ_NO
   AND BIZ_RCD_PRD_SID = 'RRC02005')
     , 'N') AS SND_YN_1 
     , IFNULL((SELECT SND_YN
  FROM BIZ_REQ_RCD
 WHERE REQ_NO = TBR.REQ_NO
   AND BIZ_RCD_PRD_SID = 'RRC02010')
     , 'N') AS SND_YN_2
  FROM BIZ_TYPE TBT 
     , BIZ TB 
     , BIZ_REQ TBR 
     , BIZ_REQ_MBR_INF TBRMI
 WHERE 1=1
   AND TBT.DEL_YN = 'N'
   AND TB.DEL_YN = 'N'
   AND TBR.DEL_YN = 'N'
   AND TBRMI.DEL_YN = 'N'
   AND TBT.BIZ_TYPE_ID = 'MT01'
   AND TBT.BIZ_TYPE_ID = TB.BIZ_TYPE_ID
   AND TB.BIZ_STAT_CD NOT IN ('BSC010'
     , 'BSC060') 
/* 대기
     , 사업종료 */
   AND TBR.BIZ_REQ_STAT_CD NOT IN ('BRS040'
     , 'BRS050') /* 탈락
     , 지원중단 */
   AND TB.BIZ_ID = TBR.BIZ_ID
   AND TBR.REQ_NO = TBRMI.REQ_NO
   AND TBRMI.MBR_SID = 'MBR2411794'
   AND TB.BIZ_STAT_CD IN ('BSC050'
     , 'BSC055');
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:14:29 DEBUG [org.sdream.comm.service.impl.TraceServiceImpl] [saveLog] TraceDTO [seq=null
     , connDtTm=null
     , sessId=BA56432068070106FE766BFCD8F45124
     , hostNm=localhost
     , pathNm=test
     , pageNm=/m/drm218gVL/L213
     , param=[dbwls176];
--------------------------------------------------
{
REQ_NO=[2025MT0101125973]}
     ,;
--------------------------------------------------
{
bizTypeId=[MT01]}
     , fullUrl=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36
     , rfrr=http://localhost:8080/m/drm218gV/L213
     , connIp=0:0:0:0:0:0:0:1
     , mdfDtTm=null]2025-02-27 01:14:29  INFO [jdbc.sqltiming] 
/* customInsertTrace  */
INSERT INTO TRACE ( SESS_ID 
     , CONN_DT_TM 
     , HOST_NM 
     , PATH_NM 
     , PAGE_NM 
     , PARAM 
     , FULL_URL 
     , RFRR 
     , CONN_IP 
     , MDF_DT_TM ) VALUES ( IFNULL('BA56432068070106FE766BFCD8F45124'
     , '') 
     , NOW() 
     , 'localhost' 
     , 'test' 
     , '/m/drm218gVL/L213' 
     , '[dbwls176];
--------------------------------------------------
{
REQ_NO=[2025MT0101125973]}
     ,;
--------------------------------------------------
{
bizTypeId=[MT01]}' 
     , 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36' 
     , 'http://localhost:8080/m/drm218gV/L213' 
     , '0:0:0:0:0:0:0:1' 
     , NOW() );
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:14:29  INFO [jdbc.sqltiming] 
/* selectPageAuth2List  */
SELECT PAGE_URI 
     , MENU_EXP_CD 
     , FUNC_EXPL 
     , USED_DT_TM 
     , DEL_YN 
     , MDF_PRS_SID 
     , MDF_DT_TM
  FROM PAGE_AUTH_2
 WHERE 1=1
   AND PAGE_URI = '/m/drm218gVL/L213'
   AND DEL_YN = 'N';
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:14:29  INFO [jdbc.sqltiming]SELECT TBR.REQ_NO 
     , TB.BIZ_NM 
     , TB.PROD 
     , TBR.REQ_SEQ 
     , TBRR.BIZ_RCD_PRD_SID 
     , TBRR.SND_YN 
     , TBRR.WRT_YN 
     , TBRR.WRT_PRGS 
     , DATE_FORMAT(TBRR.MDF_DT_TM
     , '%Y-%m-%d') MDF_DT_TM
  FROM BIZ_TYPE TBT
 INNER JOIN
       BIZ TB
    ON TBT.BIZ_TYPE_ID = TB.BIZ_TYPE_ID
 INNER JOIN
       BIZ_REQ TBR
    ON TB.BIZ_ID = TBR.BIZ_ID 
  LEFT OUTER JOIN
       BIZ_REQ_RCD TBRR
    ON TBR.REQ_NO = TBRR.REQ_NO
 WHERE TBT.BIZ_TYPE_ID = 'MT01' 
   AND TBR.REQ_NO = '2025MT0101125973'
 ORDER BY 
       TBR.REQ_SEQ ASC;
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:14:29  INFO [jdbc.sqltiming] 
/* selectMenteeDiaryMnList  */
SELECT BIZ_TYPE_ID 
     , VAR_NM 
     , VAR_VAL
  FROM MANAGE_VAR
 WHERE 1=1 
   AND VAR_NM LIKE CONCAT('%'
     , 'MENTO_DIARY_PRD_'
     , '%')
   AND BIZ_TYPE_ID = 'MT01'
 ORDER BY 
       CASE WHEN substr(VAR_NM
     , 17
     , 2) > 4 THEN 1 ELSE 2 END;
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:14:33 DEBUG [org.sdream.comm.service.impl.TraceServiceImpl] [saveLog] TraceDTO [seq=null
     , connDtTm=null
     , sessId=BA56432068070106FE766BFCD8F45124
     , hostNm=localhost
     , pathNm=test
     , pageNm=/getCurrentDate.json
     , param=[dbwls176] 
     , fullUrl=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36
     , rfrr=http://localhost:8080/m/drm218gV/L213
     , connIp=0:0:0:0:0:0:0:1
     , mdfDtTm=null]2025-02-27 01:14:33  INFO [jdbc.sqltiming] 
/* customInsertTrace  */
INSERT INTO TRACE ( SESS_ID 
     , CONN_DT_TM 
     , HOST_NM 
     , PATH_NM 
     , PAGE_NM 
     , PARAM 
     , FULL_URL 
     , RFRR 
     , CONN_IP 
     , MDF_DT_TM ) VALUES ( IFNULL('BA56432068070106FE766BFCD8F45124'
     , '') 
     , NOW() 
     , 'localhost' 
     , 'test' 
     , '/getCurrentDate.json' 
     , '[dbwls176] ' 
     , 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36' 
     , 'http://localhost:8080/m/drm218gV/L213' 
     , '0:0:0:0:0:0:0:1' 
     , NOW() );
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:14:33 DEBUG [org.sdream.comm.service.impl.TraceServiceImpl] [saveLog] TraceDTO [seq=null
     , connDtTm=null
     , sessId=BA56432068070106FE766BFCD8F45124
     , hostNm=localhost
     , pathNm=test
     , pageNm=/m/drm211R/L213
     , param=[dbwls176];
--------------------------------------------------
{
REQ_NO=[2025MT0101125973]}
     ,;
--------------------------------------------------
{
BIZ_RCD_PRD_SID=[RRC01001]}
     ,;
--------------------------------------------------
{
WRT_PRGS=[1]}
     ,;
--------------------------------------------------
{
A_CD=[2025MT0101125973]}
     , fullUrl=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36
     , rfrr=http://localhost:8080/m/drm218gV/L213
     , connIp=0:0:0:0:0:0:0:1
     , mdfDtTm=null]2025-02-27 01:14:34  INFO [jdbc.sqltiming] 
/* customInsertTrace  */
INSERT INTO TRACE ( SESS_ID 
     , CONN_DT_TM 
     , HOST_NM 
     , PATH_NM 
     , PAGE_NM 
     , PARAM 
     , FULL_URL 
     , RFRR 
     , CONN_IP 
     , MDF_DT_TM ) VALUES ( IFNULL('BA56432068070106FE766BFCD8F45124'
     , '') 
     , NOW() 
     , 'localhost' 
     , 'test' 
     , '/m/drm211R/L213' 
     , '[dbwls176];
--------------------------------------------------
{
REQ_NO=[2025MT0101125973]}
     ,;
--------------------------------------------------
{
BIZ_RCD_PRD_SID=[RRC01001]}
     ,;
--------------------------------------------------
{
WRT_PRGS=[1]}
     ,;
--------------------------------------------------
{
A_CD=[2025MT0101125973]}' 
     , 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36' 
     , 'http://localhost:8080/m/drm218gV/L213' 
     , '0:0:0:0:0:0:0:1' 
     , NOW() );
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:14:34  INFO [jdbc.sqltiming] 
/* selectPageAuth2List  */
SELECT PAGE_URI 
     , MENU_EXP_CD 
     , FUNC_EXPL 
     , USED_DT_TM 
     , DEL_YN 
     , MDF_PRS_SID 
     , MDF_DT_TM
  FROM PAGE_AUTH_2
 WHERE 1=1
   AND PAGE_URI = '/m/drm211R/L213'
   AND DEL_YN = 'N';
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:14:34  INFO [jdbc.sqltiming] 
/* isCorrectReqNo  */
SELECT COUNT(1) AS CNT
  FROM MBR_BIZ_REQ
 WHERE 1=1
   AND REQ_NO = '2025MT0101125973' 
   AND MBR_SID = 'MBR2411794'
   AND DEL_YN = 'N';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:14:34  INFO [jdbc.sqltiming] 
/* selectBizYearGrade  */
SELECT B.BIZ_YR AS bizYr 
     , B.BIZ_TYPE_ID AS bizTypeId 
     , B.PROD AS prod 
     , BRMI.GRADE AS grade
  FROM BIZ B
  LEFT OUTER JOIN
       BIZ_REQ BR
    ON BR.BIZ_ID = B.BIZ_ID LEFT OUTER JOIN BIZ_REQ_MBR_INF BRMI
    ON BRMI.REQ_NO = BR.REQ_NO
   AND BRMI.MBR_DIV = 'RRC020'
 WHERE 1=1 
   AND B.DEL_YN = 'N'
   AND BR.REQ_NO = '2025MT0101125973'
   AND BR.DEL_YN = 'N';
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:14:34  INFO [jdbc.sqltiming] 
/* getCodeListByGrpCdEngNmList  */
SELECT A.CD_ID cdId 
     , A.CD_NM cdNm 
     , CONCAT(A.CD_ID
     , ' '
     , A.CD_NM) cdNmId 
     , A.GRP_CD_NM grpCdNm 
     , A.GRP_CD_ENG_NM grpCdEngNm 
     , A.PRT_CD prtCd 
     , A.SEQ seq 
     , A.ETC etc 
  FROM CODE_MGT A
 WHERE 1=1
   AND A.DEL_YN = 'N'
   AND A.GRP_CD_ENG_NM IN ( 'GUM_RCD_SCHUL_EXPENS' 
     , 'GUM_RCD_SCHLSHIP_DLIV_PLAN' 
     , 'GUM_RCD_SCHLSHIP_DLIV_PLAN_2_OBJ' 
     , 'GUM_RCD_SCHLSHIP_DLIV_PLAN_2' 
     , 'GUM_RCD_MENTO_FREQ' 
     , 'GUM_RCD_MENTO_CN_TYPE2' 
     , 'GUM_RCD_SCHUL_EXPENS_TYPE2' );
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:14:34  INFO [jdbc.sqltiming] 
/* bizReqRcdView 사업신청 기록 상세  */
SELECT TBR.REQ_NO 
     , TB.BIZ_NM 
     , TB.BIZ_YR 
     , TB.BIZ_TYPE_ID 
     , TB.PROD 
     , TBRR.BIZ_RCD_PRD_SID 
     , TBRR.GOAL_1 
     , TBRR.GOAL_2 
     , TBRR.GOAL_3 
     , TBRR.PLAN_1 
     , TBRR.PLAN_2 
     , TBRR.PLAN_3 
     , TBRR.SND_YN 
     , TBRR.APLY_YN 
     , TBRR.APLY_CTN 
     , TBRR.APLY_DT 
     , TBRR.REG_PRS_SID 
     , DATE_FORMAT(TBRR.REG_DT_TM
     , '%Y-%m-%d') REG_DT_TM 
     , TBRR.REG_PRS_IP 
     , DATE_FORMAT(TBRR.MDF_DT_TM
     , '%Y-%m-%d') MDF_DT_TM 
     , DATE_FORMAT(TBRR.MDF_DT_TM
     , '%Y-%m-%d %T') AS MDF_DT_TM_TIME 
     , TBRR.MDF_PRS_SID 
     , TBRR2.PLAN_1 BEFORE_PLAN_1 
     , TBRR2.PLAN_2 BEFORE_PLAN_2 
     , DEC2((SELECT NM
  FROM BIZ_REQ_MBR_INF
 WHERE TBR.REQ_NO = REQ_NO
   AND MBR_DIV = 'RRC020'
   AND DEL_YN = 'N' LIMIT 1)) NM_1 
     , DEC2((SELECT NM
  FROM BIZ_REQ_MBR_INF
 WHERE TBR.REQ_NO = REQ_NO
   AND MBR_DIV = 'RRC010'
   AND DEL_YN = 'N' LIMIT 1)) NM_2 
     , (SELECT B.SCHL_NM
  FROM BIZ_REQ_MBR_INF A
     , SCHL B
 WHERE A.DEL_YN = 'N'
   AND TBR.REQ_NO = A.REQ_NO
   AND MBR_DIV = 'RRC020'
   AND A.SCHL_SID = B.SCHL_SID LIMIT 1) SCHL_NM 
     , (SELECT B.SCHL_NM
  FROM BIZ_REQ_MBR_INF A
     , SCHL B
 WHERE A.DEL_YN = 'N'
   AND TBR.REQ_NO = A.REQ_NO
   AND MBR_DIV = 'RRC010'
   AND A.SCHL_SID = B.SCHL_SID LIMIT 1) SCHL_NM_2 
     , TBRR.WRT_YN AS WRT_YN 
     , TBRR.WRT_PRGS AS WRT_PRGS 
     , TBRR.RCD_SCSH_CONFIRM
  FROM BIZ TB 
     , BIZ_REQ TBR LEFT JOIN BIZ_REQ_RCD TBRR
    ON TBR.REQ_NO = TBRR.REQ_NO
   AND TBRR.BIZ_RCD_PRD_SID = 'RRC01001' LEFT JOIN BIZ_REQ_RCD TBRR2
    ON TBR.REQ_NO = TBRR2.REQ_NO
   AND TBRR2.BIZ_RCD_PRD_SID = ''
 WHERE TB.BIZ_ID = TBR.BIZ_ID
   AND TBR.REQ_NO = '2025MT0101125973'
   AND TBR.DEL_YN = 'N' 
   AND TBR.REQ_NO IN (SELECT REQ_NO
  FROM BIZ_REQ_MBR_INF
 WHERE REQ_NO = '2025MT0101125973'
   AND MBR_SID = 'MBR2411794'
   AND DEL_YN = 'N');
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:14:34  INFO [jdbc.sqltiming]SELECT REQ_NO 
     , BIZ_RCD_PRD_SID 
     , SCRE_SEQ 
     , SCRE_SBJ_NM 
     , SCRE_CATE_CD 
     , FN_CODE_NM(SCRE_CATE_CD) SCRE_CATE_CD_NM 
     , SCRE_SCR 
     , SCRE_PT 
     , SCRE_DIV 
     , MDF_PRS_SID 
     , DATE_FORMAT(MDF_DT_TM
     , '%Y-%m-%d') MDF_DT_TM 
     , SCRE_ORI
  FROM BIZ_REQ_RCD_SCRE
 WHERE REQ_NO = '2025MT0101125973'
   AND BIZ_RCD_PRD_SID = 'RRC01001'
   AND REQ_NO IN (SELECT REQ_NO
  FROM BIZ_REQ_MBR_INF
 WHERE REQ_NO = '2025MT0101125973' 
   AND MBR_SID = 'MBR2411794'
   AND DEL_YN = 'N')
 ORDER BY 
       SCRE_SEQ;
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:14:34  INFO [jdbc.sqltiming] 
/* bizReqRcdCateList  */
SELECT REQ_NO 
     , BIZ_RCD_PRD_SID 
     , CATE_GRP_CD_NM 
     , CATE_CD 
     , FN_CODE_NM(CATE_CD) CATE_CD_NM 
     , CATE_CTN 
     , CATE_TIME 
     , MDF_PRS_SID 
     , DATE_FORMAT(MDF_DT_TM
     , '%Y-%m-%d') MDF_DT_TM 
  FROM BIZ_REQ_RCD_CATE
 WHERE REQ_NO = '2025MT0101125973'
   AND BIZ_RCD_PRD_SID = 'RRC01001'
   AND REQ_NO IN (SELECT REQ_NO
  FROM BIZ_REQ_MBR_INF
 WHERE REQ_NO = '2025MT0101125973'
   AND MBR_SID = 'MBR2411794'
   AND DEL_YN = 'N')
 ORDER BY 
       CATE_GRP_CD_NM;
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:14:34  INFO [jdbc.sqltiming]SELECT REQ_NO 
     , BIZ_RCD_PRD_SID 
     , PLAN_SEQ 
     , PLAN_ITEM_CD 
     , FN_CODE_NM(PLAN_ITEM_CD) PLAN_ITEM_CD_NM 
     , PLAN_CTN 
     , PLAN_AOM 
     , MDF_PRS_SID 
     , DATE_FORMAT(MDF_DT_TM
     , '%Y-%m-%d') MDF_DT_TM
  FROM BIZ_REQ_RCD_PLAN 
WHERE REQ_NO = '2025MT0101125973'
   AND BIZ_RCD_PRD_SID = 'RRC01001'
   AND REQ_NO IN (SELECT REQ_NO 
  FROM BIZ_REQ_MBR_INF
 WHERE REQ_NO = '2025MT0101125973'
   AND MBR_SID = 'MBR2411794'
   AND DEL_YN = 'N')
 ORDER BY 
       PLAN_SEQ;
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:14:34  INFO [jdbc.sqltiming]SELECT REQ_NO 
     , BIZ_RCD_PRD_SID 
     , QUES_SEQ 
     , QUES_CTN 
     , MDF_PRS_SID 
     , DATE_FORMAT(MDF_DT_TM
     , '%Y-%m-%d') MDF_DT_TM
  FROM BIZ_REQ_RCD_QUES
 WHERE REQ_NO = '2025MT0101125973'
   AND BIZ_RCD_PRD_SID = 'RRC01001' 
   AND REQ_NO IN (SELECT REQ_NO
  FROM BIZ_REQ_MBR_INF
 WHERE REQ_NO = '2025MT0101125973'
   AND MBR_SID = 'MBR2411794'
   AND DEL_YN = 'N')
 ORDER BY 
       QUES_SEQ;
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:14:34  INFO [jdbc.sqltiming]SELECT REQ_NO 
     , BIZ_RCD_PRD_SID 
     , SEL_SEQ 
     , SEL_GRP_CD_NM 
     , SEL_CD 
     , FN_CODE_NM(SEL_CD) SEL_CD_NM 
     , SEL_CTN_1 
     , SEL_CTN_2 
     , MDF_PRS_SID 
     , DATE_FORMAT(MDF_DT_TM
     , '%Y-%m-%d') MDF_DT_TM
  FROM BIZ_REQ_RCD_SEL 
WHERE REQ_NO = '2025MT0101125973'
   AND BIZ_RCD_PRD_SID = 'RRC01001'
   AND REQ_NO IN (SELECT REQ_NO 
  FROM BIZ_REQ_MBR_INF
 WHERE REQ_NO = '2025MT0101125973'
   AND MBR_SID = 'MBR2411794'
   AND DEL_YN = 'N')
 ORDER BY 
       SEL_SEQ;
--------------------------------------------------
{
executed in 11 msec}2월 27
     , 2025 1:14:34 오후 org.apache.catalina.core.ApplicationDispatcher invoke심각: 서블릿 [jsp]을(를) 위한 Servlet.service() 호출이 예외를 발생시켰습니다.javax.servlet.ServletException: 파일 [/WEB-INF/jsp/mypage/bizReq/bizReqRcd/common/2025/RRC01001_cont.jsp]을(를) 찾을 수 없습니다.
	at org.apache.jasper.servlet.JspServlet.handleMissingResource(JspServlet.java:416)
	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:384)
	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:339)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.doInclude(ApplicationDispatcher.java:602)
	at org.apache.catalina.core.ApplicationDispatcher.include(ApplicationDispatcher.java:541)
	at org.apache.jasper.runtime.JspRuntimeLibrary.include(JspRuntimeLibrary.java:896)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.bizReq.bizReqRcd.drm225R_jsp._jspx_meth_form_005fform_005f0(drm225R_jsp.java:291)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.bizReq.bizReqRcd.drm225R_jsp._jspService(drm225R_jsp.java:100)
	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:71)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:477)
	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:395)
	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:339)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.doInclude(ApplicationDispatcher.java:602)
	at org.apache.catalina.core.ApplicationDispatcher.include(ApplicationDispatcher.java:541)
	at org.apache.jasper.runtime.JspRuntimeLibrary.include(JspRuntimeLibrary.java:896)
	at org.apache.jasper.runtime.PageContextImpl.doInclude(PageContextImpl.java:689)
	at org.apache.jasper.runtime.PageContextImpl.include(PageContextImpl.java:683)
	at org.apache.tiles.jsp.context.JspTilesRequestContext.include(JspTilesRequestContext.java:103)
	at org.apache.tiles.jsp.context.JspTilesRequestContext.dispatch(JspTilesRequestContext.java:96)
	at org.apache.tiles.renderer.impl.TemplateAttributeRenderer.write(TemplateAttributeRenderer.java:44)
	at org.apache.tiles.renderer.impl.AbstractBaseAttributeRenderer.render(AbstractBaseAttributeRenderer.java:106)
	at org.apache.tiles.renderer.impl.ChainedDelegateAttributeRenderer.write(ChainedDelegateAttributeRenderer.java:76)
	at org.apache.tiles.renderer.impl.AbstractBaseAttributeRenderer.render(AbstractBaseAttributeRenderer.java:106)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:670)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:336)
	at org.apache.tiles.template.InsertAttributeModel.renderAttribute(InsertAttributeModel.java:210)
	at org.apache.tiles.template.InsertAttributeModel.end(InsertAttributeModel.java:126)
	at org.apache.tiles.jsp.taglib.InsertAttributeTag.doTag(InsertAttributeTag.java:311)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.layout.layout_005fmypage_005fc_jsp._jspx_meth_t_005finsertAttribute_005f4(layout_005fmypage_005fc_jsp.java:395)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.layout.layout_005fmypage_005fc_jsp._jspService(layout_005fmypage_005fc_jsp.java:136)
	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:71)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:477)
	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:395)
	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:339)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:484)
	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:409)
	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:337)
	at org.apache.tiles.servlet.context.ServletTilesRequestContext.forward(ServletTilesRequestContext.java:241)
	at org.apache.tiles.servlet.context.ServletTilesRequestContext.dispatch(ServletTilesRequestContext.java:222)
	at org.apache.tiles.renderer.impl.TemplateAttributeRenderer.write(TemplateAttributeRenderer.java:44)
	at org.apache.tiles.renderer.impl.AbstractBaseAttributeRenderer.render(AbstractBaseAttributeRenderer.java:106)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:670)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:690)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:644)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:627)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:321)
	at org.springframework.web.servlet.view.tiles2.TilesView.renderMergedOutputModel(TilesView.java:124)
	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:264)
	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1216)
	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1001)
	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:945)
	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:867)
	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:951)
	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:853)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:647)
	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:827)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:484)
	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:409)
	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:337)
	at org.sdream.biz.control.MypageWrapperController.wrappingPM(MypageWrapperController.java:90)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:221)
	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)
	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)
	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandleMethod(RequestMappingHandlerAdapter.java:743)
	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:672)
	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:82)
	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:933)
	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:867)
	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:951)
	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:853)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:647)
	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:827)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.sdream.comm.filter.CrossScriptingFilter.doFilter(CrossScriptingFilter.java:55)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.sdream.comm.filter.AuthFilter.doFilter(AuthFilter.java:177)
	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:343)
	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:260)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.springframework.web.multipart.support.MultipartFilter.doFilterInternal(MultipartFilter.java:118)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:219)
	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:110)
	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:492)
	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:165)
	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:104)
	at org.apache.catalina.valves.AccessLogValve.invoke(AccessLogValve.java:1025)
	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:116)
	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:451)
	at org.apache.coyote.http11.AbstractHttp11Processor.process(AbstractHttp11Processor.java:1201)
	at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:654)
	at org.apache.tomcat.util.net.JIoEndpoint$SocketProcessor.run(JIoEndpoint.java:319)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)
	at java.lang.Thread.run(Thread.java:748)
2월 27
     , 2025 1:14:34 오후 org.apache.catalina.core.ApplicationDispatcher invoke심각: 서블릿 [jsp]을(를) 위한 Servlet.service() 호출이 예외를 발생시켰습니다.javax.servlet.ServletException: 파일 [/WEB-INF/jsp/mypage/bizReq/bizReqRcd/common/2025/RRC01001_cont.jsp]을(를) 찾을 수 없습니다.
	at org.apache.jasper.servlet.JspServlet.handleMissingResource(JspServlet.java:416)
	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:384)
	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:339)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.doInclude(ApplicationDispatcher.java:602)
	at org.apache.catalina.core.ApplicationDispatcher.include(ApplicationDispatcher.java:541)
	at org.apache.jasper.runtime.JspRuntimeLibrary.include(JspRuntimeLibrary.java:896)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.bizReq.bizReqRcd.drm225R_jsp._jspx_meth_form_005fform_005f0(drm225R_jsp.java:291)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.bizReq.bizReqRcd.drm225R_jsp._jspService(drm225R_jsp.java:100)
	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:71)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:477)
	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:395)
	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:339)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.doInclude(ApplicationDispatcher.java:602)
	at org.apache.catalina.core.ApplicationDispatcher.include(ApplicationDispatcher.java:541)
	at org.apache.jasper.runtime.JspRuntimeLibrary.include(JspRuntimeLibrary.java:896)
	at org.apache.jasper.runtime.PageContextImpl.doInclude(PageContextImpl.java:689)
	at org.apache.jasper.runtime.PageContextImpl.include(PageContextImpl.java:683)
	at org.apache.tiles.jsp.context.JspTilesRequestContext.include(JspTilesRequestContext.java:103)
	at org.apache.tiles.jsp.context.JspTilesRequestContext.dispatch(JspTilesRequestContext.java:96)
	at org.apache.tiles.renderer.impl.TemplateAttributeRenderer.write(TemplateAttributeRenderer.java:44)
	at org.apache.tiles.renderer.impl.AbstractBaseAttributeRenderer.render(AbstractBaseAttributeRenderer.java:106)
	at org.apache.tiles.renderer.impl.ChainedDelegateAttributeRenderer.write(ChainedDelegateAttributeRenderer.java:76)
	at org.apache.tiles.renderer.impl.AbstractBaseAttributeRenderer.render(AbstractBaseAttributeRenderer.java:106)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:670)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:336)
	at org.apache.tiles.template.InsertAttributeModel.renderAttribute(InsertAttributeModel.java:210)
	at org.apache.tiles.template.InsertAttributeModel.end(InsertAttributeModel.java:126)
	at org.apache.tiles.jsp.taglib.InsertAttributeTag.doTag(InsertAttributeTag.java:311)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.layout.layout_005fmypage_005fc_jsp._jspx_meth_t_005finsertAttribute_005f4(layout_005fmypage_005fc_jsp.java:395)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.layout.layout_005fmypage_005fc_jsp._jspService(layout_005fmypage_005fc_jsp.java:136)
	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:71)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:477)
	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:395)
	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:339)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:484)
	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:409)
	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:337)
	at org.apache.tiles.servlet.context.ServletTilesRequestContext.forward(ServletTilesRequestContext.java:241)
	at org.apache.tiles.servlet.context.ServletTilesRequestContext.dispatch(ServletTilesRequestContext.java:222)
	at org.apache.tiles.renderer.impl.TemplateAttributeRenderer.write(TemplateAttributeRenderer.java:44)
	at org.apache.tiles.renderer.impl.AbstractBaseAttributeRenderer.render(AbstractBaseAttributeRenderer.java:106)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:670)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:690)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:644)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:627)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:321)
	at org.springframework.web.servlet.view.tiles2.TilesView.renderMergedOutputModel(TilesView.java:124)
	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:264)
	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1216)
	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1001)
	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:945)
	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:867)
	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:951)
	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:853)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:647)
	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:827)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:484)
	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:409)
	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:337)
	at org.sdream.biz.control.MypageWrapperController.wrappingPM(MypageWrapperController.java:90)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:221)
	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)
	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)
	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandleMethod(RequestMappingHandlerAdapter.java:743)
	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:672)
	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:82)
	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:933)
	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:867)
	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:951)
	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:853)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:647)
	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:827)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.sdream.comm.filter.CrossScriptingFilter.doFilter(CrossScriptingFilter.java:55)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.sdream.comm.filter.AuthFilter.doFilter(AuthFilter.java:177)
	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:343)
	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:260)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.springframework.web.multipart.support.MultipartFilter.doFilterInternal(MultipartFilter.java:118)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:219)
	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:110)
	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:492)
	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:165)
	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:104)
	at org.apache.catalina.valves.AccessLogValve.invoke(AccessLogValve.java:1025)
	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:116)
	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:451)
	at org.apache.coyote.http11.AbstractHttp11Processor.process(AbstractHttp11Processor.java:1201)
	at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:654)
	at org.apache.tomcat.util.net.JIoEndpoint$SocketProcessor.run(JIoEndpoint.java:319)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)
	at java.lang.Thread.run(Thread.java:748)
2월 27
     , 2025 1:14:34 오후 org.apache.catalina.core.ApplicationDispatcher invoke심각: 서블릿 [jsp]을(를) 위한 Servlet.service() 호출이 예외를 발생시켰습니다.java.io.IOException: org.apache.tiles.util.TilesIOException: JSPException including path '/WEB-INF/jsp/mypage/bizReq/bizReqRcd/drm225R.jsp'.
	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:505)
	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:395)
	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:339)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:484)
	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:409)
	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:337)
	at org.apache.tiles.servlet.context.ServletTilesRequestContext.forward(ServletTilesRequestContext.java:241)
	at org.apache.tiles.servlet.context.ServletTilesRequestContext.dispatch(ServletTilesRequestContext.java:222)
	at org.apache.tiles.renderer.impl.TemplateAttributeRenderer.write(TemplateAttributeRenderer.java:44)
	at org.apache.tiles.renderer.impl.AbstractBaseAttributeRenderer.render(AbstractBaseAttributeRenderer.java:106)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:670)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:690)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:644)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:627)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:321)
	at org.springframework.web.servlet.view.tiles2.TilesView.renderMergedOutputModel(TilesView.java:124)
	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:264)
	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1216)
	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1001)
	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:945)
	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:867)
	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:951)
	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:853)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:647)
	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:827)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:484)
	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:409)
	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:337)
	at org.sdream.biz.control.MypageWrapperController.wrappingPM(MypageWrapperController.java:90)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:221)
	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)
	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)
	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandleMethod(RequestMappingHandlerAdapter.java:743)
	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:672)
	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:82)
	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:933)
	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:867)
	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:951)
	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:853)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:647)
	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:827)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.sdream.comm.filter.CrossScriptingFilter.doFilter(CrossScriptingFilter.java:55)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.sdream.comm.filter.AuthFilter.doFilter(AuthFilter.java:177)
	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:343)
	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:260)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.springframework.web.multipart.support.MultipartFilter.doFilterInternal(MultipartFilter.java:118)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:219)
	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:110)
	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:492)
	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:165)
	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:104)
	at org.apache.catalina.valves.AccessLogValve.invoke(AccessLogValve.java:1025)
	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:116)
	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:451)
	at org.apache.coyote.http11.AbstractHttp11Processor.process(AbstractHttp11Processor.java:1201)
	at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:654)
	at org.apache.tomcat.util.net.JIoEndpoint$SocketProcessor.run(JIoEndpoint.java:319)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)
	at java.lang.Thread.run(Thread.java:748)Caused by: org.apache.tiles.util.TilesIOException: JSPException including path '/WEB-INF/jsp/mypage/bizReq/bizReqRcd/drm225R.jsp'.
	at org.apache.tiles.servlet.context.ServletUtil.wrapServletException(ServletUtil.java:241)
	at org.apache.tiles.jsp.context.JspTilesRequestContext.include(JspTilesRequestContext.java:105)
	at org.apache.tiles.jsp.context.JspTilesRequestContext.dispatch(JspTilesRequestContext.java:96)
	at org.apache.tiles.renderer.impl.TemplateAttributeRenderer.write(TemplateAttributeRenderer.java:44)
	at org.apache.tiles.renderer.impl.AbstractBaseAttributeRenderer.render(AbstractBaseAttributeRenderer.java:106)
	at org.apache.tiles.renderer.impl.ChainedDelegateAttributeRenderer.write(ChainedDelegateAttributeRenderer.java:76)
	at org.apache.tiles.renderer.impl.AbstractBaseAttributeRenderer.render(AbstractBaseAttributeRenderer.java:106)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:670)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:336)
	at org.apache.tiles.template.InsertAttributeModel.renderAttribute(InsertAttributeModel.java:210)
	at org.apache.tiles.template.InsertAttributeModel.end(InsertAttributeModel.java:126)
	at org.apache.tiles.jsp.taglib.InsertAttributeTag.doTag(InsertAttributeTag.java:311)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.layout.layout_005fmypage_005fc_jsp._jspx_meth_t_005finsertAttribute_005f4(layout_005fmypage_005fc_jsp.java:395)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.layout.layout_005fmypage_005fc_jsp._jspService(layout_005fmypage_005fc_jsp.java:136)
	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:71)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:477)
	... 95 moreCaused by: javax.servlet.ServletException: 파일 [/WEB-INF/jsp/mypage/bizReq/bizReqRcd/common/2025/RRC01001_cont.jsp]을(를) 찾을 수 없습니다.
	at org.apache.jasper.servlet.JspServlet.handleMissingResource(JspServlet.java:416)
	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:384)
	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:339)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.doInclude(ApplicationDispatcher.java:602)
	at org.apache.catalina.core.ApplicationDispatcher.include(ApplicationDispatcher.java:541)
	at org.apache.jasper.runtime.JspRuntimeLibrary.include(JspRuntimeLibrary.java:896)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.bizReq.bizReqRcd.drm225R_jsp._jspx_meth_form_005fform_005f0(drm225R_jsp.java:291)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.bizReq.bizReqRcd.drm225R_jsp._jspService(drm225R_jsp.java:100)
	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:71)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:477)
	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:395)
	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:339)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.doInclude(ApplicationDispatcher.java:602)
	at org.apache.catalina.core.ApplicationDispatcher.include(ApplicationDispatcher.java:541)
	at org.apache.jasper.runtime.JspRuntimeLibrary.include(JspRuntimeLibrary.java:896)
	at org.apache.jasper.runtime.PageContextImpl.doInclude(PageContextImpl.java:689)
	at org.apache.jasper.runtime.PageContextImpl.include(PageContextImpl.java:683)
	at org.apache.tiles.jsp.context.JspTilesRequestContext.include(JspTilesRequestContext.java:103)
	... 110 more
2월 27
     , 2025 1:14:34 오후 org.apache.catalina.core.ApplicationDispatcher invoke심각: 서블릿 [spring]을(를) 위한 Servlet.service() 호출이 예외를 발생시켰습니다.javax.servlet.ServletException: 파일 [/WEB-INF/jsp/mypage/bizReq/bizReqRcd/common/2025/RRC01001_cont.jsp]을(를) 찾을 수 없습니다.
	at org.apache.jasper.servlet.JspServlet.handleMissingResource(JspServlet.java:416)
	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:384)
	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:339)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.doInclude(ApplicationDispatcher.java:602)
	at org.apache.catalina.core.ApplicationDispatcher.include(ApplicationDispatcher.java:541)
	at org.apache.jasper.runtime.JspRuntimeLibrary.include(JspRuntimeLibrary.java:896)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.bizReq.bizReqRcd.drm225R_jsp._jspx_meth_form_005fform_005f0(drm225R_jsp.java:291)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.bizReq.bizReqRcd.drm225R_jsp._jspService(drm225R_jsp.java:100)
	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:71)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:477)
	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:395)
	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:339)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.doInclude(ApplicationDispatcher.java:602)
	at org.apache.catalina.core.ApplicationDispatcher.include(ApplicationDispatcher.java:541)
	at org.apache.jasper.runtime.JspRuntimeLibrary.include(JspRuntimeLibrary.java:896)
	at org.apache.jasper.runtime.PageContextImpl.doInclude(PageContextImpl.java:689)
	at org.apache.jasper.runtime.PageContextImpl.include(PageContextImpl.java:683)
	at org.apache.tiles.jsp.context.JspTilesRequestContext.include(JspTilesRequestContext.java:103)
	at org.apache.tiles.jsp.context.JspTilesRequestContext.dispatch(JspTilesRequestContext.java:96)
	at org.apache.tiles.renderer.impl.TemplateAttributeRenderer.write(TemplateAttributeRenderer.java:44)
	at org.apache.tiles.renderer.impl.AbstractBaseAttributeRenderer.render(AbstractBaseAttributeRenderer.java:106)
	at org.apache.tiles.renderer.impl.ChainedDelegateAttributeRenderer.write(ChainedDelegateAttributeRenderer.java:76)
	at org.apache.tiles.renderer.impl.AbstractBaseAttributeRenderer.render(AbstractBaseAttributeRenderer.java:106)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:670)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:336)
	at org.apache.tiles.template.InsertAttributeModel.renderAttribute(InsertAttributeModel.java:210)
	at org.apache.tiles.template.InsertAttributeModel.end(InsertAttributeModel.java:126)
	at org.apache.tiles.jsp.taglib.InsertAttributeTag.doTag(InsertAttributeTag.java:311)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.layout.layout_005fmypage_005fc_jsp._jspx_meth_t_005finsertAttribute_005f4(layout_005fmypage_005fc_jsp.java:395)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.layout.layout_005fmypage_005fc_jsp._jspService(layout_005fmypage_005fc_jsp.java:136)
	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:71)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:477)
	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:395)
	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:339)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:484)
	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:409)
	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:337)
	at org.apache.tiles.servlet.context.ServletTilesRequestContext.forward(ServletTilesRequestContext.java:241)
	at org.apache.tiles.servlet.context.ServletTilesRequestContext.dispatch(ServletTilesRequestContext.java:222)
	at org.apache.tiles.renderer.impl.TemplateAttributeRenderer.write(TemplateAttributeRenderer.java:44)
	at org.apache.tiles.renderer.impl.AbstractBaseAttributeRenderer.render(AbstractBaseAttributeRenderer.java:106)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:670)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:690)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:644)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:627)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:321)
	at org.springframework.web.servlet.view.tiles2.TilesView.renderMergedOutputModel(TilesView.java:124)
	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:264)
	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1216)
	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1001)
	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:945)
	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:867)
	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:951)
	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:853)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:647)
	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:827)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:484)
	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:409)
	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:337)
	at org.sdream.biz.control.MypageWrapperController.wrappingPM(MypageWrapperController.java:90)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:221)
	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)
	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)
	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandleMethod(RequestMappingHandlerAdapter.java:743)
	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:672)
	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:82)
	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:933)
	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:867)
	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:951)
	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:853)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:647)
	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:827)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.sdream.comm.filter.CrossScriptingFilter.doFilter(CrossScriptingFilter.java:55)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.sdream.comm.filter.AuthFilter.doFilter(AuthFilter.java:177)
	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:343)
	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:260)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.springframework.web.multipart.support.MultipartFilter.doFilterInternal(MultipartFilter.java:118)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:219)
	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:110)
	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:492)
	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:165)
	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:104)
	at org.apache.catalina.valves.AccessLogValve.invoke(AccessLogValve.java:1025)
	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:116)
	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:451)
	at org.apache.coyote.http11.AbstractHttp11Processor.process(AbstractHttp11Processor.java:1201)
	at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:654)
	at org.apache.tomcat.util.net.JIoEndpoint$SocketProcessor.run(JIoEndpoint.java:319)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)
	at java.lang.Thread.run(Thread.java:748)
2025-02-27 01:14:34 ERROR [org.sdream.comm.filter.AuthFilter] exception occurred : NestedServletException2025-02-27 01:14:34 DEBUG [org.sdream.comm.comp.EnvProfile] Environment is local : trueorg.springframework.web.util.NestedServletException: Request processing failed; nested exception is org.apache.tiles.impl.CannotRenderException: org.apache.tiles.util.TilesIOException: JSPException including path '/WEB-INF/jsp/mypage/bizReq/bizReqRcd/drm225R.jsp'.
	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:963)
	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:853)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:647)
	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:827)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:484)
	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:409)
	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:337)
	at org.sdream.biz.control.MypageWrapperController.wrappingPM(MypageWrapperController.java:90)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:221)
	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)
	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)
	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandleMethod(RequestMappingHandlerAdapter.java:743)
	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:672)
	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:82)
	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:933)
	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:867)
	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:951)
	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:853)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:647)
	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:827)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.sdream.comm.filter.CrossScriptingFilter.doFilter(CrossScriptingFilter.java:55)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.sdream.comm.filter.AuthFilter.doFilter(AuthFilter.java:177)
	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:343)
	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:260)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.springframework.web.multipart.support.MultipartFilter.doFilterInternal(MultipartFilter.java:118)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:219)
	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:110)
	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:492)
	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:165)
	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:104)
	at org.apache.catalina.valves.AccessLogValve.invoke(AccessLogValve.java:1025)
	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:116)
	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:451)
	at org.apache.coyote.http11.AbstractHttp11Processor.process(AbstractHttp11Processor.java:1201)
	at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:654)
	at org.apache.tomcat.util.net.JIoEndpoint$SocketProcessor.run(JIoEndpoint.java:319)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)
	at java.lang.Thread.run(Thread.java:748)Caused by: org.apache.tiles.impl.CannotRenderException: org.apache.tiles.util.TilesIOException: JSPException including path '/WEB-INF/jsp/mypage/bizReq/bizReqRcd/drm225R.jsp'.
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:692)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:644)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:627)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:321)
	at org.springframework.web.servlet.view.tiles2.TilesView.renderMergedOutputModel(TilesView.java:124)
	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:264)
	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1216)
	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1001)
	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:945)
	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:867)
	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:951)
	... 67 moreCaused by: java.io.IOException: org.apache.tiles.util.TilesIOException: JSPException including path '/WEB-INF/jsp/mypage/bizReq/bizReqRcd/drm225R.jsp'.
	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:505)
	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:395)
	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:339)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:484)
	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:409)
	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:337)
	at org.apache.tiles.servlet.context.ServletTilesRequestContext.forward(ServletTilesRequestContext.java:241)
	at org.apache.tiles.servlet.context.ServletTilesRequestContext.dispatch(ServletTilesRequestContext.java:222)
	at org.apache.tiles.renderer.impl.TemplateAttributeRenderer.write(TemplateAttributeRenderer.java:44)
	at org.apache.tiles.renderer.impl.AbstractBaseAttributeRenderer.render(AbstractBaseAttributeRenderer.java:106)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:670)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:690)
	... 77 moreCaused by: org.apache.tiles.util.TilesIOException: JSPException including path '/WEB-INF/jsp/mypage/bizReq/bizReqRcd/drm225R.jsp'.
	at org.apache.tiles.servlet.context.ServletUtil.wrapServletException(ServletUtil.java:241)
	at org.apache.tiles.jsp.context.JspTilesRequestContext.include(JspTilesRequestContext.java:105)
	at org.apache.tiles.jsp.context.JspTilesRequestContext.dispatch(JspTilesRequestContext.java:96)
	at org.apache.tiles.renderer.impl.TemplateAttributeRenderer.write(TemplateAttributeRenderer.java:44)
	at org.apache.tiles.renderer.impl.AbstractBaseAttributeRenderer.render(AbstractBaseAttributeRenderer.java:106)
	at org.apache.tiles.renderer.impl.ChainedDelegateAttributeRenderer.write(ChainedDelegateAttributeRenderer.java:76)
	at org.apache.tiles.renderer.impl.AbstractBaseAttributeRenderer.render(AbstractBaseAttributeRenderer.java:106)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:670)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:336)
	at org.apache.tiles.template.InsertAttributeModel.renderAttribute(InsertAttributeModel.java:210)
	at org.apache.tiles.template.InsertAttributeModel.end(InsertAttributeModel.java:126)
	at org.apache.tiles.jsp.taglib.InsertAttributeTag.doTag(InsertAttributeTag.java:311)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.layout.layout_005fmypage_005fc_jsp._jspx_meth_t_005finsertAttribute_005f4(layout_005fmypage_005fc_jsp.java:395)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.layout.layout_005fmypage_005fc_jsp._jspService(layout_005fmypage_005fc_jsp.java:136)
	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:71)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:477)
	... 95 moreCaused by: javax.servlet.ServletException: 파일 [/WEB-INF/jsp/mypage/bizReq/bizReqRcd/common/2025/RRC01001_cont.jsp]을(를) 찾을 수 없습니다.
	at org.apache.jasper.servlet.JspServlet.handleMissingResource(JspServlet.java:416)
	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:384)
	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:339)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.doInclude(ApplicationDispatcher.java:602)
	at org.apache.catalina.core.ApplicationDispatcher.include(ApplicationDispatcher.java:541)
	at org.apache.jasper.runtime.JspRuntimeLibrary.include(JspRuntimeLibrary.java:896)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.bizReq.bizReqRcd.drm225R_jsp._jspx_meth_form_005fform_005f0(drm225R_jsp.java:291)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.bizReq.bizReqRcd.drm225R_jsp._jspService(drm225R_jsp.java:100)
	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:71)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:477)
	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:395)
	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:339)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.doInclude(ApplicationDispatcher.java:602)
	at org.apache.catalina.core.ApplicationDispatcher.include(ApplicationDispatcher.java:541)
	at org.apache.jasper.runtime.JspRuntimeLibrary.include(JspRuntimeLibrary.java:896)
	at org.apache.jasper.runtime.PageContextImpl.doInclude(PageContextImpl.java:689)
	at org.apache.jasper.runtime.PageContextImpl.include(PageContextImpl.java:683)
	at org.apache.tiles.jsp.context.JspTilesRequestContext.include(JspTilesRequestContext.java:103)
	... 110 more2025-02-27 01:14:34 DEBUG [org.sdream.comm.comp.EnvProfile] Environment is local : true2025-02-27 01:14:34 ERROR [org.sdream.comm.service.impl.ErrServiceImpl] [saveErrorInfo] org.springframework.web.util.NestedServletException: Request processing failed; nested exception is org.apache.tiles.impl.CannotRenderException: org.apache.tiles.util.TilesIOException: JSPException including path '/WEB-INF/jsp/mypage/bizReq/bizReqRcd/drm225R.jsp'.
	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:963)
	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:853)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:647)
	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:827)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:484)
	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:409)
	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:337)
	at org.sdream.biz.control.MypageWrapperController.wrappingPM(MypageWrapperController.java:90)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:221)
	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)
	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)
	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandleMethod(RequestMappingHandlerAdapter.java:743)
	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:672)
	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:82)
	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:933)
	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:867)
	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:951)
	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:853)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:647)
	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:827)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.sdream.comm.filter.CrossScriptingFilter.doFilter(CrossScriptingFilter.java:55)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.sdream.comm.filter.AuthFilter.doFilter(AuthFilter.java:177)
	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:343)
	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:260)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.springframework.web.multipart.support.MultipartFilter.doFilterInternal(MultipartFilter.java:118)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88)
	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:219)
	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:110)
	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:492)
	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:165)
	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:104)
	at org.apache.catalina.valves.AccessLogValve.invoke(AccessLogValve.java:1025)
	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:116)
	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:451)
	at org.apache.coyote.http11.AbstractHttp11Processor.process(AbstractHttp11Processor.java:1201)
	at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:654)
	at org.apache.tomcat.util.net.JIoEndpoint$SocketProcessor.run(JIoEndpoint.java:319)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)
	at java.lang.Thread.run(Thread.java:748)Caused by: org.apache.tiles.impl.CannotRenderException: org.apache.tiles.util.TilesIOException: JSPException including path '/WEB-INF/jsp/mypage/bizReq/bizReqRcd/drm225R.jsp'.
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:692)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:644)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:627)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:321)
	at org.springframework.web.servlet.view.tiles2.TilesView.renderMergedOutputModel(TilesView.java:124)
	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:264)
	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1216)
	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1001)
	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:945)
	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:867)
	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:951)
	... 67 moreCaused by: java.io.IOException: org.apache.tiles.util.TilesIOException: JSPException including path '/WEB-INF/jsp/mypage/bizReq/bizReqRcd/drm225R.jsp'.
	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:505)
	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:395)
	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:339)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:484)
	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:409)
	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:337)
	at org.apache.tiles.servlet.context.ServletTilesRequestContext.forward(ServletTilesRequestContext.java:241)
	at org.apache.tiles.servlet.context.ServletTilesRequestContext.dispatch(ServletTilesRequestContext.java:222)
	at org.apache.tiles.renderer.impl.TemplateAttributeRenderer.write(TemplateAttributeRenderer.java:44)
	at org.apache.tiles.renderer.impl.AbstractBaseAttributeRenderer.render(AbstractBaseAttributeRenderer.java:106)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:670)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:690)
	... 77 moreCaused by: org.apache.tiles.util.TilesIOException: JSPException including path '/WEB-INF/jsp/mypage/bizReq/bizReqRcd/drm225R.jsp'.
	at org.apache.tiles.servlet.context.ServletUtil.wrapServletException(ServletUtil.java:241)
	at org.apache.tiles.jsp.context.JspTilesRequestContext.include(JspTilesRequestContext.java:105)
	at org.apache.tiles.jsp.context.JspTilesRequestContext.dispatch(JspTilesRequestContext.java:96)
	at org.apache.tiles.renderer.impl.TemplateAttributeRenderer.write(TemplateAttributeRenderer.java:44)
	at org.apache.tiles.renderer.impl.AbstractBaseAttributeRenderer.render(AbstractBaseAttributeRenderer.java:106)
	at org.apache.tiles.renderer.impl.ChainedDelegateAttributeRenderer.write(ChainedDelegateAttributeRenderer.java:76)
	at org.apache.tiles.renderer.impl.AbstractBaseAttributeRenderer.render(AbstractBaseAttributeRenderer.java:106)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:670)
	at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:336)
	at org.apache.tiles.template.InsertAttributeModel.renderAttribute(InsertAttributeModel.java:210)
	at org.apache.tiles.template.InsertAttributeModel.end(InsertAttributeModel.java:126)
	at org.apache.tiles.jsp.taglib.InsertAttributeTag.doTag(InsertAttributeTag.java:311)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.layout.layout_005fmypage_005fc_jsp._jspx_meth_t_005finsertAttribute_005f4(layout_005fmypage_005fc_jsp.java:395)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.layout.layout_005fmypage_005fc_jsp._jspService(layout_005fmypage_005fc_jsp.java:136)
	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:71)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:477)
	... 95 moreCaused by: javax.servlet.ServletException: 파일 [/WEB-INF/jsp/mypage/bizReq/bizReqRcd/common/2025/RRC01001_cont.jsp]을(를) 찾을 수 없습니다.
	at org.apache.jasper.servlet.JspServlet.handleMissingResource(JspServlet.java:416)
	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:384)
	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:339)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.doInclude(ApplicationDispatcher.java:602)
	at org.apache.catalina.core.ApplicationDispatcher.include(ApplicationDispatcher.java:541)
	at org.apache.jasper.runtime.JspRuntimeLibrary.include(JspRuntimeLibrary.java:896)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.bizReq.bizReqRcd.drm225R_jsp._jspx_meth_form_005fform_005f0(drm225R_jsp.java:291)
	at org.apache.jsp.WEB_002dINF.jsp.mypage.bizReq.bizReqRcd.drm225R_jsp._jspService(drm225R_jsp.java:100)
	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:71)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:477)
	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:395)
	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:339)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:728)
	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303)
	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208)
	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742)
	at org.apache.catalina.core.ApplicationDispatcher.doInclude(ApplicationDispatcher.java:602)
	at org.apache.catalina.core.ApplicationDispatcher.include(ApplicationDispatcher.java:541)
	at org.apache.jasper.runtime.JspRuntimeLibrary.include(JspRuntimeLibrary.java:896)
	at org.apache.jasper.runtime.PageContextImpl.doInclude(PageContextImpl.java:689)
	at org.apache.jasper.runtime.PageContextImpl.include(PageContextImpl.java:683)
	at org.apache.tiles.jsp.context.JspTilesRequestContext.include(JspTilesRequestContext.java:103)
	... 110 more
2025-02-27 01:14:34  INFO [jdbc.sqltiming] 
/* insertErr  */
INSERT INTO ERR ( ERR_SID 
     , ERR_CD 
     , ERR_CTN 
     , CONN_IP 
     , URL 
     , URI 
     , LCNS_SID 
     , LOGIN_SID 
     , RFRR 
     , PARAM 
     , SESS_INF 
     , ERR_STAT_CD 
     , ERR_MEMO 
     , ERR_ORG_MBR_SID 
     , DEL_YN 
     , MDF_PRS_SID 
     , MDF_DT_TM ) VALUES ( NULL 
     , 'ERC010' 
     , 'org.springframework.web.util.NestedServletException: Request processing failed; nested exception is org.apache.tiles.impl.CannotRenderException: org.apache.tiles.util.TilesIOException: JSPException including path ''/WEB-INF/jsp/mypage/bizReq/bizReqRcd/drm225R.jsp''. at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:963) at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:853) at javax.servlet.http.HttpServlet.service(HttpServlet.java:647) at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:827) at javax.servlet.http.HttpServlet.service(HttpServlet.java:728) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742) at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:484) at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:409) at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:337) at org.sdream.biz.control.MypageWrapperController.wrappingPM(MypageWrapperController.java:90) at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method) at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62) at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) at java.lang.reflect.Method.invoke(Method.java:498) at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:221) at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136) at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104) at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandleMethod(RequestMappingHandlerAdapter.java:743) at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:672) at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:82) at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:933) at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:867) at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:951) at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:853) at javax.servlet.http.HttpServlet.service(HttpServlet.java:647) at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:827) at javax.servlet.http.HttpServlet.service(HttpServlet.java:728) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.sdream.comm.filter.CrossScriptingFilter.doFilter(CrossScriptingFilter.java:55) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.sdream.comm.filter.AuthFilter.doFilter(AuthFilter.java:177) at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:343) at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:260) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.springframework.web.multipart.support.MultipartFilter.doFilterInternal(MultipartFilter.java:118) at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88) at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:219) at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:110) at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:492) at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:165) at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:104) at org.apache.catalina.valves.AccessLogValve.invoke(AccessLogValve.java:1025) at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:116) at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:451) at org.apache.coyote.http11.AbstractHttp11Processor.process(AbstractHttp11Processor.java:1201) at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:654) at org.apache.tomcat.util.net.JIoEndpoint$SocketProcessor.run(JIoEndpoint.java:319) at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149) at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624) at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61) at java.lang.Thread.run(Thread.java:748) Caused by: org.apache.tiles.impl.CannotRenderException: org.apache.tiles.util.TilesIOException: JSPException including path ''/WEB-INF/jsp/mypage/bizReq/bizReqRcd/drm225R.jsp''. at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:692) at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:644) at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:627) at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:321) at org.springframework.web.servlet.view.tiles2.TilesView.renderMergedOutputModel(TilesView.java:124) at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:264) at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1216) at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1001) at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:945) at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:867) at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:951) ... 67 more Caused by: java.io.IOException: org.apache.tiles.util.TilesIOException: JSPException including path ''/WEB-INF/jsp/mypage/bizReq/bizReqRcd/drm225R.jsp''. at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:505) at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:395) at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:339) at javax.servlet.http.HttpServlet.service(HttpServlet.java:728) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742) at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:484) at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:409) at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:337) at org.apache.tiles.servlet.context.ServletTilesRequestContext.forward(ServletTilesRequestContext.java:241) at org.apache.tiles.servlet.context.ServletTilesRequestContext.dispatch(ServletTilesRequestContext.java:222) at org.apache.tiles.renderer.impl.TemplateAttributeRenderer.write(TemplateAttributeRenderer.java:44) at org.apache.tiles.renderer.impl.AbstractBaseAttributeRenderer.render(AbstractBaseAttributeRenderer.java:106) at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:670) at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:690) ... 77 more Caused by: org.apache.tiles.util.TilesIOException: JSPException including path ''/WEB-INF/jsp/mypage/bizReq/bizReqRcd/drm225R.jsp''. at org.apache.tiles.servlet.context.ServletUtil.wrapServletException(ServletUtil.java:241) at org.apache.tiles.jsp.context.JspTilesRequestContext.include(JspTilesRequestContext.java:105) at org.apache.tiles.jsp.context.JspTilesRequestContext.dispatch(JspTilesRequestContext.java:96) at org.apache.tiles.renderer.impl.TemplateAttributeRenderer.write(TemplateAttributeRenderer.java:44) at org.apache.tiles.renderer.impl.AbstractBaseAttributeRenderer.render(AbstractBaseAttributeRenderer.java:106) at org.apache.tiles.renderer.impl.ChainedDelegateAttributeRenderer.write(ChainedDelegateAttributeRenderer.java:76) at org.apache.tiles.renderer.impl.AbstractBaseAttributeRenderer.render(AbstractBaseAttributeRenderer.java:106) at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:670) at org.apache.tiles.impl.BasicTilesContainer.render(BasicTilesContainer.java:336) at org.apache.tiles.template.InsertAttributeModel.renderAttribute(InsertAttributeModel.java:210) at org.apache.tiles.template.InsertAttributeModel.end(InsertAttributeModel.java:126) at org.apache.tiles.jsp.taglib.InsertAttributeTag.doTag(InsertAttributeTag.java:311) at org.apache.jsp.WEB_002dINF.jsp.mypage.layout.layout_005fmypage_005fc_jsp._jspx_meth_t_005finsertAttribute_005f4(layout_005fmypage_005fc_jsp.java:395) at org.apache.jsp.WEB_002dINF.jsp.mypage.layout.layout_005fmypage_005fc_jsp._jspService(layout_005fmypage_005fc_jsp.java:136) at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:71) at javax.servlet.http.HttpServlet.service(HttpServlet.java:728) at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:477) ... 95 more Caused by: javax.servlet.ServletException: 파일 [/WEB-INF/jsp/mypage/bizReq/bizReqRcd/common/2025/RRC01001_cont.jsp]을(를) 찾을 수 없습니다. at org.apache.jasper.servlet.JspServlet.handleMissingResource(JspServlet.java:416) at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:384) at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:339) at javax.servlet.http.HttpServlet.service(HttpServlet.java:728) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742) at org.apache.catalina.core.ApplicationDispatcher.doInclude(ApplicationDispatcher.java:602) at org.apache.catalina.core.ApplicationDispatcher.include(ApplicationDispatcher.java:541) at org.apache.jasper.runtime.JspRuntimeLibrary.include(JspRuntimeLibrary.java:896) at org.apache.jsp.WEB_002dINF.jsp.mypage.bizReq.bizReqRcd.drm225R_jsp._jspx_meth_form_005fform_005f0(drm225R_jsp.java:291) at org.apache.jsp.WEB_002dINF.jsp.mypage.bizReq.bizReqRcd.drm225R_jsp._jspService(drm225R_jsp.java:100) at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:71) at javax.servlet.http.HttpServlet.service(HttpServlet.java:728) at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:477) at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:395) at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:339) at javax.servlet.http.HttpServlet.service(HttpServlet.java:728) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:742) at org.apache.catalina.core.ApplicationDispatcher.doInclude(ApplicationDispatcher.java:602) at org.apache.catalina.core.ApplicationDispatcher.include(ApplicationDispatcher.java:541) at org.apache.jasper.runtime.JspRuntimeLibrary.include(JspRuntimeLibrary.java:896) at org.apache.jasper.runtime.PageContextImpl.doInclude(PageContextImpl.java:689) at org.apache.jasper.runtime.PageContextImpl.include(PageContextImpl.java:683) at org.apache.tiles.jsp.context.JspTilesRequestContext.include(JspTilesRequestContext.java:103) ... 110 more ' 
     , '0:0:0:0:0:0:0:1' 
     , NULL 
     , '/m/drm211R/L213' 
     , NULL 
     , 'dbwls176' 
     , 'http://localhost:8080/m/drm218gV/L213' 
     , ';
--------------------------------------------------
{
REQ_NO=[2025MT0101125973]}
     ,;
--------------------------------------------------
{
BIZ_RCD_PRD_SID=[RRC01001]}
     ,;
--------------------------------------------------
{
WRT_PRGS=[1]}
     ,;
--------------------------------------------------
{
A_CD=[2025MT0101125973]}' 
     , ';
--------------------------------------------------
{
U_ACC_CRT_CD=ACC010}
     ,;
--------------------------------------------------
{
U_MBR_ID=dbwls176}
     ,;
--------------------------------------------------
{
U_LOGIN_TIME_AT=N}
     ,;
--------------------------------------------------
{
U_BIRTH=1994-03-15 00:00:00.0}
     ,;
--------------------------------------------------
{
U_SEX_NM=여}
     ,;
--------------------------------------------------
{
U_LOGIN_YN=Y}
     ,;
--------------------------------------------------
{
U_MBR_NM=김유진}
     ,;
--------------------------------------------------
{
U_ORG_ROLE_NM=}
     ,;
--------------------------------------------------
{
U_LOGIN_TOKEN=rt9nvjSJot6Xhl9umkjkeU605A03weqnPOLqUW+Tzl0PT3WmHZR1AvlXs3GNB+TV}
     ,;
--------------------------------------------------
{
U_MBR_EMAIL=tngkr2tngkr@naver.com}
     ,;
--------------------------------------------------
{
U_SEX_CD=SEX020}
     ,;
--------------------------------------------------
{
U_AUTH_LIST=[;
--------------------------------------------------
{
bizStatCd=BSC050
     , bizTypeId=MT01
     , prod=1
     , bizId=MT012501
     , reqRoleCd=RRC010}]}
     ,;
--------------------------------------------------
{
U_LOGIN_TIME=2025
     , 02
     , 27
     , 13
     , 08
     , 38}
     ,;
--------------------------------------------------
{
U_LOGIN_CONN_IP=0:0:0:0:0:0:0:1}
     ,;
--------------------------------------------------
{
U_USER_AGENT=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36}
     ,;
--------------------------------------------------
{
U_MBR_CRT_CD_SET=[]}
     ,;
--------------------------------------------------
{
U_MBR_SID=MBR2411794}
     ,;
--------------------------------------------------
{
U_MEX_LIST=[MEX001
     , MEX200
     , MEX214
     , MEX218
     , MEX213
     , MEX250]}
     , ' 
     , NULL 
     , 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36' 
     , NULL 
     , 'N' 
     , 'MBR2411794' 
     , NOW() );
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:14:34 DEBUG [org.sdream.comm.service.impl.TraceServiceImpl] [saveLog] TraceDTO [seq=null
     , connDtTm=null
     , sessId=BA56432068070106FE766BFCD8F45124
     , hostNm=localhost
     , pathNm=test
     , pageNm=/merror
     , param=[dbwls176] 
     , fullUrl=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36
     , rfrr=http://localhost:8080/m/drm218gV/L213
     , connIp=0:0:0:0:0:0:0:1
     , mdfDtTm=null]2025-02-27 01:14:34  INFO [jdbc.sqltiming] 
/* customInsertTrace  */
INSERT INTO TRACE ( SESS_ID 
     , CONN_DT_TM 
     , HOST_NM 
     , PATH_NM 
     , PAGE_NM 
     , PARAM 
     , FULL_URL 
     , RFRR 
     , CONN_IP 
     , MDF_DT_TM ) VALUES ( IFNULL('BA56432068070106FE766BFCD8F45124'
     , '') 
     , NOW() 
     , 'localhost' 
     , 'test' 
     , '/merror' 
     , '[dbwls176] ' 
     , 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36' 
     , 'http://localhost:8080/m/drm218gV/L213' 
     , '0:0:0:0:0:0:0:1' 
     , NOW() );
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:14:34  INFO [jdbc.sqltiming] 
/* selectPageAuth2List  */
SELECT PAGE_URI 
     , MENU_EXP_CD 
     , FUNC_EXPL 
     , USED_DT_TM 
     , DEL_YN 
     , MDF_PRS_SID 
     , MDF_DT_TM
  FROM PAGE_AUTH_2
 WHERE 1=1
   AND PAGE_URI = '/merror'
   AND DEL_YN = 'N';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:16:28  INFO [jdbc.sqltiming]SELECT 1;
--------------------------------------------------
{
executed in 5 msec}2025-02-27 01:24:36 DEBUG [org.sdream.comm.service.impl.TraceServiceImpl] [saveLog] TraceDTO [seq=null
     , connDtTm=null
     , sessId=BA56432068070106FE766BFCD8F45124
     , hostNm=localhost
     , pathNm=test
     , pageNm=/m/drmFstMy18/L215
     , param=[dbwls176] 
     , fullUrl=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36
     , rfrr=http://localhost:8080/m/drm218gV/L213
     , connIp=0:0:0:0:0:0:0:1
     , mdfDtTm=null]2025-02-27 01:24:36  INFO [jdbc.sqltiming] 
/* customInsertTrace  */
INSERT INTO TRACE ( SESS_ID 
     , CONN_DT_TM 
     , HOST_NM 
     , PATH_NM 
     , PAGE_NM 
     , PARAM 
     , FULL_URL 
     , RFRR 
     , CONN_IP 
     , MDF_DT_TM ) VALUES ( IFNULL('BA56432068070106FE766BFCD8F45124'
     , '') 
     , NOW() 
     , 'localhost' 
     , 'test' 
     , '/m/drmFstMy18/L215' 
     , '[dbwls176] ' 
     , 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36' 
     , 'http://localhost:8080/m/drm218gV/L213' 
     , '0:0:0:0:0:0:0:1' 
     , NOW() );
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:24:36  INFO [jdbc.sqltiming] 
/* selectPageAuth2List  */
SELECT PAGE_URI 
     , MENU_EXP_CD 
     , FUNC_EXPL 
     , USED_DT_TM 
     , DEL_YN 
     , MDF_PRS_SID 
     , MDF_DT_TM
  FROM PAGE_AUTH_2
 WHERE 1=1
   AND PAGE_URI = '/m/drmFstMy18/L215'
   AND DEL_YN = 'N';
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:24:36  INFO [jdbc.sqltiming] /* selectMtBizReqMbrInfByMypage - BIZ_REQ_MBR_INF테이블 마이페이지 선정자 확인 */SELECT B.BIZ_YR AS bizYr
     , B.BIZ_ID AS bizId
     , B.BIZ_TYPE_ID AS bizTypeId
     , B.PROD AS prod
     , S.SCHL_NM AS schlNm
     , M.MBR_ID AS mbrId
     , M.BIRTH AS birth
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , BRMI.REQ_NO AS reqNo
     , BRMI.MBR_SID AS mbrSid
     , BRMI.MBR_DIV AS mbrDiv
     , BRMI.LOG_SEQ AS logSeq
     , DEC2(BRMI.NM) AS nm
     , DEC2(BRMI.PHN_NO) AS phnNo
     , DEC2(BRMI.MOPHN_NO) AS mophnNo
     , BRMI.SCHL_SID AS schlSid
     , BRMI.GRADE AS grade
     , BRMI.FML_REL_CD AS fmlRelCd
     , BRMI.BANK AS bank
     , DEC2(BRMI.ACCNT) AS accnt
     , BRMI.REG_PRS_SID AS regPrsSid
     , BRMI.REG_DT_TM AS regDtTm
     , BRMI.REG_PRS_IP AS regPrsIp
     , BRMI.MDF_PRS_SID AS mdfPrsSid
     , BRMI.MDF_DT_TM AS mdfDtTm
     , BRMI.DEL_YN AS delYn
     , BRMI.CHK_YN AS chkYn
     , BRMI.CHK_DT_TM AS chkDtTm
     , BRMI.MBR_MOD_DT_TM AS mbrModDtTm
     , BRMI.PROG_SVY_1_DT_TM AS progSvy1DtTm
     , BRMI.PROG_SVY_2_DT_TM AS progSvy2DtTm
     , DEC2(BRMI.UGT_CTT) AS ugtCtt
  FROM BIZ_REQ_MBR_INF BRMI
 INNER JOIN
       BIZ_REQ BR
    ON BRMI.REQ_NO = BR.REQ_NO
   AND BR.DEL_YN = 'N'
 INNER JOIN
       BIZ B
    ON BR.BIZ_ID = B.BIZ_ID
   AND B.DEL_YN = 'N' LEFT JOIN SCHL S
    ON BRMI.SCHL_SID = S.SCHL_SID LEFT JOIN MBR M
    ON BRMI.MBR_SID = M.MBR_SID
 WHERE B.BIZ_STAT_CD = 'BSC050' /* 사업상태-진행중 */
   AND BRMI.MBR_DIV = 'RRC010' /* 멘토
     , 멘티 */
   AND BRMI.MBR_SID = 'MBR2411794' 
/* SID 
 */
   AND B.BIZ_TYPE_ID IN ('MT01'
     , 'MT02') 
/* 사업그룹  */
   AND BR.BIZ_REQ_STAT_CD = 'BRS020' /* 멘토 - 선정 */;
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:24:36 DEBUG [org.sdream.comm.service.impl.TraceServiceImpl] [saveLog] TraceDTO [seq=null
     , connDtTm=null
     , sessId=BA56432068070106FE766BFCD8F45124
     , hostNm=localhost
     , pathNm=test
     , pageNm=/m/getMtProgGrpMyList
     , param=[dbwls176] 
     , fullUrl=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36
     , rfrr=http://localhost:8080/m/drmFstMy18/L215
     , connIp=0:0:0:0:0:0:0:1
     , mdfDtTm=null]2025-02-27 01:24:36  INFO [jdbc.sqltiming] 
/* customInsertTrace  */
INSERT INTO TRACE ( SESS_ID 
     , CONN_DT_TM 
     , HOST_NM 
     , PATH_NM 
     , PAGE_NM 
     , PARAM 
     , FULL_URL 
     , RFRR 
     , CONN_IP 
     , MDF_DT_TM ) VALUES ( IFNULL('BA56432068070106FE766BFCD8F45124'
     , '') 
     , NOW() 
     , 'localhost' 
     , 'test' 
     , '/m/getMtProgGrpMyList' 
     , '[dbwls176] ' 
     , 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36' 
     , 'http://localhost:8080/m/drmFstMy18/L215' 
     , '0:0:0:0:0:0:0:1' 
     , NOW() );
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:24:36  INFO [jdbc.sqltiming] 
/* selectPageAuth2List  */
SELECT PAGE_URI 
     , MENU_EXP_CD 
     , FUNC_EXPL 
     , USED_DT_TM 
     , DEL_YN 
     , MDF_PRS_SID 
     , MDF_DT_TM
  FROM PAGE_AUTH_2
 WHERE 1=1
   AND PAGE_URI = '/m/getMtProgGrpMyList'
   AND DEL_YN = 'N';
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:24:37  INFO [jdbc.sqltiming] /* selectMtBizReqMbrInfByPk - BIZ_REQ_MBR_INF테이블 PK로 조회 */SELECT GETCDNM(BRMI.BANK) AS bankNm
     , S.SCHL_NM AS schlNm
     , M.MBR_ID AS mbrId
     , BRMI.REQ_NO AS reqNo
     , BRMI.MBR_SID AS mbrSid
     , BRMI.MBR_DIV AS mbrDiv
     , BRMI.LOG_SEQ AS logSeq
     , DEC2(BRMI.NM) AS nm
     , DEC2(BRMI.PHN_NO) AS phnNo
     , DEC2(BRMI.MOPHN_NO) AS mophnNo
     , BRMI.SCHL_SID AS schlSid
     , BRMI.GRADE AS grade
     , BRMI.FML_REL_CD AS fmlRelCd
     , BRMI.BANK AS bank
     , DEC2(BRMI.ACCNT) AS accnt
     , BRMI.REG_PRS_SID AS regPrsSid
     , BRMI.REG_DT_TM AS regDtTm
     , BRMI.REG_PRS_IP AS regPrsIp
     , BRMI.MDF_PRS_SID AS mdfPrsSid
     , BRMI.MDF_DT_TM AS mdfDtTm
     , BRMI.DEL_YN AS delYn
     , BRMI.CHK_YN AS chkYn
     , BRMI.CHK_DT_TM AS chkDtTm
     , BRMI.MBR_MOD_DT_TM AS mbrModDtTm
     , BRMI.PROG_SVY_1_DT_TM AS progSvy1DtTm
     , BRMI.PROG_SVY_2_DT_TM AS progSvy2DtTm
     , DEC2(BRMI.UGT_CTT) AS ugtCtt
  FROM BIZ_REQ_MBR_INF BRMI
 INNER JOIN
       BIZ_REQ BR
    ON BRMI.REQ_NO = BR.REQ_NO
   AND BR.DEL_YN = 'N'
 INNER JOIN
       BIZ B
    ON BR.BIZ_ID = B.BIZ_ID
   AND B.DEL_YN = 'N' LEFT JOIN SCHL S
    ON BRMI.SCHL_SID = S.SCHL_SID LEFT JOIN MBR M
    ON BRMI.MBR_SID = M.MBR_SID
 WHERE BRMI.DEL_YN = 'N'
   AND BRMI.REQ_NO = NULL
   AND BRMI.MBR_SID = 'MBR2411794';
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:24:37  INFO [jdbc.sqltiming] /* selectMtProgGrpMyList - PROG_GRP테이블 마이페이지 리스트조회 */SELECT PG.PROG_GRP_CD AS progGrpCd
     , PG.PROG_GRP_NM AS progGrpNm
     , CASE WHEN PG.EXP_ENDDE IS NOT NULL
   AND PG.EXP_ENDDE != '' THEN CONCAT(DATE_FORMAT(PG.BGNDE
     , '%Y-%m-%d')
     , ' ~ '
     , DATE_FORMAT(PG.EXP_ENDDE
     , '%Y-%m-%d')) ELSE CONCAT(DATE_FORMAT(PG.BGNDE
     , '%Y-%m-%d')
     , ' ~ '
     , DATE_FORMAT(PG.ENDDE
     , '%Y-%m-%d')) END AS progDtStr
     , CASE WHEN PG.PROG_STAT_TXT IS NOT NULL
   AND PG.PROG_STAT_TXT != '' THEN PG.PROG_STAT_TXT WHEN DATE_FORMAT(PG.BGNDE
     , '%Y-%m-%d 00:00:00') <= NOW()
   AND DATE_FORMAT(PG.ENDDE
     , '%Y-%m-%d 23:59:59') > NOW() THEN '접수중' ELSE '접수마감' END AS progStat
     , PG.PAGE_URI AS pageUri
  FROM (SELECT P.PROG_GRP_CD
  FROM PROG P
     , PROG_BIZ_TRG PBT
 WHERE P.PROG_SID = PBT.PROG_SID
   AND P.OPEN_YN = 'Y'
   AND P.EXP_YN = 'Y'
   AND PBT.DEL_YN = 'N'
   AND ( (PBT.BIZ_ID = 'MT012501'
   AND PBT.REQ_ROLE_CD = 'RRC010') ) 
/* 임시처리  */
 UNIONSELECT PT.PROG_GRP_CD
  FROM PROG_TRGR PT
 WHERE PT.PROG_GRP_CD = 'PGC019'
   AND PT.BIZ_ID IN( 'MT012501' )
   AND PT.TRGR_SID = 'MBR2411794'
   AND PT.TRG_YN = 'Y' UNIONSELECT P.PROG_GRP_CD
  FROM PROG_TRGR PT
     , PROG P
 WHERE PT.PROG_SID = P.PROG_SID
   AND PT.TRG_YN = 'Y'
   AND P.OPEN_YN = 'N'
   AND P.EXP_YN = 'Y'
   AND PT.BIZ_ID IN( 'MT012501' )
   AND PT.TRGR_SID = 'MBR2411794' )ZZ
     , PROG_GRP PG
 WHERE ZZ.PROG_GRP_CD = PG.PROG_GRP_CD
   AND PG.EXP_YN = 'Y'
 ORDER BY 
       PG.ALIG_NUM ASC
     , CASE WHEN PG.BGNDE <= NOW()
   AND PG.ENDDE > NOW() THEN 1 ELSE 2 END ASC
     , PG.BGNDE DESC;
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:24:38 DEBUG [org.sdream.comm.service.impl.TraceServiceImpl] [saveLog] TraceDTO [seq=null
     , connDtTm=null
     , sessId=BA56432068070106FE766BFCD8F45124
     , hostNm=localhost
     , pathNm=test
     , pageNm=/m/drmFstMy19/L215
     , param=[dbwls176];
--------------------------------------------------
{
PROG_GRP_CD=[PGC084]}
     , fullUrl=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36
     , rfrr=http://localhost:8080/m/drmFstMy18/L215
     , connIp=0:0:0:0:0:0:0:1
     , mdfDtTm=null]2025-02-27 01:24:38  INFO [jdbc.sqltiming] 
/* customInsertTrace  */
INSERT INTO TRACE ( SESS_ID 
     , CONN_DT_TM 
     , HOST_NM 
     , PATH_NM 
     , PAGE_NM 
     , PARAM 
     , FULL_URL 
     , RFRR 
     , CONN_IP 
     , MDF_DT_TM ) VALUES ( IFNULL('BA56432068070106FE766BFCD8F45124'
     , '') 
     , NOW() 
     , 'localhost' 
     , 'test' 
     , '/m/drmFstMy19/L215' 
     , '[dbwls176];
--------------------------------------------------
{
PROG_GRP_CD=[PGC084]}' 
     , 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36' 
     , 'http://localhost:8080/m/drmFstMy18/L215' 
     , '0:0:0:0:0:0:0:1' 
     , NOW() );
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:24:38  INFO [jdbc.sqltiming] 
/* selectPageAuth2List  */
SELECT PAGE_URI 
     , MENU_EXP_CD 
     , FUNC_EXPL 
     , USED_DT_TM 
     , DEL_YN 
     , MDF_PRS_SID 
     , MDF_DT_TM
  FROM PAGE_AUTH_2
 WHERE 1=1
   AND PAGE_URI = '/m/drmFstMy19/L215'
   AND DEL_YN = 'N';
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:24:38  INFO [jdbc.sqltiming] /* selectMtBizReqMbrInfByMypage - BIZ_REQ_MBR_INF테이블 마이페이지 선정자 확인 */SELECT B.BIZ_YR AS bizYr
     , B.BIZ_ID AS bizId
     , B.BIZ_TYPE_ID AS bizTypeId
     , B.PROD AS prod
     , S.SCHL_NM AS schlNm
     , M.MBR_ID AS mbrId
     , M.BIRTH AS birth
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , BRMI.REQ_NO AS reqNo
     , BRMI.MBR_SID AS mbrSid
     , BRMI.MBR_DIV AS mbrDiv
     , BRMI.LOG_SEQ AS logSeq
     , DEC2(BRMI.NM) AS nm
     , DEC2(BRMI.PHN_NO) AS phnNo
     , DEC2(BRMI.MOPHN_NO) AS mophnNo
     , BRMI.SCHL_SID AS schlSid
     , BRMI.GRADE AS grade
     , BRMI.FML_REL_CD AS fmlRelCd
     , BRMI.BANK AS bank
     , DEC2(BRMI.ACCNT) AS accnt
     , BRMI.REG_PRS_SID AS regPrsSid
     , BRMI.REG_DT_TM AS regDtTm
     , BRMI.REG_PRS_IP AS regPrsIp
     , BRMI.MDF_PRS_SID AS mdfPrsSid
     , BRMI.MDF_DT_TM AS mdfDtTm
     , BRMI.DEL_YN AS delYn
     , BRMI.CHK_YN AS chkYn
     , BRMI.CHK_DT_TM AS chkDtTm
     , BRMI.MBR_MOD_DT_TM AS mbrModDtTm
     , BRMI.PROG_SVY_1_DT_TM AS progSvy1DtTm
     , BRMI.PROG_SVY_2_DT_TM AS progSvy2DtTm
     , DEC2(BRMI.UGT_CTT) AS ugtCtt
  FROM BIZ_REQ_MBR_INF BRMI
 INNER JOIN
       BIZ_REQ BR
    ON BRMI.REQ_NO = BR.REQ_NO
   AND BR.DEL_YN = 'N'
 INNER JOIN
       BIZ B
    ON BR.BIZ_ID = B.BIZ_ID
   AND B.DEL_YN = 'N' LEFT JOIN SCHL S
    ON BRMI.SCHL_SID = S.SCHL_SID LEFT JOIN MBR M
    ON BRMI.MBR_SID = M.MBR_SID
 WHERE B.BIZ_STAT_CD = 'BSC050' /* 사업상태-진행중 */
   AND BRMI.MBR_DIV = 'RRC010' /* 멘토
     , 멘티 */
   AND BRMI.MBR_SID = 'MBR2411794' 
/* SID 
 */
   AND B.BIZ_TYPE_ID IN ('MT01'
     , 'MT02') 
/* 사업그룹  */
   AND BR.BIZ_REQ_STAT_CD = 'BRS020' /* 멘토 - 선정 */;
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:24:38  INFO [jdbc.sqltiming] /* selectMtProgByMypage - PROG테이블 마이페이지 조회 */SELECT P.PROG_SID AS progSid
     , P.PROG_GRP_CD AS progGrpCd
     , P.PROG_YR AS progYr
     , P.PROG_DIV_NM AS progDivNm
     , P.PROG_PROD AS progProd
     , P.ALIG_NUM AS aligNum
     , P.PROG_NM AS progNm
     , P.ATT_PRD_CTN AS attPrdCtn
     , P.DT_TM_CTN AS dtTmCtn
     , P.LOC_CTN AS locCtn
     , P.DTL_CTN AS dtlCtn
     , P.HDCNT AS hdcnt
     , P.WTNG_CNT AS wtngCnt
     , P.EXP_YN AS expYn
     , P.OPEN_YN AS openYn
     , P.REG_DIV AS regDiv
     , P.GDCC_EXP_YN AS gdccExpYn
     , P.MDF_YN AS mdfYn
     , P.FILE_SID AS fileSid
     , P.ST_TIME AS stTime
     , P.END_TIME AS endTime
     , P.REG_PRS_SID AS regPrsSid
     , P.REG_DT_TM AS regDtTm
     , P.REG_PRS_IP AS regPrsIp
     , P.MDF_PRS_SID AS mdfPrsSid
     , P.MDF_DT_TM AS mdfDtTm
     , P.DIV_CD_1 AS divCd1
     , P.UNV_PROG_ADM_YN AS unvProgAdmYn
     , P.PROG_STAT_CD AS progStatCd
  FROM PROG P
 WHERE P.PROG_GRP_CD = 'PGC084'
   AND P.PROG_YR = '2025';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:24:38  INFO [jdbc.sqltiming] /* selectMtProgReqByMypage - PROG_REQ테이블 마이페이지 프로그램 신청확인 */SELECT P.PROG_PROD AS progProd
     , P.PROG_NM AS progNm
     , P.DT_TM_CTN AS dtTmCtn
     , PRAF.ATT_FILE_SID AS attFileSid
     , SUBSTRING_INDEX(DEC2(PR.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(PR.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , GETCDNM(PR.REQ_STAT_CD) AS reqStatCdNm
     , PR.PROG_REQ_SID AS progReqSid
     , PR.PROG_SID AS progSid
     , DEC2(PR.REQ_PRS_NM) AS reqPrsNm
     , PR.BIRTH AS birth
     , PR.GRADE AS grade
     , PR.AFL AS afl
     , PR.POS AS pos
     , DEC2(PR.PHN_NO) AS phnNo
     , DEC2(PR.EMAIL) AS email
     , PR.PO_YN AS poYn
     , PR.POST_NO AS postNo
     , PR.NUM_ADDR AS numAddr
     , PR.ROAD_ADDR AS roadAddr
     , PR.DTL_ADDR AS dtlAddr
     , PR.REQ_YN AS reqYn
     , PR.STD_REQ_YN AS stdReqYn
     , PR.SEX_CD AS sexCd
     , PR.ATTD_YN AS attdYn
     , PR.COMPL_YN AS complYn
     , PR.REQ_CTN_1 AS reqCtn1
     , PR.REQ_CTN_2 AS reqCtn2
     , PR.DIV_CD_1 AS divCd1
     , PR.DIV_CD_2 AS divCd2
     , PR.BIZ_REQ_SEQ AS bizReqSeq
     , PR.BUT_BIZ_TYPE_CD AS butBizTypeCd
     , PR.BUT_BIZ_DTL_PART_CD AS butBizDtlPartCd
     , PR.REQ_STAT_NUM AS reqStatNum
     , PR.REQ_STAT_CD AS reqStatCd
     , PR.ETC_NUM_NM AS etcNumNm
     , PR.REG_PRS_SID AS regPrsSid
     , PR.REG_DT_TM AS regDtTm
     , PR.REG_PRS_IP AS regPrsIp
     , PR.MDF_PRS_SID AS mdfPrsSid
     , PR.MDF_DT_TM AS mdfDtTm
     , PR.CNCL_YN AS cnclYn
     , PR.RSDN_TYPE_CD AS rsdnTypeCd
     , PR.RAT_DIV AS ratDiv
     , PR.RST_CTN AS rstCtn
     , DEC2(PR.MOPHN_NO) AS mophnNo
     , DEC2(PR.IHIDNUM) AS ihidnum
     , PR.PRD AS prd
     , PR.MAJ AS maj
     , PR.SCRE_DIV_NM_1 AS screDivNm1
     , PR.SCRE_CRD_1 AS screCrd1
     , PR.SCRE_MAX_SCR_1 AS screMaxScr1
     , PR.SCRE_DIV_NM_2 AS screDivNm2
     , PR.SCRE_CRD_2 AS screCrd2
     , PR.SCRE_MAX_SCR_2 AS screMaxScr2
     , PR.REQ_CTN_3 AS reqCtn3
     , PR.YR AS yr
     , PR.REQ_NO AS reqNo
     , PR.RD10_REQ_NO AS rd10ReqNo
     , DEC2(PR.BANK_NM) AS bankNm
     , DEC2(PR.ACCNT_NO) AS accntNo
     , DEC2(PR.DEP_OWN) AS depOwn
     , PR.BANK_DIV AS bankDiv
     , PR.BANK_CD AS bankCd
     , PR.BANK_ADDR AS bankAddr
     , PR.EVAL_CMN_SID_1 AS evalCmnSid1
     , PR.EVAL_1_A AS eval1A
     , PR.EVAL_1_B AS eval1B
     , PR.EVAL_1_C AS eval1C
     , PR.EVAL_SCR_1 AS evalScr1
     , PR.EVAL_CTN_1 AS evalCtn1
     , PR.EVAL_CMN_SID_2 AS evalCmnSid2
     , PR.EVAL_2_A AS eval2A
     , PR.EVAL_2_B AS eval2B
     , PR.EVAL_2_C AS eval2C
     , PR.EVAL_SCR_2 AS evalScr2
     , PR.EVAL_CTN_2 AS evalCtn2
     , PR.NAT AS nat
     , PR.REQ_CTN_7 AS reqCtn7
     , PR.REQ_CTN_6 AS reqCtn6
     , PR.REQ_CTN_5 AS reqCtn5
     , PR.REQ_CTN_4 AS reqCtn4
     , PR.REQ_PRS_SID AS reqPrsSid
     , PR.CALC_YN AS calcYn
     , (SELECT PROG_YR
  FROM PROG P
 WHERE PROG_SID = PR.PROG_SID ) AS progYr
  FROM PROG_REQ PR
 INNER JOIN
       PROG P
    ON PR.PROG_SID = P.PROG_SID LEFT JOIN PROG_REQ_ATT_FILE PRAF
    ON PRAF.PROG_REQ_SID = PR.PROG_REQ_SID
 WHERE P.PROG_GRP_CD = 'PGC084'
   AND P.PROG_YR = '2025'
   AND PR.REG_PRS_SID = 'MBR2411794';
--------------------------------------------------
{
executed in 12 msec}2025-02-27 01:24:38  INFO [jdbc.sqltiming] /* selectMtProgMentoClubAplByPk - PROG_MENTO_CLUB_APL테이블 PK로 조회 */SELECT GETCDNM(PMCA.BANK_CD) AS bankCdNm
     , IFNULL(FORMAT(PMCA.REQ_AOM
     , 0)
     , 0) AS reqAomCom
     , IFNULL(FORMAT(PMCA.SAM_AOM
     , 0)
     , 0) AS samAomCom
     , (SELECT FILE_NM
  FROM FILE_MGT FM
 WHERE FM.FILE_SID = PMCA.PO_FILE_SID
   AND FM.DEL_YN = 'N') AS poFileNm
     , PMCA.PROG_REQ_SID AS progReqSid
     , PMCA.AFL_SCHL_SID AS aflSchlSid
     , DEC2(PMCA.MOPHN_NO) AS mophnNo
     , PMCA.ACTV_SUB_CTN AS actvSubCtn
     , PMCA.ACTV_ST_DT AS actvStDt
     , PMCA.ACTV_END_DT AS actvEndDt
     , PMCA.MENTO_ACTV_HDCNT AS mentoActvHdcnt
     , PMCA.TCH_ACTV_HDCNT AS tchActvHdcnt
     , PMCA.EXPT_EFCT_CTN AS exptEfctCtn
     , DEC2(PMCA.DEP_OWN) AS depOwn
     , DEC2(PMCA.ACCNT_NO) AS accntNo
     , PMCA.BANK_CD AS bankCd
     , PMCA.PO_FILE_SID AS poFileSid
     , PMCA.SELT_YN AS seltYn
     , PMCA.REQ_AOM AS reqAom
     , PMCA.SAM_AOM AS samAom
     , PMCA.GDCC_CTN AS gdccCtn
     , PMCA.DEL_YN AS delYn
     , PMCA.REG_PRS_SID AS regPrsSid
     , PMCA.REG_DT_TM AS regDtTm
     , PMCA.MDF_PRS_SID AS mdfPrsSid
     , PMCA.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_APL PMCA
 WHERE PMCA.DEL_YN = 'N'
   AND PMCA.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:24:38  INFO [jdbc.sqltiming] /* selectMtProgMentoClubVrfByPk - PROG_MENTO_CLUB_VRF테이블 PK로 조회 */SELECT PMCV.PROG_REQ_SID AS progReqSid
     , PMCV.DOC_CMN_1_SID AS docCmn1Sid
     , PMCV.DOC_CMN_2_SID AS docCmn2Sid
     , PMCV.INV_CMN_1_SID AS invCmn1Sid
     , PMCV.INV_CMN_2_SID AS invCmn2Sid
     , PMCV.DOC_CMN_1_EVAL_SCR AS docCmn1EvalScr
     , PMCV.DOC_CMN_2_EVAL_SCR AS docCmn2EvalScr
     , PMCV.INV_CMN_1_EVAL AS invCmn1Eval
     , PMCV.INV_CMN_2_EVAL AS invCmn2Eval
     , PMCV.DOC_CMN_1_GNRV AS docCmn1Gnrv
     , PMCV.DOC_CMN_2_GNRV AS docCmn2Gnrv
     , PMCV.INV_CMN_1_GNRV AS invCmn1Gnrv
     , PMCV.INV_CMN_2_GNRV AS invCmn2Gnrv
     , PMCV.DOC_CMN_1_UNQ AS docCmn1Unq
     , PMCV.DOC_CMN_2_UNQ AS docCmn2Unq
     , PMCV.INV_CMN_1_UNQ AS invCmn1Unq
     , PMCV.INV_CMN_2_UNQ AS invCmn2Unq
     , PMCV.DOC_CMN_1_RVW_DT_TM AS docCmn1RvwDtTm
     , PMCV.DOC_CMN_2_RVW_DT_TM AS docCmn2RvwDtTm
     , PMCV.INV_CMN_1_RVW_DT_TM AS invCmn1RvwDtTm
     , PMCV.INV_CMN_2_RVW_DT_TM AS invCmn2RvwDtTm
     , PMCV.VRF_REQ_NO AS vrfReqNo
     , PMCV.PART_PROG AS partProg
     , PMCV.UNQ AS unq
     , PMCV.RVW_TRG_YN AS rvwTrgYn
     , PMCV.DOC_RST_CD AS docRstCd
     , PMCV.INV_TM AS invTm
     , PMCV.DEL_YN AS delYn
     , PMCV.REG_PRS_SID AS regPrsSid
     , PMCV.REG_DT_TM AS regDtTm
     , PMCV.MDF_PRS_SID AS mdfPrsSid
     , PMCV.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_VRF PMCV
 WHERE PMCV.DEL_YN = 'N' 
   AND PMCV.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 12 msec}2025-02-27 01:24:38  INFO [jdbc.sqltiming] /* selectMtProgMentoClubRstRptByPk - PROG_MENTO_CLUB_RST_RPT테이블 PK로 조회 */SELECT (SELECT FM.FILE_NM 
  FROM FILE_MGT FM
 WHERE FM.FILE_SID = PMCRR.SETT_FILE_SID
   AND FM.DEL_YN = 'N') AS settFileNm
     , SUBSTRING_INDEX(DEC2(PMCRR.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(PMCRR.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , PMCRR.PROG_REQ_SID AS progReqSid
     , PMCRR.AFL_SCHL_SID AS aflSchlSid
     , DEC2(PMCRR.MOPHN_NO) AS mophnNo
     , PMCRR.ACTV_RST_CTN AS actvRstCtn
     , PMCRR.SETT_FILE_SID AS settFileSid
     , PMCRR.COMM_STAT_CD AS commStatCd
     , PMCRR.REG_PRS_SID AS regPrsSid
     , PMCRR.REG_DT_TM AS regDtTm
     , PMCRR.MDF_PRS_SID AS mdfPrsSid
     , PMCRR.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_RST_RPT PMCRR 
WHERE PMCRR.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:24:44 DEBUG [org.sdream.comm.service.impl.TraceServiceImpl] [saveLog] TraceDTO [seq=null
     , connDtTm=null
     , sessId=BA56432068070106FE766BFCD8F45124
     , hostNm=localhost
     , pathNm=test
     , pageNm=/m/drmFstMy20/L215
     , param=[dbwls176] 
     , fullUrl=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36
     , rfrr=http://localhost:8080/m/drmFstMy19/L215?PROG_GRP_CD=PGC084
     , connIp=0:0:0:0:0:0:0:1
     , mdfDtTm=null]2025-02-27 01:24:44  INFO [jdbc.sqltiming] 
/* customInsertTrace  */
INSERT INTO TRACE ( SESS_ID 
     , CONN_DT_TM 
     , HOST_NM 
     , PATH_NM 
     , PAGE_NM 
     , PARAM 
     , FULL_URL 
     , RFRR 
     , CONN_IP 
     , MDF_DT_TM ) VALUES ( IFNULL('BA56432068070106FE766BFCD8F45124'
     , '') 
     , NOW() 
     , 'localhost' 
     , 'test' 
     , '/m/drmFstMy20/L215' 
     , '[dbwls176] ' 
     , 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36' 
     , 'http://localhost:8080/m/drmFstMy19/L215?PROG_GRP_CD=PGC084' 
     , '0:0:0:0:0:0:0:1' 
     , NOW() );
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:24:44  INFO [jdbc.sqltiming] 
/* selectPageAuth2List  */
SELECT PAGE_URI 
     , MENU_EXP_CD 
     , FUNC_EXPL 
     , USED_DT_TM 
     , DEL_YN 
     , MDF_PRS_SID 
     , MDF_DT_TM
  FROM PAGE_AUTH_2
 WHERE 1=1
   AND PAGE_URI = '/m/drmFstMy20/L215'
   AND DEL_YN = 'N';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:24:44  INFO [jdbc.sqltiming] /* selectMtBizReqMbrInfByMypage - BIZ_REQ_MBR_INF테이블 마이페이지 선정자 확인 */SELECT B.BIZ_YR AS bizYr
     , B.BIZ_ID AS bizId
     , B.BIZ_TYPE_ID AS bizTypeId
     , B.PROD AS prod
     , S.SCHL_NM AS schlNm
     , M.MBR_ID AS mbrId
     , M.BIRTH AS birth
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , BRMI.REQ_NO AS reqNo
     , BRMI.MBR_SID AS mbrSid
     , BRMI.MBR_DIV AS mbrDiv
     , BRMI.LOG_SEQ AS logSeq
     , DEC2(BRMI.NM) AS nm
     , DEC2(BRMI.PHN_NO) AS phnNo
     , DEC2(BRMI.MOPHN_NO) AS mophnNo
     , BRMI.SCHL_SID AS schlSid
     , BRMI.GRADE AS grade
     , BRMI.FML_REL_CD AS fmlRelCd
     , BRMI.BANK AS bank
     , DEC2(BRMI.ACCNT) AS accnt
     , BRMI.REG_PRS_SID AS regPrsSid
     , BRMI.REG_DT_TM AS regDtTm
     , BRMI.REG_PRS_IP AS regPrsIp
     , BRMI.MDF_PRS_SID AS mdfPrsSid
     , BRMI.MDF_DT_TM AS mdfDtTm
     , BRMI.DEL_YN AS delYn
     , BRMI.CHK_YN AS chkYn
     , BRMI.CHK_DT_TM AS chkDtTm
     , BRMI.MBR_MOD_DT_TM AS mbrModDtTm
     , BRMI.PROG_SVY_1_DT_TM AS progSvy1DtTm
     , BRMI.PROG_SVY_2_DT_TM AS progSvy2DtTm
     , DEC2(BRMI.UGT_CTT) AS ugtCtt
  FROM BIZ_REQ_MBR_INF BRMI
 INNER JOIN
       BIZ_REQ BR
    ON BRMI.REQ_NO = BR.REQ_NO
   AND BR.DEL_YN = 'N'
 INNER JOIN
       BIZ B
    ON BR.BIZ_ID = B.BIZ_ID
   AND B.DEL_YN = 'N' LEFT JOIN SCHL S
    ON BRMI.SCHL_SID = S.SCHL_SID LEFT JOIN MBR M
    ON BRMI.MBR_SID = M.MBR_SID
 WHERE B.BIZ_STAT_CD = 'BSC050' /* 사업상태-진행중 */
   AND BRMI.MBR_DIV = 'RRC010' /* 멘토
     , 멘티 */
   AND BRMI.MBR_SID = 'MBR2411794' 
/* SID 
 */
   AND B.BIZ_TYPE_ID IN ('MT01'
     , 'MT02') 
/* 사업그룹  */
   AND BR.BIZ_REQ_STAT_CD = 'BRS020' /* 멘토 - 선정 */;
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:24:44  INFO [jdbc.sqltiming] /* selectMtProgByMypage - PROG테이블 마이페이지 조회 */SELECT P.PROG_SID AS progSid
     , P.PROG_GRP_CD AS progGrpCd
     , P.PROG_YR AS progYr
     , P.PROG_DIV_NM AS progDivNm
     , P.PROG_PROD AS progProd
     , P.ALIG_NUM AS aligNum
     , P.PROG_NM AS progNm
     , P.ATT_PRD_CTN AS attPrdCtn
     , P.DT_TM_CTN AS dtTmCtn
     , P.LOC_CTN AS locCtn
     , P.DTL_CTN AS dtlCtn
     , P.HDCNT AS hdcnt
     , P.WTNG_CNT AS wtngCnt
     , P.EXP_YN AS expYn
     , P.OPEN_YN AS openYn
     , P.REG_DIV AS regDiv
     , P.GDCC_EXP_YN AS gdccExpYn
     , P.MDF_YN AS mdfYn
     , P.FILE_SID AS fileSid
     , P.ST_TIME AS stTime
     , P.END_TIME AS endTime
     , P.REG_PRS_SID AS regPrsSid
     , P.REG_DT_TM AS regDtTm
     , P.REG_PRS_IP AS regPrsIp
     , P.MDF_PRS_SID AS mdfPrsSid
     , P.MDF_DT_TM AS mdfDtTm
     , P.DIV_CD_1 AS divCd1
     , P.UNV_PROG_ADM_YN AS unvProgAdmYn
     , P.PROG_STAT_CD AS progStatCd
  FROM PROG P
 WHERE P.PROG_GRP_CD = 'PGC084'
   AND P.PROG_YR = '2025';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:24:44  INFO [jdbc.sqltiming] /* selectMtProgReqByMypage - PROG_REQ테이블 마이페이지 프로그램 신청확인 */SELECT P.PROG_PROD AS progProd
     , P.PROG_NM AS progNm
     , P.DT_TM_CTN AS dtTmCtn
     , PRAF.ATT_FILE_SID AS attFileSid
     , SUBSTRING_INDEX(DEC2(PR.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(PR.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , GETCDNM(PR.REQ_STAT_CD) AS reqStatCdNm
     , PR.PROG_REQ_SID AS progReqSid
     , PR.PROG_SID AS progSid
     , DEC2(PR.REQ_PRS_NM) AS reqPrsNm
     , PR.BIRTH AS birth
     , PR.GRADE AS grade
     , PR.AFL AS afl
     , PR.POS AS pos
     , DEC2(PR.PHN_NO) AS phnNo
     , DEC2(PR.EMAIL) AS email
     , PR.PO_YN AS poYn
     , PR.POST_NO AS postNo
     , PR.NUM_ADDR AS numAddr
     , PR.ROAD_ADDR AS roadAddr
     , PR.DTL_ADDR AS dtlAddr
     , PR.REQ_YN AS reqYn
     , PR.STD_REQ_YN AS stdReqYn
     , PR.SEX_CD AS sexCd
     , PR.ATTD_YN AS attdYn
     , PR.COMPL_YN AS complYn
     , PR.REQ_CTN_1 AS reqCtn1
     , PR.REQ_CTN_2 AS reqCtn2
     , PR.DIV_CD_1 AS divCd1
     , PR.DIV_CD_2 AS divCd2
     , PR.BIZ_REQ_SEQ AS bizReqSeq
     , PR.BUT_BIZ_TYPE_CD AS butBizTypeCd
     , PR.BUT_BIZ_DTL_PART_CD AS butBizDtlPartCd
     , PR.REQ_STAT_NUM AS reqStatNum
     , PR.REQ_STAT_CD AS reqStatCd
     , PR.ETC_NUM_NM AS etcNumNm
     , PR.REG_PRS_SID AS regPrsSid
     , PR.REG_DT_TM AS regDtTm
     , PR.REG_PRS_IP AS regPrsIp
     , PR.MDF_PRS_SID AS mdfPrsSid
     , PR.MDF_DT_TM AS mdfDtTm
     , PR.CNCL_YN AS cnclYn
     , PR.RSDN_TYPE_CD AS rsdnTypeCd
     , PR.RAT_DIV AS ratDiv
     , PR.RST_CTN AS rstCtn
     , DEC2(PR.MOPHN_NO) AS mophnNo
     , DEC2(PR.IHIDNUM) AS ihidnum
     , PR.PRD AS prd
     , PR.MAJ AS maj
     , PR.SCRE_DIV_NM_1 AS screDivNm1
     , PR.SCRE_CRD_1 AS screCrd1
     , PR.SCRE_MAX_SCR_1 AS screMaxScr1
     , PR.SCRE_DIV_NM_2 AS screDivNm2
     , PR.SCRE_CRD_2 AS screCrd2
     , PR.SCRE_MAX_SCR_2 AS screMaxScr2
     , PR.REQ_CTN_3 AS reqCtn3
     , PR.YR AS yr
     , PR.REQ_NO AS reqNo
     , PR.RD10_REQ_NO AS rd10ReqNo
     , DEC2(PR.BANK_NM) AS bankNm
     , DEC2(PR.ACCNT_NO) AS accntNo
     , DEC2(PR.DEP_OWN) AS depOwn
     , PR.BANK_DIV AS bankDiv
     , PR.BANK_CD AS bankCd
     , PR.BANK_ADDR AS bankAddr
     , PR.EVAL_CMN_SID_1 AS evalCmnSid1
     , PR.EVAL_1_A AS eval1A
     , PR.EVAL_1_B AS eval1B
     , PR.EVAL_1_C AS eval1C
     , PR.EVAL_SCR_1 AS evalScr1
     , PR.EVAL_CTN_1 AS evalCtn1
     , PR.EVAL_CMN_SID_2 AS evalCmnSid2
     , PR.EVAL_2_A AS eval2A
     , PR.EVAL_2_B AS eval2B
     , PR.EVAL_2_C AS eval2C
     , PR.EVAL_SCR_2 AS evalScr2
     , PR.EVAL_CTN_2 AS evalCtn2
     , PR.NAT AS nat
     , PR.REQ_CTN_7 AS reqCtn7
     , PR.REQ_CTN_6 AS reqCtn6
     , PR.REQ_CTN_5 AS reqCtn5
     , PR.REQ_CTN_4 AS reqCtn4
     , PR.REQ_PRS_SID AS reqPrsSid
     , PR.CALC_YN AS calcYn
     , (SELECT PROG_YR
  FROM PROG P
 WHERE PROG_SID = PR.PROG_SID ) AS progYr
  FROM PROG_REQ PR
 INNER JOIN
       PROG P
    ON PR.PROG_SID = P.PROG_SID LEFT JOIN PROG_REQ_ATT_FILE PRAF
    ON PRAF.PROG_REQ_SID = PR.PROG_REQ_SID
 WHERE P.PROG_GRP_CD = 'PGC084'
   AND P.PROG_YR = '2025'
   AND PR.REG_PRS_SID = 'MBR2411794';
--------------------------------------------------
{
executed in 12 msec}2025-02-27 01:24:44  INFO [jdbc.sqltiming] /* selectMtProgMentoClubAplByPk - PROG_MENTO_CLUB_APL테이블 PK로 조회 */SELECT GETCDNM(PMCA.BANK_CD) AS bankCdNm
     , IFNULL(FORMAT(PMCA.REQ_AOM
     , 0)
     , 0) AS reqAomCom
     , IFNULL(FORMAT(PMCA.SAM_AOM
     , 0)
     , 0) AS samAomCom
     , (SELECT FILE_NM
  FROM FILE_MGT FM
 WHERE FM.FILE_SID = PMCA.PO_FILE_SID
   AND FM.DEL_YN = 'N') AS poFileNm
     , PMCA.PROG_REQ_SID AS progReqSid
     , PMCA.AFL_SCHL_SID AS aflSchlSid
     , DEC2(PMCA.MOPHN_NO) AS mophnNo
     , PMCA.ACTV_SUB_CTN AS actvSubCtn
     , PMCA.ACTV_ST_DT AS actvStDt
     , PMCA.ACTV_END_DT AS actvEndDt
     , PMCA.MENTO_ACTV_HDCNT AS mentoActvHdcnt
     , PMCA.TCH_ACTV_HDCNT AS tchActvHdcnt
     , PMCA.EXPT_EFCT_CTN AS exptEfctCtn
     , DEC2(PMCA.DEP_OWN) AS depOwn
     , DEC2(PMCA.ACCNT_NO) AS accntNo
     , PMCA.BANK_CD AS bankCd
     , PMCA.PO_FILE_SID AS poFileSid
     , PMCA.SELT_YN AS seltYn
     , PMCA.REQ_AOM AS reqAom
     , PMCA.SAM_AOM AS samAom
     , PMCA.GDCC_CTN AS gdccCtn
     , PMCA.DEL_YN AS delYn
     , PMCA.REG_PRS_SID AS regPrsSid
     , PMCA.REG_DT_TM AS regDtTm
     , PMCA.MDF_PRS_SID AS mdfPrsSid
     , PMCA.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_APL PMCA
 WHERE PMCA.DEL_YN = 'N'
   AND PMCA.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:24:44  INFO [jdbc.sqltiming] /* selectMtProgMentoClubAplActvDtlListBySidList - PROG_MENTO_CLUB_APL_ACTV_DTL_LIST테이블 SID로 리스트 조회 */SELECT IFNULL(FORMAT(PMCAADL.REQ_AOM
     , 0)
     , '') AS reqAomCom
     , PMCAADL.PROG_REQ_SID AS progReqSid
     , PMCAADL.ACTV_SEQ AS actvSeq
     , PMCAADL.ACTV_DTL_SUB_CTN AS actvDtlSubCtn
     , PMCAADL.ACTV_DTL_ST_DT AS actvDtlStDt
     , PMCAADL.ACTV_DTL_END_DT AS actvDtlEndDt
     , PMCAADL.ACTV_PLAN_CTN AS actvPlanCtn
     , PMCAADL.REQ_AOM AS reqAom
     , PMCAADL.REG_PRS_SID AS regPrsSid
     , PMCAADL.REG_DT_TM AS regDtTm
     , PMCAADL.MDF_PRS_SID AS mdfPrsSid
     , PMCAADL.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_APL_ACTV_DTL_LIST PMCAADL
 WHERE PMCAADL.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:24:44  INFO [jdbc.sqltiming] /* selectMtProgMentoClubAplActvExpListBySidList - PROG_MENTO_CLUB_APL_ACTV_EXP_LIST테이블 SID로 리스트 조회 */SELECT IFNULL(FORMAT(PMCAAEL.UTPC
     , 0)
     , '') AS utpcCom
     , IFNULL(FORMAT(PMCAAEL.REQ_AOM
     , 0)
     , '') AS reqAomCom
     , PMCAAEL.PROG_REQ_SID AS progReqSid
     , PMCAAEL.ACTV_SEQ AS actvSeq
     , PMCAAEL.ACTV_EXP_SEQ AS actvExpSeq
     , PMCAAEL.ACTV_EXP_CTN AS actvExpCtn
     , PMCAAEL.UTPC AS utpc
     , PMCAAEL.QTT AS qtt
     , PMCAAEL.REQ_AOM AS reqAom
     , PMCAAEL.REG_PRS_SID AS regPrsSid
     , PMCAAEL.REG_DT_TM AS regDtTm
     , PMCAAEL.MDF_PRS_SID AS mdfPrsSid
     , PMCAAEL.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_APL_ACTV_EXP_LIST PMCAAEL
 WHERE PMCAAEL.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:24:51 DEBUG [org.sdream.comm.service.impl.TraceServiceImpl] [saveLog] TraceDTO [seq=null
     , connDtTm=null
     , sessId=BA56432068070106FE766BFCD8F45124
     , hostNm=localhost
     , pathNm=test
     , pageNm=/m/drmFstMy20/L215
     , param=[dbwls176] 
     , fullUrl=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36
     , rfrr=http://localhost:8080/m/drmFstMy19/L215?PROG_GRP_CD=PGC084
     , connIp=0:0:0:0:0:0:0:1
     , mdfDtTm=null]2025-02-27 01:24:51  INFO [jdbc.sqltiming] 
/* customInsertTrace  */
INSERT INTO TRACE ( SESS_ID 
     , CONN_DT_TM 
     , HOST_NM 
     , PATH_NM 
     , PAGE_NM 
     , PARAM 
     , FULL_URL 
     , RFRR 
     , CONN_IP 
     , MDF_DT_TM ) VALUES ( IFNULL('BA56432068070106FE766BFCD8F45124'
     , '') 
     , NOW() 
     , 'localhost' 
     , 'test' 
     , '/m/drmFstMy20/L215' 
     , '[dbwls176] ' 
     , 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36' 
     , 'http://localhost:8080/m/drmFstMy19/L215?PROG_GRP_CD=PGC084' 
     , '0:0:0:0:0:0:0:1' 
     , NOW() );
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:24:51  INFO [jdbc.sqltiming] 
/* selectPageAuth2List  */
SELECT PAGE_URI 
     , MENU_EXP_CD 
     , FUNC_EXPL 
     , USED_DT_TM 
     , DEL_YN 
     , MDF_PRS_SID 
     , MDF_DT_TM
  FROM PAGE_AUTH_2
 WHERE 1=1
   AND PAGE_URI = '/m/drmFstMy20/L215'
   AND DEL_YN = 'N';
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:24:51  INFO [jdbc.sqltiming] /* selectMtBizReqMbrInfByMypage - BIZ_REQ_MBR_INF테이블 마이페이지 선정자 확인 */SELECT B.BIZ_YR AS bizYr
     , B.BIZ_ID AS bizId
     , B.BIZ_TYPE_ID AS bizTypeId
     , B.PROD AS prod
     , S.SCHL_NM AS schlNm
     , M.MBR_ID AS mbrId
     , M.BIRTH AS birth
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , BRMI.REQ_NO AS reqNo
     , BRMI.MBR_SID AS mbrSid
     , BRMI.MBR_DIV AS mbrDiv
     , BRMI.LOG_SEQ AS logSeq
     , DEC2(BRMI.NM) AS nm
     , DEC2(BRMI.PHN_NO) AS phnNo
     , DEC2(BRMI.MOPHN_NO) AS mophnNo
     , BRMI.SCHL_SID AS schlSid
     , BRMI.GRADE AS grade
     , BRMI.FML_REL_CD AS fmlRelCd
     , BRMI.BANK AS bank
     , DEC2(BRMI.ACCNT) AS accnt
     , BRMI.REG_PRS_SID AS regPrsSid
     , BRMI.REG_DT_TM AS regDtTm
     , BRMI.REG_PRS_IP AS regPrsIp
     , BRMI.MDF_PRS_SID AS mdfPrsSid
     , BRMI.MDF_DT_TM AS mdfDtTm
     , BRMI.DEL_YN AS delYn
     , BRMI.CHK_YN AS chkYn
     , BRMI.CHK_DT_TM AS chkDtTm
     , BRMI.MBR_MOD_DT_TM AS mbrModDtTm
     , BRMI.PROG_SVY_1_DT_TM AS progSvy1DtTm
     , BRMI.PROG_SVY_2_DT_TM AS progSvy2DtTm
     , DEC2(BRMI.UGT_CTT) AS ugtCtt
  FROM BIZ_REQ_MBR_INF BRMI
 INNER JOIN
       BIZ_REQ BR
    ON BRMI.REQ_NO = BR.REQ_NO
   AND BR.DEL_YN = 'N'
 INNER JOIN
       BIZ B
    ON BR.BIZ_ID = B.BIZ_ID
   AND B.DEL_YN = 'N' LEFT JOIN SCHL S
    ON BRMI.SCHL_SID = S.SCHL_SID LEFT JOIN MBR M
    ON BRMI.MBR_SID = M.MBR_SID
 WHERE B.BIZ_STAT_CD = 'BSC050' /* 사업상태-진행중 */
   AND BRMI.MBR_DIV = 'RRC010' /* 멘토
     , 멘티 */
   AND BRMI.MBR_SID = 'MBR2411794' 
/* SID 
 */
   AND B.BIZ_TYPE_ID IN ('MT01'
     , 'MT02') 
/* 사업그룹  */
   AND BR.BIZ_REQ_STAT_CD = 'BRS020' /* 멘토 - 선정 */;
--------------------------------------------------
{
executed in 12 msec}2025-02-27 01:24:51  INFO [jdbc.sqltiming] /* selectMtProgByMypage - PROG테이블 마이페이지 조회 */SELECT P.PROG_SID AS progSid
     , P.PROG_GRP_CD AS progGrpCd
     , P.PROG_YR AS progYr
     , P.PROG_DIV_NM AS progDivNm
     , P.PROG_PROD AS progProd
     , P.ALIG_NUM AS aligNum
     , P.PROG_NM AS progNm
     , P.ATT_PRD_CTN AS attPrdCtn
     , P.DT_TM_CTN AS dtTmCtn
     , P.LOC_CTN AS locCtn
     , P.DTL_CTN AS dtlCtn
     , P.HDCNT AS hdcnt
     , P.WTNG_CNT AS wtngCnt
     , P.EXP_YN AS expYn
     , P.OPEN_YN AS openYn
     , P.REG_DIV AS regDiv
     , P.GDCC_EXP_YN AS gdccExpYn
     , P.MDF_YN AS mdfYn
     , P.FILE_SID AS fileSid
     , P.ST_TIME AS stTime
     , P.END_TIME AS endTime
     , P.REG_PRS_SID AS regPrsSid
     , P.REG_DT_TM AS regDtTm
     , P.REG_PRS_IP AS regPrsIp
     , P.MDF_PRS_SID AS mdfPrsSid
     , P.MDF_DT_TM AS mdfDtTm
     , P.DIV_CD_1 AS divCd1
     , P.UNV_PROG_ADM_YN AS unvProgAdmYn
     , P.PROG_STAT_CD AS progStatCd
  FROM PROG P
 WHERE P.PROG_GRP_CD = 'PGC084'
   AND P.PROG_YR = '2025';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:24:51  INFO [jdbc.sqltiming] /* selectMtProgReqByMypage - PROG_REQ테이블 마이페이지 프로그램 신청확인 */SELECT P.PROG_PROD AS progProd
     , P.PROG_NM AS progNm
     , P.DT_TM_CTN AS dtTmCtn
     , PRAF.ATT_FILE_SID AS attFileSid
     , SUBSTRING_INDEX(DEC2(PR.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(PR.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , GETCDNM(PR.REQ_STAT_CD) AS reqStatCdNm
     , PR.PROG_REQ_SID AS progReqSid
     , PR.PROG_SID AS progSid
     , DEC2(PR.REQ_PRS_NM) AS reqPrsNm
     , PR.BIRTH AS birth
     , PR.GRADE AS grade
     , PR.AFL AS afl
     , PR.POS AS pos
     , DEC2(PR.PHN_NO) AS phnNo
     , DEC2(PR.EMAIL) AS email
     , PR.PO_YN AS poYn
     , PR.POST_NO AS postNo
     , PR.NUM_ADDR AS numAddr
     , PR.ROAD_ADDR AS roadAddr
     , PR.DTL_ADDR AS dtlAddr
     , PR.REQ_YN AS reqYn
     , PR.STD_REQ_YN AS stdReqYn
     , PR.SEX_CD AS sexCd
     , PR.ATTD_YN AS attdYn
     , PR.COMPL_YN AS complYn
     , PR.REQ_CTN_1 AS reqCtn1
     , PR.REQ_CTN_2 AS reqCtn2
     , PR.DIV_CD_1 AS divCd1
     , PR.DIV_CD_2 AS divCd2
     , PR.BIZ_REQ_SEQ AS bizReqSeq
     , PR.BUT_BIZ_TYPE_CD AS butBizTypeCd
     , PR.BUT_BIZ_DTL_PART_CD AS butBizDtlPartCd
     , PR.REQ_STAT_NUM AS reqStatNum
     , PR.REQ_STAT_CD AS reqStatCd
     , PR.ETC_NUM_NM AS etcNumNm
     , PR.REG_PRS_SID AS regPrsSid
     , PR.REG_DT_TM AS regDtTm
     , PR.REG_PRS_IP AS regPrsIp
     , PR.MDF_PRS_SID AS mdfPrsSid
     , PR.MDF_DT_TM AS mdfDtTm
     , PR.CNCL_YN AS cnclYn
     , PR.RSDN_TYPE_CD AS rsdnTypeCd
     , PR.RAT_DIV AS ratDiv
     , PR.RST_CTN AS rstCtn
     , DEC2(PR.MOPHN_NO) AS mophnNo
     , DEC2(PR.IHIDNUM) AS ihidnum
     , PR.PRD AS prd
     , PR.MAJ AS maj
     , PR.SCRE_DIV_NM_1 AS screDivNm1
     , PR.SCRE_CRD_1 AS screCrd1
     , PR.SCRE_MAX_SCR_1 AS screMaxScr1
     , PR.SCRE_DIV_NM_2 AS screDivNm2
     , PR.SCRE_CRD_2 AS screCrd2
     , PR.SCRE_MAX_SCR_2 AS screMaxScr2
     , PR.REQ_CTN_3 AS reqCtn3
     , PR.YR AS yr
     , PR.REQ_NO AS reqNo
     , PR.RD10_REQ_NO AS rd10ReqNo
     , DEC2(PR.BANK_NM) AS bankNm
     , DEC2(PR.ACCNT_NO) AS accntNo
     , DEC2(PR.DEP_OWN) AS depOwn
     , PR.BANK_DIV AS bankDiv
     , PR.BANK_CD AS bankCd
     , PR.BANK_ADDR AS bankAddr
     , PR.EVAL_CMN_SID_1 AS evalCmnSid1
     , PR.EVAL_1_A AS eval1A
     , PR.EVAL_1_B AS eval1B
     , PR.EVAL_1_C AS eval1C
     , PR.EVAL_SCR_1 AS evalScr1
     , PR.EVAL_CTN_1 AS evalCtn1
     , PR.EVAL_CMN_SID_2 AS evalCmnSid2
     , PR.EVAL_2_A AS eval2A
     , PR.EVAL_2_B AS eval2B
     , PR.EVAL_2_C AS eval2C
     , PR.EVAL_SCR_2 AS evalScr2
     , PR.EVAL_CTN_2 AS evalCtn2
     , PR.NAT AS nat
     , PR.REQ_CTN_7 AS reqCtn7
     , PR.REQ_CTN_6 AS reqCtn6
     , PR.REQ_CTN_5 AS reqCtn5
     , PR.REQ_CTN_4 AS reqCtn4
     , PR.REQ_PRS_SID AS reqPrsSid
     , PR.CALC_YN AS calcYn
     , (SELECT PROG_YR
  FROM PROG P
 WHERE PROG_SID = PR.PROG_SID ) AS progYr
  FROM PROG_REQ PR
 INNER JOIN
       PROG P
    ON PR.PROG_SID = P.PROG_SID LEFT JOIN PROG_REQ_ATT_FILE PRAF
    ON PRAF.PROG_REQ_SID = PR.PROG_REQ_SID
 WHERE P.PROG_GRP_CD = 'PGC084'
   AND P.PROG_YR = '2025'
   AND PR.REG_PRS_SID = 'MBR2411794';
--------------------------------------------------
{
executed in 12 msec}2025-02-27 01:24:51  INFO [jdbc.sqltiming] /* selectMtProgMentoClubAplByPk - PROG_MENTO_CLUB_APL테이블 PK로 조회 */SELECT GETCDNM(PMCA.BANK_CD) AS bankCdNm
     , IFNULL(FORMAT(PMCA.REQ_AOM
     , 0)
     , 0) AS reqAomCom
     , IFNULL(FORMAT(PMCA.SAM_AOM
     , 0)
     , 0) AS samAomCom
     , (SELECT FILE_NM
  FROM FILE_MGT FM
 WHERE FM.FILE_SID = PMCA.PO_FILE_SID
   AND FM.DEL_YN = 'N') AS poFileNm
     , PMCA.PROG_REQ_SID AS progReqSid
     , PMCA.AFL_SCHL_SID AS aflSchlSid
     , DEC2(PMCA.MOPHN_NO) AS mophnNo
     , PMCA.ACTV_SUB_CTN AS actvSubCtn
     , PMCA.ACTV_ST_DT AS actvStDt
     , PMCA.ACTV_END_DT AS actvEndDt
     , PMCA.MENTO_ACTV_HDCNT AS mentoActvHdcnt
     , PMCA.TCH_ACTV_HDCNT AS tchActvHdcnt
     , PMCA.EXPT_EFCT_CTN AS exptEfctCtn
     , DEC2(PMCA.DEP_OWN) AS depOwn
     , DEC2(PMCA.ACCNT_NO) AS accntNo
     , PMCA.BANK_CD AS bankCd
     , PMCA.PO_FILE_SID AS poFileSid
     , PMCA.SELT_YN AS seltYn
     , PMCA.REQ_AOM AS reqAom
     , PMCA.SAM_AOM AS samAom
     , PMCA.GDCC_CTN AS gdccCtn
     , PMCA.DEL_YN AS delYn
     , PMCA.REG_PRS_SID AS regPrsSid
     , PMCA.REG_DT_TM AS regDtTm
     , PMCA.MDF_PRS_SID AS mdfPrsSid
     , PMCA.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_APL PMCA
 WHERE PMCA.DEL_YN = 'N'
   AND PMCA.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:24:51  INFO [jdbc.sqltiming] /* selectMtProgMentoClubAplActvDtlListBySidList - PROG_MENTO_CLUB_APL_ACTV_DTL_LIST테이블 SID로 리스트 조회 */SELECT IFNULL(FORMAT(PMCAADL.REQ_AOM
     , 0)
     , '') AS reqAomCom
     , PMCAADL.PROG_REQ_SID AS progReqSid
     , PMCAADL.ACTV_SEQ AS actvSeq
     , PMCAADL.ACTV_DTL_SUB_CTN AS actvDtlSubCtn
     , PMCAADL.ACTV_DTL_ST_DT AS actvDtlStDt
     , PMCAADL.ACTV_DTL_END_DT AS actvDtlEndDt
     , PMCAADL.ACTV_PLAN_CTN AS actvPlanCtn
     , PMCAADL.REQ_AOM AS reqAom
     , PMCAADL.REG_PRS_SID AS regPrsSid
     , PMCAADL.REG_DT_TM AS regDtTm
     , PMCAADL.MDF_PRS_SID AS mdfPrsSid
     , PMCAADL.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_APL_ACTV_DTL_LIST PMCAADL
 WHERE PMCAADL.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:24:51  INFO [jdbc.sqltiming] /* selectMtProgMentoClubAplActvExpListBySidList - PROG_MENTO_CLUB_APL_ACTV_EXP_LIST테이블 SID로 리스트 조회 */SELECT IFNULL(FORMAT(PMCAAEL.UTPC
     , 0)
     , '') AS utpcCom
     , IFNULL(FORMAT(PMCAAEL.REQ_AOM
     , 0)
     , '') AS reqAomCom
     , PMCAAEL.PROG_REQ_SID AS progReqSid
     , PMCAAEL.ACTV_SEQ AS actvSeq
     , PMCAAEL.ACTV_EXP_SEQ AS actvExpSeq
     , PMCAAEL.ACTV_EXP_CTN AS actvExpCtn
     , PMCAAEL.UTPC AS utpc
     , PMCAAEL.QTT AS qtt
     , PMCAAEL.REQ_AOM AS reqAom
     , PMCAAEL.REG_PRS_SID AS regPrsSid
     , PMCAAEL.REG_DT_TM AS regDtTm
     , PMCAAEL.MDF_PRS_SID AS mdfPrsSid
     , PMCAAEL.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_APL_ACTV_EXP_LIST PMCAAEL
 WHERE PMCAAEL.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:25:04 DEBUG [org.sdream.comm.service.impl.TraceServiceImpl] [saveLog] TraceDTO [seq=null
     , connDtTm=null
     , sessId=BA56432068070106FE766BFCD8F45124
     , hostNm=localhost
     , pathNm=test
     , pageNm=/m/saveDrmFstMy20
     , param=[dbwls176];
--------------------------------------------------
{
progReqSid=[PRQ25000000000125804]}
     ,;
--------------------------------------------------
{
mtBizReqMbrInfVo.reqNo=[2025MT0101125973]}
     ,;
--------------------------------------------------
{
mtBizReqMbrInfVo.mbrSid=[MBR2411794]}
     ,;
--------------------------------------------------
{
mtProgReqVo.progSid=[PRO25000000000125803]}
     ,;
--------------------------------------------------
{
mtProgReqVo.reqPrsNm=[김유진]}
     ,;
--------------------------------------------------
{
mtProgReqVo.reqNo=[2025MT0101125973]}
     ,;
--------------------------------------------------
{
mtProgReqVo.afl=[강릉오성학교(고)]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplVo.aflSchlSid=[SCH0007621]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplVo.actvSubCtn=[강릉 여행 일대기]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplVo.mentoActvHdcnt=[1]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplVo.tchActvHdcnt=[]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplVo.exptEfctCtn=[와 같이 2025년 멘토 동아리 활동 지원 신청서를 제출합니다. ※ 제출완료 버튼을 눌러도 신청서는 2025.6.14(금)까지 열람 및 수정 가능합니다. ※ 멘토 동아리로 선정된 경우
     , 활동 후 2026.1.20(월)까지 결과보고서(활동내용
     , 활동결과
     , 영수증 등)를 제출해야 합니다.와 같이 2025년 멘토 동아리 활동 지원 신청서를 제출합니다. ※ 제출완료 버튼을 눌러도 신청서는 2025.6.14(금)까지 열람 및 수정 가능합니다. ※ 멘토 동아리로 선정된 경우
     , 활동 후 2026.1.20(월)까지 결과보고서(활동내용
     , 활동결과
     , 영수증 등)를 제출해야 합니다.와 같이 2025년 멘토 동아리 활동 지원 신청서를 제출합니다. ※ 제출완료 버튼을 눌러도 신청서는 2025.6.14(금)까지 열람 및 수정 가능합니다. ※ 멘토 동아리로 선정된 경우
     , 활동 후 2026.1.20(월)까지 결과보고서(활동내용
     , 활동결과
     , 영수증 등)를 제출해야 합니다.]}
     ,;
--------------------------------------------------
{
mtBizReqMbrInfVo.schlSid=[SCH0007621]}
     ,;
--------------------------------------------------
{
mtProgReqVo.mophnNo=[010-4179-4550]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplVo.mophnNo=[010-4179-4550]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplVo.reqAom=[64666]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplVo.actvStDtStr=[2024-12-02]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplVo.actvEndDtStr=[2025-02-18]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvDtlList[0].actvSeq=[1]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvDtlList[0].actvDtlSubCtn=[2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvDtlList[0].actvDtlStDtStr=[2024-11-01]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvDtlList[0].actvDtlEndDtStr=[2024-12-20]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvDtlList[0].actvPlanCtn=[2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvDtlList[0].reqAom=[64666]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvExpList[0].actvSeq=[1]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvExpList[0].actvExpSeq=[1]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvExpList[0].actvExpCtn=[가가가]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvExpList[0].utpc=[32333]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvExpList[0].qtt=[2]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvExpList[0].reqAom=[64666]}
     ,;
--------------------------------------------------
{
mtProgReqVo.reqStatCd=[PRSC10002]}
     , fullUrl=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36
     , rfrr=http://localhost:8080/m/drmFstMy20/L215
     , connIp=0:0:0:0:0:0:0:1
     , mdfDtTm=null]2025-02-27 01:25:04  INFO [jdbc.sqltiming] 
/* customInsertTrace  */
INSERT INTO TRACE ( SESS_ID 
     , CONN_DT_TM 
     , HOST_NM 
     , PATH_NM 
     , PAGE_NM 
     , PARAM 
     , FULL_URL 
     , RFRR 
     , CONN_IP 
     , MDF_DT_TM ) VALUES ( IFNULL('BA56432068070106FE766BFCD8F45124'
     , '') 
     , NOW() 
     , 'localhost' 
     , 'test' 
     , '/m/saveDrmFstMy20' 
     , '[dbwls176];
--------------------------------------------------
{
progReqSid=[PRQ25000000000125804]}
     ,;
--------------------------------------------------
{
mtBizReqMbrInfVo.reqNo=[2025MT0101125973]}
     ,;
--------------------------------------------------
{
mtBizReqMbrInfVo.mbrSid=[MBR2411794]}
     ,;
--------------------------------------------------
{
mtProgReqVo.progSid=[PRO25000000000125803]}
     ,;
--------------------------------------------------
{
mtProgReqVo.reqPrsNm=[김유진]}
     ,;
--------------------------------------------------
{
mtProgReqVo.reqNo=[2025MT0101125973]}
     ,;
--------------------------------------------------
{
mtProgReqVo.afl=[강릉오성학교(고)]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplVo.aflSchlSid=[SCH0007621]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplVo.actvSubCtn=[강릉 여행 일대기]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplVo.mentoActvHdcnt=[1]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplVo.tchActvHdcnt=[]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplVo.exptEfctCtn=[와 같이 2025년 멘토 동아리 활동 지원 신청서를 제출합니다. ※ 제출완료 버튼을 눌러도 신청서는 2025.6.14(금)까지 열람 및 수정 가능합니다. ※ 멘토 동아리로 선정된 경우
     , 활동 후 2026.1.20(월)까지 결과보고서(활동내용
     , 활동결과
     , 영수증 등)를 제출해야 합니다.와 같이 2025년 멘토 동아리 활동 지원 신청서를 제출합니다. ※ 제출완료 버튼을 눌러도 신청서는 2025.6.14(금)까지 열람 및 수정 가능합니다. ※ 멘토 동아리로 선정된 경우
     , 활동 후 2026.1.20(월)까지 결과보고서(활동내용
     , 활동결과
     , 영수증 등)를 제출해야 합니다.와 같이 2025년 멘토 동아리 활동 지원 신청서를 제출합니다. ※ 제출완료 버튼을 눌러도 신청서는 2025.6.14(금)까지 열람 및 수정 가능합니다. ※ 멘토 동아리로 선정된 경우
     , 활동 후 2026.1.20(월)까지 결과보고서(활동내용
     , 활동결과
     , 영수증 등)를 제출해야 합니다.]}
     ,;
--------------------------------------------------
{
mtBizReqMbrInfVo.schlSid=[SCH0007621]}
     ,;
--------------------------------------------------
{
mtProgReqVo.mophnNo=[010-4179-4550]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplVo.mophnNo=[010-4179-4550]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplVo.reqAom=[64666]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplVo.actvStDtStr=[2024-12-02]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplVo.actvEndDtStr=[2025-02-18]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvDtlList[0].actvSeq=[1]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvDtlList[0].actvDtlSubCtn=[2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvDtlList[0].actvDtlStDtStr=[2024-11-01]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvDtlList[0].actvDtlEndDtStr=[2024-12-20]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvDtlList[0].actvPlanCtn=[2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvDtlList[0].reqAom=[64666]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvExpList[0].actvSeq=[1]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvExpList[0].actvExpSeq=[1]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvExpList[0].actvExpCtn=[가가가]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvExpList[0].utpc=[32333]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvExpList[0].qtt=[2]}
     ,;
--------------------------------------------------
{
mtProgMentoClubAplActvExpList[0].reqAom=[64666]}
     ,;
--------------------------------------------------
{
mtProgReqVo.reqStatCd=[PRSC10002]}' 
     , 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36' 
     , 'http://localhost:8080/m/drmFstMy20/L215' 
     , '0:0:0:0:0:0:0:1' 
     , NOW() );
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming] 
/* selectPageAuth2List  */
SELECT PAGE_URI 
     , MENU_EXP_CD 
     , FUNC_EXPL 
     , USED_DT_TM 
     , DEL_YN 
     , MDF_PRS_SID 
     , MDF_DT_TM
  FROM PAGE_AUTH_2
 WHERE 1=1
   AND PAGE_URI = '/m/saveDrmFstMy20'
   AND DEL_YN = 'N';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming] 
/* saveMtProgReq  */
INSERT INTO PROG_REQ ( PROG_REQ_SID
     , PROG_SID
     , REQ_PRS_NM
     , BIRTH
     , GRADE
     , AFL
     , POS
     , PHN_NO
     , EMAIL
     , PO_YN
     , POST_NO
     , NUM_ADDR
     , ROAD_ADDR
     , DTL_ADDR
     , REQ_YN
     , STD_REQ_YN
     , SEX_CD
     , ATTD_YN
     , COMPL_YN
     , REQ_CTN_1
     , REQ_CTN_2
     , DIV_CD_1
     , DIV_CD_2
     , BIZ_REQ_SEQ
     , BUT_BIZ_TYPE_CD
     , BUT_BIZ_DTL_PART_CD
     , REQ_STAT_NUM
     , REQ_STAT_CD
     , ETC_NUM_NM
     , REG_PRS_SID
     , REG_DT_TM
     , REG_PRS_IP
     , MDF_PRS_SID
     , MDF_DT_TM
     , CNCL_YN
     , RSDN_TYPE_CD
     , RAT_DIV
     , RST_CTN
     , MOPHN_NO
     , IHIDNUM
     , PRD
     , MAJ
     , SCRE_DIV_NM_1
     , SCRE_CRD_1
     , SCRE_MAX_SCR_1
     , SCRE_DIV_NM_2
     , SCRE_CRD_2
     , SCRE_MAX_SCR_2
     , REQ_CTN_3
     , YR
     , REQ_NO
     , RD10_REQ_NO
     , BANK_NM
     , ACCNT_NO
     , DEP_OWN
     , BANK_DIV
     , BANK_CD
     , BANK_ADDR
     , EVAL_CMN_SID_1
     , EVAL_1_A
     , EVAL_1_B
     , EVAL_1_C
     , EVAL_SCR_1
     , EVAL_CTN_1
     , EVAL_CMN_SID_2
     , EVAL_2_A
     , EVAL_2_B
     , EVAL_2_C
     , EVAL_SCR_2
     , EVAL_CTN_2
     , NAT
     , REQ_CTN_7
     , REQ_CTN_6
     , REQ_CTN_5
     , REQ_CTN_4
     , REQ_PRS_SID
     , CALC_YN ) VALUES ( 'PRQ25000000000125804'
     , 'PRO25000000000125803'
     , ENC2('김유진')
     , NULL
     , NULL
     , '강릉오성학교(고)'
     , NULL
     , ENC2(NULL)
     , ENC2(NULL)
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , 'PRSC10002'
     , NULL
     , 'MBR2411794'
     , NOW()
     , NULL
     , 'MBR2411794'
     , NULL
     , 'N'
     , NULL
     , NULL
     , NULL
     , ENC2('010-4179-4550')
     , ENC2(NULL)
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , '2025MT0101125973'
     , NULL
     , ENC2(NULL)
     , ENC2(NULL)
     , ENC2(NULL)
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL )
    ON DUPLICATE KEYUPDATE PROG_SID = 'PRO25000000000125803'
     , REQ_PRS_NM = ENC2('김유진')
     , AFL = '강릉오성학교(고)'
     , REQ_STAT_CD = 'PRSC10002'
     , MOPHN_NO = ENC2('010-4179-4550')
     , REQ_NO = '2025MT0101125973'
     , MDF_PRS_SID = 'MBR2411794'
     , MDF_DT_TM = NOW();
--------------------------------------------------
{
executed in 12 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming] 
/* saveMtProgMentoClubApl  */
INSERT INTO PROG_MENTO_CLUB_APL ( PROG_REQ_SID
     , AFL_SCHL_SID
     , MOPHN_NO
     , ACTV_SUB_CTN
     , ACTV_ST_DT
     , ACTV_END_DT
     , MENTO_ACTV_HDCNT
     , TCH_ACTV_HDCNT
     , EXPT_EFCT_CTN
     , DEP_OWN
     , ACCNT_NO
     , BANK_CD
     , PO_FILE_SID
     , SELT_YN
     , REQ_AOM
     , SAM_AOM
     , GDCC_CTN
     , DEL_YN
     , REG_PRS_SID
     , REG_DT_TM
     , MDF_PRS_SID
     , MDF_DT_TM ) VALUES ( 'PRQ25000000000125804'
     , 'SCH0007621'
     , ENC2('010-4179-4550')
     , '강릉 여행 일대기'
     , CASE WHEN '2024-12-02'='NULL' THEN NULL ELSE '2024-12-02' END
     , CASE WHEN '2025-02-18'='NULL' THEN NULL ELSE '2025-02-18' END
     , 1
     , NULL
     , '와 같이 2025년 멘토 동아리 활동 지원 신청서를 제출합니다. ※ 제출완료 버튼을 눌러도 신청서는 2025.6.14(금)까지 열람 및 수정 가능합니다. ※ 멘토 동아리로 선정된 경우
     , 활동 후 2026.1.20(월)까지 결과보고서(활동내용
     , 활동결과
     , 영수증 등)를 제출해야 합니다.와 같이 2025년 멘토 동아리 활동 지원 신청서를 제출합니다. ※ 제출완료 버튼을 눌러도 신청서는 2025.6.14(금)까지 열람 및 수정 가능합니다. ※ 멘토 동아리로 선정된 경우
     , 활동 후 2026.1.20(월)까지 결과보고서(활동내용
     , 활동결과
     , 영수증 등)를 제출해야 합니다.와 같이 2025년 멘토 동아리 활동 지원 신청서를 제출합니다. ※ 제출완료 버튼을 눌러도 신청서는 2025.6.14(금)까지 열람 및 수정 가능합니다. ※ 멘토 동아리로 선정된 경우
     , 활동 후 2026.1.20(월)까지 결과보고서(활동내용
     , 활동결과
     , 영수증 등)를 제출해야 합니다.'
     , ENC2(NULL)
     , ENC2(NULL)
     , NULL
     , NULL
     , NULL
     , 64666
     , NULL
     , NULL
     , 'N'
     , 'MBR2411794'
     , NOW()
     , 'MBR2411794'
     , NULL )
    ON DUPLICATE KEYUPDATE AFL_SCHL_SID = 'SCH0007621'
     , MOPHN_NO = ENC2('010-4179-4550')
     , ACTV_SUB_CTN = '강릉 여행 일대기'
     , ACTV_ST_DT = CASE WHEN '2024-12-02'='NULL' THEN NULL ELSE '2024-12-02' END
     , ACTV_END_DT = CASE WHEN '2025-02-18'='NULL' THEN NULL ELSE '2025-02-18' END
     , MENTO_ACTV_HDCNT = 1
     , EXPT_EFCT_CTN = '와 같이 2025년 멘토 동아리 활동 지원 신청서를 제출합니다. ※ 제출완료 버튼을 눌러도 신청서는 2025.6.14(금)까지 열람 및 수정 가능합니다. ※ 멘토 동아리로 선정된 경우
     , 활동 후 2026.1.20(월)까지 결과보고서(활동내용
     , 활동결과
     , 영수증 등)를 제출해야 합니다.와 같이 2025년 멘토 동아리 활동 지원 신청서를 제출합니다. ※ 제출완료 버튼을 눌러도 신청서는 2025.6.14(금)까지 열람 및 수정 가능합니다. ※ 멘토 동아리로 선정된 경우
     , 활동 후 2026.1.20(월)까지 결과보고서(활동내용
     , 활동결과
     , 영수증 등)를 제출해야 합니다.와 같이 2025년 멘토 동아리 활동 지원 신청서를 제출합니다. ※ 제출완료 버튼을 눌러도 신청서는 2025.6.14(금)까지 열람 및 수정 가능합니다. ※ 멘토 동아리로 선정된 경우
     , 활동 후 2026.1.20(월)까지 결과보고서(활동내용
     , 활동결과
     , 영수증 등)를 제출해야 합니다.'
     , REQ_AOM = 64666
     , MDF_PRS_SID = 'MBR2411794'
     , MDF_DT_TM = NOW();
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming] /* selectMtProgMentoClubAplByPk - PROG_MENTO_CLUB_APL테이블 PK로 조회 */SELECT GETCDNM(PMCA.BANK_CD) AS bankCdNm
     , IFNULL(FORMAT(PMCA.REQ_AOM
     , 0)
     , 0) AS reqAomCom
     , IFNULL(FORMAT(PMCA.SAM_AOM
     , 0)
     , 0) AS samAomCom
     , (SELECT FILE_NM
  FROM FILE_MGT FM
 WHERE FM.FILE_SID = PMCA.PO_FILE_SID
   AND FM.DEL_YN = 'N') AS poFileNm
     , PMCA.PROG_REQ_SID AS progReqSid
     , PMCA.AFL_SCHL_SID AS aflSchlSid
     , DEC2(PMCA.MOPHN_NO) AS mophnNo
     , PMCA.ACTV_SUB_CTN AS actvSubCtn
     , PMCA.ACTV_ST_DT AS actvStDt
     , PMCA.ACTV_END_DT AS actvEndDt
     , PMCA.MENTO_ACTV_HDCNT AS mentoActvHdcnt
     , PMCA.TCH_ACTV_HDCNT AS tchActvHdcnt
     , PMCA.EXPT_EFCT_CTN AS exptEfctCtn
     , DEC2(PMCA.DEP_OWN) AS depOwn
     , DEC2(PMCA.ACCNT_NO) AS accntNo
     , PMCA.BANK_CD AS bankCd
     , PMCA.PO_FILE_SID AS poFileSid
     , PMCA.SELT_YN AS seltYn
     , PMCA.REQ_AOM AS reqAom
     , PMCA.SAM_AOM AS samAom
     , PMCA.GDCC_CTN AS gdccCtn
     , PMCA.DEL_YN AS delYn
     , PMCA.REG_PRS_SID AS regPrsSid
     , PMCA.REG_DT_TM AS regDtTm
     , PMCA.MDF_PRS_SID AS mdfPrsSid
     , PMCA.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_APL PMCA
 WHERE PMCA.DEL_YN = 'N'
   AND PMCA.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming]SELECT IFNULL(MAX(HIST_SEQ)+1
     , 1) AS histSeq
  FROM PROG_MENTO_CLUB_APL_HIST
 WHERE PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming] 
/* insertMtProgMentoClubAplHist  */
INSERT INTO PROG_MENTO_CLUB_APL_HIST ( PROG_REQ_SID
     , HIST_SEQ
     , AFL_SCHL_SID
     , MOPHN_NO
     , ACTV_SUB_CTN
     , ACTV_ST_DT
     , ACTV_END_DT
     , MENTO_ACTV_HDCNT
     , TCH_ACTV_HDCNT
     , EXPT_EFCT_CTN
     , DEP_OWN
     , ACCNT_NO
     , BANK_CD
     , PO_FILE_SID
     , SELT_YN
     , REQ_AOM
     , SAM_AOM
     , GDCC_CTN
     , DEL_YN
     , REG_PRS_SID
     , REG_DT_TM
     , MDF_PRS_SID
     , MDF_DT_TM ) VALUES ( 'PRQ25000000000125804'
     , 6
     , 'SCH0007621'
     , ENC2('010-4179-4550')
     , '강릉 여행 일대기'
     , '2024-12-02'
     , '2025-02-18'
     , 1
     , NULL
     , '와 같이 2025년 멘토 동아리 활동 지원 신청서를 제출합니다. ※ 제출완료 버튼을 눌러도 신청서는 2025.6.14(금)까지 열람 및 수정 가능합니다. ※ 멘토 동아리로 선정된 경우
     , 활동 후 2026.1.20(월)까지 결과보고서(활동내용
     , 활동결과
     , 영수증 등)를 제출해야 합니다.와 같이 2025년 멘토 동아리 활동 지원 신청서를 제출합니다. ※ 제출완료 버튼을 눌러도 신청서는 2025.6.14(금)까지 열람 및 수정 가능합니다. ※ 멘토 동아리로 선정된 경우
     , 활동 후 2026.1.20(월)까지 결과보고서(활동내용
     , 활동결과
     , 영수증 등)를 제출해야 합니다.와 같이 2025년 멘토 동아리 활동 지원 신청서를 제출합니다. ※ 제출완료 버튼을 눌러도 신청서는 2025.6.14(금)까지 열람 및 수정 가능합니다. ※ 멘토 동아리로 선정된 경우
     , 활동 후 2026.1.20(월)까지 결과보고서(활동내용
     , 활동결과
     , 영수증 등)를 제출해야 합니다.'
     , ENC2(NULL)
     , ENC2(NULL)
     , NULL
     , NULL
     , NULL
     , 64666
     , NULL
     , NULL
     , 'N'
     , 'MBR2411794'
     , NOW()
     , 'MBR2411794'
     , '2025-02-27' );
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming] /* selectMtProgMentoClubAplActvDtlListBySidList - PROG_MENTO_CLUB_APL_ACTV_DTL_LIST테이블 SID로 리스트 조회 */SELECT IFNULL(FORMAT(PMCAADL.REQ_AOM
     , 0)
     , '') AS reqAomCom
     , PMCAADL.PROG_REQ_SID AS progReqSid
     , PMCAADL.ACTV_SEQ AS actvSeq
     , PMCAADL.ACTV_DTL_SUB_CTN AS actvDtlSubCtn
     , PMCAADL.ACTV_DTL_ST_DT AS actvDtlStDt
     , PMCAADL.ACTV_DTL_END_DT AS actvDtlEndDt
     , PMCAADL.ACTV_PLAN_CTN AS actvPlanCtn
     , PMCAADL.REQ_AOM AS reqAom
     , PMCAADL.REG_PRS_SID AS regPrsSid
     , PMCAADL.REG_DT_TM AS regDtTm
     , PMCAADL.MDF_PRS_SID AS mdfPrsSid
     , PMCAADL.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_APL_ACTV_DTL_LIST PMCAADL
 WHERE PMCAADL.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming] 
/* deleteMtProgMentoClubAplActvDtlList  */
DELETE
  FROM PROG_MENTO_CLUB_APL_ACTV_DTL_LIST
 WHERE PROG_REQ_SID = 'PRQ25000000000125804'
   AND ACTV_SEQ = 1;
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming]SELECT IFNULL(MAX(HIST_SEQ)+1
     , 1) AS histSeq
  FROM PROG_MENTO_CLUB_APL_ACTV_DTL_LIST_HIST
 WHERE PROG_REQ_SID = 'PRQ25000000000125804'
   AND ACTV_SEQ = 1;
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming] 
/* insertMtProgMentoClubAplActvDtlListHist  */
INSERT INTO PROG_MENTO_CLUB_APL_ACTV_DTL_LIST_HIST ( PROG_REQ_SID
     , ACTV_SEQ
     , HIST_SEQ
     , ACTV_DTL_SUB_CTN
     , ACTV_DTL_ST_DT
     , ACTV_DTL_END_DT
     , ACTV_PLAN_CTN
     , REQ_AOM
     , REG_PRS_SID
     , REG_DT_TM
     , MDF_PRS_SID
     , MDF_DT_TM ) VALUES ( 'PRQ25000000000125804'
     , 1
     , 10
     , '2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서'
     , '2024-11-01'
     , '2024-12-20'
     , '2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서'
     , 64666
     , 'MBR2411794'
     , NOW()
     , 'MBR2411794'
     , NULL );
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming] 
/* insertMtProgMentoClubAplActvDtlList  */
INSERT INTO PROG_MENTO_CLUB_APL_ACTV_DTL_LIST ( PROG_REQ_SID
     , ACTV_SEQ
     , ACTV_DTL_SUB_CTN
     , ACTV_DTL_ST_DT
     , ACTV_DTL_END_DT
     , ACTV_PLAN_CTN
     , REQ_AOM
     , REG_PRS_SID
     , REG_DT_TM
     , MDF_PRS_SID
     , MDF_DT_TM ) VALUES ( 'PRQ25000000000125804'
     , 1
     , '2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서'
     , CASE WHEN '2024-11-01'='NULL' THEN NULL ELSE '2024-11-01' END
     , CASE WHEN '2024-12-20'='NULL' THEN NULL ELSE '2024-12-20' END
     , '2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서'
     , 64666
     , 'MBR2411794'
     , NOW()
     , NULL
     , NULL );
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming]SELECT IFNULL(MAX(HIST_SEQ)+1
     , 1) AS histSeq
  FROM PROG_MENTO_CLUB_APL_ACTV_DTL_LIST_HIST
 WHERE PROG_REQ_SID = 'PRQ25000000000125804'
   AND ACTV_SEQ = 1;
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming] 
/* insertMtProgMentoClubAplActvDtlListHist  */
INSERT INTO PROG_MENTO_CLUB_APL_ACTV_DTL_LIST_HIST ( PROG_REQ_SID
     , ACTV_SEQ
     , HIST_SEQ
     , ACTV_DTL_SUB_CTN
     , ACTV_DTL_ST_DT
     , ACTV_DTL_END_DT
     , ACTV_PLAN_CTN
     , REQ_AOM
     , REG_PRS_SID
     , REG_DT_TM
     , MDF_PRS_SID
     , MDF_DT_TM ) VALUES ( 'PRQ25000000000125804'
     , 1
     , 11
     , '2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서'
     , NULL
     , NULL
     , '2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서2025년 멘토 동아리 활동 지원 신청서'
     , 64666
     , 'MBR2411794'
     , NOW()
     , NULL
     , NULL );
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming] /* selectMtProgMentoClubAplActvExpListBySidList - PROG_MENTO_CLUB_APL_ACTV_EXP_LIST테이블 SID로 리스트 조회 */SELECT IFNULL(FORMAT(PMCAAEL.UTPC
     , 0)
     , '') AS utpcCom
     , IFNULL(FORMAT(PMCAAEL.REQ_AOM
     , 0)
     , '') AS reqAomCom
     , PMCAAEL.PROG_REQ_SID AS progReqSid
     , PMCAAEL.ACTV_SEQ AS actvSeq
     , PMCAAEL.ACTV_EXP_SEQ AS actvExpSeq
     , PMCAAEL.ACTV_EXP_CTN AS actvExpCtn
     , PMCAAEL.UTPC AS utpc
     , PMCAAEL.QTT AS qtt
     , PMCAAEL.REQ_AOM AS reqAom
     , PMCAAEL.REG_PRS_SID AS regPrsSid
     , PMCAAEL.REG_DT_TM AS regDtTm
     , PMCAAEL.MDF_PRS_SID AS mdfPrsSid
     , PMCAAEL.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_APL_ACTV_EXP_LIST PMCAAEL
 WHERE PMCAAEL.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming] 
/* deleteMtProgMentoClubAplActvExpList  */
DELETE
  FROM PROG_MENTO_CLUB_APL_ACTV_EXP_LIST
 WHERE PROG_REQ_SID = 'PRQ25000000000125804'
   AND ACTV_SEQ = 1
   AND ACTV_EXP_SEQ = 1;
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming]SELECT IFNULL(MAX(HIST_SEQ)+1
     , 1) AS histSeq
  FROM PROG_MENTO_CLUB_APL_ACTV_EXP_LIST_HIST
 WHERE PROG_REQ_SID = 'PRQ25000000000125804'
   AND ACTV_SEQ = 1
   AND ACTV_EXP_SEQ = 1;
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming] 
/* insertMtProgMentoClubAplActvExpListHist  */
INSERT INTO PROG_MENTO_CLUB_APL_ACTV_EXP_LIST_HIST ( PROG_REQ_SID
     , ACTV_SEQ
     , ACTV_EXP_SEQ
     , HIST_SEQ
     , ACTV_EXP_CTN
     , UTPC
     , QTT
     , REQ_AOM
     , REG_PRS_SID
     , REG_DT_TM
     , MDF_PRS_SID
     , MDF_DT_TM ) VALUES ( 'PRQ25000000000125804'
     , 1
     , 1
     , 10
     , '가가가'
     , 32333
     , 2
     , 64666
     , 'MBR2411794'
     , NOW()
     , 'MBR2411794'
     , NULL );
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming] 
/* insertMtProgMentoClubAplActvExpList  */
INSERT INTO PROG_MENTO_CLUB_APL_ACTV_EXP_LIST ( PROG_REQ_SID
     , ACTV_SEQ
     , ACTV_EXP_SEQ
     , ACTV_EXP_CTN
     , UTPC
     , QTT
     , REQ_AOM
     , REG_PRS_SID
     , REG_DT_TM
     , MDF_PRS_SID
     , MDF_DT_TM ) VALUES ( 'PRQ25000000000125804'
     , 1
     , 1
     , '가가가'
     , 32333
     , 2
     , 64666
     , 'MBR2411794'
     , NOW()
     , NULL
     , NULL );
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming]SELECT IFNULL(MAX(HIST_SEQ)+1
     , 1) AS histSeq
  FROM PROG_MENTO_CLUB_APL_ACTV_EXP_LIST_HIST
 WHERE PROG_REQ_SID = 'PRQ25000000000125804'
   AND ACTV_SEQ = 1
   AND ACTV_EXP_SEQ = 1;
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming] 
/* insertMtProgMentoClubAplActvExpListHist  */
INSERT INTO PROG_MENTO_CLUB_APL_ACTV_EXP_LIST_HIST ( PROG_REQ_SID
     , ACTV_SEQ
     , ACTV_EXP_SEQ
     , HIST_SEQ
     , ACTV_EXP_CTN
     , UTPC
     , QTT
     , REQ_AOM
     , REG_PRS_SID
     , REG_DT_TM
     , MDF_PRS_SID
     , MDF_DT_TM ) VALUES ( 'PRQ25000000000125804'
     , 1
     , 1
     , 11
     , '가가가'
     , 32333
     , 2
     , 64666
     , 'MBR2411794'
     , NOW()
     , NULL
     , NULL );
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming] 
/* updateMtBizReqMbrInf  */
UPDATE BIZ_REQ_MBR_INF SET SCHL_SID = 'SCH0007621'
     , MDF_PRS_SID = 'MBR2411794'
     , MDF_DT_TM = NOW()
 WHERE REQ_NO = '2025MT0101125973'
   AND MBR_SID = 'MBR2411794';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming] /* selectMtBizReqMbrInfByPk - BIZ_REQ_MBR_INF테이블 PK로 조회 */SELECT GETCDNM(BRMI.BANK) AS bankNm
     , S.SCHL_NM AS schlNm
     , M.MBR_ID AS mbrId
     , BRMI.REQ_NO AS reqNo
     , BRMI.MBR_SID AS mbrSid
     , BRMI.MBR_DIV AS mbrDiv
     , BRMI.LOG_SEQ AS logSeq
     , DEC2(BRMI.NM) AS nm
     , DEC2(BRMI.PHN_NO) AS phnNo
     , DEC2(BRMI.MOPHN_NO) AS mophnNo
     , BRMI.SCHL_SID AS schlSid
     , BRMI.GRADE AS grade
     , BRMI.FML_REL_CD AS fmlRelCd
     , BRMI.BANK AS bank
     , DEC2(BRMI.ACCNT) AS accnt
     , BRMI.REG_PRS_SID AS regPrsSid
     , BRMI.REG_DT_TM AS regDtTm
     , BRMI.REG_PRS_IP AS regPrsIp
     , BRMI.MDF_PRS_SID AS mdfPrsSid
     , BRMI.MDF_DT_TM AS mdfDtTm
     , BRMI.DEL_YN AS delYn
     , BRMI.CHK_YN AS chkYn
     , BRMI.CHK_DT_TM AS chkDtTm
     , BRMI.MBR_MOD_DT_TM AS mbrModDtTm
     , BRMI.PROG_SVY_1_DT_TM AS progSvy1DtTm
     , BRMI.PROG_SVY_2_DT_TM AS progSvy2DtTm
     , DEC2(BRMI.UGT_CTT) AS ugtCtt
  FROM BIZ_REQ_MBR_INF BRMI
 INNER JOIN
       BIZ_REQ BR
    ON BRMI.REQ_NO = BR.REQ_NO
   AND BR.DEL_YN = 'N'
 INNER JOIN
       BIZ B
    ON BR.BIZ_ID = B.BIZ_ID
   AND B.DEL_YN = 'N' LEFT JOIN SCHL S
    ON BRMI.SCHL_SID = S.SCHL_SID LEFT JOIN MBR M
    ON BRMI.MBR_SID = M.MBR_SID
 WHERE BRMI.DEL_YN = 'N'
   AND BRMI.REQ_NO = '2025MT0101125973'
   AND BRMI.MBR_SID = 'MBR2411794';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming]SELECT IFNULL(MAX(HIST_SEQ)+1
     , 1) AS histSeq
  FROM BIZ_REQ_MBR_INF_HIST
 WHERE REQ_NO = '2025MT0101125973' 
   AND MBR_SID = 'MBR2411794';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:25:04  INFO [jdbc.sqltiming] 
/* insertMtBizReqMbrInfHist  */
INSERT INTO BIZ_REQ_MBR_INF_HIST ( REQ_NO
     , MBR_SID
     , HIST_SEQ
     , MBR_DIV
     , LOG_SEQ
     , NM
     , PHN_NO
     , MOPHN_NO
     , SCHL_SID
     , GRADE
     , FML_REL_CD
     , BANK
     , ACCNT
     , REG_PRS_SID
     , REG_DT_TM
     , REG_PRS_IP
     , MDF_PRS_SID
     , MDF_DT_TM
     , DEL_YN
     , CHK_YN
     , CHK_DT_TM
     , MBR_MOD_DT_TM
     , PROG_SVY_1_DT_TM
     , PROG_SVY_2_DT_TM
     , UGT_CTT ) VALUES ( '2025MT0101125973'
     , 'MBR2411794'
     , 7
     , 'RRC010'
     , NULL
     , ENC2('김유진')
     , ENC2('')
     , ENC2('010-4179-4550')
     , 'SCH0007621'
     , NULL
     , NULL
     , NULL
     , ENC2(NULL)
     , 'MBR0304254'
     , NOW()
     , NULL
     , NULL
     , NULL
     , 'N'
     , NULL
     , NULL
     , NULL
     , NULL
     , NULL
     , ENC2(NULL) );
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:25:05 DEBUG [org.sdream.comm.service.impl.TraceServiceImpl] [saveLog] TraceDTO [seq=null
     , connDtTm=null
     , sessId=BA56432068070106FE766BFCD8F45124
     , hostNm=localhost
     , pathNm=test
     , pageNm=/m/drmFstMy19/L215
     , param=[dbwls176] 
     , fullUrl=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36
     , rfrr=http://localhost:8080/m/drmFstMy20/L215
     , connIp=0:0:0:0:0:0:0:1
     , mdfDtTm=null]2025-02-27 01:25:05  INFO [jdbc.sqltiming] 
/* customInsertTrace  */
INSERT INTO TRACE ( SESS_ID 
     , CONN_DT_TM 
     , HOST_NM 
     , PATH_NM 
     , PAGE_NM 
     , PARAM 
     , FULL_URL 
     , RFRR 
     , CONN_IP 
     , MDF_DT_TM ) VALUES ( IFNULL('BA56432068070106FE766BFCD8F45124'
     , '') 
     , NOW() 
     , 'localhost' 
     , 'test' 
     , '/m/drmFstMy19/L215' 
     , '[dbwls176] ' 
     , 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36' 
     , 'http://localhost:8080/m/drmFstMy20/L215' 
     , '0:0:0:0:0:0:0:1' 
     , NOW() );
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:25:05  INFO [jdbc.sqltiming] 
/* selectPageAuth2List  */
SELECT PAGE_URI 
     , MENU_EXP_CD 
     , FUNC_EXPL 
     , USED_DT_TM 
     , DEL_YN 
     , MDF_PRS_SID 
     , MDF_DT_TM
  FROM PAGE_AUTH_2
 WHERE 1=1
   AND PAGE_URI = '/m/drmFstMy19/L215'
   AND DEL_YN = 'N';
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:25:06  INFO [jdbc.sqltiming] /* selectMtBizReqMbrInfByMypage - BIZ_REQ_MBR_INF테이블 마이페이지 선정자 확인 */SELECT B.BIZ_YR AS bizYr
     , B.BIZ_ID AS bizId
     , B.BIZ_TYPE_ID AS bizTypeId
     , B.PROD AS prod
     , S.SCHL_NM AS schlNm
     , M.MBR_ID AS mbrId
     , M.BIRTH AS birth
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , BRMI.REQ_NO AS reqNo
     , BRMI.MBR_SID AS mbrSid
     , BRMI.MBR_DIV AS mbrDiv
     , BRMI.LOG_SEQ AS logSeq
     , DEC2(BRMI.NM) AS nm
     , DEC2(BRMI.PHN_NO) AS phnNo
     , DEC2(BRMI.MOPHN_NO) AS mophnNo
     , BRMI.SCHL_SID AS schlSid
     , BRMI.GRADE AS grade
     , BRMI.FML_REL_CD AS fmlRelCd
     , BRMI.BANK AS bank
     , DEC2(BRMI.ACCNT) AS accnt
     , BRMI.REG_PRS_SID AS regPrsSid
     , BRMI.REG_DT_TM AS regDtTm
     , BRMI.REG_PRS_IP AS regPrsIp
     , BRMI.MDF_PRS_SID AS mdfPrsSid
     , BRMI.MDF_DT_TM AS mdfDtTm
     , BRMI.DEL_YN AS delYn
     , BRMI.CHK_YN AS chkYn
     , BRMI.CHK_DT_TM AS chkDtTm
     , BRMI.MBR_MOD_DT_TM AS mbrModDtTm
     , BRMI.PROG_SVY_1_DT_TM AS progSvy1DtTm
     , BRMI.PROG_SVY_2_DT_TM AS progSvy2DtTm
     , DEC2(BRMI.UGT_CTT) AS ugtCtt
  FROM BIZ_REQ_MBR_INF BRMI
 INNER JOIN
       BIZ_REQ BR
    ON BRMI.REQ_NO = BR.REQ_NO
   AND BR.DEL_YN = 'N'
 INNER JOIN
       BIZ B
    ON BR.BIZ_ID = B.BIZ_ID
   AND B.DEL_YN = 'N' LEFT JOIN SCHL S
    ON BRMI.SCHL_SID = S.SCHL_SID LEFT JOIN MBR M
    ON BRMI.MBR_SID = M.MBR_SID
 WHERE B.BIZ_STAT_CD = 'BSC050' /* 사업상태-진행중 */
   AND BRMI.MBR_DIV = 'RRC010' /* 멘토
     , 멘티 */
   AND BRMI.MBR_SID = 'MBR2411794' 
/* SID 
 */
   AND B.BIZ_TYPE_ID IN ('MT01'
     , 'MT02') 
/* 사업그룹  */
   AND BR.BIZ_REQ_STAT_CD = 'BRS020' /* 멘토 - 선정 */;
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:25:06  INFO [jdbc.sqltiming] /* selectMtProgByMypage - PROG테이블 마이페이지 조회 */SELECT P.PROG_SID AS progSid
     , P.PROG_GRP_CD AS progGrpCd
     , P.PROG_YR AS progYr
     , P.PROG_DIV_NM AS progDivNm
     , P.PROG_PROD AS progProd
     , P.ALIG_NUM AS aligNum
     , P.PROG_NM AS progNm
     , P.ATT_PRD_CTN AS attPrdCtn
     , P.DT_TM_CTN AS dtTmCtn
     , P.LOC_CTN AS locCtn
     , P.DTL_CTN AS dtlCtn
     , P.HDCNT AS hdcnt
     , P.WTNG_CNT AS wtngCnt
     , P.EXP_YN AS expYn
     , P.OPEN_YN AS openYn
     , P.REG_DIV AS regDiv
     , P.GDCC_EXP_YN AS gdccExpYn
     , P.MDF_YN AS mdfYn
     , P.FILE_SID AS fileSid
     , P.ST_TIME AS stTime
     , P.END_TIME AS endTime
     , P.REG_PRS_SID AS regPrsSid
     , P.REG_DT_TM AS regDtTm
     , P.REG_PRS_IP AS regPrsIp
     , P.MDF_PRS_SID AS mdfPrsSid
     , P.MDF_DT_TM AS mdfDtTm
     , P.DIV_CD_1 AS divCd1
     , P.UNV_PROG_ADM_YN AS unvProgAdmYn
     , P.PROG_STAT_CD AS progStatCd
  FROM PROG P
 WHERE P.PROG_GRP_CD = 'PGC084'
   AND P.PROG_YR = '2025';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:25:06  INFO [jdbc.sqltiming] /* selectMtProgReqByMypage - PROG_REQ테이블 마이페이지 프로그램 신청확인 */SELECT P.PROG_PROD AS progProd
     , P.PROG_NM AS progNm
     , P.DT_TM_CTN AS dtTmCtn
     , PRAF.ATT_FILE_SID AS attFileSid
     , SUBSTRING_INDEX(DEC2(PR.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(PR.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , GETCDNM(PR.REQ_STAT_CD) AS reqStatCdNm
     , PR.PROG_REQ_SID AS progReqSid
     , PR.PROG_SID AS progSid
     , DEC2(PR.REQ_PRS_NM) AS reqPrsNm
     , PR.BIRTH AS birth
     , PR.GRADE AS grade
     , PR.AFL AS afl
     , PR.POS AS pos
     , DEC2(PR.PHN_NO) AS phnNo
     , DEC2(PR.EMAIL) AS email
     , PR.PO_YN AS poYn
     , PR.POST_NO AS postNo
     , PR.NUM_ADDR AS numAddr
     , PR.ROAD_ADDR AS roadAddr
     , PR.DTL_ADDR AS dtlAddr
     , PR.REQ_YN AS reqYn
     , PR.STD_REQ_YN AS stdReqYn
     , PR.SEX_CD AS sexCd
     , PR.ATTD_YN AS attdYn
     , PR.COMPL_YN AS complYn
     , PR.REQ_CTN_1 AS reqCtn1
     , PR.REQ_CTN_2 AS reqCtn2
     , PR.DIV_CD_1 AS divCd1
     , PR.DIV_CD_2 AS divCd2
     , PR.BIZ_REQ_SEQ AS bizReqSeq
     , PR.BUT_BIZ_TYPE_CD AS butBizTypeCd
     , PR.BUT_BIZ_DTL_PART_CD AS butBizDtlPartCd
     , PR.REQ_STAT_NUM AS reqStatNum
     , PR.REQ_STAT_CD AS reqStatCd
     , PR.ETC_NUM_NM AS etcNumNm
     , PR.REG_PRS_SID AS regPrsSid
     , PR.REG_DT_TM AS regDtTm
     , PR.REG_PRS_IP AS regPrsIp
     , PR.MDF_PRS_SID AS mdfPrsSid
     , PR.MDF_DT_TM AS mdfDtTm
     , PR.CNCL_YN AS cnclYn
     , PR.RSDN_TYPE_CD AS rsdnTypeCd
     , PR.RAT_DIV AS ratDiv
     , PR.RST_CTN AS rstCtn
     , DEC2(PR.MOPHN_NO) AS mophnNo
     , DEC2(PR.IHIDNUM) AS ihidnum
     , PR.PRD AS prd
     , PR.MAJ AS maj
     , PR.SCRE_DIV_NM_1 AS screDivNm1
     , PR.SCRE_CRD_1 AS screCrd1
     , PR.SCRE_MAX_SCR_1 AS screMaxScr1
     , PR.SCRE_DIV_NM_2 AS screDivNm2
     , PR.SCRE_CRD_2 AS screCrd2
     , PR.SCRE_MAX_SCR_2 AS screMaxScr2
     , PR.REQ_CTN_3 AS reqCtn3
     , PR.YR AS yr
     , PR.REQ_NO AS reqNo
     , PR.RD10_REQ_NO AS rd10ReqNo
     , DEC2(PR.BANK_NM) AS bankNm
     , DEC2(PR.ACCNT_NO) AS accntNo
     , DEC2(PR.DEP_OWN) AS depOwn
     , PR.BANK_DIV AS bankDiv
     , PR.BANK_CD AS bankCd
     , PR.BANK_ADDR AS bankAddr
     , PR.EVAL_CMN_SID_1 AS evalCmnSid1
     , PR.EVAL_1_A AS eval1A
     , PR.EVAL_1_B AS eval1B
     , PR.EVAL_1_C AS eval1C
     , PR.EVAL_SCR_1 AS evalScr1
     , PR.EVAL_CTN_1 AS evalCtn1
     , PR.EVAL_CMN_SID_2 AS evalCmnSid2
     , PR.EVAL_2_A AS eval2A
     , PR.EVAL_2_B AS eval2B
     , PR.EVAL_2_C AS eval2C
     , PR.EVAL_SCR_2 AS evalScr2
     , PR.EVAL_CTN_2 AS evalCtn2
     , PR.NAT AS nat
     , PR.REQ_CTN_7 AS reqCtn7
     , PR.REQ_CTN_6 AS reqCtn6
     , PR.REQ_CTN_5 AS reqCtn5
     , PR.REQ_CTN_4 AS reqCtn4
     , PR.REQ_PRS_SID AS reqPrsSid
     , PR.CALC_YN AS calcYn
     , (SELECT PROG_YR
  FROM PROG P
 WHERE PROG_SID = PR.PROG_SID ) AS progYr
  FROM PROG_REQ PR
 INNER JOIN
       PROG P
    ON PR.PROG_SID = P.PROG_SID LEFT JOIN PROG_REQ_ATT_FILE PRAF
    ON PRAF.PROG_REQ_SID = PR.PROG_REQ_SID
 WHERE P.PROG_GRP_CD = 'PGC084'
   AND P.PROG_YR = '2025'
   AND PR.REG_PRS_SID = 'MBR2411794';
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:25:06  INFO [jdbc.sqltiming] /* selectMtProgMentoClubAplByPk - PROG_MENTO_CLUB_APL테이블 PK로 조회 */SELECT GETCDNM(PMCA.BANK_CD) AS bankCdNm
     , IFNULL(FORMAT(PMCA.REQ_AOM
     , 0)
     , 0) AS reqAomCom
     , IFNULL(FORMAT(PMCA.SAM_AOM
     , 0)
     , 0) AS samAomCom
     , (SELECT FILE_NM
  FROM FILE_MGT FM
 WHERE FM.FILE_SID = PMCA.PO_FILE_SID
   AND FM.DEL_YN = 'N') AS poFileNm
     , PMCA.PROG_REQ_SID AS progReqSid
     , PMCA.AFL_SCHL_SID AS aflSchlSid
     , DEC2(PMCA.MOPHN_NO) AS mophnNo
     , PMCA.ACTV_SUB_CTN AS actvSubCtn
     , PMCA.ACTV_ST_DT AS actvStDt
     , PMCA.ACTV_END_DT AS actvEndDt
     , PMCA.MENTO_ACTV_HDCNT AS mentoActvHdcnt
     , PMCA.TCH_ACTV_HDCNT AS tchActvHdcnt
     , PMCA.EXPT_EFCT_CTN AS exptEfctCtn
     , DEC2(PMCA.DEP_OWN) AS depOwn
     , DEC2(PMCA.ACCNT_NO) AS accntNo
     , PMCA.BANK_CD AS bankCd
     , PMCA.PO_FILE_SID AS poFileSid
     , PMCA.SELT_YN AS seltYn
     , PMCA.REQ_AOM AS reqAom
     , PMCA.SAM_AOM AS samAom
     , PMCA.GDCC_CTN AS gdccCtn
     , PMCA.DEL_YN AS delYn
     , PMCA.REG_PRS_SID AS regPrsSid
     , PMCA.REG_DT_TM AS regDtTm
     , PMCA.MDF_PRS_SID AS mdfPrsSid
     , PMCA.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_APL PMCA
 WHERE PMCA.DEL_YN = 'N'
   AND PMCA.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:25:06  INFO [jdbc.sqltiming] /* selectMtProgMentoClubVrfByPk - PROG_MENTO_CLUB_VRF테이블 PK로 조회 */SELECT PMCV.PROG_REQ_SID AS progReqSid
     , PMCV.DOC_CMN_1_SID AS docCmn1Sid
     , PMCV.DOC_CMN_2_SID AS docCmn2Sid
     , PMCV.INV_CMN_1_SID AS invCmn1Sid
     , PMCV.INV_CMN_2_SID AS invCmn2Sid
     , PMCV.DOC_CMN_1_EVAL_SCR AS docCmn1EvalScr
     , PMCV.DOC_CMN_2_EVAL_SCR AS docCmn2EvalScr
     , PMCV.INV_CMN_1_EVAL AS invCmn1Eval
     , PMCV.INV_CMN_2_EVAL AS invCmn2Eval
     , PMCV.DOC_CMN_1_GNRV AS docCmn1Gnrv
     , PMCV.DOC_CMN_2_GNRV AS docCmn2Gnrv
     , PMCV.INV_CMN_1_GNRV AS invCmn1Gnrv
     , PMCV.INV_CMN_2_GNRV AS invCmn2Gnrv
     , PMCV.DOC_CMN_1_UNQ AS docCmn1Unq
     , PMCV.DOC_CMN_2_UNQ AS docCmn2Unq
     , PMCV.INV_CMN_1_UNQ AS invCmn1Unq
     , PMCV.INV_CMN_2_UNQ AS invCmn2Unq
     , PMCV.DOC_CMN_1_RVW_DT_TM AS docCmn1RvwDtTm
     , PMCV.DOC_CMN_2_RVW_DT_TM AS docCmn2RvwDtTm
     , PMCV.INV_CMN_1_RVW_DT_TM AS invCmn1RvwDtTm
     , PMCV.INV_CMN_2_RVW_DT_TM AS invCmn2RvwDtTm
     , PMCV.VRF_REQ_NO AS vrfReqNo
     , PMCV.PART_PROG AS partProg
     , PMCV.UNQ AS unq
     , PMCV.RVW_TRG_YN AS rvwTrgYn
     , PMCV.DOC_RST_CD AS docRstCd
     , PMCV.INV_TM AS invTm
     , PMCV.DEL_YN AS delYn
     , PMCV.REG_PRS_SID AS regPrsSid
     , PMCV.REG_DT_TM AS regDtTm
     , PMCV.MDF_PRS_SID AS mdfPrsSid
     , PMCV.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_VRF PMCV
 WHERE PMCV.DEL_YN = 'N' 
   AND PMCV.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:25:06  INFO [jdbc.sqltiming] /* selectMtProgMentoClubRstRptByPk - PROG_MENTO_CLUB_RST_RPT테이블 PK로 조회 */SELECT (SELECT FM.FILE_NM 
  FROM FILE_MGT FM
 WHERE FM.FILE_SID = PMCRR.SETT_FILE_SID
   AND FM.DEL_YN = 'N') AS settFileNm
     , SUBSTRING_INDEX(DEC2(PMCRR.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(PMCRR.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , PMCRR.PROG_REQ_SID AS progReqSid
     , PMCRR.AFL_SCHL_SID AS aflSchlSid
     , DEC2(PMCRR.MOPHN_NO) AS mophnNo
     , PMCRR.ACTV_RST_CTN AS actvRstCtn
     , PMCRR.SETT_FILE_SID AS settFileSid
     , PMCRR.COMM_STAT_CD AS commStatCd
     , PMCRR.REG_PRS_SID AS regPrsSid
     , PMCRR.REG_DT_TM AS regDtTm
     , PMCRR.MDF_PRS_SID AS mdfPrsSid
     , PMCRR.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_RST_RPT PMCRR 
WHERE PMCRR.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:26:28  INFO [jdbc.sqltiming]SELECT 1;
--------------------------------------------------
{
executed in 5 msec}2025-02-27 01:28:22 DEBUG [org.sdream.comm.service.impl.TraceServiceImpl] [saveLog] TraceDTO [seq=null
     , connDtTm=null
     , sessId=BA56432068070106FE766BFCD8F45124
     , hostNm=localhost
     , pathNm=test
     , pageNm=/m/drmFstMy19/L215
     , param=[dbwls176] 
     , fullUrl=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36
     , rfrr=http://localhost:8080/m/drmFstMy20/L215
     , connIp=0:0:0:0:0:0:0:1
     , mdfDtTm=null]2025-02-27 01:28:22  INFO [jdbc.sqltiming] 
/* customInsertTrace  */
INSERT INTO TRACE ( SESS_ID 
     , CONN_DT_TM 
     , HOST_NM 
     , PATH_NM 
     , PAGE_NM 
     , PARAM 
     , FULL_URL 
     , RFRR 
     , CONN_IP 
     , MDF_DT_TM ) VALUES ( IFNULL('BA56432068070106FE766BFCD8F45124'
     , '') 
     , NOW() 
     , 'localhost' 
     , 'test' 
     , '/m/drmFstMy19/L215' 
     , '[dbwls176] ' 
     , 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36' 
     , 'http://localhost:8080/m/drmFstMy20/L215' 
     , '0:0:0:0:0:0:0:1' 
     , NOW() );
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:28:22  INFO [jdbc.sqltiming] 
/* selectPageAuth2List  */
SELECT PAGE_URI 
     , MENU_EXP_CD 
     , FUNC_EXPL 
     , USED_DT_TM 
     , DEL_YN 
     , MDF_PRS_SID 
     , MDF_DT_TM
  FROM PAGE_AUTH_2
 WHERE 1=1
   AND PAGE_URI = '/m/drmFstMy19/L215'
   AND DEL_YN = 'N';
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:28:22  INFO [jdbc.sqltiming] /* selectMtBizReqMbrInfByMypage - BIZ_REQ_MBR_INF테이블 마이페이지 선정자 확인 */SELECT B.BIZ_YR AS bizYr
     , B.BIZ_ID AS bizId
     , B.BIZ_TYPE_ID AS bizTypeId
     , B.PROD AS prod
     , S.SCHL_NM AS schlNm
     , M.MBR_ID AS mbrId
     , M.BIRTH AS birth
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , BRMI.REQ_NO AS reqNo
     , BRMI.MBR_SID AS mbrSid
     , BRMI.MBR_DIV AS mbrDiv
     , BRMI.LOG_SEQ AS logSeq
     , DEC2(BRMI.NM) AS nm
     , DEC2(BRMI.PHN_NO) AS phnNo
     , DEC2(BRMI.MOPHN_NO) AS mophnNo
     , BRMI.SCHL_SID AS schlSid
     , BRMI.GRADE AS grade
     , BRMI.FML_REL_CD AS fmlRelCd
     , BRMI.BANK AS bank
     , DEC2(BRMI.ACCNT) AS accnt
     , BRMI.REG_PRS_SID AS regPrsSid
     , BRMI.REG_DT_TM AS regDtTm
     , BRMI.REG_PRS_IP AS regPrsIp
     , BRMI.MDF_PRS_SID AS mdfPrsSid
     , BRMI.MDF_DT_TM AS mdfDtTm
     , BRMI.DEL_YN AS delYn
     , BRMI.CHK_YN AS chkYn
     , BRMI.CHK_DT_TM AS chkDtTm
     , BRMI.MBR_MOD_DT_TM AS mbrModDtTm
     , BRMI.PROG_SVY_1_DT_TM AS progSvy1DtTm
     , BRMI.PROG_SVY_2_DT_TM AS progSvy2DtTm
     , DEC2(BRMI.UGT_CTT) AS ugtCtt
  FROM BIZ_REQ_MBR_INF BRMI
 INNER JOIN
       BIZ_REQ BR
    ON BRMI.REQ_NO = BR.REQ_NO
   AND BR.DEL_YN = 'N'
 INNER JOIN
       BIZ B
    ON BR.BIZ_ID = B.BIZ_ID
   AND B.DEL_YN = 'N' LEFT JOIN SCHL S
    ON BRMI.SCHL_SID = S.SCHL_SID LEFT JOIN MBR M
    ON BRMI.MBR_SID = M.MBR_SID
 WHERE B.BIZ_STAT_CD = 'BSC050' /* 사업상태-진행중 */
   AND BRMI.MBR_DIV = 'RRC010' /* 멘토
     , 멘티 */
   AND BRMI.MBR_SID = 'MBR2411794' 
/* SID 
 */
   AND B.BIZ_TYPE_ID IN ('MT01'
     , 'MT02') 
/* 사업그룹  */
   AND BR.BIZ_REQ_STAT_CD = 'BRS020' /* 멘토 - 선정 */;
--------------------------------------------------
{
executed in 12 msec}2025-02-27 01:28:22  INFO [jdbc.sqltiming] /* selectMtProgByMypage - PROG테이블 마이페이지 조회 */SELECT P.PROG_SID AS progSid
     , P.PROG_GRP_CD AS progGrpCd
     , P.PROG_YR AS progYr
     , P.PROG_DIV_NM AS progDivNm
     , P.PROG_PROD AS progProd
     , P.ALIG_NUM AS aligNum
     , P.PROG_NM AS progNm
     , P.ATT_PRD_CTN AS attPrdCtn
     , P.DT_TM_CTN AS dtTmCtn
     , P.LOC_CTN AS locCtn
     , P.DTL_CTN AS dtlCtn
     , P.HDCNT AS hdcnt
     , P.WTNG_CNT AS wtngCnt
     , P.EXP_YN AS expYn
     , P.OPEN_YN AS openYn
     , P.REG_DIV AS regDiv
     , P.GDCC_EXP_YN AS gdccExpYn
     , P.MDF_YN AS mdfYn
     , P.FILE_SID AS fileSid
     , P.ST_TIME AS stTime
     , P.END_TIME AS endTime
     , P.REG_PRS_SID AS regPrsSid
     , P.REG_DT_TM AS regDtTm
     , P.REG_PRS_IP AS regPrsIp
     , P.MDF_PRS_SID AS mdfPrsSid
     , P.MDF_DT_TM AS mdfDtTm
     , P.DIV_CD_1 AS divCd1
     , P.UNV_PROG_ADM_YN AS unvProgAdmYn
     , P.PROG_STAT_CD AS progStatCd
  FROM PROG P
 WHERE P.PROG_GRP_CD = 'PGC084'
   AND P.PROG_YR = '2025';
--------------------------------------------------
{
executed in 14 msec}2025-02-27 01:28:22  INFO [jdbc.sqltiming] /* selectMtProgReqByMypage - PROG_REQ테이블 마이페이지 프로그램 신청확인 */SELECT P.PROG_PROD AS progProd
     , P.PROG_NM AS progNm
     , P.DT_TM_CTN AS dtTmCtn
     , PRAF.ATT_FILE_SID AS attFileSid
     , SUBSTRING_INDEX(DEC2(PR.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(PR.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , GETCDNM(PR.REQ_STAT_CD) AS reqStatCdNm
     , PR.PROG_REQ_SID AS progReqSid
     , PR.PROG_SID AS progSid
     , DEC2(PR.REQ_PRS_NM) AS reqPrsNm
     , PR.BIRTH AS birth
     , PR.GRADE AS grade
     , PR.AFL AS afl
     , PR.POS AS pos
     , DEC2(PR.PHN_NO) AS phnNo
     , DEC2(PR.EMAIL) AS email
     , PR.PO_YN AS poYn
     , PR.POST_NO AS postNo
     , PR.NUM_ADDR AS numAddr
     , PR.ROAD_ADDR AS roadAddr
     , PR.DTL_ADDR AS dtlAddr
     , PR.REQ_YN AS reqYn
     , PR.STD_REQ_YN AS stdReqYn
     , PR.SEX_CD AS sexCd
     , PR.ATTD_YN AS attdYn
     , PR.COMPL_YN AS complYn
     , PR.REQ_CTN_1 AS reqCtn1
     , PR.REQ_CTN_2 AS reqCtn2
     , PR.DIV_CD_1 AS divCd1
     , PR.DIV_CD_2 AS divCd2
     , PR.BIZ_REQ_SEQ AS bizReqSeq
     , PR.BUT_BIZ_TYPE_CD AS butBizTypeCd
     , PR.BUT_BIZ_DTL_PART_CD AS butBizDtlPartCd
     , PR.REQ_STAT_NUM AS reqStatNum
     , PR.REQ_STAT_CD AS reqStatCd
     , PR.ETC_NUM_NM AS etcNumNm
     , PR.REG_PRS_SID AS regPrsSid
     , PR.REG_DT_TM AS regDtTm
     , PR.REG_PRS_IP AS regPrsIp
     , PR.MDF_PRS_SID AS mdfPrsSid
     , PR.MDF_DT_TM AS mdfDtTm
     , PR.CNCL_YN AS cnclYn
     , PR.RSDN_TYPE_CD AS rsdnTypeCd
     , PR.RAT_DIV AS ratDiv
     , PR.RST_CTN AS rstCtn
     , DEC2(PR.MOPHN_NO) AS mophnNo
     , DEC2(PR.IHIDNUM) AS ihidnum
     , PR.PRD AS prd
     , PR.MAJ AS maj
     , PR.SCRE_DIV_NM_1 AS screDivNm1
     , PR.SCRE_CRD_1 AS screCrd1
     , PR.SCRE_MAX_SCR_1 AS screMaxScr1
     , PR.SCRE_DIV_NM_2 AS screDivNm2
     , PR.SCRE_CRD_2 AS screCrd2
     , PR.SCRE_MAX_SCR_2 AS screMaxScr2
     , PR.REQ_CTN_3 AS reqCtn3
     , PR.YR AS yr
     , PR.REQ_NO AS reqNo
     , PR.RD10_REQ_NO AS rd10ReqNo
     , DEC2(PR.BANK_NM) AS bankNm
     , DEC2(PR.ACCNT_NO) AS accntNo
     , DEC2(PR.DEP_OWN) AS depOwn
     , PR.BANK_DIV AS bankDiv
     , PR.BANK_CD AS bankCd
     , PR.BANK_ADDR AS bankAddr
     , PR.EVAL_CMN_SID_1 AS evalCmnSid1
     , PR.EVAL_1_A AS eval1A
     , PR.EVAL_1_B AS eval1B
     , PR.EVAL_1_C AS eval1C
     , PR.EVAL_SCR_1 AS evalScr1
     , PR.EVAL_CTN_1 AS evalCtn1
     , PR.EVAL_CMN_SID_2 AS evalCmnSid2
     , PR.EVAL_2_A AS eval2A
     , PR.EVAL_2_B AS eval2B
     , PR.EVAL_2_C AS eval2C
     , PR.EVAL_SCR_2 AS evalScr2
     , PR.EVAL_CTN_2 AS evalCtn2
     , PR.NAT AS nat
     , PR.REQ_CTN_7 AS reqCtn7
     , PR.REQ_CTN_6 AS reqCtn6
     , PR.REQ_CTN_5 AS reqCtn5
     , PR.REQ_CTN_4 AS reqCtn4
     , PR.REQ_PRS_SID AS reqPrsSid
     , PR.CALC_YN AS calcYn
     , (SELECT PROG_YR
  FROM PROG P
 WHERE PROG_SID = PR.PROG_SID ) AS progYr
  FROM PROG_REQ PR
 INNER JOIN
       PROG P
    ON PR.PROG_SID = P.PROG_SID LEFT JOIN PROG_REQ_ATT_FILE PRAF
    ON PRAF.PROG_REQ_SID = PR.PROG_REQ_SID
 WHERE P.PROG_GRP_CD = 'PGC084'
   AND P.PROG_YR = '2025'
   AND PR.REG_PRS_SID = 'MBR2411794';
--------------------------------------------------
{
executed in 13 msec}2025-02-27 01:28:22  INFO [jdbc.sqltiming] /* selectMtProgMentoClubAplByPk - PROG_MENTO_CLUB_APL테이블 PK로 조회 */SELECT GETCDNM(PMCA.BANK_CD) AS bankCdNm
     , IFNULL(FORMAT(PMCA.REQ_AOM
     , 0)
     , 0) AS reqAomCom
     , IFNULL(FORMAT(PMCA.SAM_AOM
     , 0)
     , 0) AS samAomCom
     , (SELECT FILE_NM
  FROM FILE_MGT FM
 WHERE FM.FILE_SID = PMCA.PO_FILE_SID
   AND FM.DEL_YN = 'N') AS poFileNm
     , PMCA.PROG_REQ_SID AS progReqSid
     , PMCA.AFL_SCHL_SID AS aflSchlSid
     , DEC2(PMCA.MOPHN_NO) AS mophnNo
     , PMCA.ACTV_SUB_CTN AS actvSubCtn
     , PMCA.ACTV_ST_DT AS actvStDt
     , PMCA.ACTV_END_DT AS actvEndDt
     , PMCA.MENTO_ACTV_HDCNT AS mentoActvHdcnt
     , PMCA.TCH_ACTV_HDCNT AS tchActvHdcnt
     , PMCA.EXPT_EFCT_CTN AS exptEfctCtn
     , DEC2(PMCA.DEP_OWN) AS depOwn
     , DEC2(PMCA.ACCNT_NO) AS accntNo
     , PMCA.BANK_CD AS bankCd
     , PMCA.PO_FILE_SID AS poFileSid
     , PMCA.SELT_YN AS seltYn
     , PMCA.REQ_AOM AS reqAom
     , PMCA.SAM_AOM AS samAom
     , PMCA.GDCC_CTN AS gdccCtn
     , PMCA.DEL_YN AS delYn
     , PMCA.REG_PRS_SID AS regPrsSid
     , PMCA.REG_DT_TM AS regDtTm
     , PMCA.MDF_PRS_SID AS mdfPrsSid
     , PMCA.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_APL PMCA
 WHERE PMCA.DEL_YN = 'N'
   AND PMCA.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:28:22  INFO [jdbc.sqltiming] /* selectMtProgMentoClubVrfByPk - PROG_MENTO_CLUB_VRF테이블 PK로 조회 */SELECT PMCV.PROG_REQ_SID AS progReqSid
     , PMCV.DOC_CMN_1_SID AS docCmn1Sid
     , PMCV.DOC_CMN_2_SID AS docCmn2Sid
     , PMCV.INV_CMN_1_SID AS invCmn1Sid
     , PMCV.INV_CMN_2_SID AS invCmn2Sid
     , PMCV.DOC_CMN_1_EVAL_SCR AS docCmn1EvalScr
     , PMCV.DOC_CMN_2_EVAL_SCR AS docCmn2EvalScr
     , PMCV.INV_CMN_1_EVAL AS invCmn1Eval
     , PMCV.INV_CMN_2_EVAL AS invCmn2Eval
     , PMCV.DOC_CMN_1_GNRV AS docCmn1Gnrv
     , PMCV.DOC_CMN_2_GNRV AS docCmn2Gnrv
     , PMCV.INV_CMN_1_GNRV AS invCmn1Gnrv
     , PMCV.INV_CMN_2_GNRV AS invCmn2Gnrv
     , PMCV.DOC_CMN_1_UNQ AS docCmn1Unq
     , PMCV.DOC_CMN_2_UNQ AS docCmn2Unq
     , PMCV.INV_CMN_1_UNQ AS invCmn1Unq
     , PMCV.INV_CMN_2_UNQ AS invCmn2Unq
     , PMCV.DOC_CMN_1_RVW_DT_TM AS docCmn1RvwDtTm
     , PMCV.DOC_CMN_2_RVW_DT_TM AS docCmn2RvwDtTm
     , PMCV.INV_CMN_1_RVW_DT_TM AS invCmn1RvwDtTm
     , PMCV.INV_CMN_2_RVW_DT_TM AS invCmn2RvwDtTm
     , PMCV.VRF_REQ_NO AS vrfReqNo
     , PMCV.PART_PROG AS partProg
     , PMCV.UNQ AS unq
     , PMCV.RVW_TRG_YN AS rvwTrgYn
     , PMCV.DOC_RST_CD AS docRstCd
     , PMCV.INV_TM AS invTm
     , PMCV.DEL_YN AS delYn
     , PMCV.REG_PRS_SID AS regPrsSid
     , PMCV.REG_DT_TM AS regDtTm
     , PMCV.MDF_PRS_SID AS mdfPrsSid
     , PMCV.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_VRF PMCV
 WHERE PMCV.DEL_YN = 'N' 
   AND PMCV.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:28:22  INFO [jdbc.sqltiming] /* selectMtProgMentoClubRstRptByPk - PROG_MENTO_CLUB_RST_RPT테이블 PK로 조회 */SELECT (SELECT FM.FILE_NM 
  FROM FILE_MGT FM
 WHERE FM.FILE_SID = PMCRR.SETT_FILE_SID
   AND FM.DEL_YN = 'N') AS settFileNm
     , SUBSTRING_INDEX(DEC2(PMCRR.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(PMCRR.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , PMCRR.PROG_REQ_SID AS progReqSid
     , PMCRR.AFL_SCHL_SID AS aflSchlSid
     , DEC2(PMCRR.MOPHN_NO) AS mophnNo
     , PMCRR.ACTV_RST_CTN AS actvRstCtn
     , PMCRR.SETT_FILE_SID AS settFileSid
     , PMCRR.COMM_STAT_CD AS commStatCd
     , PMCRR.REG_PRS_SID AS regPrsSid
     , PMCRR.REG_DT_TM AS regDtTm
     , PMCRR.MDF_PRS_SID AS mdfPrsSid
     , PMCRR.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_RST_RPT PMCRR 
WHERE PMCRR.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:28:24 DEBUG [org.sdream.comm.service.impl.TraceServiceImpl] [saveLog] TraceDTO [seq=null
     , connDtTm=null
     , sessId=BA56432068070106FE766BFCD8F45124
     , hostNm=localhost
     , pathNm=test
     , pageNm=/p/drmFstMy19RstPop
     , param=[dbwls176];
--------------------------------------------------
{
progReqSid=[PRQ25000000000125804]}
     , fullUrl=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36
     , rfrr=http://localhost:8080/m/drmFstMy19/L215
     , connIp=0:0:0:0:0:0:0:1
     , mdfDtTm=null]2025-02-27 01:28:24  INFO [jdbc.sqltiming] 
/* customInsertTrace  */
INSERT INTO TRACE ( SESS_ID 
     , CONN_DT_TM 
     , HOST_NM 
     , PATH_NM 
     , PAGE_NM 
     , PARAM 
     , FULL_URL 
     , RFRR 
     , CONN_IP 
     , MDF_DT_TM ) VALUES ( IFNULL('BA56432068070106FE766BFCD8F45124'
     , '') 
     , NOW() 
     , 'localhost' 
     , 'test' 
     , '/p/drmFstMy19RstPop' 
     , '[dbwls176];
--------------------------------------------------
{
progReqSid=[PRQ25000000000125804]}' 
     , 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36' 
     , 'http://localhost:8080/m/drmFstMy19/L215' 
     , '0:0:0:0:0:0:0:1' 
     , NOW() );
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:28:24  INFO [jdbc.sqltiming] 
/* selectPageAuth2List  */
SELECT PAGE_URI 
     , MENU_EXP_CD 
     , FUNC_EXPL 
     , USED_DT_TM 
     , DEL_YN 
     , MDF_PRS_SID 
     , MDF_DT_TM
  FROM PAGE_AUTH_2
 WHERE 1=1
   AND PAGE_URI = '/p/drmFstMy19RstPop'
   AND DEL_YN = 'N';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:28:24  INFO [jdbc.sqltiming] /* selectMtBizReqMbrInfByMypage - BIZ_REQ_MBR_INF테이블 마이페이지 선정자 확인 */SELECT B.BIZ_YR AS bizYr
     , B.BIZ_ID AS bizId
     , B.BIZ_TYPE_ID AS bizTypeId
     , B.PROD AS prod
     , S.SCHL_NM AS schlNm
     , M.MBR_ID AS mbrId
     , M.BIRTH AS birth
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , BRMI.REQ_NO AS reqNo
     , BRMI.MBR_SID AS mbrSid
     , BRMI.MBR_DIV AS mbrDiv
     , BRMI.LOG_SEQ AS logSeq
     , DEC2(BRMI.NM) AS nm
     , DEC2(BRMI.PHN_NO) AS phnNo
     , DEC2(BRMI.MOPHN_NO) AS mophnNo
     , BRMI.SCHL_SID AS schlSid
     , BRMI.GRADE AS grade
     , BRMI.FML_REL_CD AS fmlRelCd
     , BRMI.BANK AS bank
     , DEC2(BRMI.ACCNT) AS accnt
     , BRMI.REG_PRS_SID AS regPrsSid
     , BRMI.REG_DT_TM AS regDtTm
     , BRMI.REG_PRS_IP AS regPrsIp
     , BRMI.MDF_PRS_SID AS mdfPrsSid
     , BRMI.MDF_DT_TM AS mdfDtTm
     , BRMI.DEL_YN AS delYn
     , BRMI.CHK_YN AS chkYn
     , BRMI.CHK_DT_TM AS chkDtTm
     , BRMI.MBR_MOD_DT_TM AS mbrModDtTm
     , BRMI.PROG_SVY_1_DT_TM AS progSvy1DtTm
     , BRMI.PROG_SVY_2_DT_TM AS progSvy2DtTm
     , DEC2(BRMI.UGT_CTT) AS ugtCtt
  FROM BIZ_REQ_MBR_INF BRMI
 INNER JOIN
       BIZ_REQ BR
    ON BRMI.REQ_NO = BR.REQ_NO
   AND BR.DEL_YN = 'N'
 INNER JOIN
       BIZ B
    ON BR.BIZ_ID = B.BIZ_ID
   AND B.DEL_YN = 'N' LEFT JOIN SCHL S
    ON BRMI.SCHL_SID = S.SCHL_SID LEFT JOIN MBR M
    ON BRMI.MBR_SID = M.MBR_SID
 WHERE B.BIZ_STAT_CD = 'BSC050' /* 사업상태-진행중 */
   AND BRMI.MBR_DIV = 'RRC010' /* 멘토
     , 멘티 */
   AND BRMI.MBR_SID = 'MBR2411794' 
/* SID 
 */
   AND B.BIZ_TYPE_ID IN ('MT01'
     , 'MT02') 
/* 사업그룹  */
   AND BR.BIZ_REQ_STAT_CD = 'BRS020' /* 멘토 - 선정 */;
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:28:24  INFO [jdbc.sqltiming] /* selectMtProgReqByPk - PROG_REQ테이블 PK로 조회 */SELECT PR.PROG_REQ_SID AS progReqSid
     , PR.PROG_SID AS progSid
     , DEC2(PR.REQ_PRS_NM) AS reqPrsNm
     , PR.BIRTH AS birth
     , PR.GRADE AS grade
     , PR.AFL AS afl
     , PR.POS AS pos
     , DEC2(PR.PHN_NO) AS phnNo
     , DEC2(PR.EMAIL) AS email
     , PR.PO_YN AS poYn
     , PR.POST_NO AS postNo
     , PR.NUM_ADDR AS numAddr
     , PR.ROAD_ADDR AS roadAddr
     , PR.DTL_ADDR AS dtlAddr
     , PR.REQ_YN AS reqYn
     , PR.STD_REQ_YN AS stdReqYn
     , PR.SEX_CD AS sexCd
     , PR.ATTD_YN AS attdYn
     , PR.COMPL_YN AS complYn
     , PR.REQ_CTN_1 AS reqCtn1
     , PR.REQ_CTN_2 AS reqCtn2
     , PR.DIV_CD_1 AS divCd1
     , PR.DIV_CD_2 AS divCd2
     , PR.BIZ_REQ_SEQ AS bizReqSeq
     , PR.BUT_BIZ_TYPE_CD AS butBizTypeCd
     , PR.BUT_BIZ_DTL_PART_CD AS butBizDtlPartCd
     , PR.REQ_STAT_NUM AS reqStatNum
     , PR.REQ_STAT_CD AS reqStatCd
     , PR.ETC_NUM_NM AS etcNumNm
     , PR.REG_PRS_SID AS regPrsSid
     , PR.REG_DT_TM AS regDtTm
     , PR.REG_PRS_IP AS regPrsIp
     , PR.MDF_PRS_SID AS mdfPrsSid
     , PR.MDF_DT_TM AS mdfDtTm
     , PR.CNCL_YN AS cnclYn
     , PR.RSDN_TYPE_CD AS rsdnTypeCd
     , PR.RAT_DIV AS ratDiv
     , PR.RST_CTN AS rstCtn
     , DEC2(PR.MOPHN_NO) AS mophnNo
     , DEC2(PR.IHIDNUM) AS ihidnum
     , PR.PRD AS prd
     , PR.MAJ AS maj
     , PR.SCRE_DIV_NM_1 AS screDivNm1
     , PR.SCRE_CRD_1 AS screCrd1
     , PR.SCRE_MAX_SCR_1 AS screMaxScr1
     , PR.SCRE_DIV_NM_2 AS screDivNm2
     , PR.SCRE_CRD_2 AS screCrd2
     , PR.SCRE_MAX_SCR_2 AS screMaxScr2
     , PR.REQ_CTN_3 AS reqCtn3
     , PR.YR AS yr
     , PR.REQ_NO AS reqNo
     , PR.RD10_REQ_NO AS rd10ReqNo
     , DEC2(PR.BANK_NM) AS bankNm
     , DEC2(PR.ACCNT_NO) AS accntNo
     , DEC2(PR.DEP_OWN) AS depOwn
     , PR.BANK_DIV AS bankDiv
     , PR.BANK_CD AS bankCd
     , PR.BANK_ADDR AS bankAddr
     , PR.EVAL_CMN_SID_1 AS evalCmnSid1
     , PR.EVAL_1_A AS eval1A
     , PR.EVAL_1_B AS eval1B
     , PR.EVAL_1_C AS eval1C
     , PR.EVAL_SCR_1 AS evalScr1
     , PR.EVAL_CTN_1 AS evalCtn1
     , PR.EVAL_CMN_SID_2 AS evalCmnSid2
     , PR.EVAL_2_A AS eval2A
     , PR.EVAL_2_B AS eval2B
     , PR.EVAL_2_C AS eval2C
     , PR.EVAL_SCR_2 AS evalScr2
     , PR.EVAL_CTN_2 AS evalCtn2
     , PR.NAT AS nat
     , PR.REQ_CTN_7 AS reqCtn7
     , PR.REQ_CTN_6 AS reqCtn6
     , PR.REQ_CTN_5 AS reqCtn5
     , PR.REQ_CTN_4 AS reqCtn4
     , PR.REQ_PRS_SID AS reqPrsSid
     , PR.CALC_YN AS calcYn
     , (SELECT PROG_YR
  FROM PROG P
 WHERE PROG_SID = PR.PROG_SID ) AS progYr
  FROM PROG_REQ PR
 WHERE PR.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:28:24  INFO [jdbc.sqltiming] /* selectMtProgByPk - PROG테이블 PK로 조회 */SELECT FM.FILE_NM AS fileNm
     , P.PROG_SID AS progSid
     , P.PROG_GRP_CD AS progGrpCd
     , P.PROG_YR AS progYr
     , P.PROG_DIV_NM AS progDivNm
     , P.PROG_PROD AS progProd
     , P.ALIG_NUM AS aligNum
     , P.PROG_NM AS progNm
     , P.ATT_PRD_CTN AS attPrdCtn
     , P.DT_TM_CTN AS dtTmCtn
     , P.LOC_CTN AS locCtn
     , P.DTL_CTN AS dtlCtn
     , P.HDCNT AS hdcnt
     , P.WTNG_CNT AS wtngCnt
     , P.EXP_YN AS expYn
     , P.OPEN_YN AS openYn
     , P.REG_DIV AS regDiv
     , P.GDCC_EXP_YN AS gdccExpYn
     , P.MDF_YN AS mdfYn
     , P.FILE_SID AS fileSid
     , P.ST_TIME AS stTime
     , P.END_TIME AS endTime
     , P.REG_PRS_SID AS regPrsSid
     , P.REG_DT_TM AS regDtTm
     , P.REG_PRS_IP AS regPrsIp
     , P.MDF_PRS_SID AS mdfPrsSid
     , P.MDF_DT_TM AS mdfDtTm
     , P.DIV_CD_1 AS divCd1
     , P.UNV_PROG_ADM_YN AS unvProgAdmYn
     , P.PROG_STAT_CD AS progStatCd
  FROM PROG P LEFT JOIN FILE_MGT FM
    ON P.FILE_SID = FM.FILE_SID
   AND FM.DEL_YN = 'N'
 WHERE P.PROG_SID = 'PRO25000000000125803';
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:28:24  INFO [jdbc.sqltiming] /* selectMtProgMentoClubAplByPk - PROG_MENTO_CLUB_APL테이블 PK로 조회 */SELECT GETCDNM(PMCA.BANK_CD) AS bankCdNm
     , IFNULL(FORMAT(PMCA.REQ_AOM
     , 0)
     , 0) AS reqAomCom
     , IFNULL(FORMAT(PMCA.SAM_AOM
     , 0)
     , 0) AS samAomCom
     , (SELECT FILE_NM
  FROM FILE_MGT FM
 WHERE FM.FILE_SID = PMCA.PO_FILE_SID
   AND FM.DEL_YN = 'N') AS poFileNm
     , PMCA.PROG_REQ_SID AS progReqSid
     , PMCA.AFL_SCHL_SID AS aflSchlSid
     , DEC2(PMCA.MOPHN_NO) AS mophnNo
     , PMCA.ACTV_SUB_CTN AS actvSubCtn
     , PMCA.ACTV_ST_DT AS actvStDt
     , PMCA.ACTV_END_DT AS actvEndDt
     , PMCA.MENTO_ACTV_HDCNT AS mentoActvHdcnt
     , PMCA.TCH_ACTV_HDCNT AS tchActvHdcnt
     , PMCA.EXPT_EFCT_CTN AS exptEfctCtn
     , DEC2(PMCA.DEP_OWN) AS depOwn
     , DEC2(PMCA.ACCNT_NO) AS accntNo
     , PMCA.BANK_CD AS bankCd
     , PMCA.PO_FILE_SID AS poFileSid
     , PMCA.SELT_YN AS seltYn
     , PMCA.REQ_AOM AS reqAom
     , PMCA.SAM_AOM AS samAom
     , PMCA.GDCC_CTN AS gdccCtn
     , PMCA.DEL_YN AS delYn
     , PMCA.REG_PRS_SID AS regPrsSid
     , PMCA.REG_DT_TM AS regDtTm
     , PMCA.MDF_PRS_SID AS mdfPrsSid
     , PMCA.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_APL PMCA
 WHERE PMCA.DEL_YN = 'N'
   AND PMCA.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:28:24 DEBUG [org.sdream.comm.comp.EnvProfile] Environment is local : true2025-02-27 01:29:38 DEBUG [org.sdream.comm.service.impl.TraceServiceImpl] [saveLog] TraceDTO [seq=null
     , connDtTm=null
     , sessId=BA56432068070106FE766BFCD8F45124
     , hostNm=localhost
     , pathNm=test
     , pageNm=/m/drmFstMy19/L215
     , param=[dbwls176] 
     , fullUrl=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36
     , rfrr=http://localhost:8080/m/drmFstMy20/L215
     , connIp=0:0:0:0:0:0:0:1
     , mdfDtTm=null]2025-02-27 01:29:38  INFO [jdbc.sqltiming] 
/* customInsertTrace  */
INSERT INTO TRACE ( SESS_ID 
     , CONN_DT_TM 
     , HOST_NM 
     , PATH_NM 
     , PAGE_NM 
     , PARAM 
     , FULL_URL 
     , RFRR 
     , CONN_IP 
     , MDF_DT_TM ) VALUES ( IFNULL('BA56432068070106FE766BFCD8F45124'
     , '') 
     , NOW() 
     , 'localhost' 
     , 'test' 
     , '/m/drmFstMy19/L215' 
     , '[dbwls176] ' 
     , 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36' 
     , 'http://localhost:8080/m/drmFstMy20/L215' 
     , '0:0:0:0:0:0:0:1' 
     , NOW() );
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:29:38  INFO [jdbc.sqltiming] 
/* selectPageAuth2List  */
SELECT PAGE_URI 
     , MENU_EXP_CD 
     , FUNC_EXPL 
     , USED_DT_TM 
     , DEL_YN 
     , MDF_PRS_SID 
     , MDF_DT_TM
  FROM PAGE_AUTH_2
 WHERE 1=1
   AND PAGE_URI = '/m/drmFstMy19/L215'
   AND DEL_YN = 'N';
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:29:38  INFO [jdbc.sqltiming] /* selectMtBizReqMbrInfByMypage - BIZ_REQ_MBR_INF테이블 마이페이지 선정자 확인 */SELECT B.BIZ_YR AS bizYr
     , B.BIZ_ID AS bizId
     , B.BIZ_TYPE_ID AS bizTypeId
     , B.PROD AS prod
     , S.SCHL_NM AS schlNm
     , M.MBR_ID AS mbrId
     , M.BIRTH AS birth
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , BRMI.REQ_NO AS reqNo
     , BRMI.MBR_SID AS mbrSid
     , BRMI.MBR_DIV AS mbrDiv
     , BRMI.LOG_SEQ AS logSeq
     , DEC2(BRMI.NM) AS nm
     , DEC2(BRMI.PHN_NO) AS phnNo
     , DEC2(BRMI.MOPHN_NO) AS mophnNo
     , BRMI.SCHL_SID AS schlSid
     , BRMI.GRADE AS grade
     , BRMI.FML_REL_CD AS fmlRelCd
     , BRMI.BANK AS bank
     , DEC2(BRMI.ACCNT) AS accnt
     , BRMI.REG_PRS_SID AS regPrsSid
     , BRMI.REG_DT_TM AS regDtTm
     , BRMI.REG_PRS_IP AS regPrsIp
     , BRMI.MDF_PRS_SID AS mdfPrsSid
     , BRMI.MDF_DT_TM AS mdfDtTm
     , BRMI.DEL_YN AS delYn
     , BRMI.CHK_YN AS chkYn
     , BRMI.CHK_DT_TM AS chkDtTm
     , BRMI.MBR_MOD_DT_TM AS mbrModDtTm
     , BRMI.PROG_SVY_1_DT_TM AS progSvy1DtTm
     , BRMI.PROG_SVY_2_DT_TM AS progSvy2DtTm
     , DEC2(BRMI.UGT_CTT) AS ugtCtt
  FROM BIZ_REQ_MBR_INF BRMI
 INNER JOIN
       BIZ_REQ BR
    ON BRMI.REQ_NO = BR.REQ_NO
   AND BR.DEL_YN = 'N'
 INNER JOIN
       BIZ B
    ON BR.BIZ_ID = B.BIZ_ID
   AND B.DEL_YN = 'N' LEFT JOIN SCHL S
    ON BRMI.SCHL_SID = S.SCHL_SID LEFT JOIN MBR M
    ON BRMI.MBR_SID = M.MBR_SID
 WHERE B.BIZ_STAT_CD = 'BSC050' /* 사업상태-진행중 */
   AND BRMI.MBR_DIV = 'RRC010' /* 멘토
     , 멘티 */
   AND BRMI.MBR_SID = 'MBR2411794' 
/* SID 
 */
   AND B.BIZ_TYPE_ID IN ('MT01'
     , 'MT02') 
/* 사업그룹  */
   AND BR.BIZ_REQ_STAT_CD = 'BRS020' /* 멘토 - 선정 */;
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:29:38  INFO [jdbc.sqltiming] /* selectMtProgByMypage - PROG테이블 마이페이지 조회 */SELECT P.PROG_SID AS progSid
     , P.PROG_GRP_CD AS progGrpCd
     , P.PROG_YR AS progYr
     , P.PROG_DIV_NM AS progDivNm
     , P.PROG_PROD AS progProd
     , P.ALIG_NUM AS aligNum
     , P.PROG_NM AS progNm
     , P.ATT_PRD_CTN AS attPrdCtn
     , P.DT_TM_CTN AS dtTmCtn
     , P.LOC_CTN AS locCtn
     , P.DTL_CTN AS dtlCtn
     , P.HDCNT AS hdcnt
     , P.WTNG_CNT AS wtngCnt
     , P.EXP_YN AS expYn
     , P.OPEN_YN AS openYn
     , P.REG_DIV AS regDiv
     , P.GDCC_EXP_YN AS gdccExpYn
     , P.MDF_YN AS mdfYn
     , P.FILE_SID AS fileSid
     , P.ST_TIME AS stTime
     , P.END_TIME AS endTime
     , P.REG_PRS_SID AS regPrsSid
     , P.REG_DT_TM AS regDtTm
     , P.REG_PRS_IP AS regPrsIp
     , P.MDF_PRS_SID AS mdfPrsSid
     , P.MDF_DT_TM AS mdfDtTm
     , P.DIV_CD_1 AS divCd1
     , P.UNV_PROG_ADM_YN AS unvProgAdmYn
     , P.PROG_STAT_CD AS progStatCd
  FROM PROG P
 WHERE P.PROG_GRP_CD = 'PGC084'
   AND P.PROG_YR = '2025';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:29:38  INFO [jdbc.sqltiming] /* selectMtProgReqByMypage - PROG_REQ테이블 마이페이지 프로그램 신청확인 */SELECT P.PROG_PROD AS progProd
     , P.PROG_NM AS progNm
     , P.DT_TM_CTN AS dtTmCtn
     , PRAF.ATT_FILE_SID AS attFileSid
     , SUBSTRING_INDEX(DEC2(PR.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(PR.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , GETCDNM(PR.REQ_STAT_CD) AS reqStatCdNm
     , PR.PROG_REQ_SID AS progReqSid
     , PR.PROG_SID AS progSid
     , DEC2(PR.REQ_PRS_NM) AS reqPrsNm
     , PR.BIRTH AS birth
     , PR.GRADE AS grade
     , PR.AFL AS afl
     , PR.POS AS pos
     , DEC2(PR.PHN_NO) AS phnNo
     , DEC2(PR.EMAIL) AS email
     , PR.PO_YN AS poYn
     , PR.POST_NO AS postNo
     , PR.NUM_ADDR AS numAddr
     , PR.ROAD_ADDR AS roadAddr
     , PR.DTL_ADDR AS dtlAddr
     , PR.REQ_YN AS reqYn
     , PR.STD_REQ_YN AS stdReqYn
     , PR.SEX_CD AS sexCd
     , PR.ATTD_YN AS attdYn
     , PR.COMPL_YN AS complYn
     , PR.REQ_CTN_1 AS reqCtn1
     , PR.REQ_CTN_2 AS reqCtn2
     , PR.DIV_CD_1 AS divCd1
     , PR.DIV_CD_2 AS divCd2
     , PR.BIZ_REQ_SEQ AS bizReqSeq
     , PR.BUT_BIZ_TYPE_CD AS butBizTypeCd
     , PR.BUT_BIZ_DTL_PART_CD AS butBizDtlPartCd
     , PR.REQ_STAT_NUM AS reqStatNum
     , PR.REQ_STAT_CD AS reqStatCd
     , PR.ETC_NUM_NM AS etcNumNm
     , PR.REG_PRS_SID AS regPrsSid
     , PR.REG_DT_TM AS regDtTm
     , PR.REG_PRS_IP AS regPrsIp
     , PR.MDF_PRS_SID AS mdfPrsSid
     , PR.MDF_DT_TM AS mdfDtTm
     , PR.CNCL_YN AS cnclYn
     , PR.RSDN_TYPE_CD AS rsdnTypeCd
     , PR.RAT_DIV AS ratDiv
     , PR.RST_CTN AS rstCtn
     , DEC2(PR.MOPHN_NO) AS mophnNo
     , DEC2(PR.IHIDNUM) AS ihidnum
     , PR.PRD AS prd
     , PR.MAJ AS maj
     , PR.SCRE_DIV_NM_1 AS screDivNm1
     , PR.SCRE_CRD_1 AS screCrd1
     , PR.SCRE_MAX_SCR_1 AS screMaxScr1
     , PR.SCRE_DIV_NM_2 AS screDivNm2
     , PR.SCRE_CRD_2 AS screCrd2
     , PR.SCRE_MAX_SCR_2 AS screMaxScr2
     , PR.REQ_CTN_3 AS reqCtn3
     , PR.YR AS yr
     , PR.REQ_NO AS reqNo
     , PR.RD10_REQ_NO AS rd10ReqNo
     , DEC2(PR.BANK_NM) AS bankNm
     , DEC2(PR.ACCNT_NO) AS accntNo
     , DEC2(PR.DEP_OWN) AS depOwn
     , PR.BANK_DIV AS bankDiv
     , PR.BANK_CD AS bankCd
     , PR.BANK_ADDR AS bankAddr
     , PR.EVAL_CMN_SID_1 AS evalCmnSid1
     , PR.EVAL_1_A AS eval1A
     , PR.EVAL_1_B AS eval1B
     , PR.EVAL_1_C AS eval1C
     , PR.EVAL_SCR_1 AS evalScr1
     , PR.EVAL_CTN_1 AS evalCtn1
     , PR.EVAL_CMN_SID_2 AS evalCmnSid2
     , PR.EVAL_2_A AS eval2A
     , PR.EVAL_2_B AS eval2B
     , PR.EVAL_2_C AS eval2C
     , PR.EVAL_SCR_2 AS evalScr2
     , PR.EVAL_CTN_2 AS evalCtn2
     , PR.NAT AS nat
     , PR.REQ_CTN_7 AS reqCtn7
     , PR.REQ_CTN_6 AS reqCtn6
     , PR.REQ_CTN_5 AS reqCtn5
     , PR.REQ_CTN_4 AS reqCtn4
     , PR.REQ_PRS_SID AS reqPrsSid
     , PR.CALC_YN AS calcYn
     , (SELECT PROG_YR
  FROM PROG P
 WHERE PROG_SID = PR.PROG_SID ) AS progYr
  FROM PROG_REQ PR
 INNER JOIN
       PROG P
    ON PR.PROG_SID = P.PROG_SID LEFT JOIN PROG_REQ_ATT_FILE PRAF
    ON PRAF.PROG_REQ_SID = PR.PROG_REQ_SID
 WHERE P.PROG_GRP_CD = 'PGC084'
   AND P.PROG_YR = '2025'
   AND PR.REG_PRS_SID = 'MBR2411794';
--------------------------------------------------
{
executed in 12 msec}2025-02-27 01:29:38  INFO [jdbc.sqltiming] /* selectMtProgMentoClubAplByPk - PROG_MENTO_CLUB_APL테이블 PK로 조회 */SELECT GETCDNM(PMCA.BANK_CD) AS bankCdNm
     , IFNULL(FORMAT(PMCA.REQ_AOM
     , 0)
     , 0) AS reqAomCom
     , IFNULL(FORMAT(PMCA.SAM_AOM
     , 0)
     , 0) AS samAomCom
     , (SELECT FILE_NM
  FROM FILE_MGT FM
 WHERE FM.FILE_SID = PMCA.PO_FILE_SID
   AND FM.DEL_YN = 'N') AS poFileNm
     , PMCA.PROG_REQ_SID AS progReqSid
     , PMCA.AFL_SCHL_SID AS aflSchlSid
     , DEC2(PMCA.MOPHN_NO) AS mophnNo
     , PMCA.ACTV_SUB_CTN AS actvSubCtn
     , PMCA.ACTV_ST_DT AS actvStDt
     , PMCA.ACTV_END_DT AS actvEndDt
     , PMCA.MENTO_ACTV_HDCNT AS mentoActvHdcnt
     , PMCA.TCH_ACTV_HDCNT AS tchActvHdcnt
     , PMCA.EXPT_EFCT_CTN AS exptEfctCtn
     , DEC2(PMCA.DEP_OWN) AS depOwn
     , DEC2(PMCA.ACCNT_NO) AS accntNo
     , PMCA.BANK_CD AS bankCd
     , PMCA.PO_FILE_SID AS poFileSid
     , PMCA.SELT_YN AS seltYn
     , PMCA.REQ_AOM AS reqAom
     , PMCA.SAM_AOM AS samAom
     , PMCA.GDCC_CTN AS gdccCtn
     , PMCA.DEL_YN AS delYn
     , PMCA.REG_PRS_SID AS regPrsSid
     , PMCA.REG_DT_TM AS regDtTm
     , PMCA.MDF_PRS_SID AS mdfPrsSid
     , PMCA.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_APL PMCA
 WHERE PMCA.DEL_YN = 'N'
   AND PMCA.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:29:38  INFO [jdbc.sqltiming] /* selectMtProgMentoClubVrfByPk - PROG_MENTO_CLUB_VRF테이블 PK로 조회 */SELECT PMCV.PROG_REQ_SID AS progReqSid
     , PMCV.DOC_CMN_1_SID AS docCmn1Sid
     , PMCV.DOC_CMN_2_SID AS docCmn2Sid
     , PMCV.INV_CMN_1_SID AS invCmn1Sid
     , PMCV.INV_CMN_2_SID AS invCmn2Sid
     , PMCV.DOC_CMN_1_EVAL_SCR AS docCmn1EvalScr
     , PMCV.DOC_CMN_2_EVAL_SCR AS docCmn2EvalScr
     , PMCV.INV_CMN_1_EVAL AS invCmn1Eval
     , PMCV.INV_CMN_2_EVAL AS invCmn2Eval
     , PMCV.DOC_CMN_1_GNRV AS docCmn1Gnrv
     , PMCV.DOC_CMN_2_GNRV AS docCmn2Gnrv
     , PMCV.INV_CMN_1_GNRV AS invCmn1Gnrv
     , PMCV.INV_CMN_2_GNRV AS invCmn2Gnrv
     , PMCV.DOC_CMN_1_UNQ AS docCmn1Unq
     , PMCV.DOC_CMN_2_UNQ AS docCmn2Unq
     , PMCV.INV_CMN_1_UNQ AS invCmn1Unq
     , PMCV.INV_CMN_2_UNQ AS invCmn2Unq
     , PMCV.DOC_CMN_1_RVW_DT_TM AS docCmn1RvwDtTm
     , PMCV.DOC_CMN_2_RVW_DT_TM AS docCmn2RvwDtTm
     , PMCV.INV_CMN_1_RVW_DT_TM AS invCmn1RvwDtTm
     , PMCV.INV_CMN_2_RVW_DT_TM AS invCmn2RvwDtTm
     , PMCV.VRF_REQ_NO AS vrfReqNo
     , PMCV.PART_PROG AS partProg
     , PMCV.UNQ AS unq
     , PMCV.RVW_TRG_YN AS rvwTrgYn
     , PMCV.DOC_RST_CD AS docRstCd
     , PMCV.INV_TM AS invTm
     , PMCV.DEL_YN AS delYn
     , PMCV.REG_PRS_SID AS regPrsSid
     , PMCV.REG_DT_TM AS regDtTm
     , PMCV.MDF_PRS_SID AS mdfPrsSid
     , PMCV.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_VRF PMCV
 WHERE PMCV.DEL_YN = 'N' 
   AND PMCV.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:29:38  INFO [jdbc.sqltiming] /* selectMtProgMentoClubRstRptByPk - PROG_MENTO_CLUB_RST_RPT테이블 PK로 조회 */SELECT (SELECT FM.FILE_NM 
  FROM FILE_MGT FM
 WHERE FM.FILE_SID = PMCRR.SETT_FILE_SID
   AND FM.DEL_YN = 'N') AS settFileNm
     , SUBSTRING_INDEX(DEC2(PMCRR.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(PMCRR.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , PMCRR.PROG_REQ_SID AS progReqSid
     , PMCRR.AFL_SCHL_SID AS aflSchlSid
     , DEC2(PMCRR.MOPHN_NO) AS mophnNo
     , PMCRR.ACTV_RST_CTN AS actvRstCtn
     , PMCRR.SETT_FILE_SID AS settFileSid
     , PMCRR.COMM_STAT_CD AS commStatCd
     , PMCRR.REG_PRS_SID AS regPrsSid
     , PMCRR.REG_DT_TM AS regDtTm
     , PMCRR.MDF_PRS_SID AS mdfPrsSid
     , PMCRR.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_RST_RPT PMCRR 
WHERE PMCRR.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:31:29 DEBUG [org.sdream.comm.service.impl.TraceServiceImpl] [saveLog] TraceDTO [seq=null
     , connDtTm=null
     , sessId=BA56432068070106FE766BFCD8F45124
     , hostNm=localhost
     , pathNm=test
     , pageNm=/m/drmFstMy19/L215
     , param=[dbwls176] 
     , fullUrl=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36
     , rfrr=http://localhost:8080/m/drmFstMy20/L215
     , connIp=0:0:0:0:0:0:0:1
     , mdfDtTm=null]2025-02-27 01:31:29  INFO [jdbc.sqltiming] 
/* customInsertTrace  */
INSERT INTO TRACE ( SESS_ID 
     , CONN_DT_TM 
     , HOST_NM 
     , PATH_NM 
     , PAGE_NM 
     , PARAM 
     , FULL_URL 
     , RFRR 
     , CONN_IP 
     , MDF_DT_TM ) VALUES ( IFNULL('BA56432068070106FE766BFCD8F45124'
     , '') 
     , NOW() 
     , 'localhost' 
     , 'test' 
     , '/m/drmFstMy19/L215' 
     , '[dbwls176] ' 
     , 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36' 
     , 'http://localhost:8080/m/drmFstMy20/L215' 
     , '0:0:0:0:0:0:0:1' 
     , NOW() );
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:31:29  INFO [jdbc.sqltiming] 
/* selectPageAuth2List  */
SELECT PAGE_URI 
     , MENU_EXP_CD 
     , FUNC_EXPL 
     , USED_DT_TM 
     , DEL_YN 
     , MDF_PRS_SID 
     , MDF_DT_TM
  FROM PAGE_AUTH_2
 WHERE 1=1
   AND PAGE_URI = '/m/drmFstMy19/L215'
   AND DEL_YN = 'N';
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:31:29  INFO [jdbc.sqltiming] /* selectMtBizReqMbrInfByMypage - BIZ_REQ_MBR_INF테이블 마이페이지 선정자 확인 */SELECT B.BIZ_YR AS bizYr
     , B.BIZ_ID AS bizId
     , B.BIZ_TYPE_ID AS bizTypeId
     , B.PROD AS prod
     , S.SCHL_NM AS schlNm
     , M.MBR_ID AS mbrId
     , M.BIRTH AS birth
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , BRMI.REQ_NO AS reqNo
     , BRMI.MBR_SID AS mbrSid
     , BRMI.MBR_DIV AS mbrDiv
     , BRMI.LOG_SEQ AS logSeq
     , DEC2(BRMI.NM) AS nm
     , DEC2(BRMI.PHN_NO) AS phnNo
     , DEC2(BRMI.MOPHN_NO) AS mophnNo
     , BRMI.SCHL_SID AS schlSid
     , BRMI.GRADE AS grade
     , BRMI.FML_REL_CD AS fmlRelCd
     , BRMI.BANK AS bank
     , DEC2(BRMI.ACCNT) AS accnt
     , BRMI.REG_PRS_SID AS regPrsSid
     , BRMI.REG_DT_TM AS regDtTm
     , BRMI.REG_PRS_IP AS regPrsIp
     , BRMI.MDF_PRS_SID AS mdfPrsSid
     , BRMI.MDF_DT_TM AS mdfDtTm
     , BRMI.DEL_YN AS delYn
     , BRMI.CHK_YN AS chkYn
     , BRMI.CHK_DT_TM AS chkDtTm
     , BRMI.MBR_MOD_DT_TM AS mbrModDtTm
     , BRMI.PROG_SVY_1_DT_TM AS progSvy1DtTm
     , BRMI.PROG_SVY_2_DT_TM AS progSvy2DtTm
     , DEC2(BRMI.UGT_CTT) AS ugtCtt
  FROM BIZ_REQ_MBR_INF BRMI
 INNER JOIN
       BIZ_REQ BR
    ON BRMI.REQ_NO = BR.REQ_NO
   AND BR.DEL_YN = 'N'
 INNER JOIN
       BIZ B
    ON BR.BIZ_ID = B.BIZ_ID
   AND B.DEL_YN = 'N' LEFT JOIN SCHL S
    ON BRMI.SCHL_SID = S.SCHL_SID LEFT JOIN MBR M
    ON BRMI.MBR_SID = M.MBR_SID
 WHERE B.BIZ_STAT_CD = 'BSC050' /* 사업상태-진행중 */
   AND BRMI.MBR_DIV = 'RRC010' /* 멘토
     , 멘티 */
   AND BRMI.MBR_SID = 'MBR2411794' 
/* SID 
 */
   AND B.BIZ_TYPE_ID IN ('MT01'
     , 'MT02') 
/* 사업그룹  */
   AND BR.BIZ_REQ_STAT_CD = 'BRS020' /* 멘토 - 선정 */;
--------------------------------------------------
{
executed in 15 msec}2025-02-27 01:31:29  INFO [jdbc.sqltiming] /* selectMtProgByMypage - PROG테이블 마이페이지 조회 */SELECT P.PROG_SID AS progSid
     , P.PROG_GRP_CD AS progGrpCd
     , P.PROG_YR AS progYr
     , P.PROG_DIV_NM AS progDivNm
     , P.PROG_PROD AS progProd
     , P.ALIG_NUM AS aligNum
     , P.PROG_NM AS progNm
     , P.ATT_PRD_CTN AS attPrdCtn
     , P.DT_TM_CTN AS dtTmCtn
     , P.LOC_CTN AS locCtn
     , P.DTL_CTN AS dtlCtn
     , P.HDCNT AS hdcnt
     , P.WTNG_CNT AS wtngCnt
     , P.EXP_YN AS expYn
     , P.OPEN_YN AS openYn
     , P.REG_DIV AS regDiv
     , P.GDCC_EXP_YN AS gdccExpYn
     , P.MDF_YN AS mdfYn
     , P.FILE_SID AS fileSid
     , P.ST_TIME AS stTime
     , P.END_TIME AS endTime
     , P.REG_PRS_SID AS regPrsSid
     , P.REG_DT_TM AS regDtTm
     , P.REG_PRS_IP AS regPrsIp
     , P.MDF_PRS_SID AS mdfPrsSid
     , P.MDF_DT_TM AS mdfDtTm
     , P.DIV_CD_1 AS divCd1
     , P.UNV_PROG_ADM_YN AS unvProgAdmYn
     , P.PROG_STAT_CD AS progStatCd
  FROM PROG P
 WHERE P.PROG_GRP_CD = 'PGC084'
   AND P.PROG_YR = '2025';
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:31:29  INFO [jdbc.sqltiming] /* selectMtProgReqByMypage - PROG_REQ테이블 마이페이지 프로그램 신청확인 */SELECT P.PROG_PROD AS progProd
     , P.PROG_NM AS progNm
     , P.DT_TM_CTN AS dtTmCtn
     , PRAF.ATT_FILE_SID AS attFileSid
     , SUBSTRING_INDEX(DEC2(PR.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(PR.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , GETCDNM(PR.REQ_STAT_CD) AS reqStatCdNm
     , PR.PROG_REQ_SID AS progReqSid
     , PR.PROG_SID AS progSid
     , DEC2(PR.REQ_PRS_NM) AS reqPrsNm
     , PR.BIRTH AS birth
     , PR.GRADE AS grade
     , PR.AFL AS afl
     , PR.POS AS pos
     , DEC2(PR.PHN_NO) AS phnNo
     , DEC2(PR.EMAIL) AS email
     , PR.PO_YN AS poYn
     , PR.POST_NO AS postNo
     , PR.NUM_ADDR AS numAddr
     , PR.ROAD_ADDR AS roadAddr
     , PR.DTL_ADDR AS dtlAddr
     , PR.REQ_YN AS reqYn
     , PR.STD_REQ_YN AS stdReqYn
     , PR.SEX_CD AS sexCd
     , PR.ATTD_YN AS attdYn
     , PR.COMPL_YN AS complYn
     , PR.REQ_CTN_1 AS reqCtn1
     , PR.REQ_CTN_2 AS reqCtn2
     , PR.DIV_CD_1 AS divCd1
     , PR.DIV_CD_2 AS divCd2
     , PR.BIZ_REQ_SEQ AS bizReqSeq
     , PR.BUT_BIZ_TYPE_CD AS butBizTypeCd
     , PR.BUT_BIZ_DTL_PART_CD AS butBizDtlPartCd
     , PR.REQ_STAT_NUM AS reqStatNum
     , PR.REQ_STAT_CD AS reqStatCd
     , PR.ETC_NUM_NM AS etcNumNm
     , PR.REG_PRS_SID AS regPrsSid
     , PR.REG_DT_TM AS regDtTm
     , PR.REG_PRS_IP AS regPrsIp
     , PR.MDF_PRS_SID AS mdfPrsSid
     , PR.MDF_DT_TM AS mdfDtTm
     , PR.CNCL_YN AS cnclYn
     , PR.RSDN_TYPE_CD AS rsdnTypeCd
     , PR.RAT_DIV AS ratDiv
     , PR.RST_CTN AS rstCtn
     , DEC2(PR.MOPHN_NO) AS mophnNo
     , DEC2(PR.IHIDNUM) AS ihidnum
     , PR.PRD AS prd
     , PR.MAJ AS maj
     , PR.SCRE_DIV_NM_1 AS screDivNm1
     , PR.SCRE_CRD_1 AS screCrd1
     , PR.SCRE_MAX_SCR_1 AS screMaxScr1
     , PR.SCRE_DIV_NM_2 AS screDivNm2
     , PR.SCRE_CRD_2 AS screCrd2
     , PR.SCRE_MAX_SCR_2 AS screMaxScr2
     , PR.REQ_CTN_3 AS reqCtn3
     , PR.YR AS yr
     , PR.REQ_NO AS reqNo
     , PR.RD10_REQ_NO AS rd10ReqNo
     , DEC2(PR.BANK_NM) AS bankNm
     , DEC2(PR.ACCNT_NO) AS accntNo
     , DEC2(PR.DEP_OWN) AS depOwn
     , PR.BANK_DIV AS bankDiv
     , PR.BANK_CD AS bankCd
     , PR.BANK_ADDR AS bankAddr
     , PR.EVAL_CMN_SID_1 AS evalCmnSid1
     , PR.EVAL_1_A AS eval1A
     , PR.EVAL_1_B AS eval1B
     , PR.EVAL_1_C AS eval1C
     , PR.EVAL_SCR_1 AS evalScr1
     , PR.EVAL_CTN_1 AS evalCtn1
     , PR.EVAL_CMN_SID_2 AS evalCmnSid2
     , PR.EVAL_2_A AS eval2A
     , PR.EVAL_2_B AS eval2B
     , PR.EVAL_2_C AS eval2C
     , PR.EVAL_SCR_2 AS evalScr2
     , PR.EVAL_CTN_2 AS evalCtn2
     , PR.NAT AS nat
     , PR.REQ_CTN_7 AS reqCtn7
     , PR.REQ_CTN_6 AS reqCtn6
     , PR.REQ_CTN_5 AS reqCtn5
     , PR.REQ_CTN_4 AS reqCtn4
     , PR.REQ_PRS_SID AS reqPrsSid
     , PR.CALC_YN AS calcYn
     , (SELECT PROG_YR
  FROM PROG P
 WHERE PROG_SID = PR.PROG_SID ) AS progYr
  FROM PROG_REQ PR
 INNER JOIN
       PROG P
    ON PR.PROG_SID = P.PROG_SID LEFT JOIN PROG_REQ_ATT_FILE PRAF
    ON PRAF.PROG_REQ_SID = PR.PROG_REQ_SID
 WHERE P.PROG_GRP_CD = 'PGC084'
   AND P.PROG_YR = '2025'
   AND PR.REG_PRS_SID = 'MBR2411794';
--------------------------------------------------
{
executed in 12 msec}2025-02-27 01:31:29  INFO [jdbc.sqltiming] /* selectMtProgMentoClubAplByPk - PROG_MENTO_CLUB_APL테이블 PK로 조회 */SELECT GETCDNM(PMCA.BANK_CD) AS bankCdNm
     , IFNULL(FORMAT(PMCA.REQ_AOM
     , 0)
     , 0) AS reqAomCom
     , IFNULL(FORMAT(PMCA.SAM_AOM
     , 0)
     , 0) AS samAomCom
     , (SELECT FILE_NM
  FROM FILE_MGT FM
 WHERE FM.FILE_SID = PMCA.PO_FILE_SID
   AND FM.DEL_YN = 'N') AS poFileNm
     , PMCA.PROG_REQ_SID AS progReqSid
     , PMCA.AFL_SCHL_SID AS aflSchlSid
     , DEC2(PMCA.MOPHN_NO) AS mophnNo
     , PMCA.ACTV_SUB_CTN AS actvSubCtn
     , PMCA.ACTV_ST_DT AS actvStDt
     , PMCA.ACTV_END_DT AS actvEndDt
     , PMCA.MENTO_ACTV_HDCNT AS mentoActvHdcnt
     , PMCA.TCH_ACTV_HDCNT AS tchActvHdcnt
     , PMCA.EXPT_EFCT_CTN AS exptEfctCtn
     , DEC2(PMCA.DEP_OWN) AS depOwn
     , DEC2(PMCA.ACCNT_NO) AS accntNo
     , PMCA.BANK_CD AS bankCd
     , PMCA.PO_FILE_SID AS poFileSid
     , PMCA.SELT_YN AS seltYn
     , PMCA.REQ_AOM AS reqAom
     , PMCA.SAM_AOM AS samAom
     , PMCA.GDCC_CTN AS gdccCtn
     , PMCA.DEL_YN AS delYn
     , PMCA.REG_PRS_SID AS regPrsSid
     , PMCA.REG_DT_TM AS regDtTm
     , PMCA.MDF_PRS_SID AS mdfPrsSid
     , PMCA.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_APL PMCA
 WHERE PMCA.DEL_YN = 'N'
   AND PMCA.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:31:29  INFO [jdbc.sqltiming] /* selectMtProgMentoClubVrfByPk - PROG_MENTO_CLUB_VRF테이블 PK로 조회 */SELECT PMCV.PROG_REQ_SID AS progReqSid
     , PMCV.DOC_CMN_1_SID AS docCmn1Sid
     , PMCV.DOC_CMN_2_SID AS docCmn2Sid
     , PMCV.INV_CMN_1_SID AS invCmn1Sid
     , PMCV.INV_CMN_2_SID AS invCmn2Sid
     , PMCV.DOC_CMN_1_EVAL_SCR AS docCmn1EvalScr
     , PMCV.DOC_CMN_2_EVAL_SCR AS docCmn2EvalScr
     , PMCV.INV_CMN_1_EVAL AS invCmn1Eval
     , PMCV.INV_CMN_2_EVAL AS invCmn2Eval
     , PMCV.DOC_CMN_1_GNRV AS docCmn1Gnrv
     , PMCV.DOC_CMN_2_GNRV AS docCmn2Gnrv
     , PMCV.INV_CMN_1_GNRV AS invCmn1Gnrv
     , PMCV.INV_CMN_2_GNRV AS invCmn2Gnrv
     , PMCV.DOC_CMN_1_UNQ AS docCmn1Unq
     , PMCV.DOC_CMN_2_UNQ AS docCmn2Unq
     , PMCV.INV_CMN_1_UNQ AS invCmn1Unq
     , PMCV.INV_CMN_2_UNQ AS invCmn2Unq
     , PMCV.DOC_CMN_1_RVW_DT_TM AS docCmn1RvwDtTm
     , PMCV.DOC_CMN_2_RVW_DT_TM AS docCmn2RvwDtTm
     , PMCV.INV_CMN_1_RVW_DT_TM AS invCmn1RvwDtTm
     , PMCV.INV_CMN_2_RVW_DT_TM AS invCmn2RvwDtTm
     , PMCV.VRF_REQ_NO AS vrfReqNo
     , PMCV.PART_PROG AS partProg
     , PMCV.UNQ AS unq
     , PMCV.RVW_TRG_YN AS rvwTrgYn
     , PMCV.DOC_RST_CD AS docRstCd
     , PMCV.INV_TM AS invTm
     , PMCV.DEL_YN AS delYn
     , PMCV.REG_PRS_SID AS regPrsSid
     , PMCV.REG_DT_TM AS regDtTm
     , PMCV.MDF_PRS_SID AS mdfPrsSid
     , PMCV.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_VRF PMCV
 WHERE PMCV.DEL_YN = 'N' 
   AND PMCV.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:31:29  INFO [jdbc.sqltiming] /* selectMtProgMentoClubRstRptByPk - PROG_MENTO_CLUB_RST_RPT테이블 PK로 조회 */SELECT (SELECT FM.FILE_NM 
  FROM FILE_MGT FM
 WHERE FM.FILE_SID = PMCRR.SETT_FILE_SID
   AND FM.DEL_YN = 'N') AS settFileNm
     , SUBSTRING_INDEX(DEC2(PMCRR.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(PMCRR.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , PMCRR.PROG_REQ_SID AS progReqSid
     , PMCRR.AFL_SCHL_SID AS aflSchlSid
     , DEC2(PMCRR.MOPHN_NO) AS mophnNo
     , PMCRR.ACTV_RST_CTN AS actvRstCtn
     , PMCRR.SETT_FILE_SID AS settFileSid
     , PMCRR.COMM_STAT_CD AS commStatCd
     , PMCRR.REG_PRS_SID AS regPrsSid
     , PMCRR.REG_DT_TM AS regDtTm
     , PMCRR.MDF_PRS_SID AS mdfPrsSid
     , PMCRR.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_RST_RPT PMCRR 
WHERE PMCRR.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:31:34 DEBUG [org.sdream.comm.service.impl.TraceServiceImpl] [saveLog] TraceDTO [seq=null
     , connDtTm=null
     , sessId=BA56432068070106FE766BFCD8F45124
     , hostNm=localhost
     , pathNm=test
     , pageNm=/p/drmFstMy19RstPop
     , param=[dbwls176];
--------------------------------------------------
{
progReqSid=[PRQ25000000000125804]}
     , fullUrl=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36
     , rfrr=http://localhost:8080/m/drmFstMy19/L215
     , connIp=0:0:0:0:0:0:0:1
     , mdfDtTm=null]2025-02-27 01:31:34  INFO [jdbc.sqltiming] 
/* customInsertTrace  */
INSERT INTO TRACE ( SESS_ID 
     , CONN_DT_TM 
     , HOST_NM 
     , PATH_NM 
     , PAGE_NM 
     , PARAM 
     , FULL_URL 
     , RFRR 
     , CONN_IP 
     , MDF_DT_TM ) VALUES ( IFNULL('BA56432068070106FE766BFCD8F45124'
     , '') 
     , NOW() 
     , 'localhost' 
     , 'test' 
     , '/p/drmFstMy19RstPop' 
     , '[dbwls176];
--------------------------------------------------
{
progReqSid=[PRQ25000000000125804]}' 
     , 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML
     , like Gecko) Chrome/133.0.0.0 Safari/537.36' 
     , 'http://localhost:8080/m/drmFstMy19/L215' 
     , '0:0:0:0:0:0:0:1' 
     , NOW() );
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:31:34  INFO [jdbc.sqltiming] 
/* selectPageAuth2List  */
SELECT PAGE_URI 
     , MENU_EXP_CD 
     , FUNC_EXPL 
     , USED_DT_TM 
     , DEL_YN 
     , MDF_PRS_SID 
     , MDF_DT_TM
  FROM PAGE_AUTH_2
 WHERE 1=1
   AND PAGE_URI = '/p/drmFstMy19RstPop'
   AND DEL_YN = 'N';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:31:34  INFO [jdbc.sqltiming] /* selectMtBizReqMbrInfByMypage - BIZ_REQ_MBR_INF테이블 마이페이지 선정자 확인 */SELECT B.BIZ_YR AS bizYr
     , B.BIZ_ID AS bizId
     , B.BIZ_TYPE_ID AS bizTypeId
     , B.PROD AS prod
     , S.SCHL_NM AS schlNm
     , M.MBR_ID AS mbrId
     , M.BIRTH AS birth
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , 1) AS mophnNoFst
     , SUBSTRING_INDEX(DEC2(BRMI.MOPHN_NO)
     , '-'
     , -2) AS mophnNoEnd
     , BRMI.REQ_NO AS reqNo
     , BRMI.MBR_SID AS mbrSid
     , BRMI.MBR_DIV AS mbrDiv
     , BRMI.LOG_SEQ AS logSeq
     , DEC2(BRMI.NM) AS nm
     , DEC2(BRMI.PHN_NO) AS phnNo
     , DEC2(BRMI.MOPHN_NO) AS mophnNo
     , BRMI.SCHL_SID AS schlSid
     , BRMI.GRADE AS grade
     , BRMI.FML_REL_CD AS fmlRelCd
     , BRMI.BANK AS bank
     , DEC2(BRMI.ACCNT) AS accnt
     , BRMI.REG_PRS_SID AS regPrsSid
     , BRMI.REG_DT_TM AS regDtTm
     , BRMI.REG_PRS_IP AS regPrsIp
     , BRMI.MDF_PRS_SID AS mdfPrsSid
     , BRMI.MDF_DT_TM AS mdfDtTm
     , BRMI.DEL_YN AS delYn
     , BRMI.CHK_YN AS chkYn
     , BRMI.CHK_DT_TM AS chkDtTm
     , BRMI.MBR_MOD_DT_TM AS mbrModDtTm
     , BRMI.PROG_SVY_1_DT_TM AS progSvy1DtTm
     , BRMI.PROG_SVY_2_DT_TM AS progSvy2DtTm
     , DEC2(BRMI.UGT_CTT) AS ugtCtt
  FROM BIZ_REQ_MBR_INF BRMI
 INNER JOIN
       BIZ_REQ BR
    ON BRMI.REQ_NO = BR.REQ_NO
   AND BR.DEL_YN = 'N'
 INNER JOIN
       BIZ B
    ON BR.BIZ_ID = B.BIZ_ID
   AND B.DEL_YN = 'N' LEFT JOIN SCHL S
    ON BRMI.SCHL_SID = S.SCHL_SID LEFT JOIN MBR M
    ON BRMI.MBR_SID = M.MBR_SID
 WHERE B.BIZ_STAT_CD = 'BSC050' /* 사업상태-진행중 */
   AND BRMI.MBR_DIV = 'RRC010' /* 멘토
     , 멘티 */
   AND BRMI.MBR_SID = 'MBR2411794' 
/* SID 
 */
   AND B.BIZ_TYPE_ID IN ('MT01'
     , 'MT02') 
/* 사업그룹  */
   AND BR.BIZ_REQ_STAT_CD = 'BRS020' /* 멘토 - 선정 */;
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:31:34  INFO [jdbc.sqltiming] /* selectMtProgReqByPk - PROG_REQ테이블 PK로 조회 */SELECT PR.PROG_REQ_SID AS progReqSid
     , PR.PROG_SID AS progSid
     , DEC2(PR.REQ_PRS_NM) AS reqPrsNm
     , PR.BIRTH AS birth
     , PR.GRADE AS grade
     , PR.AFL AS afl
     , PR.POS AS pos
     , DEC2(PR.PHN_NO) AS phnNo
     , DEC2(PR.EMAIL) AS email
     , PR.PO_YN AS poYn
     , PR.POST_NO AS postNo
     , PR.NUM_ADDR AS numAddr
     , PR.ROAD_ADDR AS roadAddr
     , PR.DTL_ADDR AS dtlAddr
     , PR.REQ_YN AS reqYn
     , PR.STD_REQ_YN AS stdReqYn
     , PR.SEX_CD AS sexCd
     , PR.ATTD_YN AS attdYn
     , PR.COMPL_YN AS complYn
     , PR.REQ_CTN_1 AS reqCtn1
     , PR.REQ_CTN_2 AS reqCtn2
     , PR.DIV_CD_1 AS divCd1
     , PR.DIV_CD_2 AS divCd2
     , PR.BIZ_REQ_SEQ AS bizReqSeq
     , PR.BUT_BIZ_TYPE_CD AS butBizTypeCd
     , PR.BUT_BIZ_DTL_PART_CD AS butBizDtlPartCd
     , PR.REQ_STAT_NUM AS reqStatNum
     , PR.REQ_STAT_CD AS reqStatCd
     , PR.ETC_NUM_NM AS etcNumNm
     , PR.REG_PRS_SID AS regPrsSid
     , PR.REG_DT_TM AS regDtTm
     , PR.REG_PRS_IP AS regPrsIp
     , PR.MDF_PRS_SID AS mdfPrsSid
     , PR.MDF_DT_TM AS mdfDtTm
     , PR.CNCL_YN AS cnclYn
     , PR.RSDN_TYPE_CD AS rsdnTypeCd
     , PR.RAT_DIV AS ratDiv
     , PR.RST_CTN AS rstCtn
     , DEC2(PR.MOPHN_NO) AS mophnNo
     , DEC2(PR.IHIDNUM) AS ihidnum
     , PR.PRD AS prd
     , PR.MAJ AS maj
     , PR.SCRE_DIV_NM_1 AS screDivNm1
     , PR.SCRE_CRD_1 AS screCrd1
     , PR.SCRE_MAX_SCR_1 AS screMaxScr1
     , PR.SCRE_DIV_NM_2 AS screDivNm2
     , PR.SCRE_CRD_2 AS screCrd2
     , PR.SCRE_MAX_SCR_2 AS screMaxScr2
     , PR.REQ_CTN_3 AS reqCtn3
     , PR.YR AS yr
     , PR.REQ_NO AS reqNo
     , PR.RD10_REQ_NO AS rd10ReqNo
     , DEC2(PR.BANK_NM) AS bankNm
     , DEC2(PR.ACCNT_NO) AS accntNo
     , DEC2(PR.DEP_OWN) AS depOwn
     , PR.BANK_DIV AS bankDiv
     , PR.BANK_CD AS bankCd
     , PR.BANK_ADDR AS bankAddr
     , PR.EVAL_CMN_SID_1 AS evalCmnSid1
     , PR.EVAL_1_A AS eval1A
     , PR.EVAL_1_B AS eval1B
     , PR.EVAL_1_C AS eval1C
     , PR.EVAL_SCR_1 AS evalScr1
     , PR.EVAL_CTN_1 AS evalCtn1
     , PR.EVAL_CMN_SID_2 AS evalCmnSid2
     , PR.EVAL_2_A AS eval2A
     , PR.EVAL_2_B AS eval2B
     , PR.EVAL_2_C AS eval2C
     , PR.EVAL_SCR_2 AS evalScr2
     , PR.EVAL_CTN_2 AS evalCtn2
     , PR.NAT AS nat
     , PR.REQ_CTN_7 AS reqCtn7
     , PR.REQ_CTN_6 AS reqCtn6
     , PR.REQ_CTN_5 AS reqCtn5
     , PR.REQ_CTN_4 AS reqCtn4
     , PR.REQ_PRS_SID AS reqPrsSid
     , PR.CALC_YN AS calcYn
     , (SELECT PROG_YR
  FROM PROG P
 WHERE PROG_SID = PR.PROG_SID ) AS progYr
  FROM PROG_REQ PR
 WHERE PR.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:31:34  INFO [jdbc.sqltiming] /* selectMtProgByPk - PROG테이블 PK로 조회 */SELECT FM.FILE_NM AS fileNm
     , P.PROG_SID AS progSid
     , P.PROG_GRP_CD AS progGrpCd
     , P.PROG_YR AS progYr
     , P.PROG_DIV_NM AS progDivNm
     , P.PROG_PROD AS progProd
     , P.ALIG_NUM AS aligNum
     , P.PROG_NM AS progNm
     , P.ATT_PRD_CTN AS attPrdCtn
     , P.DT_TM_CTN AS dtTmCtn
     , P.LOC_CTN AS locCtn
     , P.DTL_CTN AS dtlCtn
     , P.HDCNT AS hdcnt
     , P.WTNG_CNT AS wtngCnt
     , P.EXP_YN AS expYn
     , P.OPEN_YN AS openYn
     , P.REG_DIV AS regDiv
     , P.GDCC_EXP_YN AS gdccExpYn
     , P.MDF_YN AS mdfYn
     , P.FILE_SID AS fileSid
     , P.ST_TIME AS stTime
     , P.END_TIME AS endTime
     , P.REG_PRS_SID AS regPrsSid
     , P.REG_DT_TM AS regDtTm
     , P.REG_PRS_IP AS regPrsIp
     , P.MDF_PRS_SID AS mdfPrsSid
     , P.MDF_DT_TM AS mdfDtTm
     , P.DIV_CD_1 AS divCd1
     , P.UNV_PROG_ADM_YN AS unvProgAdmYn
     , P.PROG_STAT_CD AS progStatCd
  FROM PROG P LEFT JOIN FILE_MGT FM
    ON P.FILE_SID = FM.FILE_SID
   AND FM.DEL_YN = 'N'
 WHERE P.PROG_SID = 'PRO25000000000125803';
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:31:34  INFO [jdbc.sqltiming] /* selectMtProgMentoClubAplByPk - PROG_MENTO_CLUB_APL테이블 PK로 조회 */SELECT GETCDNM(PMCA.BANK_CD) AS bankCdNm
     , IFNULL(FORMAT(PMCA.REQ_AOM
     , 0)
     , 0) AS reqAomCom
     , IFNULL(FORMAT(PMCA.SAM_AOM
     , 0)
     , 0) AS samAomCom
     , (SELECT FILE_NM
  FROM FILE_MGT FM
 WHERE FM.FILE_SID = PMCA.PO_FILE_SID
   AND FM.DEL_YN = 'N') AS poFileNm
     , PMCA.PROG_REQ_SID AS progReqSid
     , PMCA.AFL_SCHL_SID AS aflSchlSid
     , DEC2(PMCA.MOPHN_NO) AS mophnNo
     , PMCA.ACTV_SUB_CTN AS actvSubCtn
     , PMCA.ACTV_ST_DT AS actvStDt
     , PMCA.ACTV_END_DT AS actvEndDt
     , PMCA.MENTO_ACTV_HDCNT AS mentoActvHdcnt
     , PMCA.TCH_ACTV_HDCNT AS tchActvHdcnt
     , PMCA.EXPT_EFCT_CTN AS exptEfctCtn
     , DEC2(PMCA.DEP_OWN) AS depOwn
     , DEC2(PMCA.ACCNT_NO) AS accntNo
     , PMCA.BANK_CD AS bankCd
     , PMCA.PO_FILE_SID AS poFileSid
     , PMCA.SELT_YN AS seltYn
     , PMCA.REQ_AOM AS reqAom
     , PMCA.SAM_AOM AS samAom
     , PMCA.GDCC_CTN AS gdccCtn
     , PMCA.DEL_YN AS delYn
     , PMCA.REG_PRS_SID AS regPrsSid
     , PMCA.REG_DT_TM AS regDtTm
     , PMCA.MDF_PRS_SID AS mdfPrsSid
     , PMCA.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_APL PMCA
 WHERE PMCA.DEL_YN = 'N'
   AND PMCA.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 9 msec}2025-02-27 01:31:34  INFO [jdbc.sqltiming] /* selectMtProgMentoClubRstRvwByPk - PROG_MENTO_CLUB_RST_RVW테이블 PK로 조회 */SELECT FORMAT(IFNULL(PMCRR.SAM_AOM
     , 0)
     , 0) AS samAomCom
     , FORMAT(IFNULL(PMCRR.USE_AOM
     , 0)
     , 0) AS useAomCom
     , FORMAT(IFNULL(PMCRR.RTURN_AOM
     , 0)
     , 0) AS rturnAomCom
     , FORMAT(IFNULL(PMCRR.SAM_AOM
     , 0) - IFNULL(PMCRR.USE_AOM
     , 0) - IFNULL(PMCRR.RTURN_AOM
     , 0)
     , 0) AS blceAomCom
     , FORMAT(IFNULL(PMCRR.SAM_AOM
     , 0) - IFNULL(PMCRR.RTURN_AOM
     , 0)
     , 0) AS lastSamAomCom
     , ROUND(IFNULL(PMCRR.USE_AOM
     , 0) / (IFNULL(PMCRR.SAM_AOM
     , 0) - IFNULL(PMCRR.RTURN_AOM
     , 0)) * 100) AS percent
     , PMCRR.PROG_REQ_SID AS progReqSid
     , PMCRR.SELT_MEMO AS seltMemo
     , PMCRR.SELT_GDCC AS seltGdcc
     , PMCRR.RVW_RST_CD AS rvwRstCd
     , PMCRR.RVW_EVAL_CD AS rvwEvalCd
     , PMCRR.RVW_UNQ AS rvwUnq
     , PMCRR.RVW_NEED_YN AS rvwNeedYn
     , PMCRR.RVW_RST_CTN AS rvwRstCtn
     , PMCRR.SAM_AOM AS samAom
     , PMCRR.USE_AOM AS useAom
     , PMCRR.RTURN_AOM AS rturnAom
     , PMCRR.RTURN_DT AS rturnDt
     , PMCRR.DEL_YN AS delYn
     , PMCRR.REG_PRS_SID AS regPrsSid
     , PMCRR.REG_DT_TM AS regDtTm
     , PMCRR.MDF_PRS_SID AS mdfPrsSid
     , PMCRR.MDF_DT_TM AS mdfDtTm
  FROM PROG_MENTO_CLUB_RST_RVW PMCRR
 WHERE PMCRR.DEL_YN = 'N'
   AND PMCRR.PROG_REQ_SID = 'PRQ25000000000125804';
--------------------------------------------------
{
executed in 12 msec}2025-02-27 01:31:34  INFO [jdbc.sqltiming] /* selectCommMbrRrnByPk - MBR_RRN테이블 PK로 조회 */SELECT MR.MBR_SID AS mbrSid
     , MR.REG_YR AS regYr
     , MR.BIZ_ID AS bizId
     , MR.PROD AS prod
     , DEC2(MR.RRN_1) AS rrn1
     , DEC2(MR.RRN_2) AS rrn2
     , MR.DEL_YN AS delYn
     , MR.MDF_PRS_SID AS mdfPrsSid
     , MR.MDF_DT_TM AS mdfDtTm
  FROM MBR_RRN MR
 WHERE MR.DEL_YN = 'N'
   AND MR.MBR_SID = 'MBR2411794'
   AND MR.REG_YR = '2025'
   AND MR.BIZ_ID = 'MT012501'
   AND MR.PROD = 0;
--------------------------------------------------
{
executed in 10 msec}2025-02-27 01:31:34  INFO [jdbc.sqltiming] /* selectMtCodeMgtByGrpCdEngNmList - CODE_MGT테이블 GRP_CD_ENG_NM으로 리스트 조회 */SELECT GETCDNM(CM.PRT_CD) AS prtCdNm
     , CM.CD_ID AS cdId
     , CM.GRP_CD_NM AS grpCdNm
     , CM.GRP_CD_ENG_NM AS grpCdEngNm
     , CM.PRT_CD AS prtCd
     , CM.CD_NM AS cdNm
     , CM.WU_SID AS wuSid
     , CM.ETC AS etc
     , CM.DEL_YN AS delYn
     , CM.MDF_PRS_SID AS mdfPrsSid
     , CM.MDF_DT_TM AS mdfDtTm
     , CM.SEQ AS seq
  FROM CODE_MGT CM
 WHERE CM.DEL_YN = 'N' 
   AND CM.GRP_CD_ENG_NM = 'BANK_TYPE_CD'
 ORDER BY 
       CM.SEQ ASC
     , CM.CD_ID ASC;
--------------------------------------------------
{
executed in 11 msec}2025-02-27 01:31:34 DEBUG [org.sdream.comm.comp.EnvProfile] Environment is local : true;
--------------------------------------------------
{