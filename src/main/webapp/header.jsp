<%@ page import="java.util.List" %>
<%@ page import="top.cjw.bookmanagementv0.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>主页</title>
    <style>
        /*body{*/
        /*    background-image:url("./images/background.JPEG");*/
        /*    background-size: 100% 100%;*/
        /*}*/
        nav{
            padding: 10px;
            text-align: right;
        }
        .img3{
            height: 50px;
            width: 50px;
            border-radius: 10px;
        }
        h1{
            text-align:left;
        }

    </style>
</head>
<body>
<h1>图书管理系统</h1>

<nav>
    <form action="<%request.getContextPath();%>/user/logout">
        <img class="img3" src="<%=session.getAttribute("avatar")%>" alt="头像">
    <a href="<%request.getContextPath();%>/user/home" >主页</a> |
    <a href="<%request.getContextPath();%>/user/personal-center" >个人中心</a>|
    <a href="<%request.getContextPath();%>/user/record" >借阅记录</a>|
    <a href="<%request.getContextPath();%>/user/bgManagement" onclick="showManage()">后台管理</a>
    <button type="submit">退出登录</button>
    </form>
</nav>
</body>
</html>
