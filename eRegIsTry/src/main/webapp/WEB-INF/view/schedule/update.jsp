<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update schedule</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Update The Schedule </h3>
    <%--@elvariable id="schedule" type="com.utm.entities.Schedule"--%>
    <form:form action="/schedule/update" method="POST" modelAttribute="schedule" >
        <input path="id" name="id" type="hidden"  value="${schedule.id}" />

        <div class="block" >
            <label for="day"> Day:</label>
            <form:input path="day" type="text" name="day" placeholder="day" />
            <form:errors path="day" cssClass="error" />
        </div>
        <br/>
        <div class="block">
            <label> Time </label>
            <form:input path="time" type="time" name="time" />
            <form:errors path="time" cssClass="error" />
        </div>
        <br/>

        <div class="block">
            <label for="subject"> Subject:</label>
            <form:select path="subject">
                <form:option value="-1" >Select subject</form:option>
                <%--@elvariable id="subjects" type="java.util.List"--%>
                <form:options items="${subjects}" itemLabel="subject" itemValue="id" />
            </form:select>
            <form:errors path="subject" cssClass="error" />
        </div>
        <br/>

        <div class="block" >
            <label for="group"> Group:</label>
            <form:select path="group">
                <form:option value="-1" >Select group</form:option>
                <%--@elvariable id="groups" type="java.util.List"--%>
                <form:options items="${groups}" itemLabel="name" itemValue="id" />
            </form:select>
            <form:errors path="group" cssClass="error" />
        </div>
        <br/>

        <input type="submit" value="Update Schedule" name="submitBtn">
    </form:form>
</div>
</body>
</html>
