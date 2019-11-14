<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete teacher</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Delete teacher</h3>
    <%--@elvariable id="administrator" type="com.utm.entities.Administrator"--%>
    <%--@elvariable id="user" type="com.utm.entities.User"--%>
    <form:form action="/teacher/delete" method="POST" modelAttribute="user">
    <div class="sbmt" align="center" >
        <label>Are you sure that you want to DELETE this user?</label>
        <input path="id" name="id" type="hidden"  value="${user.id}" />
        <%--        <input path="administrator" name="administrator" type="hidden" value="${user.administrator.id}" />--%>
    </div>
        <input type="submit" value="Delete" name="deleteBtn" />
    </form:form>
</div>

</body>
</html>
