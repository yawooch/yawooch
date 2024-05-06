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
<title>담당 교수 지정</title>
<script src="${path}/js/jquery-3.7.1.js"></script>
<script src="${path}/js/university.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<script>
$(document).ready(()=>
{
    $('#deptNo').on('change',(event)=>
    {
        let departmentNo = $(event.target).val();
        console.log(departmentNo);
        university.getSubjectsByDepartmentNo(departmentNo, sbjtSuccess);

        university.getProfessorByDepartmentNo(departmentNo, prfsSuccess);
    });
})
function prfsSuccess (obj)
{
    console.log(obj.professors);
    let element = $('#professorNo'); 
    console.log(obj);

    element.empty();
    element.append('<option value="">--------- 선택 --------</option>');
    
    for(let i = 0 ; i < obj.professors.length; i ++)
    {
        let professor = obj.professors[i];
        element.append('<option value="' + professor.no + '">' + professor.name + '</option>');
    }
}
function sbjtSuccess (obj)
{
    let element = $('#classNo'); 
    console.log(obj);
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
    <h2>TB_CLASS_PROFESSOR 테이블에 데이터 Chew가</h2>
    <form action="${path}/subject/join" method="post" id="enrollForm">
    <security:csrfInput/>
    <div class="col-4">
        <div class="input-group mb-3">
            <label  class="input-group-text" for="deptNo">학과</label>
            <select class="form-control"      id="deptNo" required>
                <c:forEach var="department" items="${departments}">
                <option value="${department.no}">${department.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="input-group mb-3">
            <label class="input-group-text" for="classNo">과목</label>
            <select class="form-control" name="classNo" id="classNo" required>
                <option>--------- 선택 --------</option>
            </select>
        </div>
        <div class="input-group mb-3">
            <label class="input-group-text" for="professorNo">교수</label>
            <select class="form-control"    name="professorNo" id="professorNo" required>
                <option>--------- 선택 --------</option>
            </select>
        </div>
        <div class="input-group mb-3">
            <input class="btn btn-lg btn-outline-primary"   type="submit" value="등록"></input>
            <input class="btn btn-lg btn-outline-secondary" type="reset"  value="취소"></input>
        </div>
    </div>
    </form>
</div>

</body>
</html>