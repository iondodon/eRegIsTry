<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update lesson</title>
    <style>
        .error {
            color: darkred;
        }
    </style>
</head>
<body>

<%--@elvariable id="lesson" type="com.utm.entities.Lesson"--%>
<form:form action="/lesson/update" modelAttribute="lesson" method="POST" >
    <input path="id" name="id" type="hidden"  value="${lesson.id}" />

    topic:
    <form:input path="topic" type="text" name="topic" placeholder="topic" />
    <form:errors path="topic" cssClass="error" />

    <br/>

    homework:
    <form:input path="homework" type="text" name="homework" placeholder="homework" />
    <form:errors path="homework" cssClass="error" />

    <br/>

    <form:input type="datetime-local" path="datetime"/>
    <form:errors path="datetime" cssClass="error" />

    <br/>

    subject:
    <form:select path="subject">
        <form:option value="-1" >Select subject</form:option>
        <%--@elvariable id="subjects" type="java.util.List"--%>
        <form:options items="${subjects}" itemLabel="subject" itemValue="id" />
    </form:select>
    <form:errors path="subject" cssClass="error" />

    <br/>

    teacher:
    <form:select path="teacher">
        <form:option value="-1" >Select teacher</form:option>
        <%--@elvariable id="teachers" type="java.util.List"--%>
        <form:options items="${teachers}" itemLabel="user.username" itemValue="id" />
    </form:select>
    <form:errors path="teacher" cssClass="error" />

    <input type="submit" value="Update" name="updateBtn">
</form:form>

</body>
</html>
