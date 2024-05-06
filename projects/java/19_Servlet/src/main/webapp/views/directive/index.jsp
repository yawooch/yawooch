<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  --%>
<%--     errorPage = "../common/error.jsp" %> --%>
<%--     errorPage = "/views/common/error.jsp" %> --%>
<%-- <% int result = 10 / 0;  %> --%>

<%@ include file="/views/common/header.jsp" %>
    <main>
    <form action="<%= request.getContextPath() %>/views/directive/userFormResult.jsp" method="POST">
        <fieldset>
            <label for="userName">이름 : </label>
            <input type="text" name="userName" id="userName" />
            <br>
            <label for="userAge">나이 : </label>
            <input type="text" name="userAge" id="userAge" />
            <br>
            <label for="userGender">성별 : </label>
            <label><input type="radio" name="userGender" value="남자" checked />남자</label>
            <label><input type="radio" name="userGender" value="여자" />여자</label>
            <br>
            <label for="">좋아하는 음식 : </label>
            <label><input type="checkbox" name="userFood" value="한식" checked>한식</label>
            <label><input type="checkbox" name="userFood" value="분식">분식</label>
            <label><input type="checkbox" name="userFood" value="중식">중식</label>
            <label><input type="checkbox" name="userFood" value="일식">일식</label>
            <label><input type="checkbox" name="userFood" value="양식">양식</label>
            <br>
            <label for="method">방식 : </label>
            <label><input type="radio" name="method" value="GET" checked />GET</label>
            <label><input type="radio" name="method" value="POST" />POST</label>
            <br>
        </fieldset>
        <br>
        <input type="submit" value="등록" />
        <input type="reset" value="다시입력" />
    </form>
    <script>
            let submit = document.querySelector('input[type=submit]');
            submit.addEventListener('click', (event)=>{
            event.preventDefault();
            let method = document.querySelector('input:checked[name=method]').value;
            console.log(method);
            document.getElementsByTagName('form')[0].method.value = method;
            document.getElementsByTagName('form')[0].submit();
        });
    </script>
<%@ include file="/views/common/footer.jsp" %>