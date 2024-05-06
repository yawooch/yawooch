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
<title>Insert title here</title>
<script src="${path}/js/jquery-3.7.1.js"></script>
<script src="${path}/js/university.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<script>
$(document).ready(()=>
{
	$('#enrollForm').on('submit',(event)=>
	{
		if($('#preatendingNo').val() === '')
		{
			$('#preatendingNo').prop('disabled',true);
		}
		if($('#type').val() === '')
		{
			$('#type').prop('disabled',true);
		}
	})
	
	$('#deptNo').on('change',(event)=>
	{
		let departmentNo = $(event.target).val();
		console.log(departmentNo);
		
		university.getSubjectsByDepartmentNo(departmentNo, success)
	});
})
function success (obj)
{
    let element = $('#preatendingNo'); 
    console.log(obj.subjects);
    let subjects = obj.subjects;

    element.empty();
    element.append('<option value="">--------- 선택 --------</option>');
    
    for(let i = 0 ; i < subjects.length; i ++)
    {
        element.append('<option value="' + subjects[i].no + '">' + subjects[i].name + '</option>');
    }
}
</script>
<div class="container-fluid">
    <h2>TB_CLASS 테이블에 데이터 추가</h2>
    <form action="${path}/subject/enroll" method="post" id="enrollForm">
    <div class="col-4">
        <div class="input-group mb-3">
            <label  class="input-group-text" for="deptNo">학과</label>
            <select class="form-control"      id="deptNo" name="deptNo" required>
                <c:forEach var="department" items="${departments}">
                <option value="${department.no}">${department.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="input-group mb-3">
            <label class="input-group-text" for="preatendingNo">선수 과목</label>
            <select class="form-control" name="preatendingNo" id="preatendingNo">
                <option>--------- 선택 --------</option>
            </select>
        </div>
        <div class="input-group mb-3">
            <label class="input-group-text" for="name">과목 이름</label>
            <input class="form-control" type="text" name="name" id="name"/>
        </div>
        <div class="input-group mb-3">
            <label class="input-group-text" for="type">과목 구분</label>
            <input class="form-control" type="text" name="type" id="type" list="subjectTypeList"/>
            <datalist id="subjectTypeList">
                <option value="논문지도">논문지도</option>
                <option value="전공필수">전공필수</option>
                <option value="전공선택">전공선택</option>
                <option value="교양필수">교양필수</option>
                <option value="교양선택">교양선택</option>
            </datalist>
        </div>
        <security:csrfInput/>
        <div class="input-group mb-3">
            <input class="btn btn-lg btn-outline-primary"   type="submit" value="등록"></input>
            <input class="btn btn-lg btn-outline-secondary" type="reset"  value="취소"></input>
        </div>
    </div>
    </form>
</div>
</body>
</html>