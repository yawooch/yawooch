<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Arrays"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"      prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"       prefix="fmt" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${path}/js/jquery-3.7.1.js"></script>
<title>Insert title here</title>
</head>
<body>
<section id="content">
	<h2 align="center">회원 정보 수정</h2>
	<div id="view-container">
		<form id="memberFrm" action="${ path }/member/update" method="POST">
			<table>
				<tr>
	                <th>아이디</th>
					<td>
						<input type="text" name="id" id="newId" 
								value="${ loginMember.id }" readonly required >
					</td> 	
	            </tr>
	            <tr>
	                <th>이름</th>
					<td>
						<input type="text" name="name" id="userName" 
								value="${ loginMember.name }" required>				
					</td> 	
	            </tr>
      	        <tr>
	                <th>휴대폰</th>
	                <td>
	                    <input type="tel" placeholder="(-없이)01012345678" 
	                    		value="${ loginMember.phone }" name="phone" id="phone" maxlength="11">
	                </td>
	            </tr>
	            <tr>
	                <th>이메일</th>
					<td>
						<input type="email" placeholder="abc@abc.com" 
								value="${ loginMember.email }" name="email" id="email">												
					</td> 	
	            </tr>
	            <tr>
	                <th>주소</th>
						<td>
							<input type="text" name="address" id="address"
									value="${ loginMember.address }">
						</td> 	
	            </tr>
	            <tr>
	               	<th>취미</th>
					<td>
						<label><input type="checkbox" name="hobby" id="hobby0" value="운동"
									${ fn:contains(loginMember.hobby, '운동') ? 'checked' : '' }>운동</label>
						<label><input type="checkbox" name="hobby" id="hobby1" value="등산"
									${ fn:contains(loginMember.hobby, '등산') ? 'checked' : '' }>등산</label>
						<label><input type="checkbox" name="hobby" id="hobby2" value="독서"
									${ fn:contains(loginMember.hobby, '독서') ? 'checked' : '' }>독서</label>
						<label><input type="checkbox" name="hobby" id="hobby3" value="게임"
									${ fn:contains(loginMember.hobby, '게임') ? 'checked' : '' }>게임</label>
						<label><input type="checkbox" name="hobby" id="hobby4" value="여행"
									${ fn:contains(loginMember.hobby, '여행') ? 'checked' : '' }>여행</label>
					</td> 		
	            </tr>
	        </table>
	        <button type="button">비밀번호변경</button>
	        <input type="submit" value="정보수정">
	        <input type="button" id="btnDelete" value="탈퇴">
	 	</form>
 	</div>
</section>
<script>
	$(document).ready(() => {
		$('#btnDelete').on('click', () => {
			if (confirm('정말로 탈퇴하시겠습니까?')) {
				location.replace('${ path }/member/delete');
			}
		});
	});
</script>
</body>
</html>