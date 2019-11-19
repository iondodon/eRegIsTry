<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Lesson</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>

<div>
    <h3 align="center">Update Lesson</h3
    <%--@elvariable id="lesson" type="com.utm.entities.Lesson"--%>
    <form:form action="/lesson/update" modelAttribute="lesson" method="POST" >
        <input path="id" name="id" type="hidden"  value="${lesson.id}" />

        <div class="block" >
            <label for="topic"> Topic :</label>
            <form:input path="topic" type="text" name="topic" placeholder="topic"/>
            <form:errors path="topic" cssClass="error" />
        </div>

        <br/>

        <div class="block" >
            <label for="homework"> Homework :</label>
            <form:input path="homework" type="text" name="homework" placeholder="homework" />
            <form:errors path="homework" cssClass="error" />
        </div>
        <br/>
        <div class="block" >
            <label> Date </label>
            <form:input type="datetime-local" path="datetime"/>
            <form:errors path="datetime" cssClass="error" />
        </div>
        <br/>

        <div class="block" >
            <label for="subject"> Subject :</label>
            <form:select path="subject">
                <form:option value="-1" >Select subject</form:option>
                <%--@elvariable id="subjects" type="java.util.List"--%>
                <form:options items="${subjects}" itemLabel="subject" itemValue="id" />
            </form:select>
            <form:errors path="subject" cssClass="error" />
        </div>

        <br/>

        <div class="block" >
            <label for="teacher"> Teacher :</label>
            <form:select path="teacher">
                <form:option value="-1" >Select teacher</form:option>
                <%--@elvariable id="teachers" type="java.util.List"--%>
                <form:options items="${teachers}" itemLabel="user.username" itemValue="id" />
            </form:select>
            <form:errors path="teacher" cssClass="error" />
        </div>
        <input type="submit" value="Update Lesson" name="updateBtn">

    </form:form>
</div>
</body>
</html>
