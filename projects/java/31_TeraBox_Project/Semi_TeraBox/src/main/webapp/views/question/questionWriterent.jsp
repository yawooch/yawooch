<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />
<link rel="stylesheet" href="${path}/views/question/css/questionWrite.css">
<div class="container has-lnb">
    <div class="page-util">
        <div class="inner-wrap">
            <div class="location">
                <span>Home</span>
                <a href="${path}/question" title="고객센터 페이지로 이동">고객센터</a>
                <a href="${path}/question/write" title="문의하기 페이지로 이동">문의하기</a>
            </div>
        </div>
    </div>
       <div class="inner-wrap">
           <div class="lnb-area">
               <nav id="lnb">
                   <p class="tit"><a href="${path}/question" title="고객센터">고객센터</a></p>
                   <ul>
                       <li class=""><a href="${path}/question"      title="고객센터 홈">고객센터 홈</a></li>
                       <li class=""><a href="${path}/question/announcement" title="공지사항">공지사항</a></li>
                       <li class=""><a href="${path}/question/faq"    title="자주 묻는 질문">자주 묻는 질문</a></li>
                       <li class=""><a href="${ path }/question/writeview"  title="1:1 문의">1:1 문의</a></li>
                       <li class="on"><a href="${path}/question/writerentview"  title="단체관람 및 대관문의">단체관람 및 대관문의</a></li>
                       <li class=""><a href="${path}/question/lost"   title="분실물 문의">분실물 문의</a></li>
                   </ul>
                   <div class="left-customer-info">
                       <p class="tit">
                           테라박스 고객센터
                           <i class="qt-bar-by"></i>
                           <span>Dream center</span>
                       </p>
                       <p class="time">
                           <i class="iconset ico-clock"></i>
                           "10:00~19:00"
                       </p>
                   </div>
               </nav>
           </div>
           <div id="contents" class="location-fixed">
               <h2 class="tit">문의하기</h2>

		<div class="mypage-infomation mt20">
			<ul class="dot-list mb20">
				<li><span style="font-weight: bold;">고객님의 문의에 답변하는 직원은
						<span style="color: #EB323A;">고객 여러분의 가족 중 한 사람일 수 있습니다.</span>
				</span><br> 고객의 언어폭력(비하, 욕설, 협박, 성희롱 등)으로부터 직원을 보호하기 위해<br> 관련
					법에 따라 수사기관에 필요한 조치를 요구할 수 있으며, 형법에 의해 처벌 대상이 될 수 있습니다.<br></li>
				<br>
				<li>문의하시기 전 FAQ를 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다.</li>
			</ul>

			<div class="tab-block">
				<ul>
					<li><a href="${path}/question/writeview" class="btn" title="1:1 문의내역 탭으로 이동">1:1 문의</a></li>
					<li class="on" ><a href="${path}/question/writerentview" class="btn" title="단체관람/대관 문의내역 탭으로 이동">단체관람/대관문의</a></li>
					<li><a href="${path}/question/writeLost"  class="btn" title="분실물 문의내역 탭으로 이동">분실물 문의</a></li>
				</ul>
			</div>
			<div class="agree-box">
				<dl>
					<dt>
						<span class="bg-chk mr10"> <input type="checkbox" id="chk">
							<label for="chk"><strong>개인정보 수집에 대한 동의</strong></label>
						</span> <span class="font-orange">[필수]</span>
					</dt>
					<dd style="font-size: 13px;">
						귀하께서 문의하신 다음의 내역은 법률에 의거 개인정보 수집·이용에 대한 본인동의가 필요한 항목입니다.<br>
						<br> [개인정보의 수집 및 이용목적]<br> 회사는 1:1 문의 내역의 확인, 요청사항 처리
						또는 완료 시 원활한 의사소통 경로 확보를 위해 수집하고 있습니다.<br> <br> [필수 수집하는
						개인정보의 항목]<br> 이름, 휴대전화, 이메일, 문의내용<br> <br> [개인정보의
						보유기간 및 이용기간]<br> <span class="ismsimp">문의 접수 ~ 처리 완료
							후 3년<br> (단, 관계법령의 규정에 의하여 보존 할 필요성이 있는 경우에는 관계 법령에 따라 보존)<br>
							자세한 내용은 '개인정보 처리방침'을 확인하시기 바랍니다.
						</span>
					</dd>
				</dl>
			</div>
			<p class="reset mt10">* 원활한 서비스 이용을 위한 최소한의 개인정보이므로 동의하지 않을 경우
				서비스를 이용하실 수 없습니다</p>
			<p class="reset mt30 a-r font-orange">* 필수</p>
			<form name="regFrm" method="post" action="/question/writerentview">
				<div class="table-wrap mt10" style="display: block;">
					<table class="board-form va-m">
						<colgroup>
							<col style="width: 150px;">
							<col>
							<col style="width: 150px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="theater">극장</label> <em
									class="font-orange">*</em></th>
								<td colspan="3"><select id="theater" class="small"
									title="지역선택" tabindex="-98" name="theaters">
										<option value="">지역선택</option>
										<option value="10">서울</option>
										<option value="30">경기</option>
										<option value="35">인천</option>
										<option value="45">대전/충청/세종</option>
										<option value="55">부산/대구/경상</option>
										<option value="65">광주/전라</option>
										<option value="70">강원</option>
										<option value="80">제주</option>
								</select> <select name="brchNo" id="theater02" title="극장선택"
									class="small ml07" tabindex="-98">
										<option value="">극장선택</option>
										<option value="">상암</option>
										<option value="">강남</option>
										<option value="">동대문</option>
										<option value="">홍대</option>
								</select></td>
							</tr>
							<tr>
								<th scope="row"><label for="date">관람/대관일</label> <em
									class="font-orange">*</em></th>
								<td colspan="3"><input type="date" title="날짜 입력 : yyyy.mm.dd" name="lentDe" id="date"
									class="date-calendar hasDatepicker"/>
								<select name="lentTime" class="small ml07" title="시간선택"
									tabindex="-98">
										<option value="">시간선택</option>
										<option value="01">01</option>
										<option value="02">02</option>
										<option value="03">03</option>
										<option value="04">04</option>
										<option value="05">05</option>
										<option value="06">06</option>
										<option value="07">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
								</select></td>
							</tr>
							<tr>
								<th scope="row"><label for="lentAdmisMovieNm">관람할
										영화</label> <!--  2019-02-14 : 필수값으로 변경 --> <em class="font-orange">*</em>
									<!--//  2019-02-14 : 필수값으로 변경 --></th>
									<td colspan="3"><input type="text" name="admisMovieNm"
										id="lentAdmisMovieNm" class="input-text" maxlength="100"></td>
								</tr>
								<tr>
									<th scope="row"><label for="lentAdmisPcntCnt">관람인원</label>
										<em class="font-orange">*</em></th>
									<td colspan="3"><input type="number" name="admisPcntCnt"
										id="lentAdmisPcntCnt" class="input-text w150px a-r numType"
										maxlength="3"> 명</td>
								</tr>
								<tr>
									<th scope="row"><label for="lentAinqurNm">이름</label> <em
										class="font-orange">*</em></th>
									<td colspan="3"><input type="text" name="inqurNm"
										id="lentAinqurNm" class="input-text w150px" value=""
										maxlength="30"></td>
								</tr>
								<tr>
									<th scope="row"><label for="lentHpNum1">연락처</label> <em
										class="font-orange">*</em></th>
									<td><input type="text" name="hpNum1" id="lentHpNum1"
										class="input-text w60px numType" maxlength="3"
										title="핸드폰번호 첫자리 입력"> <span>-</span> <input
										id="lentHpNum2" type="text" name="hpNum2" class="input-text w60px numType"
										maxlength="4" title="핸드폰번호 중간자리 입력"> <span>-</span> <input
									id="lentHpNum3"	type="text" name="hpNum3" class="input-text w60px numType"
										maxlength="4" title="핸드폰번호 마지막자리 입력"></td>
									<th scope="row"><label for="lentRpstEmail">이메일</label> <em
										class="font-orange">*</em></th>
									<td><input type="text" name="rpstEmail" id="lentRpstEmail"
										class="input-text" value="" maxlength="50"></td>
								</tr>
								<tr>
									<th scope="row"><label for="lentCustInqTitle">제목</label> <em
										class="font-orange">*</em></th>
									<td colspan="3"><input type="text" name="custInqTitle"
										id="lentCustInqTitle" class="input-text" maxlength="100"></td>
								</tr>
								<tr>
									<th scope="row"><label for="lentCustInqCn">내용</label> <em
										class="font-orange">*</em></th>
									<td colspan="3">
										<div class="textarea">
											<textarea name="custInqCn" id="lentCustInqCn" rows="5"
												cols="30" title="내용입력"
												placeholder="- 대관 목적과 관련하여 행사내용 등을 상세히 남겨주시면 더욱 빠른 답변이 가능합니다.
- 문의 내용에 개인정보(이름, 연락처, 카드번호 등)가 포함되지 않도록 유의하시기 바랍니다."
												class="input-textarea"></textarea>
											<div class="util">
												<p class="count">
													<span id="textareaCnt">0</span> / 2000
												</p>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="name">비밀번호</label> <em
										class="font-orange">*</em></th>
									<td colspan="3"><input type="password" id="nonMbInqPw"
										name="nonMbInqPwd" class="input-text w150px pwnew"
										maxlength="4" oninput="gfn_numberMaxLength(this);"> <em
										class="fc_r ml10">* 단체관람 및 대관문의에 대한 고객정보 보호를 위해 게시글의
											비밀번호를 설정해주세요.</em></td>
								</tr>
							</tbody>
						</table>
				</div>
				<div class="btn-group pt40 positionRelative">
					<button type="submit" class="button purple large">등록</button>
				</div>
			</form>
		</div>
		</div>
	</div>
</div>
<jsp:include page="/views/common/footer.jsp" />