<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Index page</title>
  </head>

  <body style="display: flex; flex-direction: row;">
    <div>
        Administrator:
        <br/>
        <a href="<c:url value="/administrator/register"/>">register administrator</a>
        <br/>
        <a href="<c:url value="/administrator/show?administratorId=1"/>">show administrator</a>
        <br/>
        <a href="<c:url value="/administrator/update-user-data?administratorId=1"/>">update administrator (user data)</a>
        <br/>
        <a href="<c:url value="/administrator/update?administratorId=1"/>">update administrator</a>
        <br/>
        <a href="<c:url value="/administrator/delete?administratorId=1"/>">delete administrator</a>

        <br/><br/>
        Teacher:
        <br/>
        <a href="<c:url value="/teacher/create"/>">create teacher</a>
        <br/>
        <a href="<c:url value="/teacher/show?teacherId=1"/>">show teacher</a>
        <br/>
        <a href="<c:url value="/teacher/update-user-data?teacherId=1"/>">update teacher (user data)</a>
        <br/>
        <a href="<c:url value="/teacher/update?teacherId=1"/>">update teacher</a>
        <br/>
        <a href="<c:url value="/teacher/delete?teacherId=2"/>">delete teacher</a>

        <br/><br/>
        Student:
        <br/>
        <a href="<c:url value="/student/create"/>">create student</a>
        <br/>
        <a href="<c:url value="/student/show?studentId=3"/>">show student</a>
        <br/>
        <a href="<c:url value="/student/update-user-data?studentId=3"/>">update student (user data)</a>
        <br/>
        <a href="<c:url value="/student/update?studentId=3"/>">update student</a>
        <br/>
        <a href="<c:url value="/student/delete?studentId=3"/>">delete student</a>

        <br/><br/>
        Group:
        <br/>
        <a href="<c:url value="/group/create"/>">create group</a>
        <br/>
        <a href="<c:url value="/group/show?groupId=2"/>">show group</a>
        <br/>
        <a href="<c:url value="/group/update?groupId=2"/>">update group</a>
        <br/>
        <a href="<c:url value="/group/delete?groupId=2"/>">delete group</a>

        <br/><br/>
        Subject:
        <br/>
        <a href="<c:url value="/subject/create" />">create subject </a>
        <br/>
        <a href="<c:url value="/subject/show?subjectId=2"/>">show subject</a>
        <br/>
        <a href="<c:url value="/subject/update?subjectId=2"/>">update subject</a>
        <br/>
        <a href="<c:url value="/subject/delete?subjectId=2"/>">delete subject</a>
    </div>

    <div>
        Registry:
        <br/>
        <a href="<c:url value="/registry/create" />">create registry </a>
<%--        <br/>--%>
<%--        <a href="<c:url value="/registry/show?registryId=1"/>">show registry</a>--%>
<%--        <br/>--%>
<%--        <a href="<c:url value="/registry/update?registryId=1"/>">update registry</a>--%>
<%--        <br/>--%>
<%--        <a href="<c:url value="/registry/delete?registryId=1"/>">delete registry</a>          --%>

        <br/><br/>

        Lesson:
        <br/>
        <a href="<c:url value="/lesson/create" />">create lesson</a>
        <br/>
        <a href="<c:url value="/lesson/show?lessonId=1"/>">show lesson</a>
        <br/>
        <a href="<c:url value="/lesson/update?lessonId=3"/>">update lesson</a>
        <br/>
        <a href="<c:url value="/lesson/delete?lessonId=3"/>">delete lesson</a>
    </div>

  </body>
</html>
