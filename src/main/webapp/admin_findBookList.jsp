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
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>图书管理</title>
    <script src="./js/jquery.min.js"></script>

    <style>
        .box{
            display: flex;
            width: 75%;
            padding:20px;
            height: auto;
            align-items: center;
            justify-content: space-between;
            background-color: rgba(255, 255, 255, 0.6);
            margin: 0 auto;
        }
        .up{
            margin-top: 20px;
        }
        h2{

        }
        img{
            height: 350px;
            width: 300px;

        }

        .special {
             display: flex;
             flex-direction: column;
             margin-bottom: 10px;
         }
        .left .right{
            flex:1;
        }
        .content {
            width: 75%;
            padding: 20px;
            margin: auto;
            background-color: rgba(255, 255, 255, 0.5);
        }
        table{
            width: 95%;
            margin: 0 auto;
            text-align: center;
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
        function  confirmBtn(event) {
            let x;
            const r = confirm("是否确认操作？");
            if (r===true){
                x="你点击了确定";
            }
            else {
                event.preventDefault();
                x="你点击了取消";
            }
            document.getElementsByClassName("b").innerHTML=x;
        }

        <%
    List<String> msgs = new ArrayList<>();
    if (request.getSession().getAttribute("msg6") != null) {
//    管理员修改图书弹窗
msgs.add((String) request.getSession().getAttribute("msg6"));
        session.setAttribute("msg6", null);
    }
        if (request.getSession().getAttribute("msg8") != null) {
//    管理员添加图书弹窗
msgs.add((String) request.getSession().getAttribute("msg8"));
        session.setAttribute("msg8", null);
    }
            if (request.getSession().getAttribute("msg9") != null) {
//    管理员删除图书弹窗
msgs.add((String) request.getSession().getAttribute("msg9"));
        session.setAttribute("msg9", null);
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
<body style="background-image: url(https://t.tutu.to/img/iLMh); background-size: cover; background-attachment: fixed;">

<jsp:include page="admin_header.jsp"/>
<div class="box">

    <h2 style="font-size: 15px">图书管理</h2>
    <form class="addBook" action="<%request.getContextPath();%>/book/addBook" method="post">
        <label>
                <span>书名
                <input type="text" placeholder="请输入书名" name="bookName" required>
                </span>
        </label>
        <label>
                <span>种类id
                <input type="text" placeholder="请输入种类id" name="typeId" required>
                </span>
        </label>
        <label>
                <span>封面地址(图床)
                <input type="text" placeholder="请输入封面地址" name="cover" >
                </span>
        </label>
        <label>
                <span>库存(本)
                <input type="text" name="count" placeholder="请输入库存"  required>
                </span>
        </label>
        <input type="submit" value="添加">
        <button type="reset">重置</button>
    </form>
</div>
<div class="content">
    <table>
        <thead>
        <tr>
            <th>图书封面</th>
            <th>图书信息</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${bookList}" var="book">

            <tr>
            <td>
                <img class="img1" src="${book.cover}" alt="无法识别图片">
            </td>
            <td>
                <h4>图书名称：&nbsp ${book.name}</h4>
                <h4>库&nbsp 存：&nbsp${book.count}本</h4>

            </td>
            <td>
                <form action="<%request.getContextPath();%>/book/adminUpdateBook?bId=${book.bookId}" method="post">
                <label class="special">
                <span>书名</span>
                <input type="text" name="bookName" placeholder="请输入新书名" value="${book.name}" required>
                </label>
                <label class="special">
                <span>种类id</span>
                <input type="text" name="typeId" placeholder="请输入种类id" value="${book.typeId}" required>
                </label>
                <label class="special">
                <span>库存(本)</span>
                <input type="text" name="count" placeholder="请输入库存" value="${book.count}" required>
                </label>
                <label class="special">
                <span>图片地址(图床)</span>
                <input type="text" name="cover" placeholder="请输入图片地址" value="${book.cover}" required>
                </label>

                <input type="submit" class="b" onclick="confirmBtn(event)" value="修改">
                <button type="reset">重置</button>

                </form>
                <form action="<%request.getContextPath();%>/book/deleteBook?bId=${book.bookId}" method="post">
                    <input type="submit" class="b" onclick="confirmBtn(event)" value="删除">
                </form>
            </td>
            </tr>

        </c:forEach>
        <div class="top">
            <button id="scrollToTopBtn" onclick="scrollToTop()">Top</button>
        </div>
    </table>
</div>


</body>
