<%@ page import="java.util.List" %>
<%@ page import="top.cjw.bookmanagementv0.entity.Book" %><%--
  Created by IntelliJ IDEA.
  User: yeluzi
  Date: 2024/5/30
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>BookList</title>
    <style>
        body {
            background-size: 100% 100%;
            background-attachment: fixed;
        }

        div {
            background-color: #ffffff;
            margin-left: 10px;
            margin-right: 10px;
            padding-left: 20px;
            padding-right: 20px;
        }
        .box{
            width: 75%;
            height: auto;
            margin: 0 auto;
        }
        .box1 {
            height: 10%;
            padding-top:45px;
            background-color: #aca9bb;
            margin: 0 auto;
        }
        .search {
            text-align: right;
            float: right;
        }
        span {
            display: inline-block;
            justify-content: center;
            margin: 10px;
            padding: 25px 10px;
            width: 280px;
            text-align: center;
            background-color: #ffffff;
        }
        .img1 {
            margin: auto;
            display: block;
            height: 200px;
            width: 150px;
            transform: scale(1.2);
            border-radius: 3px;
            box-shadow:0 0 4px 4px #aca9bb;
        }

        .top {
            float: right;
            margin-right: 25px;
        }

        #scrollToTopBtn {
            bottom: 20px; /* 距离页面底部的距离 */
            font-size: 18px; /* 字体大小 */
            border: none; /* 去除边框 */
            outline: none; /* 去除点击时的轮廓 */
            color: blue; /* 文字颜色 */
            border-radius: 10px; /* 圆角 */
            position: fixed; /* 固定在视口上 */
        }
        a{
            text-decoration: none;
        }

    </style>
</head>
<body style="background-image: url(https://t.tutu.to/img/XM1i)">

<jsp:include page="header.jsp"/>

<div class="box">
    <div class="box1">
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

    <div>
        <c:forEach items="${bookList}" var="book">
        <span>
            <img class="img1" src="${book.cover}" alt="无法识别图片">
            <br>
            ${book.name}|库存：${book.count}本
            <a href="<%request.getContextPath();%>/book/borrow?bId=${book.bookId}">借阅</a>
        </span>
        </c:forEach>
    </div>
    <div class="top">
        <button id="scrollToTopBtn" onclick="scrollToTop()">Top</button>
    </div>
</div>

</body>
<script>
    // var mybutton = document.getElementById("scrollToTopBtn");
    // window.onscroll = function() {
    //     if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    //         mybutton.classList.add("show");
    //     } else {
    //         mybutton.classList.remove("show");
    //     }
    // };
    function scrollToTop() {
        // document.body.scrollTop = 0; // For Safari
        document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
    }
</script>
</html>
