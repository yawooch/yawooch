<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/views/common/header.jsp" />
<link rel="stylesheet" href="${path}/views/question/css/lostItemreal.css">
<link rel="img" href="${path}/src/main/webapp/img/">
<link rel="icon" href="../question/img/TeraBox.ico">
<script src="${path}/views/js/jquery-3.7.1.js"></script>
<script src="${path}/views/question/js/lostItemreal.js"></script>
<div class="qt-body-by">
<!-- 분실물 상세 -->
	<main class="qt-main-by">
		<div class="qt-submenu-by">
			<div class="qt-submenu-area-by">
				<div class="qt-submenu-areaname-by">
					<span></span> <a
						href="${path}/question"
						title="고객센터 페이지로 이동" id="qt_submenuname_by"> 고객센터</a> <a
						href="${path}/question/writeLost"
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
					<li><a href="${path}/question/faq">자주묻는
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
				<h2 class="qt-mainname-by">나의 문의내역</h2>
				<div class="clearfix">
					<ul class="dot-list">
						<li>메가박스에서 잃어버린 물건이 있다면 ‘분실물 문의/접수’를 통해 접수해주세요</li>
						<li>접수하신 글은 비밀글로 등록되어 작성자와 관리자만 확인 가능합니다.</li>
					</ul>
				</div>
				<div class="table-wrap"></div>
				<div class="board-view">
					<div class="tit-area">
						<p class="tit">${ question.title }</p>
					</div>
					<div class="info">
						<p>
							<span class="txt">
							${ question.division }
							<c:if test="${ not empty question.type }">
								<span> - ${ question.type }</span>
							</c:if>
							</span>
						</p>
						<p>
							<strong class="txt">${ question.cinemaId }</strong>
						</p>
						<p>
							<span class="txt">${ question.phone }</span>
						</p>
						<p>
							<span class="txt">${ question.email }</span>
						</p>
						<p>
							<span class="txt">${ question.answRegDttm }</span>
						</p>
						<p>
							<span class="txt">답변 상태: ${ question.check }</span>
						</p>
					</div>
					<div class="cont">
						<textarea rows="5" cols="30" readonly class="input-textarea view"
							style="border: none;">${ question.content }</textarea>
                        <c:if test="${ not empty question.answContent }">
                        	<div> ${ question.answContent }</div>
                        </c:if>
					</div>
					<div class="btn-group pt40">
						<a href="${path}/question/lost"
							id="listBtn" class="button large" title="목록">목록</a> 
						<a href="javascript:void(0);"
							class="button large deleteBtn inq-delete" title="삭제">삭제</a>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/views/common/footer.jsp" />
</div>