<%@ page import="top.cjw.bookmanagementv0.entity.Book" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: yeluzi
  Date: 2024/5/31
  Time: 13:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<h1>欢迎，${sessionScope.get("username")}!</h1>
<hr>

</body>
</html>
