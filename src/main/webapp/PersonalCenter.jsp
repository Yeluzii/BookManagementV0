<%@ page import="top.cjw.bookmanagementv0.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: yeluzi
  Date: 2024/5/31
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<style>
    body {
        background-size: 100% 100%;
        background-attachment: fixed;
    }

    div {
        width: 75%;
        background-color: #ffffff;
        margin: auto;
        padding-left: 20px;
        padding-right: 20px;
    }

    .box{

    }

    .left {
        float: left;
        background-color: #555555;
        width: 33%;
        height: auto;
    }

    .right {
        float: right;
        background-color: #ffff;
        width: 67%;
        height: auto;
    }


</style>
<head>
    <title>个人中心</title>
</head>
<body style="background-image: url(https://t.tutu.to/img/XM1i)">
<jsp:include page="header.jsp"/>

<div class="box">

    <div class="left">
        <img class="img3" src="<%=session.getAttribute("avatar")%>" alt="头像">
    </div>

    <div class="right">
        <h2>用户名：${sessionScope.get("username")}</h2>
        <h2>密码：${sessionScope.get("password")}</h2>
        <form action="<%request.getContextPath();%>/user/update-password" method="post">
            <label>
                <input type="password" name="old_password" placeholder="请输入原密码">
            </label>
            <label>
                <input type="password" name="new_password" placeholder="请输入新密码">
            </label>
            <input type="submit" value="修改密码">
        </form>
    </div>

</div>

<div id="message">${msg}</div>
<script>
    // 简单示例，显示消息后延迟隐藏
    window.onload = function () {
        var messageElement = document.getElementById('message');
        if (messageElement.innerText) {
            setTimeout(function () {
                messageElement.style.display = 'none';
            }, 5000); // 5秒后自动隐藏
        }
    };
</script>

</body>
</html>
