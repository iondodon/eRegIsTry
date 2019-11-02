<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Subject</title>
</head>
<body>

    <%--@elvariable id="subject" type="com.utm.entities.Subject"--%>
    <form:form action="/subject/delete" method="POST" modelAttribute="subject">
        <input path="id" name="id" type="hidden"  value="${subject.id}" />
        <input type="submit" value="Delete" name="deleteBtn" />
    </form:form>

</body>
</html>
