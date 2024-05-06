<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"            prefix="c"        %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"             prefix="fmt"      %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"       prefix="fn"       %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<security:csrfMetaTags/>
<title>교수 등록</title>
<script src="${path}/js/jquery-3.7.1.js"></script>
<script src="${path}/js/university.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<script>
let headerName = $('meta[name="_csrf_header"]').attr('content');
let token      = $('meta[name="_csrf"]').attr('content');

//모든 ajax 요청시 CSRF 토큰을 전송하도록 설정한다.
$(document).ajaxSend((event, xhr, option)=>
{
	xhr.setRequestHeader(headerName, token);
});
// console.log(headerName , token);


$(document).ready(()=>
{
    $('#btnEnroll').on('click', ()=>
    {
        $('#loadingSpinner').fadeIn();
        let professor = {
             name        : $('#name').val(), 
             ssn         : $('#ssn').val(), 
             address     : $('#address').val(), 
             departmentNo: $('#departmentNo').val()
          };
        console.log(professor);
        
        university.addProfessor(professor, (obj)=>
        {
            console.log(obj);
            if(obj.resultCode == 1)
            {
                  alert('등록 성공');
            }
            else
            {
                  alert('등록 실패');
            }
            
            $('#loadingSpinner').fadeOut();

            $('#name').val(''); 
            $('#ssn').val(''); 
            $('#address').val(''); 
            $('#departmentNo').val('');
        });
    });
})

</script>

<div class="container-fluid">
    <h2>TB_PROFESSOR 테이블에 데이터 저장</h2>
    <div class="col-3" style="position:relative;">
        <div id="loadingSpinner" style="display:none;position:absolute;width:100%; height:100%; background-color:rgb(0 0 0 / 45%);z-index:2;">
            <div class="spinner-border text-info" style="position:absolute;top:50%;left:50%;"></div>
        </div>
        <div class="input-group mb-3">
            <label class="input-group-text" for="name">이름</label>
            <input class="form-control col-1" type="text" id="name">
        </div>
        <div class="input-group mb-3">
            <label class="input-group-text" for="ssn">주민번호</label>
            <input class="form-control col-1"type="text" id="ssn">
        </div>
        <div class="input-group mb-3">
            <label class="input-group-text" for="address">주소</label>
            <input class="form-control col-1" type="text" id="address">
        </div>
        <div class="input-group mb-12">
            <label class="input-group-text" for="departmentNo">학과</label>
            <select class="form-control col-12" id="departmentNo">
            <c:forEach var="department" items="${departments}">
                <option value="${department.no}"><c:out value="${department.name}"/></option>
            </c:forEach>
            </select>
        </div>
        <br>
        <div class="btn-group" >
            <button class="btn btn-lg btn-outline-primary"    id="btnEnroll">등</button>
            <button class="btn btn-lg btn-outline-secondary"  id="btnCancel">취</button>
        </div>
    </div>
</div>


</body>
</html>