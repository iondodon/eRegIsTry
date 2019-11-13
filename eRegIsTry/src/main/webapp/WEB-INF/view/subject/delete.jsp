<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Subject</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Delete subject</h3>
    <%--@elvariable id="subject" type="com.utm.entities.Subject"--%>
    <form:form action="/subject/delete" method="POST" modelAttribute="subject">
    <div class="sbmt" align="center" >
        <label>Are you sure that you want to DELETE this subject?</label>
        <input path="id" name="id" type="hidden"  value="${subject.id}" />
    </div>

        <input type="submit" value="Delete" name="deleteBtn" />
    </form:form>
</div>
</body>
</html>
