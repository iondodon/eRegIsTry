<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show lesson</title>
</head>
<body>
    datetime: ${lesson.datetime.toString()}

    <br/>

    homework: ${lesson.homework}

    <br/>

    topic: ${lesson.topic}

    <br/>

    subject: ${lesson.subject.subject}

    <br/>

    teacher: ${lesson.teacher.user.username}
</body>
</html>
