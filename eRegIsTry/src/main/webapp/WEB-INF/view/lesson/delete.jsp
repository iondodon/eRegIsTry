<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Lesson</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Delete lesson</h3>

<%--@elvariable id="lesson" type="com.utm.entities.Subject"--%>
    <form:form action="/lesson/delete" method="POST" modelAttribute="lesson">
        <div class="sbmt" align="center" >
            <label>Are you sure that you want to DELETE this lesson?</label>
            <input path="id" name="id" type="hidden"  value="${lesson.id}" />
        </div>
        <input type="submit" value="Delete" name="deleteBtn" />
    </form:form>
</div>
</body>
</html>
