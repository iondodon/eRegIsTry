<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update student</title>
    <style>
        .error {
            color: darkred;
        }
    </style>
</head>
<body>
<%--@elvariable id="student" type="com.utm.entities.Student"--%>
<%--@elvariable id="user" type="com.utm.entities.User"--%>
<form:form action="/student/update" method="POST" modelAttribute="student">
    <input path="id" name="id" type="hidden"  value="${student.id}" />

    base subject:
    <form:select path="group">
        <form:option value="-1">Select group</form:option>
        <%--@elvariable id="groups" type="java.util.List"--%>
        <form:options items="${groups}" itemLabel="name" itemValue="id" />
    </form:select>

    <input type="submit" value="Update" name="submitBtn" />
</form:form>

</body>
</html>
