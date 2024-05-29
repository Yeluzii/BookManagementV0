<%@ page import="top.cjw.bookmanagementv0.service.BookService" %>
<%@ page import="top.cjw.bookmanagementv0.entity.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="top.cjw.bookmanagementv0.service.impl.BookServiceImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="top.cjw.bookmanagementv0.service.UserService" %>
<%@ page import="top.cjw.bookmanagementv0.service.impl.UserServiceImpl" %>
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
            background-image:url("./images/2.jpg");
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
<%--        <img class="img3" src="${sessionScope.get("avatar")}" alt="头像">--%>
        <img class="img3" src="/images/p1.jpg" alt="hhh">
    <a href="#" onclick="showHome()">主页</a> |
    <a href="#" onclick="showPersonal()">个人中心</a>|
    <a href="#" onclick="showManage()">后台管理</a>
    <button type="submit">退出登录</button>
    </form>


</nav>

<section id="home">


    <div>
        全部 | 政治 | 经济 | 文化 | 社会 | 科学
        <form class="search" action="<%request.getContextPath();%>/book/search">
            <input type="text" placeholder="请输入书名" name="name">
            <button type="submit">搜索</button>
        </form>
    </div>


    <div>
    <%
        BookService bookService = new BookServiceImpl();
        List<Book> books = bookService.findAll();
        for (Book book : books) {
    %>

    <span>
        <img class="img1" src=" <%=book.getCover() %>" alt="无法识别图片">
        <br>
        <%=book.getName()%>|库存：<%=book.getCount()%>本
    </span>

    <%
        }
    %>
    </div>
<%--    <div>--%>

<%--        <c:forEach  items="${Book}" var="book" >--%>
<%--        <span>--%>
<%--            <img class="img1" src="${book.cover}" alt="无法识别图片">--%>
<%--            ${book.name}--%>
<%--        </span>--%>
<%--        </c:forEach>--%>
<%--    </div>--%>
<div1 class="box">
    <a href="#">&lt;&lt;上一页</a>
    <a href="#">1</a>
    <a href="#">下一页&gt;&gt;</a>
</div1>

</section>





<section id="personal" style="display: none">
    <h1>欢迎，${sessionScope.get("username")}!</h1>
    <div>
     <div class="1" style="background-color: #d5cccc">
         <h1 class="2">个人信息</h1>
         <h2>用户名：${sessionScope.get("username")}</h2>
         <h2>密码：${sessionScope.get("password")}</h2>


     </div>
        ----------------------------------------------------------------
     <div>
         <h1 class="2" style="background-color: #d5cccc">借阅信息</h1>
         <span>
             <img class="img2" src="images/1.jpg" alt="无法识别图片">
         </span>
         <span>
             <img class="img2" src="images/2.jpg" alt="无法识别图片">
         </span>
     </div>

    </div>
</section>

<section id="manage" style="display: none">
    <h1>后台管理</h1>
    <c:if test="${user.isAdmin}">

        Welcome, Admin!

    </c:if>
</section>
</body>
<%--document.getElementById("register").style.display = "block";--%>
<%--document.getElementById("login").style.display = "none";--%>
<%--document.getElementById("home").style.display = "none";--%>
<script>
    function showHome() {
        document.getElementById("home").style.display = "block";
        document.getElementById("personal").style.display="none";
        document.getElementById("manage").style.display="none";
    }
    function showPersonal() {
        document.getElementById("home").style.display = "none";
        document.getElementById("personal").style.display="block";
        document.getElementById("manage").style.display="none";
    }
    function showManage() {
        document.getElementById("home").style.display = "none";
        document.getElementById("personal").style.display="none";
        document.getElementById("manage").style.display="block";
    }
</script>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--登出   分类按钮   ||| 显示   搜索   （个人中心跳转） 借还--%>
<%--管理员登录--%>

<%--</body>--%>
<%--</html>--%>
