<%--
  Created by IntelliJ IDEA.
  User: yeluzi
  Date: 2024/6/2
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<div>
    <a href="<%request.getContextPath();%>/record/findAll">借阅记录</a>
    <a href="<%request.getContextPath();%>/book/adminAllBook">所有图书</a>
    <a href="<%request.getContextPath();%>/user/findAll">所有用户</a>
</div>

</body>
</html>
