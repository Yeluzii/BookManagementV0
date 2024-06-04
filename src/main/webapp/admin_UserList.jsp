<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: yeluzi
  Date: 2024/6/2
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户列表</title>
    <style>
        img{
            height: 350px;
            width: 300px;
        }
        label {
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
        th{
            margin: 15px;
            padding:15px;
        }
        .reduceLength{
            display: inline-block; /* 更改为inline-block以限制宽度 */
            width: 200px; /* 设置一个合适的宽度 */
            margin-bottom: 10px;
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

        <%-- 将消息存储在一个数组中 --%>
        <%
            List<String> msgs = new ArrayList<>();
            if (request.getSession().getAttribute("updateUserAvatar") != null) {
    //    修改用户头像弹窗
                msgs.add((String) request.getSession().getAttribute("updateUserAvatar"));
                session.setAttribute("updateUserAvatar", null);
            }
            if (request.getSession().getAttribute("msg5") != null) {
    //    修改用户密码弹窗
                msgs.add((String) request.getSession().getAttribute("msg5"));
                session.setAttribute("msg5", null);
            }
            if (request.getSession().getAttribute("msg10") != null) {
    //    删除用户弹窗
                msgs.add((String) request.getSession().getAttribute("msg10"));
                session.setAttribute("msg10", null);
            }
            if (request.getSession().getAttribute("msg11") != null) {
    //    修改用户权限弹窗
                msgs.add((String) request.getSession().getAttribute("msg11"));
                session.setAttribute("msg11", null);
            }
            if (request.getSession().getAttribute("searchUser") != null) {
    //    数据库中没有该用户，查询失败弹窗
        msgs.add((String) request.getSession().getAttribute("searchUser"));
                session.setAttribute("searchUser", null);
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

        function scrollToTop() {
            document.body.scrollTop = 0; // For Safari
            document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
        }

    </script>
</head>
<body style="background-image: url(https://t.tutu.to/img/iLMh); background-size: cover; background-attachment: fixed;">

<jsp:include page="admin_header.jsp"/>

<div class="content">

    <div class="search">
        搜索用户：
        <form class="search" action="<%request.getContextPath();%>/admin/searchUser" method="post">
            <label>
                <input type="text" name="username" placeholder="请输入用户名">
            </label>
            <button type="submit">搜索</button>
        </form>
    </div>
<hr>
<table>
    <thead>
    <tr>
        <th>用户头像</th>
        <th>用户名</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${userList}" var="user">
        <tr>
            <td>
                <img class="img1" src="${user.avatar}" alt="无法识别图片">

            </td>
            <td>
                ${user.username}
            </td>
            <td>
                <form action="<%request.getContextPath();%>/admin/updateUserAvatar?userName=${user.username}" method="post">
                    <label class="reduceLength">
                        <input type="text" name="avatar" value="${user.avatar}" placeholder="请输入头像地址" required>
                    </label>
                    <input type="submit" class="submit-btn" value="修改头像">
                </form>
                <form action="<%request.getContextPath();%>/admin/updateIsAdminByUserName?userName=${user.username}" method="post">
                    <span>
                        <input type="radio" name="isAdmin" value="0"
                               <c:if test="${user.isAdmin == 0}">checked</c:if>>普通用户

                        <input type="radio" name="isAdmin" value="1"
                               <c:if test="${user.isAdmin == 1}">checked</c:if> >管理员

                        <input type="submit"  onclick="confirmBtn(event)"  class="b"  value="修改权限">
                    </span>
                </form>
                <form action="<%request.getContextPath();%>/admin/adminUpdatePassword?userName=${user.username}" method="post">
                    <label class="reduceLength">
                        <input type="password" name="new_password" placeholder="请输入新密码">
                    </label>
                    <input type="submit" onclick="confirmBtn(event)"  class="b" value="修改密码">
                </form>

                <form action="<%request.getContextPath();%>/admin/deleteUser?userId=${user.userId}" method="post">
                    <input type="submit" onclick="confirmBtn(event)"  class="b"  value="删除该用户">
                </form>
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
