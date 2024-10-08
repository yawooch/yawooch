<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
    prefix="security"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" href="${path}/css/community/mypetdetail.css">

<style>
#fileDown {
    font-size: 16px;
    cursor: pointer;
}
</style>

<div class="content">
    <div class="container">
        <div class="common-title">
            <p>공지사항</p>
        </div>
        <div class="common-sideMenu">
            <ul>
                <li class="">커뮤니티</li>
                <li class="on"><a href="${path}/community/notice">공지사항</a></li>
                <li class="">  <a href="${path}/community/board">자유 게시판</a>
                    <ul class="community-detail-sideMenu">
                        <li><a href="${ path }/community/board/talk">수다</a></li>
                        <li><a href="${ path }/community/board/mypet">마이펫 자랑</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="common-list">
            <div class="community-detail-list">
                <table border="1">
                    <tr>
                        <td style="background-color: #FDFAEF;">제목</td>
                        <td colspan="5" class="community-td-title" style="text-align: left;">
                        ${ community.communityCategory }
                        ${ community.communityTitle }
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #FDFAEF;">작성자</td>
                        <td>${ community.communityWriterId }         </td>
                        <td style="background-color: #FDFAEF;">등록일</td>
                        <td>${ community.communityEd }               </td>
                        <td style="background-color: #FDFAEF;">조회수</td>
                        <td>${ community.communityCount }            </td>
                    </tr>
                    <tr>
                        <td colspan="6" class="community-td-content" style="text-align: left;">
                        <c:if test="${ community.communityRfileName == null }">
                            ${ community.communityContent }
                        </c:if>
                        <c:if test="${ community.communityRfileName != null }">
                            <p><img style="max-width: 800px; max-height: 800px;" src="${ path }/resources/upload/community/${ community.communityRfileName }" alt=""></p>
                            ${ community.communityContent }
                        </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #FDFAEF;">첨부파일</td>
                        <c:if test="${ empty community.communityOfileName }">
                        <td colspan="5" style="text-align: left;"><a> - </a></td>
                        </c:if>
                        <c:if test="${ not empty community.communityOfileName }">
                        <td colspan="5" style="text-align: left;"><a id="fileDown">${ community.communityOfileName }</a></td>
                        </c:if>
                    </tr>
                </table>
            </div>
            <div class="btn-wrap">
                <c:if test="${not empty loginMember and loginMember.memberRole == 'ROLE_ADMIN'}">
                    <button class="community-btn" id="updateBtn">수정</button>
                    <button class="community-btn" id="deleteBtn">삭제</button>
                </c:if>
                <button class="community-btn" onclick="location.href='${ path }/community/notice'">목록</button>
            </div>
        </div>
    </div>
</div>

<script>

$(document).ready(() => {
    // 파일 다운로드
    $('#fileDown').on('click', () => {
        let oname = encodeURIComponent('${ community.communityOfileName }');
        let rname = encodeURIComponent('${ community.communityRfileName }');
        
        console.log(oname);
        console.log(rname);
        
        location.assign(`${ path }/community/board/fileDown?oname=\${oname}&rname=\${rname}`);
        
    });
    
    // 수정
    $('#updateBtn').on('click', () => {
        if(confirm('게시글을 수정하시겠습니까?')) {
            location.href=`${path}/admin/noticeUpdate?no=${community.communityNo}`;
        } else {
            location.reload();
        }
    });
    
    // 삭제
    $('#deleteBtn').on('click', () => {
        if(confirm('게시글을 삭제하시겠습니까?')) {
            location.href=`${path}/admin/noticeDelete?no=${community.communityNo}`;
        } else {
            location.reload();
        }
    });
    
});
    
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />