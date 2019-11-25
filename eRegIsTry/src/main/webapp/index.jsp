<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Index page</title>
      <style><%@include file="/WEB-INF/resource/stil.css"%></style>
  </head>

  <body style="display: flex; flex-direction: row;">
  <ul>
      <li><a class="active" href="#home">Home</a></li>
      <li><a href="#news">News</a></li>
      <li><a href="#contact">Contact</a></li>
      <li><a href="#about">About</a></li>
      <li style="float: right"><a href="/showLoginPage">Logout</a></li>
  </ul>
  <div class="menu">
<%--      <!-- Add a logout button -->--%>
<%--      <form:form action="${pageContext.request.contextPath}/logout" method="POST">--%>

<%--          <input type="submit" value="Logout" />--%>

<%--      </form:form>--%>
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
        <br/>
        <a href="<c:url value="/administrator/list"/>">list administrators</a>

        <br/><br/>
        Student:
        <br/>
        <a href="<c:url value="/student/create"/>">create student</a>
        <br/>
        <a href="<c:url value="/student/show?studentId=1"/>">show student</a>
        <br/>
        <a href="<c:url value="/student/update-user-data?studentId=1"/>">update student (user data)</a>
        <br/>
        <a href="<c:url value="/student/update?studentId=1"/>">update student</a>
        <br/>
        <a href="<c:url value="/student/delete?studentId=1"/>">delete student</a>
        <br/>
        <a href="<c:url value="/student/list"/>">list students</a>

        <br/><br/>
        Group:
        <br/>
        <a href="<c:url value="/group/create"/>">create group</a>
        <br/>
        <a href="<c:url value="/group/show?groupId=2"/>">show group</a>
        <br/>
        <a href="<c:url value="/group/update?groupId=1"/>">update group</a>
        <br/>
        <a href="<c:url value="/group/delete?groupId=2"/>">delete group</a>
        <br/>
        <a href="<c:url value="/group/list"/>">list groups</a>

        <br/><br/>
        Subject:
        <br/>
        <a href="<c:url value="/subject/create" />">create subject </a>
        <br/>
        <a href="<c:url value="/subject/show?subjectId=1"/>">show subject</a>
        <br/>
        <a href="<c:url value="/subject/update?subjectId=1"/>">update subject</a>
        <br/>
        <a href="<c:url value="/subject/delete?subjectId=1"/>">delete subject</a>
        <br/>
        <a href="<c:url value="/subject/list"/>">list subjects</a>
    </div>

    <div>
        Registry:
        <br/>
        <a href="<c:url value="/registry/create" />">create registry </a>
        <br/>
        <a href="<c:url value="/registry/show?registryId=2"/>">show registry</a>
        <br/>
        <a href="<c:url value="/registry/update?registryId=2"/>">update registry</a>
        <br/>
        <a href="<c:url value="/registry/delete?registryId=2"/>">delete registry</a>
        <br/>
        <a href="<c:url value="/registry/list"/>">list registries</a>

        <br/><br/>

        Lesson:
        <br/>
        <a href="<c:url value="/lesson/create" />">create lesson</a>
        <br/>
        <a href="<c:url value="/lesson/show?lessonId=3"/>">show lesson</a>
        <br/>
        <a href="<c:url value="/lesson/update?lessonId=2"/>">update lesson</a>
        <br/>
        <a href="<c:url value="/lesson/delete?lessonId=1"/>">delete lesson</a>
        <br/>
        <a href="<c:url value="/lesson/list"/>">list lessons</a>

        <br/><br/>

        Schedule:
        <br/>
        <a href="<c:url value="/schedule/create" />">create schedule</a>
        <br/>
        <a href="<c:url value="/schedule/show?scheduleId=2"/>">show schedule</a>
        <br/>
        <a href="<c:url value="/schedule/update?scheduleId=2"/>">update schedule</a>
        <br/>
        <a href="<c:url value="/schedule/delete?scheduleId=2"/>">delete schedule</a>
        <br/>
        <a href="<c:url value="/schedule/list"/>">list schedule</a>

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
        <br/>
        <a href="<c:url value="/teacher/list"/>">list teachers</a>
    </div>

    <div>
        <a href="<c:url value="/my-account"/>">my account</a>
    </div>
  </div>
  </body>
</html>
