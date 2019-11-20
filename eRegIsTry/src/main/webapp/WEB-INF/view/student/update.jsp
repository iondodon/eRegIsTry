<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update student</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Update group</h3>
<%--@elvariable id="student" type="com.utm.entities.Student"--%>
<%--@elvariable id="user" type="com.utm.entities.User"--%>
<form:form action="/student/update" method="POST" modelAttribute="student">
    <input path="id" name="id" type="hidden"  value="${student.id}" />

    <div class="block" >
        <label for="group">Group:</label>
    <form:select path="group">
        <form:option value="-1">Select group</form:option>
        <%--@elvariable id="groups" type="java.util.List"--%>
        <form:options items="${groups}" itemLabel="name" itemValue="id" />
    </form:select>

    <input type="submit" value="Update" name="submitBtn" />
    </div>
</form:form>
</div>
</body>
</html>
