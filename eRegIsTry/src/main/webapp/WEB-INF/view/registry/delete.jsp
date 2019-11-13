<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Registry</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Delete registry</h3>
<%--@elvariable id="registry" type="com.utm.entities.Registry"--%>
    <form:form action="/registry/delete" method="POST" modelAttribute="registry">
    <div class="sbmt" align="center" >
        <label>Are you sure that you want to DELETE this registry?</label>
        <input path="id" name="id" type="hidden"  value="${registry.id}" />
    </div>

        <input type="submit" value="Delete" name="deleteBtn" />
    </form:form>
</div>
</body>
</html>
