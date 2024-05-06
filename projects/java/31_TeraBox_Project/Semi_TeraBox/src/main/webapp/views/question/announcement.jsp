<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/views/question/css/announcement.css">
<link rel="img" href="${path}/src/main/webapp/img/">
<link rel="icon" href="../question/img/TeraBox.ico">
<jsp:include page="/views/common/header.jsp" />
<script src="${ path }/views/question/js/announcement.js"></script>
<div class="qt-body-by">
	<main class="qt-main-by">
		<div class="qt-submenu-by">
			<div class="qt-submenu-area-by">
				<div class="qt-submenu-areaname-by">
					<span></span> <a
						href="${ path }/question"
						title="고객센터 페이지로 이동" id="qt_submenuname_by"> 고객센터</a> <a
						href="${ path }/question/announcement"
						title="고객센터 페이지로 이동" id="qt_submenuname1_by">공지사항</a>
				</div>
			</div>
		</div>

		<div class="qt-mainarea-by">
			<nav id="qt_sidebar-area_by" class="qt-sidebar-areapoint-by">
				<p class="qt-sidebar-each-by">
					<a href="javascript:void(0);" title="고객센터">고객센터</a>
				</p>
				<ul>
					<li class="qt-first-area-by"><a class="qt-first-text-by"
						href="${ path }/question">고객센터
							홈</a></li>
					<li><a class="qt-third-text-by"
						href="${ path }/question/announcement">공지사항</a></li>
					<li><a href="${ path }/question/faq">자주묻는
							질문</a></li>
						<li><a href="${ path }/question/writeview">1:1 문의</a></li>
					<li><a href="${ path }/question/writerentview">단체관람 및 대관문의</a></li>
					<li><a
						href="${ path } /question/lost">분실물 문의</a></li>
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
				<h2 class="qt-mainname-by">공지사항</h2>
				<div class="qt-tab-block-by qt-small-by qt-mb-30-by">
					<ul>
						<li class="qt-on-by">
							<button type="button" class="qt-btn-by qt-tabBtn-by"
								id="qt-totalTab-by" data-no title="전체">
								<a class="qt-acolor-by"
									href="${ path }/question/announcement">전체</a>
							</button>
						</li>
						<li>
							<button type="button" class="qt-btn-by qt-tabBtn-by"
								id="qt-totalTab-by" data-no="88" title="테라박스 공지">
								<a class="qt-acolor1-by"
									href="${ path }/question/announcementTera">테라박스
									공지</a>
							</button>
						</li>
						<li>
							<button type="button" class="qt-btn-by qt-tabBtn-by"
								id="qt-totalTab-by" data-no="89" title="지점 공지">
								<a class="qt-acolor1-by"
									href="${ path }/question/announcementSeoul">지점
									공지</a>
							</button>
						</li>
					</ul>
				</div>
				<div class="qt-board-list-util-by">
					<select class="qt-area-by">
						<option value>강남</option>
						<option value>목동</option>
						<option value>상암</option>
						<option value>홍대</option>
						<option value>동대문</option>
					</select>
					<p class="qt-result-count-by">
						<strong> 전체 <em class="qt-font-gblue-by">3,646</em> 건
						</strong>
					</p>
					<div class="qt-board-search-by">
						<input type="text" id="qt_searchTxt_by" title="검색어를 입력해 주세요."
							placeholder="검색어를 입력해 주세요." class="qt-input-text-by" value
							maxlength="15">
						<button type="button" id="qt_searchBtn_by"
							class="qt-btn-search-input-by">검색</button>
					</div>
				</div>
				<div class="qt-table-wrap-by">
					<table class="qt-board-list-by">
						<caption>번호, 극장, 구분, 제목, 등록일이 들어간 공지사항 전체 리스트</caption>
						<col style="width: 72px;">
						<col style="width: 133px;">
						<col style="width: 95px;">
						<col>
						<col style="width: 116px;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">극장</th>
								<th scope="col">구분</th>
								<th scope="col">제목</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="notice" items="${ list }">
							<tr>
								<td>${ notice.noticeNo }</td>
								<td>${ notice.cinemaArea }</td>
								<td>${ notice.noticeType }</td>
								<th><a href="javascript:void(0);" class="qt-moveBtn-by" title="공지사항 상세보기">[${ notice.cinemaArea }] ${ notice.noticeTitle }</a></th>
								<td>${ notice.noticeRegDate }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="qt-pagination-by">
					<a title="첫번째 페이지보기" href="${ path }/question/announcement?page=1" class="control first" >first</a>
					<a title="이전페이지보기" href="${ path }/question/announcement?page=${ pageInfo.prevPage }" class="control previous" >previous</a>
						<c:forEach var="current" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" >
							<c:choose>
								<c:when test="${current == pageInfo.currentPage }">
									<button style="border: 1px solid rgb(175, 45, 45); background-color: rgb(175, 45, 45); border-radius: 4px;
									    width: 32px; height:32px; line-height: 22px; color: white; cursor: auto;"  disabled>${ current }</button>
								</c:when>
								<c:otherwise>			
									<button class="faq-btn-number" onclick="location.href='${path}/question/announcement?page=${ current }'">${ current }</button>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					<a title="10페이지보기" href="${ path }/question/announcement?page=${ pageInfo.nextPage }" class="control next">next</a>
					<a title="마지막 페이지보기" href="${ path }/question/announcement?page=${ pageInfo.maxPage }" class="control last">last</a>
				</div>
			</div>
	</main>
	<jsp:include page="/views/common/footer.jsp" />