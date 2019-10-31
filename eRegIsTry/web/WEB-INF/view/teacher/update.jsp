<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update teacher</title>
    <style>
        .error {
            color: darkred;
        }
    </style>
</head>
<body>
    <%--@elvariable id="teacher" type="com.utm.entities.Teacher"--%>
    <%--@elvariable id="user" type="com.utm.entities.User"--%>
    <form:form action="/teacher/update" method="POST" modelAttribute="teacher">
        <input path="id" name="id" type="hidden"  value="${teacher.id}" />

        base subject:
        <form:select path="baseSubject">
            <form:option value="-1">Select base subject</form:option>
            <form:options items="${subjects}" itemLabel="subject" itemValue="id" />
        </form:select>

        <input type="submit" value="Update" name="submitBtn" />
    </form:form>

</body>
</html>
