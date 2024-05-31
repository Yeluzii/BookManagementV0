<%@ page import="top.cjw.bookmanagementv0.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: yeluzi
  Date: 2024/5/31
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
</head>
<body>
<jsp:include page="header.jsp"/>

    <div class="1" style="background-color: #d5cccc">
        <h1 class="2">个人信息</h1>
        <h2>用户名：${sessionScope.get("username")}</h2>
        <h2>密码：${sessionScope.get("password")}</h2>
    </div>

</body>
</html>
