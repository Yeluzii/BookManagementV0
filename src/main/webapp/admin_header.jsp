<%@ page import="java.util.List" %>
<%@ page import="top.cjw.bookmanagementv0.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>图书管理系统</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-attachment: fixed;
            background-size: cover;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        nav.header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px 5px;
            border-radius: 5px;
            background-color: rgba(248, 248, 248, 0.8);
            border-bottom: 1px solid #ddd;
        }

        nav.header h1 {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin: 0;
        }

        nav.header .user-nav {
            display: flex;
            align-items: center;
        }

        nav.header .user-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }

        nav.header a {
            color: #333;
            text-decoration: none;
            margin-right: 10px;
        }

        nav.header a:hover {
            text-decoration: underline;
        }

        nav.header button.logout-btn {
            background-color: #333;
            color: #fff;
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        nav.header button.logout-btn:hover {
            background-color: #555;
        }
        h1{
            margin-left:150px;
        }
        h1 img {
            vertical-align: middle;
        }
        .dropdown-content {
            /*display: none;*/
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            display: flex; /* 添加这一行 */
            flex-direction: column; /* 添加这一行 */
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }

        details[open] .dropdown-content {
            display: block;
        }


    </style>
    <script>function toggleDropdown(event) {
        event.preventDefault(); // 阻止默认的链接行为
        const dropdown = document.getElementById('dropdown');
        dropdown.open = !dropdown.open; // 切换open属性
    }
    </script>
</head>
<body>
<div class="container">
    <nav class="header">
            <h1>
                <img  src="https://t.tutu.to/img/4AW7" alt="logo" style="width: 40px; height: 40px;">
                图书管理系统
            </h1>
        <div class="user-nav">
            <img class="user-avatar" src="<%=session.getAttribute("avatar")%>" alt="头像">
            <a style="text-decoration: none" href="<%request.getContextPath();%>/admin/home">主页</a>|&nbsp;
            <a style="text-decoration: none" href="<%request.getContextPath();%>/admin/personal-center">个人中心</a>|&nbsp;
            <a style="text-decoration: none" href="<%request.getContextPath();%>/admin/record">借阅记录</a>|
            <details id="dropdown">
                <summary><a href="#" onclick="toggleDropdown(event); return false;">后台管理</a></summary>
                <div class="dropdown-content">
                    <a style="text-decoration: none" href="<%request.getContextPath();%>/record/findAll">借阅管理</a>
                    <a style="text-decoration: none" href="<%request.getContextPath();%>/book/adminAllBook">图书管理</a>
                    <a style="text-decoration: none" href="<%request.getContextPath();%>/admin/findAll">用户管理</a>
                </div>
            </details>
            <form action="<%request.getContextPath();%>/user/logout" method="post">
                <button style="text-decoration: none" class="logout-btn" type="submit">退出登录</button>
            </form>
        </div>
    </nav>
</div>
</body>
</html>
