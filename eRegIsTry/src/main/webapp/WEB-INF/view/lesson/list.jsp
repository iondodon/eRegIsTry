<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Topics</title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 5px;
            text-align: center;
        }
    </style>
</head>
<body>
<div>
    <h3 align="center">List of Topics</h3>
    <table style="width:50%" align="center">
        <tr>
            <th width="20%">Topic</th>
        </tr>
    </table>
    <%--${administrators}--%>

    <%--@elvariable id="administrator" type="com.utm.entities.Administrator"--%>
    <c:forEach items="${lessons}" var="lesson">

        <table style="width:50%" align="center">
            <tr>
                <th width="20%">${lesson.topic}</th>

            </tr>
        </table>
    </c:forEach>
</div>
</body>
</html>
