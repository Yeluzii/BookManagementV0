<%--
  Created by IntelliJ IDEA.
  User: yeluzi
  Date: 2024/5/27
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--    <%@ taglib prefix="c" uri="jakarta.tags.core" %>--%>
<%--    <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>--%>

    <%--    <%@ page import="java.util.List" %>--%>
    <%--    <%@ page import="com.example.bookshop.entity.Book" %>--%>
    <%--    <%@ page import="com.example.bookshop.DAO.Impl.BookDaoImpl" %>--%>
    <%--    <%@ page import="java.util.Arrays" %>--%>
    <title>网上图书商城的设计与开发</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url("./images/IMG_5811(20240524-203904).JPEG");
        }

        header {
            background-color: #333;
            padding: 15px;
            text-align: center;
            color: #fff;
        }

        nav {
            background-color: #ecbbbb;
            padding: 10px;
            text-align: center;
        }

        nav2 {
            background-color: #ecbbbb;
            padding: 20% 5%;
            text-align: center;
            float: left;
        }

        .place {
            font-size: 50px;
            border-radius: 10px;
            background-color: #8e989b;
            color: rgb(54, 101, 231);
            text-decoration: none;
            float: left;
        }

        .place:hover {
            background: #aee328;
            border-radius: 10px;
        }

        section {
            padding: 20px;
            text-align: center;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 4px;
        }

        button {
            background-color: #333;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #555;
        }
    </style>
</head>

<body>

<header>
    <h1 style="text-shadow: 5px 5px 5px #f0ecec;">网上图书商城</h1>
</header>

<nav2>
    <button class="place" href="/personal-center" onclick="showCenter()">个人中心</button>
    <br>
    <button class="place" href="/shop" onclick="showShop()">商城</button>
    <br>
    <button class="place" href="/order" onclick="showOrder()">我的订单</button>
</nav2>

<section id="shop">
    <h2 style="color: #14eaea;text-shadow: 5px 5px 5px #7283f6">商城</h2>

<%--    <%--%>
<%--        List<Book> list = new BookDaoImpl().getAllBooks();--%>
<%--        request.setAttribute("list", list);--%>
<%--//        for (Book book : list) {--%>
<%--//            System.out.println(book.getName());--%>
<%--//        }--%>
<%--    %>--%>

    <c:forEach items="${list}" var="list">
        <div>
            <h3 style="color: #14adef;text-shadow: 5px 5px 5px #707edf">
                <c:out value="${list.name}"></c:out>
            </h3>
        </div>
    </c:forEach>

</section>

<section id="order" style="display: none">
    <h2 style="color: #14eaea;text-shadow: 5px 5px 5px #7283f6">我的订单</h2>
</section>

<section id="center" style="display: none">
    <h2 style="color: #14eaea;text-shadow: 5px 5px 5px #7283f6">个人中心</h2>
</section>


<script>
    function showCenter() {
        document.getElementById("order").style.display = "none";
        document.getElementById("shop").style.display = "none";
        document.getElementById("center").style.display = "block";
    }

    function showOrder() {
        document.getElementById("order").style.display = "block";
        document.getElementById("shop").style.display = "none";
        document.getElementById("center").style.display = "none";
    }

    function showShop() {
        document.getElementById("order").style.display = "none";
        document.getElementById("shop").style.display = "block";
        document.getElementById("center").style.display = "none";
    }

</script>

</body>

</html>
