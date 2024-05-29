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
        body{
            background-image:url("./images/background.JPEG");
            background-size: 100% 100%;
        }
        nav{
            padding: 10px;
            text-align: right;
        }
        h1{
            text-align: center;
        }
        h2{
            text-align: left;
        }
        div{
            background-color: #ffffff;
            margin-left: 10px;
            margin-right: 10px;
            padding-left: 20px;
            padding-right: 20px;

        }
        span{
            display: inline-block;
            justify-content: center;
            margin:10px;
            padding:10px;
            width: 300px;
            text-align: center;
            background-color: #f3f0f0;
        }
        .search{
            text-align: right;
        }
        .img1{
            margin:auto;
            display: block;
            height: 200px;
            width: 150px;
            transform: scale(1.2);
        }
        .img2{
            height: 100px;
            width: 80px;
        }
        .img3{
            height: 50px;
            width: 50px;
            border-radius: 10px;
        }
        .box{
            display: inline-block;
            width:36px;
            height:36px;
            background-color: #73B7BF;
            border: 1px solid #ccc ;
            text-align: center;
            line-height:36px
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
        <img class="img3" src="${sessionScope.get("avatar")}" alt="头像">
    <a href="#" onclick="showHome()">主页</a> |
    <a href="#" onclick="showPersonal()">个人中心</a>|
    <a href="#" onclick="showManage()">后台管理</a>
    <button type="submit">退出登录</button>
    </form>

</nav>

    <div>
        全部 | 政治 | 经济 | 文化 | 社会 | 科学
        <form class="search" action="<%request.getContextPath();%>/book/search">
            <input type="text" placeholder="请输入书名" name="name">
            <button type="submit">搜索</button>
        </form>
    </div>

</body>
</html>
