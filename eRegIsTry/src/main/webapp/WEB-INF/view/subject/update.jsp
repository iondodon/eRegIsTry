<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update subject</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Update Subject</h3>
    <%--@elvariable id="subject" type="com.utm.entities.Subject"--%>
    <form:form action="/subject/update" modelAttribute="subject" method="POST" >
        <input path="id" name="id" type="hidden"  value="${subject.id}" />
    <div class="block" >
        <label for="subject">Subject:</label>
        <form:input path="subject" type="text" name="subject" placeholder="subject name" />
        <form:errors path="subject" cssClass="error" />
    </div>
        <input type="submit" value="Update" name="updateBtn">
    </form:form>
</div>
</body>
</html>
