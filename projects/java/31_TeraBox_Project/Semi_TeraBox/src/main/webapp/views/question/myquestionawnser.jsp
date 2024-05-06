<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/views/common/header.jsp" />
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/views/question/css/myquestionawnser.css">
<link rel="img" href="${path}/src/main/webapp/img/">
<link rel="icon" href="../question/img/TeraBox.ico">
<script src="${path}/views/js/jquery-3.7.1.js"></script>
<script src="${path}/views/question/js/lostItemreal.js"></script>
<div class="qt-body-by">
	<main class="qt-main-by">
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="${path}/mypage" title="나의 테라박스 페이지로 이동">나의
						테라박스</a> <a href="${path}/mypage/myqeustion" title="나의 문의내역 페이지로 이동">나의
						문의내역</a>
				</div>
			</div>
		</div>

		<div class="qt-mainarea-by">
			<div class="lnb-area">
				<nav id="lnb">
					<p class="tit">
						<a href="${path}/mypage" title="나의 테라박스">나의 테라박스</a>
					</p>
					<ul>
						<li class=""><a href="${path}/mypage" title="예매/구매내역">예매/구매내역</a></li>
						<li class="on"><a href="${path}/mypage/question"
							title="나의 문의내역">나의 문의내역</a></li>
						<li class=""><a href="${path}/mypage/myinfo" title="회원정보">회원정보</a></li>
					</ul>
				</nav>
			</div>

			</nav>
			<div id="qt_contents_by">
				<h2 class="qt-mainname-by">나의 문의내역</h2>
				<div class="clearfix">
					<ul class="dot-list">
						<li id="tabDesc">고객센터를 통해 남기신 문의내역을 확인하실 수 있습니다.</li>
					</ul>
				</div>
				<div class="table-wrap"></div>
				<div class="board-view">
					<div class="tit-area">
						<p class="tit">${ question.title }</p>
					</div>
					<div class="info">
						<p>
							<span class="txt">${ question.division }</span>
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
							<div>${ question.answContent }</div>
						</c:if>
					</div>
					<div class="btn-group pt40">
						<a href="${ path }/mypage/question" id="listBtn"
							class="button large" title="목록">목록</a> <a href="javascript:void(0);"
							class="button large deleteBtn inq-delete" title="삭제">삭제</a>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/views/common/footer.jsp" />
</div>