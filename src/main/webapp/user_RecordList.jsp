<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: yeluzi
  Date: 2024/6/2
  Time: 13:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
    </style>
    <script>

        <%-- 将消息存储在一个数组中 --%>
        <%
            List<String> msgs = new ArrayList<>();
            if (request.getSession().getAttribute("msg4") != null) {
    //    还书弹窗
                msgs.add((String) request.getSession().getAttribute("msg4"));
                session.setAttribute("msg4", null);
            }
        %>
        <%-- 使用现代JavaScript语法 --%>
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

    </script>
</head>
<body style="background-image: url(https://t.tutu.to/img/iLMh); background-size: cover; background-attachment: fixed;">
<jsp:include page="header.jsp"/>

<div class="content">
    <h1>借阅记录</h1>
    <table>
        <thead>
        <tr>
            <th>记录号</th>
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
                <td>${record.book.name}</td>
                <td>${record.borrowDatetime}</td>
                <td>${record.returnDatetime}</td>
                <td>
                    <c:choose>
                        <c:when test="${not empty record.returnDatetime}">
                            已归还
                        </c:when>
                        <c:otherwise>
                            <a class="astyle" href="<%=request.getContextPath()%>/book/returnBook?bId=${record.book.bookId}">归还</a>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%--msg显示还书失败信息--%>
    <div id="message" class="message-style">${msg}</div>
</div>

</body>
</html>
