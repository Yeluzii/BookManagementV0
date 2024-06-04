<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>借阅记录</title>

    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .content {
            width: 75%;
            padding: 20px;
            margin: auto;
            background-color: rgba(255, 255, 255, 0.5);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .astyle {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 3px;
            background-color: rgba(77, 77, 77, 0.63);
            color: #fff;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: rgba(117, 117, 117, 0.64);
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
    <%-- 将消息存储在一个数组中 --%>
    <%
        List<String> msgs = new ArrayList<>();
        if (request.getSession().getAttribute("msg7") != null) {
//    管理员归还图书弹窗
            msgs.add((String) request.getSession().getAttribute("msg7"));
            session.setAttribute("msg7", null);
        }
        if (request.getSession().getAttribute("searchRecord") != null) {
            //    根据用户名查借阅记录失败弹窗
            msgs.add((String) request.getSession().getAttribute("searchRecord"));
            session.setAttribute("searchRecord", null);
        }
    %>
    <%-- 使用现代JavaScript语法 --%>
    <script>
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
<body style="background-image: url(https://t.tutu.to/img/iLMh); background-size: cover; background-attachment: fixed;">
<jsp:include page="admin_header.jsp"/>

<div class="content">
    <h1>借阅记录</h1>
    <div class="search">
        <form class="search" action="<%request.getContextPath();%>/record/adminSearchByUsername" method="post">
            <label>
                按用户名搜索：
                <input type="text" name="username" placeholder="请输入用户名">
            </label>
            <button type="submit">搜索</button>
        </form>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <form class="search" action="<%request.getContextPath();%>/record/adminSearchByBookName" method="post">
            <label>
                按书名搜索：
                <input type="text" name="bookName" placeholder="请输入书名">
            </label>
            <button type="submit">搜索</button>
        </form>
    </div>
    <table>
        <thead>
        <tr>
            <th>记录号</th>
            <th>用户名</th>
            <th>书名</th>
            <th>借阅时间</th>
            <th>归还时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${recordList}" var="record">
            <tr>
                <td>${record.recordId}</td>
                <td>${record.user.username}</td>
                <td>${record.book.name}</td>
                <td>${record.borrowDatetime}</td>
                <td>${record.returnDatetime}</td>
                <td>
                    <c:choose>
                        <c:when test="${not empty record.returnDatetime}">
                            已归还
                        </c:when>
                        <c:otherwise>
                            <a class="astyle" href="<%request.getContextPath();%>/book/adminReturnBook?bId=${record.book.bookId}&userName=${record.user.username}">归还</a>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        <div class="top">
            <button id="scrollToTopBtn" onclick="scrollToTop()">Top</button>
        </div>
    </tbody>
    </table>
    </div>
</body>

</html>
