<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>主页</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            /*background-image: url('https://img2.imgtp.com/2024/05/31/vL6Oc1V7.jpg'); !* 添加背景图片URL *!*/
            background-attachment: fixed; /* 设置背景图片固定 */
            background-size: cover; /* 让背景图片自适应填充整个视口 */
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px 5px;
            border-radius: 5px;
            background-color:  rgba(248, 248, 248, 0.8);
            border-bottom: 1px solid #ddd;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }
        h1{
            margin-left:150px;
        }
        h1 img{
            vertical-align: middle;
        }

        .user-nav {
            display: flex;
            align-items: center;
        }

        .user-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .user-nav a {
            color: #333;

            margin-right: 10px;
        }

        .user-nav a:hover {
            text-decoration: underline;
        }

        .logout-btn {
            background-color: #333;
            color: #fff;
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .logout-btn:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
<div class="container">
    <header class="header">
        <div class="logo">
            <img  src="https://t.tutu.to/img/4AW7" alt="logo" style="width: 40px; height: 40px;">
            图书管理系统</div>
        <div class="user-nav">
            <img class="user-avatar" src="<%=session.getAttribute("avatar")%>" alt="头像">
            <a style="text-decoration: none" href="<%request.getContextPath();%>/user/home">主页</a>
            <a style="text-decoration: none" href="<%request.getContextPath();%>/user/personal-center">个人中心</a>
            <a style="text-decoration: none" href="<%request.getContextPath();%>/user/record">借阅记录</a>
            <form action="<%request.getContextPath();%>/user/logout" method="post">
                <button style="text-decoration: none" class="logout-btn" type="submit">退出登录</button>
            </form>
        </div>
    </header>
</div>
</body>
</html>
