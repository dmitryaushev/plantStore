<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Find user</title>
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet"/>
</head>
<body>
<c:import url="${contextPath}/WEB-INF/view/navibar.jsp"/>
<form:form id="form" name="form" method="get" action="find" modelAttribute="user">
    <label>
        <span class="small">User email</span>
        <form:input path="email" id="email"/>
        <button type="submit" class="button">Find</button>
    </label>
</form:form>
<c:if test="${not empty error}">
    <p style="color: red">${error}</p>
</c:if>
</body>
</html>