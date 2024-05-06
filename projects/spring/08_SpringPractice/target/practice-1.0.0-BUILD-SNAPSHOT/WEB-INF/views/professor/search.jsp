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
<title>교수 조회</title>

<script src="${path}/js/jquery-3.7.1.js"></script>
<script src="${path}/js/university.js"></script>
</head>
<body>
<h2>TB_PROFESSOR 테이블에서 데이터 조회(비동기 통신)</h2>

<label for="professorNo">교수 번호</label>
<input type="text" id="professorNo"/>

<button id="btnSearch">조회</button>
<p id="result"></p>

<script>
$(document).ready(()=>
{
	$('#professorNo').on('keyup',(event)=>{
		
		if(event.key == 'Enter')
		{
			btnClickEvent();
		}
    });
	$('#btnSearch').on('click',btnClickEvent);
})
function btnClickEvent()
{
    let professorNo = $('#professorNo').val();
    university.getProfessorByNo(professorNo, (obj)=>
    {
        console.log(obj);
        let result = '';         
		let professor = obj.professor;
		console.log(professor);

		if(professor !== null)
		{
			let department = professor.department;
			result += '교수번호 : '  + professor.no           + '<br>';
			result += '이름     : '  + professor.name         + '<br>';
			result += '주소     : '  + professor.address      + '<br>';
			result += '주민번호 : '  + professor.ssn          + '<br>';
			
			if(department !== null)
			{
				result += '학과     : '+ department.name     +'<br>';
				result += '계열     : '+ department.category +'<br>';
				
			}
			else
			{
				result += '학과     : 없음<br>';
			}
		}
		else
		{
			result = '교수 정보가 없습니다.';
		}
		
		$('#result').html(result);
    });
}
// function btnClickEvent()
// {
//     let professorNo = $('#professorNo').val();
    
//     $.ajax({
// 	   type : 'get',
// 	   url: '${path}/professors/' + professorNo,
// 	   dataType : 'json',
// 	   success: (obj)=>{
// 		   console.log(obj);
// 		   let result = '';		   
// 		   let professor = obj.professor;
// 		   console.log(professor);

// 		   if(professor !== null)
// 		   {
// 			   let department = professor.department;
// 			   result += '교수번호 : '  + professor.no           + '<br>';
// 			   result += '이름     : '  + professor.name         + '<br>';
// 			   result += '주소     : '  + professor.address      + '<br>';
// 			   result += '주민번호 : '  + professor.ssn          + '<br>';
			   
// 			   if(department !== null)
// 			   {
//     			   result += '학과     : '+ department.name     +'<br>';
//     			   result += '계열     : '+ department.category +'<br>';
				   
// 			   }
// 			   else
// 			   {
//     			   result += '학과     : 없음<br>';
// 			   }
// 		   }
// 		   else
// 		   {
// 			   result = '교수 정보가 없습니다.';
// 		   }
		   
// 		   $('#result').html(result);
// 	   },
// 	   error:(obj)=>{
//            console.log(obj);
// 	   }
	   
//     });
    
//     alert(`professorNo : \${professorNo}`);
// }
</script>

</body>
</html>