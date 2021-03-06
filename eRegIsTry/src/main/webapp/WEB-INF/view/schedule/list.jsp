<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List schedule records</title>
    <style> <%@include file="/WEB-INF/resource/stil.css"%></style>
    <style> <%@include file="/WEB-INF/resource/style.css"%></style>
    <style> <%@ include file="assets/css/style.css" %></style>
    <style> <%@ include file="assets/js/util.js" %></style>
    <style> <%@ include file= "assets/js/main.js"%></style>
    <style> <%@ include file= "assets/js/doc.js"%></style>
    <%--    <style><%@include file="/WEB-INF/resource/stil.css"%></style>--%>
    <%--     document.getElementsByTagName("html")[0].className += " js";--%>

    <style> <%@include file="/WEB-INF/resource/stil.css"%></style>
    <style>
        div.sticky {
            position: -webkit-sticky;
            position: sticky;
            top: 0;
            left:225px;
            z-index: 1;
        }</style>

    <style>
        div.navigation{
        display:    table-row;
        position: fixed;
        z-index: 1;
        right: 0;
        left: 0;
    }</style>


</head>
<body>
<div class="navigation">
<%--  ADMIN MENU--%>
<security:authorize access="hasRole('ROLE_ADMINISTRATOR')">
    <div class="navbar">
        <a class="active"  href="../../../index.jsp">Home</a>
        <a href="<c:url value="/schedule/show?scheduleId=2"/>">Schedule</a>
        <div class="subnav">
            <button class="subnavbtn">Utilities <i class="fa fa-caret-down"></i></button>
            <div class="subnav-content">
                <a href="/administrator/list">Admin</a>
                <a href="/teacher/list">Teachers</a>
                <a href="/student/list">Students</a>
                <a href="/group/list">Groups</a>
                <a href="/subject/list">Subjects</a>
                <a href="/lesson/list">Lessons</a>
                <a href="/registry/list">Registry</a>
            </div>
        </div>
        <div class="subnav">
            <button class="subnavbtn">Register <i class="fa fa-caret-down"></i></button>
            <div class="subnav-content">
                <a href="/administrator/register">Admin</a>
                <a href="/teacher/create">Teachers</a>
                <a href="/student/create">Students</a>
                <a href="/group/create">Groups</a>
                <a href="/subject/create">Subjects</a>
                <a href="/lesson/create">Lessons</a>
                <a href="/registry/create">Registry</a>
                <a href="/schedule/create">Schedule</a>
            </div>
        </div>
            <%--      <a href="<c:url value="/administrator/register"/>">Register administrator</a>--%>
        <a class="a" style="float: right" href="/showLoginPage">Logout</a>
        <a href="#" style="float: right; color: aqua">
            User: <security:authentication property="principal.username" /> </a>

    </div>
</security:authorize>

<%--  TEACHER MENU--%>
<security:authorize access="hasRole('ROLE_TEACHER')">
    <div class="navbar">
        <a class="active"  href="../../../index.jsp">Home</a>
        <a href="<c:url value="/schedule/show?scheduleId=2"/>">Schedule</a>
        <div class="subnav">
            <button class="subnavbtn">Utilities <i class="fa fa-caret-down"></i></button>
            <div class="subnav-content">
                <a href="/group/list">Groups</a>
                <a href="/subject/list">Subjects</a>
                <a href="/lesson/list">Lessons</a>
                <a href="/registry/list">Registry</a>
            </div>
        </div>
        <div class="subnav">
            <button class="subnavbtn">Register <i class="fa fa-caret-down"></i></button>
            <div class="subnav-content">
                <a href="/lesson/create">Lessons</a>
                <a href="/registry/create">Registry</a>
            </div>
        </div>
        <a class="a" style="float: right" href="/showLoginPage">Logout</a>
        <a href="#" style="float: right; color: aqua">
            User: <security:authentication property="principal.username" /> </a>

    </div>
</security:authorize>

<%--STUDENT MENU--%>
<security:authorize access="hasRole('ROLE_STUDENT')">
    <div class="navbar">
        <a class="active"  href="../../../index.jsp">Home</a>
        <a href="<c:url value="/schedule/show?scheduleId=2"/>">Schedule</a>
        <div class="subnav">
            <button class="subnavbtn">Utilities <i class="fa fa-caret-down"></i></button>
            <div class="subnav-content">
                <a href="/group/list">Groups</a>
                <a href="/subject/list">Subjects</a>
                <a href="/lesson/list">Lessons</a>
                <a href="/registry/list">Registry</a>
            </div>
        </div>
        <a class="a" style="float: right" href="/showLoginPage">Logout</a>
        <a href="#" style="float: right; color: aqua">
            User: <security:authentication property="principal.username" /> </a>

    </div>
</security:authorize>
</div>



<%--@elvariable id="scheduleRecord" type="com.utm.entities.Schedule"--%>
<%--@elvariable id="scheduleRecords" type="java.util.List"--%>
<div style=" position:static; padding-top:100px">
<div class="cd-schedule__top-info"><span>Monday</span></div>
</div>
<ul>
    <c:if test="${groupRecords.size() > 4}">
        <li class="cd-schedule__group" style="width: calc(350px * ${groupRecords.size()} )">
            </c:if>
                <c:if test="${groupRecords.size() <= 4}">
                    <li class="cd-schedule__group" style="width: calc(350px * ${groupRecords.size()} * 4)">
                        </c:if>
                            <ul>
                                ${scheduleRecord.subject.teachers}
                                    <c:forEach items="${groupRecords}" var="groupRecord">
                                        <li class="cd-schedule__event">
                                            <ul>
                                                <div class="sticky"> ${groupRecord.name}</div>
                                                <c:forEach items="${scheduleRecords}" var="scheduleRecord">
                                                    <%--@elvariable id="scheduleRecord" type="com.utm.entities.Schedule"--%>
                                                    <c:if test="${scheduleRecord.day.toLowerCase() == 'monday'}">
                                                        <%--@elvariable id="groupRecord" type="com.utm.entities.Group"--%>
                                                        <c:if test="${scheduleRecord.group.name == groupRecord.name}">
                                                            <li>
                                                                <a data-start="${scheduleRecord.time.toString()}" data-end="${scheduleRecord.time.hours + 1}:${scheduleRecord.time.minutes+30}:00" data-content="event-abs-circuit" data-event="event-1" href="#0">
                                                                    <em class="cd-schedule__name">${scheduleRecord.subject.subject} <br/> ${scheduleRecord.teacher.user.firstName} ${scheduleRecord.teacher.user.lastName}</em>
                                                                </a>
                                                            </li>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </li>
                        </ul>

<div style=" position:static; padding-top:100px">
    <div class="cd-schedule__top-info"><span>Tuesday</span></div>
</div>
<ul>
    <c:if test="${groupRecords.size() > 4}">
    <li class="cd-schedule__group" style="width: calc(350px * ${groupRecords.size()} )">
        </c:if>
        <c:if test="${groupRecords.size() <= 4}">
    <li class="cd-schedule__group" style="width: calc(350px * ${groupRecords.size()} * 4)">
        </c:if>
        <ul>
            ${scheduleRecord.subject.teachers}
            <c:forEach items="${groupRecords}" var="groupRecord">
                <li class="cd-schedule__event">
                    <ul>
                        <div class="sticky"> ${groupRecord.name}</div>
                        <c:forEach items="${scheduleRecords}" var="scheduleRecord">
                            <%--@elvariable id="scheduleRecord" type="com.utm.entities.Schedule"--%>
                            <c:if test="${scheduleRecord.day.toLowerCase() == 'tuesday'}">
                                <%--@elvariable id="groupRecord" type="com.utm.entities.Group"--%>
                                <c:if test="${scheduleRecord.group.name == groupRecord.name}">
                                    <li>
                                        <a data-start="${scheduleRecord.time.toString()}" data-end="${scheduleRecord.time.hours + 1}:${scheduleRecord.time.minutes+30}:00" data-content="event-abs-circuit" data-event="event-1" href="#0">
                                            <em class="cd-schedule__name">${scheduleRecord.subject.subject} <br/> ${scheduleRecord.teacher.user.firstName} ${scheduleRecord.teacher.user.lastName}</em>
                                        </a>
                                    </li>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </ul>
                </li>
            </c:forEach>
        </ul>
    </li>
</ul>

<div style=" position:static; padding-top:100px">
    <div class="cd-schedule__top-info"><span>Wednesday</span></div>
</div>
<ul>
    <c:if test="${groupRecords.size() > 4}">
    <li class="cd-schedule__group" style="width: calc(350px * ${groupRecords.size()} )">
        </c:if>
        <c:if test="${groupRecords.size() <= 4}">
    <li class="cd-schedule__group" style="width: calc(350px * ${groupRecords.size()} * 4)">
        </c:if>
        <ul>
            ${scheduleRecord.subject.teachers}
            <c:forEach items="${groupRecords}" var="groupRecord">
                <li class="cd-schedule__event">
                    <ul>
                        <div class="sticky"> ${groupRecord.name}</div>
                        <c:forEach items="${scheduleRecords}" var="scheduleRecord">
                            <%--@elvariable id="scheduleRecord" type="com.utm.entities.Schedule"--%>
                            <c:if test="${scheduleRecord.day.toLowerCase() == 'wednesday'}">
                                <%--@elvariable id="groupRecord" type="com.utm.entities.Group"--%>
                                <c:if test="${scheduleRecord.group.name == groupRecord.name}">
                                    <li>
                                        <a data-start="${scheduleRecord.time.toString()}" data-end="${scheduleRecord.time.hours + 1}:${scheduleRecord.time.minutes+30}:00" data-content="event-abs-circuit" data-event="event-1" href="#0">
                                            <em class="cd-schedule__name">${scheduleRecord.subject.subject} <br/> ${scheduleRecord.teacher.user.firstName} ${scheduleRecord.teacher.user.lastName}</em>
                                        </a>
                                    </li>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </ul>
                </li>
            </c:forEach>
        </ul>
    </li>
</ul>

<div style=" position:static; padding-top:100px">
    <div class="cd-schedule__top-info"><span>Thursday</span></div>
</div>
<ul>
    <c:if test="${groupRecords.size() > 4}">
    <li class="cd-schedule__group" style="width: calc(350px * ${groupRecords.size()} )">
        </c:if>
        <c:if test="${groupRecords.size() <= 4}">
    <li class="cd-schedule__group" style="width: calc(350px * ${groupRecords.size()} * 4)">
        </c:if>
        <ul>
            ${scheduleRecord.subject.teachers}
            <c:forEach items="${groupRecords}" var="groupRecord">
                <li class="cd-schedule__event">
                    <ul>
                        <div class="sticky"> ${groupRecord.name}</div>
                        <c:forEach items="${scheduleRecords}" var="scheduleRecord">
                            <%--@elvariable id="scheduleRecord" type="com.utm.entities.Schedule"--%>
                            <c:if test="${scheduleRecord.day.toLowerCase() == 'thursday'}">
                                <%--@elvariable id="groupRecord" type="com.utm.entities.Group"--%>
                                <c:if test="${scheduleRecord.group.name == groupRecord.name}">
                                    <li>
                                        <a data-start="${scheduleRecord.time.toString()}" data-end="${scheduleRecord.time.hours + 1}:${scheduleRecord.time.minutes+30}:00" data-content="event-abs-circuit" data-event="event-1" href="#0">
                                            <em class="cd-schedule__name">${scheduleRecord.subject.subject} <br/> ${scheduleRecord.teacher.user.firstName} ${scheduleRecord.teacher.user.lastName}</em>
                                        </a>
                                    </li>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </ul>
                </li>
            </c:forEach>
        </ul>
    </li>
</ul>

<div style=" position:static; padding-top:100px">
    <div class="cd-schedule__top-info"><span>Friday</span></div>
</div>
<ul>
    <c:if test="${groupRecords.size() > 4}">
    <li class="cd-schedule__group" style="width: calc(350px * ${groupRecords.size()} )">
        </c:if>
        <c:if test="${groupRecords.size() <= 4}">
    <li class="cd-schedule__group" style="width: calc(350px * ${groupRecords.size()} * 4)">
        </c:if>
        <ul>
            ${scheduleRecord.subject.teachers}
            <c:forEach items="${groupRecords}" var="groupRecord">
                <li class="cd-schedule__event">
                    <ul>
                        <div class="sticky"> ${groupRecord.name}</div>
                        <c:forEach items="${scheduleRecords}" var="scheduleRecord">
                            <%--@elvariable id="scheduleRecord" type="com.utm.entities.Schedule"--%>
                            <c:if test="${scheduleRecord.day.toLowerCase() == 'friday'}">
                                <%--@elvariable id="groupRecord" type="com.utm.entities.Group"--%>
                                <c:if test="${scheduleRecord.group.name == groupRecord.name}">
                                    <li>
                                        <a data-start="${scheduleRecord.time.toString()}" data-end="${scheduleRecord.time.hours + 1}:${scheduleRecord.time.minutes+30}:00" data-content="event-abs-circuit" data-event="event-1" href="#0">
                                            <em class="cd-schedule__name">${scheduleRecord.subject.subject} <br/> ${scheduleRecord.teacher.user.firstName} ${scheduleRecord.teacher.user.lastName}</em>
                                        </a>
                                    </li>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </ul>
                </li>
            </c:forEach>
        </ul>
    </li>
</ul>
</body>
</html>
