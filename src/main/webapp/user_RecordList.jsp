<%--
  Created by IntelliJ IDEA.
  User: yeluzi
  Date: 2024/6/2
  Time: 13:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>借阅记录</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<div>
    <h1>借阅记录</h1>
    <c:forEach items="${recordList}" var="record">
        <span>
            ${record.recordId}
            ${record.user.username}
            ${record.book.name}
            ${record.borrowDatetime}
<%--            <a href="<%request.getContextPath();%>/record/return-book?recordId=${record.r_id}">归还</a>--%>
        </span>
    </c:forEach>
</div>

</body>
</html>
