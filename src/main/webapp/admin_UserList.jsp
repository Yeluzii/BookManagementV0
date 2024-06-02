<%--
  Created by IntelliJ IDEA.
  User: yeluzi
  Date: 2024/6/2
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户列表</title>
</head>
<body>
<jsp:include page="admin_bgManagement.jsp"/>
<div>
    <h1>用户列表</h1>
    <c:forEach items="${userList}" var="user">
        <span>
            <img class="img1" src="${user.avatar}" alt="无法识别图片">
            <span>
                    ${user.username}
            </span>

        </span>
    </c:forEach>
</div>

</body>
</html>
