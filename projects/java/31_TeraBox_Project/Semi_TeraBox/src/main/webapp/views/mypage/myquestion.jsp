<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/views/common/header.jsp" />
<link rel="stylesheet" href="${path}/views/mypage/css/myquestion.css">
<!-- 나의 문의 내역 -->
<div class="container has-lnb">
	<div class="page-util">
		<div class="inner-wrap">
			<div class="location">
				<span>Home</span> 
				<a href="${path}/mypage" title="나의 테라박스 페이지로 이동">나의 테라박스</a> 
				<a href="${path}/mypage/myqeustion" title="나의 문의내역 페이지로 이동">나의 문의내역</a>
			</div>
		</div>
	</div>
	<div class="inner-wrap">
		<div class="lnb-area">
		  <div class="mp-tera-box">
                        <a href="javascript:void(0);">나의 테라박스</a>
                    </div>
			<div class="mp-question">
                        <a href="${path}/mypage">나의 예매 내역  </a>
                    </div>
                    
                    <div class="mp-ticketing">
                        <a href="${path}/mypage/question">나의 문의 내역<img src="${path}/views/mypage/img/arrow.png" alt="화살표"></a>
                    </div>
                    <div class="mp-member">
                        <a href="${path}/mypage/myinfo">회원 정보 수정</a>
                    </div>
		</div>
		<div id="contents" class="location-fixed">
			<h2 class="tit">나의 문의내역</h2>
			<div class="mypage-infomation mt20">
				<ul class="dot-list mb20">
					<li id="tabDesc">고객센터를 통해 남기신 문의내역을 확인하실 수 있습니다.</li>
					<!-- <li>문의하시기 전 <a href="/support/faq" class="a-link"><strong>자주묻는질문</strong></a>을 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다</li> -->
				</ul>

				<div class="btn-group right">
					<a href="${ path }/question/writeview" class="button" id="inqBtn" title="문의하기">문의하기</a>
				</div>
			</div>

			<div class="board-list-util mb10">
				<p class="result-count">
					<!-- to 개발 : 검색을 안한 경우 -->
					<strong>전체 (<b id="totalCnt">${ pageInfo.listCount }</b>건)
					</strong>
				</p>

				<select id="custInqStatCd"
					onchange="javascript:$('#searchBtn').click();" class=""
					tabindex="-98">
					<option value="">전체</option>
					<option value="INQST1">미답변</option>
					<option value="INQST2">답변완료</option>
				</select>

				<div class="board-search ml07">
					<input type="text" title="검색어를 입력해 주세요."
						placeholder="검색어를 입력해 주세요." class="input-text" id="searchTxt"
						value="">
					<button type="button" class="btn-search-input" id="searchBtn">검색</button>
				</div>
			</div>

			<div class="table-wrap">

				<table class="board-list a-c">
					<colgroup>
						<col style="width: 80px">
						<col style="width: 140px;">
						<col style="width: 120px;">
						<col>
						<col style="width: 160px;">
						<col style="width: 100px;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">극장</th>
							<th scope="col">구분</th>
							<th scope="col">제목</th>
							<th scope="col">답변상태</th>
							<th scope="col">등록일</th>
						</tr>
					</thead>
<%-- 					<c:if test="${ not empty list }"> --%>
<%-- 						<c:forEach var="questionlst" items="${ list }"> --%>
<!-- 							<tbody> -->
<!-- 								<tr> -->
<%-- 									<th scope="col">${questlist.QuestNo}</th> --%>
<%-- 									<th scope="col">${question.CinemaId }</th> --%>
<%-- 									<th scope="col">${qtuestion.type }</th> --%>
<%-- 									<th scope="col">${question.quest.title }</th> --%>
<%-- 									<th scope="col">${question.questName }</th> --%>
<!-- 								</tr> -->
<!-- 							</tbody> -->
<%-- 						</c:forEach> --%>
<%-- 					</c:if> --%>
					<tbody>
						<c:if test="${ not empty list }">
							<c:forEach var="question" items="${ list }">
									<tr>
										<td scope="col">${question.no}</td>
										<td scope="col">${question.cinemaId }</td>
										<td scope="col">${question.division }</td>
										<td scope="col"><a href="${ path }/mypage/questionanswer?no=${question.no}">${question.title }</a></td>
										<td scope="col">${question.check }</td>
										<td scope="col">${question.answRegDttm }</td>
									</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<!-- pagination -->
			<nav class="pagination">
				<div class="mv-com-btnlist">
	                    <button class="mv-com-btnFirst mv-com-btnFunction" onclick="location.href='${ path }/mypage/question?&page=1'">
	                        <img src="${path}/views/movie/image/arrow-leftleft.png" alt="">
	                    </button>
	                    <button class="mv-com-btnPrev mv-com-btnFunction" onclick="location.href='${ path }/mypage/question?&page=${ pageInfo.prevPage }'">
	                        <img src="${path}/views/movie/image/arrow-left.png" alt="">
	                    </button>
	                    <c:forEach var="current" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
							<c:choose>
								<c:when test="${ current == pageInfo.currentPage }">
									<button class="mv-com-btnNumber on">${ current }</button>
								</c:when>
								<c:otherwise>
									<button class="mv-com-btnNumber" onclick="location.href='${ path }/mypage/question?&page=${ current }'">${ current }</button>
								</c:otherwise>
							</c:choose>
						</c:forEach>
	                    <button class="mv-com-btnNext mv-com-btnFunction" onclick="location.href='${ path }/mypage/question?&page=${ pageInfo.nextPage }'">
	                        <img src="${path}/views/movie/image/arrow-right.png" alt="">
	                    </button>
	                    <button class="mv-com-btnLast mv-com-btnFunction" onclick="location.href='${ path }/mypage/question?&page=${ pageInfo.maxPage }'">
	                        <img src="${path}/views/movie/image/arrow-rightright.png" alt="">
	                    </button>
	                </div>
			</nav>
			<!--// pagination -->
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
	
		// 선택된 버튼 색상 변경 및 커서 기본으로 변경
	    $('.mv-com-btnlist').children('.on').css({
	        'border': '1px solid #AF2D2D',
	        'background-color': '#AF2D2D',
	        'color': 'white',
	        'cursor': 'auto'
	    });
	});
</script>
<jsp:include page="/views/common/footer.jsp" />