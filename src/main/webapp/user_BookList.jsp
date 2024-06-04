<%@ page import="java.util.List" %>
<%@ page import="top.cjw.bookmanagementv0.entity.Book" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: yeluzi
  Date: 2024/5/30
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>BookList</title>
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
            overflow-x: hidden;/*管理元素左右两侧的内容溢出，指定如果内容溢出元素框，则溢出内容会被隐藏，不会显示滚动条。*/
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .content {
            background-color: #ffffff;
            padding: 20px;
            margin: 20px;
            border-radius: 5px;
            box-shadow: 0 0 4px 4px rgba(172, 169, 187, 0.1);
        }

        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px 0;
            background-color: rgba(248, 248, 248, 0.8);
            border-bottom: 1px solid #ddd;
        }

        .header a {
            color: #333;
            text-decoration: none;
            margin-left: 10px;
        }

        .header a:hover {
            text-decoration: underline;
        }

        .search {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }


        .search input {
            padding: 10px 15px;
            margin-right: 10px;
            border: 1px solid #ddd;
            border-radius: 3px;
            width: 280px;
        }

        .search button {
            padding: 10px 15px;
            border: none;
            border-radius: 3px;
            background-color: #333;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .search button:hover {
            background-color: #555;
        }

        .book-item {
            display: flex;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }

        .book-item img {
            height: 150px;
            width: 100px;
            object-fit: cover;
            border-radius: 3px;
            margin-right: 10px;
        }

        .book-info {
            flex: 1;
        }

        .book-info p {
            margin-bottom: 5px;
        }

        .book-info a {
            color: #333;
            text-decoration: none;
        }

        .book-info a:hover {
            text-decoration: underline;
        }

        #scrollToTopBtn {
            bottom: 20px;
            font-size: 18px;
            border: none;
            outline: none;
            color: #333;
            border-radius: 10px;
            position: fixed;
            right: 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 50px;
            height: 40px;
        }

        #scrollToTopBtn:hover {
            color: #555;
        }
    </style>
    <script>

        <%-- 将消息存储在一个数组中 --%>
        <%
            List<String> msgs = new ArrayList<>();
            if (request.getSession().getAttribute("msg3") != null) {
    //    借阅弹窗
        msgs.add((String) request.getSession().getAttribute("msg3"));
                session.setAttribute("msg3", null);
            }
            if (request.getSession().getAttribute("searchBook") != null) {
    //    数据库中没有该书，搜索失败弹窗
        msgs.add((String) request.getSession().getAttribute("searchBook"));
                session.setAttribute("searchBook", null);
            }
        %>
        window.addEventListener('DOMContentLoaded', function () {
            <%-- 提取消息数组 --%>
            const messages = [<%= String.join(",", msgs.stream().map(s -> "'" + s + "'").toArray(String[]::new)) %>];

            <%-- 显示所有消息 --%>
            messages.forEach(message => {
                if (message) {
                    alert(message);
                }
            });
        });

        function scrollToTop() {
            document.body.scrollTop = 0; // For Safari
            document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
        }

    </script>
</head>
<body  STYLE="background-image: url(https://t.tutu.to/img/iLMh)" >

<jsp:include page="header.jsp" />

<div class="container">
    <div class="content">
        <div class="header">
            <a href="<%request.getContextPath();%>/book/userSelectAll">全部</a>
            <a href="<%request.getContextPath();%>/book/type?typeId=1">古典文学</a>
            <a href="<%request.getContextPath();%>/book/type?typeId=2">科学</a>
            <a href="<%request.getContextPath();%>/book/type?typeId=3">现代文学</a>
            <a href="<%request.getContextPath();%>/book/type?typeId=4">历史</a>
            <a href="<%request.getContextPath();%>/book/type?typeId=5">教育</a>
            <a href="<%request.getContextPath();%>/book/type?typeId=6">科技</a>
            <a href="<%request.getContextPath();%>/book/type?typeId=7">小说</a>
            <a href="<%request.getContextPath();%>/book/type?typeId=8">外国文学</a>
            <a href="<%request.getContextPath();%>/book/type?typeId=9">其他</a>
        </div>
        <div class="search">
            <form class="search" action="<%request.getContextPath();%>/book/search" method="post">
                <label>
                    <input type="text" placeholder="请输入书名" name="name">
                </label>
                <button type="submit">搜索</button>
            </form>
        </div>
        <c:forEach items="${bookList}" var="book">
            <div class="book-item">
                <img class="img1" src="${book.cover}" alt="无法识别图片">
                <div class="book-info">
                    <p>${book.name}</p>
                    <p>库存：${book.count}本</p>
                    <a href="<%request.getContextPath();%>/book/borrow?bId=${book.bookId}">借阅</a>
                </div>
            </div>
        </c:forEach>
        <div class="top">
            <button id="scrollToTopBtn" onclick="scrollToTop()">Top</button>
        </div>
    </div>
</div>

</body>
</html>
