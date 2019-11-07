<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update schedule</title>

    <style>
        .error {
            color: darkred;
        }
    </style>
</head>
<body>

<%--@elvariable id="schedule" type="com.utm.entities.Schedule"--%>
<form:form action="/schedule/update" method="POST" modelAttribute="schedule" >
    <input path="id" name="id" type="hidden"  value="${schedule.id}" />

    day:
    <form:input path="day" type="text" name="day" placeholder="day" />
    <form:errors path="day" cssClass="error" />

    <br/>

    <form:input path="time" type="time" name="time" />
    <form:errors path="time" cssClass="error" />

    <br/>

    subject:
    <form:select path="subject">
        <form:option value="-1" >Select subject</form:option>
        <%--@elvariable id="subjects" type="java.util.List"--%>
        <form:options items="${subjects}" itemLabel="subject" itemValue="id" />
    </form:select>
    <form:errors path="subject" cssClass="error" />

    <br/>

    group:
    <form:select path="group">
        <form:option value="-1" >Select group</form:option>
        <%--@elvariable id="groups" type="java.util.List"--%>
        <form:options items="${groups}" itemLabel="name" itemValue="id" />
    </form:select>
    <form:errors path="group" cssClass="error" />

    <br/>

    <input type="submit" value="Update" name="submitBtn">
</form:form>

</body>
</html>
