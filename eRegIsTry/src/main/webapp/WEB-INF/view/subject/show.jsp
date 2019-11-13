<%@ page import="com.utm.entities.Subject" %><%--@elvariable id="subject" type="com.utm.entities.Subject"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show subject</title>
    <style> <%@include file="/WEB-INF/resource/style.css"%>
    </style>
</head>
<body>
<div>
    <h3 align="center">Information about subject</h3>
    <div class="block" >
        <label>Subject Name:</label>
        <div class="sh">${subject.subject}</div>

        <label> Lessons:</label>
        <div class="sh"> To add lesson here!!!
<%--    <%--%>
<%--        //TODO: to list the lessons and the schedule--%>
<%--        Subject subject = (Subject) request.getAttribute("subject");--%>

<%--    %>--%>
        </div>

        <label>Schedules:</label>
<%--    schedules: <%  %>--%>
        <div class="sh"> To add schedule here!!! </div>
    </div>
</div>
</body>
</html>
