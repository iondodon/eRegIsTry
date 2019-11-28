<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create schedule</title>

    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 class="addS" align="center">Adding a record in schedule ...</h3>
    <%--@elvariable id="schedule" type="com.utm.entities.Schedule"--%>
    <form:form action="/schedule/create" method="POST" modelAttribute="schedule" >
    <div class="block" >
        <label for="day">Set day:</label>
        <form:input path="day" type="text" name="day" placeholder="day" />
        <form:errors path="day" cssClass="error" />

        <label for="day">Select time:</label>
        <form:input path="time" type="time" name="time" />
        <form:errors path="time" cssClass="error" />

        <label for="subject">Select subject:</label>
        <form:select path="subject">
            <form:option value="-1" >Select subject</form:option>
            <%--@elvariable id="subjects" type="java.util.List"--%>
            <form:options items="${subjects}" itemLabel="subject" itemValue="id" />
        </form:select>
        <form:errors path="subject" cssClass="error" />

        <label for="group">Select group:</label>
        <form:select path="group">
            <form:option value="-1" >Select group</form:option>
            <%--@elvariable id="groups" type="java.util.List"--%>
            <form:options items="${groups}" itemLabel="name" itemValue="id" />
        </form:select>
        <form:errors path="group" cssClass="error" />

    </div>

        <input type="submit" value="Submit" name="submitBtn">
    </form:form>
</div>
</body>
</html>
