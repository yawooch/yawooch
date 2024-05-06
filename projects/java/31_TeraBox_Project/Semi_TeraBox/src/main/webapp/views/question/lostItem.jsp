<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/views/common/header.jsp" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/views/question/css/lostItem.css">
<link rel="img" href="${path}/src/main/webapp/img/">
<link rel="icon" href="../question/img/TeraBox.ico">
<script src="${path}/views/js/jquery-3.7.1.js"></script>
<script src="${path}/views/question/js/lostItem.js"></script>
<div class="qt-body-by">

<!-- 분실물 문의 -->
	<main class="qt-main-by">
		<div class="qt-submenu-by">
			<div class="qt-submenu-area-by">
				<div class="qt-submenu-areaname-by">
					<span></span> <a
						href="${path}/question"
						title="고객센터 페이지로 이동" id="qt_submenuname_by"> 고객센터</a> <a
						href="${path}/question/lost"
						title="고객센터 페이지로 이동" id="qt_submenuname1_by">분실물 문의</a>
				</div>
			</div>
		</div>

		<div class="qt-mainarea-by">
			<nav id="qt_sidebar-area_by" class="qt-sidebar-areapoint-by">
				<p class="qt-sidebar-each-by">
					<a href="${path}/question" title="고객센터">고객센터</a>
				</p>
				<ul>
					<li class="qt-first-area-by"><a class="qt-first-text-by"
						href="${path}/question">고객센터
							홈</a></li>
					<li><a class="qt-third-text-by"
						href="${path}/question/announcement">공지사항</a></li>
					<li><a href="${path}/question/faq ">자주묻는
							질문</a></li>
						<li><a href="${path}/question/writeview">1:1 문의</a></li>
					<li><a href="${path}/question/writerentview">단체관람 및 대관문의</a></li>
					<li><a class="qt-four-text-by"
						href="${path}/question/lost">분실물
							문의</a></li>
				</ul>
				<div class="qt-info-by">
					<p class="qt-sidebar-each-by">
						테라박스 고객센터 <i class="qt-bar-by"></i> <span>Dream center</span>
					</p>
					<p class="qt-time-by">
						<i class="qt-clock-by qt-iconset-by"></i> "10:00~19:00"
					</p>
				</div>
			</nav>
			<div id="qt_contents_by">
				<h2 class="qt-mainname-by">분실물 문의</h2>
				<div class="clearfix">
					<ul class="dot-list">
						<li>메가박스에서 잃어버린 물건이 있다면 ‘분실물 문의/접수’를 통해 접수해주세요. <a href="${ path }/question/writeLost"
							class="button float-r" title="분실물 문의 등록하기">문의 하기</a>
						</li>
						<li>접수하신 글은 비밀글로 등록되어 작성자와 관리자만 확인 가능합니다.</li>
					</ul>
				</div>
				<div class="board-list-util">
					<select class="qt-area-by">
						<option value>강남</option>
						<option value>목동</option>
						<option value>상암</option>
						<option value>홍대</option>
						<option value>동대문</option>
					</select> <select class="qt-area-by">
						<option value>접수 선택</option>
						<option value>답변</option>
						<option value>미답변</option>
					</select>
					<p class="result-count">
						<strong> 전체 <em class="font-gblue">${ pageInfo.listCount }</em> 건
						</strong>
					</p>
					<div class="board-search">
						<input type="text" id="searchTxt" title="검색어를 입력해 주세요."
							placeholder="검색어를 입력해 주세요." class="input-text" value
							maxlength="15">
						<button type="button" id="searchBtn" class="btn-search-input">검색</button>
					</div>
				</div>
				<div class="table-wrap">
					<table class="board-list">
						<caption>번호, 극장, 구분, 제목, 등록일이 들어간 공지사항 전체 리스트</caption>
						<col style="width: 72px;">
						<col style="width: 133px;">
						<col>
						<col style="width: 100px;">
						<col style="width: 116px;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">극장</th>
								<th scope="col">제목</th>
								<th scope="col">접수상태</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${ empty list }">
								<tr>
									<td colspan=5>분실물이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${ not empty list }">
								<c:forEach var="question" items="${list}">
									<tr>
										<td>${question.no}</td>
										<td>${question.cinemaId}</td>
										<th scope="row">
											<a href="${ path }/question/lostitem?no=${question.no}" class="btn-layer-open moveBtn"
											data-sn="726847" data-no="14853206" title="분실물 문의 상세보기 ">
												${question.title} 
											</a>
										</th>
										<td> ${question.check} </td>
										<td> ${question.answRegDttm} </td>
									</tr>
								</c:forEach>
							</c:if>

						</tbody>
					</table>
				</div>
				
				
				<nav class="qt-pagination-by">
					<div class="mv-com-btnlist">
	                    <button class="mv-com-btnFirst mv-com-btnFunction" onclick="location.href='${ path }/question/lost?&page=1'">
	                        <img src="${path}/views/movie/image/arrow-leftleft.png" alt="">
	                    </button>
	                    <button class="mv-com-btnPrev mv-com-btnFunction" onclick="location.href='${ path }/question/lost?&page=${ pageInfo.prevPage }'">
	                        <img src="${path}/views/movie/image/arrow-left.png" alt="">
	                    </button>
	                    <c:forEach var="current" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
							<c:choose>
								<c:when test="${ current == pageInfo.currentPage }">
									<button class="mv-com-btnNumber on">${ current }</button>
								</c:when>
								<c:otherwise>
									<button class="mv-com-btnNumber" onclick="location.href='${ path }/question/lost?&page=${ current }'">${ current }</button>
								</c:otherwise>
							</c:choose>
						</c:forEach>
	                    <button class="mv-com-btnNext mv-com-btnFunction" onclick="location.href='${ path }/question/lost?&page=${ pageInfo.nextPage }'">
	                        <img src="${path}/views/movie/image/arrow-right.png" alt="">
	                    </button>
	                    <button class="mv-com-btnLast mv-com-btnFunction" onclick="location.href='${ path }/question/lost?&page=${ pageInfo.maxPage }'">
	                        <img src="${path}/views/movie/image/arrow-rightright.png" alt="">
	                    </button>
	                </div>
<!-- 					<strong class="qt-active-by">1</strong>  -->
<!-- 					<a title="2페이지보기" href="javascript:void(0);" pagenum="2">2</a>  -->
<!-- 					<a title="3페이지보기" href="javascript:void(0);" pagenum="3">3</a>  -->
<!-- 					<a title="4페이지보기" href="javascript:void(0);" pagenum="4">4</a>  -->
<!-- 					<a title="5페이지보기"	href="javascript:void(0);" pagenum="5">5</a>  -->
<!-- 					<a title="6페이지보기" href="javascript:void(0);" pagenum="6">6</a> -->
<!-- 					<a title="이후 10페이지보기" href="javascript:void(0);" class="control next" pagenum="11">next</a> -->
<!-- 					<a title="마지막 페이지보기" href="javascript:void(0);" class="control last" pagenum="787">last</a> -->
				</nav>
			</div>
		</div>
	</main>
	<jsp:include page="/views/common/footer.jsp" />
</div>