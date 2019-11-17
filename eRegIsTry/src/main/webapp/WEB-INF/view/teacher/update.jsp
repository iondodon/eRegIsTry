<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update teacher</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Update department</h3>
    <%--@elvariable id="teacher" type="com.utm.entities.Teacher"--%>
    <%--@elvariable id="user" type="com.utm.entities.User"--%>
    <form:form action="/teacher/update" method="POST" modelAttribute="teacher">
        <input path="id" name="id" type="hidden"  value="${teacher.id}" />

        <div class="block" >
            <label for="baseSubject">Base Subject:</label>
            <form:select path="baseSubject">
                <form:option value="-1">Select base subject</form:option>
                <form:options items="${subjects}" itemLabel="subject" itemValue="id" />
            </form:select>
        </div>
        <input type="submit" value="Update Subject" name="submitBtn" />
    </form:form>
</div>
</body>
</html>

