<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Group</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Delete group</h3>
<%--@elvariable id="group" type="com.utm.entities.Group"--%>
    <form:form action="/group/delete" method="POST" modelAttribute="group">
    <div class="sbmt" align="center" >
        <label>Are you sure that you want to DELETE this group?</label>
        <input path="id" name="id" type="hidden"  value="${group.id}" />
    </div>

            <input type="submit" value="Delete" name="deleteBtn" />
        </form:form>
</div>
</body>
</html>
