<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>${user.firstName} ${user.lastName}</title>
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet"/>
</head>
<body>
<c:import url="${contextPath}/WEB-INF/view/navibar.jsp"/>
<table class="zui-table">
    <form:form id="form" name="form" method="post" action="editUser" modelAttribute="user">
    <form:hidden path="id" id="id"/>
    <form:hidden path="password" id="password"/>
    <h1>Edit user form</h1>
    <tr>
        <td>
            <p>First name</p>
        </td>
        <td>
            <form:input type="text" path="firstName" id="firstName"/>
            <form:errors path="firstName" cssClass="error"/>
        </td>
    </tr>
    <tr>
        <td>
            <p>Last name</p>
        </td>
        <td>
            <form:input type="text" path="lastName" id="lastName"/>
            <form:errors path="lastName" cssClass="error"/>
        </td>
    </tr>
    <tr>
        <td>
            <p>Email</p>
        </td>
        <td>
            <form:input type="text" path="email" id="email"/>
            <form:errors path="email" cssClass="error"/>
                ${message}
        </td>
    </tr>
    <security:authorize access="hasRole('ROLE_ADMIN')">
        <tr>
            <td>
                <p>Role</p>
            </td>
            <td>
                <form:select path="role">
                    <c:forEach items="${roles}" var="role">
                        <c:choose>
                            <c:when test="${user.role eq role}">
                                <form:option selected="true" value="${role.id}">
                                    <c:set var="str" value="${fn:replace(role.title, 'ROLE_', '')}"/>
                                    ${fn:substring(str, 0, 1)}${fn:toLowerCase(fn:substring(str, 1, fn:length(str)))}
                                </form:option>
                            </c:when>
                            <c:otherwise>
                                <form:option value="${role.id}">
                                    <c:set var="str" value="${fn:replace(role.title, 'ROLE_', '')}"/>
                                    ${fn:substring(str, 0, 1)}${fn:toLowerCase(fn:substring(str, 1, fn:length(str)))}
                                </form:option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </form:select>
            </td>
        </tr>
    </security:authorize>
</table>
<button type="submit" class="button">Save</button>
<security:authorize access="hasRole('ROLE_ADMIN')">
    <a href="${pageContext.request.contextPath}/user/delete?id=${user.id}"
       class="button" role="button" tabindex="0">Delete User</a>
    <div class="spacer"></div>
</security:authorize>
</form:form>
</body>
</html>