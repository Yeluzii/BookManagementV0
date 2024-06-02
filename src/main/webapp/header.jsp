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
        <img class="img3" src="<%=session.getAttribute("avatar")%>" alt="头像">
    <a href="<%request.getContextPath();%>/user/home" >主页</a> |
    <a href="<%request.getContextPath();%>/user/personal-center" >个人中心</a>|
    <a href="<%request.getContextPath();%>/user/record" >借阅记录</a>|
    <a href="<%request.getContextPath();%>/user/bgManagement" onclick="showManage()">后台管理</a>
    <button type="submit">退出登录</button>
    </form>

</nav>

    <div>
        <label>
            <a href="<%request.getContextPath();%>/book/selectAll">全部</a>
            <a href="<%request.getContextPath();%>/book/type?typeId=1">古典文学</a>
            <a href="<%request.getContextPath();%>/book/type?typeId=2">科学</a>
            <a href="<%request.getContextPath();%>/book/type?typeId=3">现代文学</a>
            <a href="<%request.getContextPath();%>/book/type?typeId=4">历史</a>
            <a href="<%request.getContextPath();%>/book/type?typeId=5">教育</a>
            <a href="<%request.getContextPath();%>/book/type?typeId=6">科技</a>
            <a href="<%request.getContextPath();%>/book/type?typeId=7">漫画</a>
            <a href="<%request.getContextPath();%>/book/type?typeId=8">小说</a>
            <a href="<%request.getContextPath();%>/book/type?typeId=9">外国文学</a>
            <a href="<%request.getContextPath();%>/book/type?typeId=10">其他</a>
        </label>

        <form class="search" action="<%request.getContextPath();%>/book/search" method="post">
            <label>
                <input type="text" placeholder="请输入书名" name="name">
            </label>
            <button type="submit">搜索</button>
        </form>
    </div>


</body>
</html>
