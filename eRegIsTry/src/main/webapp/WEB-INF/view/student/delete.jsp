<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete student</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Delete student</h3>
<%--@elvariable id="user" type="com.utm.entities.User"--%>
    <form:form action="/student/delete" method="POST" modelAttribute="user">
    <div class="sbmt" align="center" >
        <label>Are you sure that you want to DELETE this user?</label>
        <input path="id" name="id" type="hidden"  value="${user.id}" />
    </div>

        <input type="submit" value="Delete" name="deleteBtn" />
    </form:form>
</div>
</body>
</html>
