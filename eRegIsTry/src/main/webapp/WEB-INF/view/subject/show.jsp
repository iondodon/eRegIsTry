<%@ page import="com.utm.entities.Subject" %><%--@elvariable id="subject" type="com.utm.entities.Subject"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show subject</title>
</head>
<body>

    subject name: ${subject.subject}

    <br/>

    lessons:
    <%
        //TODO: to list the lessons and the schedule
        Subject subject = (Subject) request.getAttribute("subject");

    %>

    schedules: <%  %>
</body>
</html>
