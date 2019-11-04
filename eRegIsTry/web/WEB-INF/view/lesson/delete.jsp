<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Lesson</title>
</head>
<body>

<%--@elvariable id="lesson" type="com.utm.entities.Subject"--%>
<form:form action="/lesson/delete" method="POST" modelAttribute="lesson">
    <input path="id" name="id" type="hidden"  value="${lesson.id}" />
    <input type="submit" value="Delete" name="deleteBtn" />
</form:form>

</body>
</html>
