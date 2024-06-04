<%@ page import="top.cjw.bookmanagementv0.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: yeluzi
  Date: 2024/5/31
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>个人中心</title>
    <script src="./js/jquery.min.js"></script>
    <style>

        .box {
            display: flex;
            align-items: center;
            padding: 20px;
            width: 75%;
            margin:auto;
            justify-content: space-between;
            background-color: rgba(255, 255, 255, 0.5);
        }
        .left {
            /* 保持原有样式，但考虑与整体设计协调 */
            width: 30%; /* 调整宽度以适应整体布局 */
            padding: 20px;
        }
        .right {
            width: 70%;
            padding: 20px;
        }
        /* 添加按钮样式以匹配整体设计 */
        .submit-btn {
            padding: 5px 10px;
            width: 80px;
            border: none;
            border-radius: 3px;
            background-color: #333;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .submit-btn:hover {
            background-color: #555;
        }
        .img3{
            border-radius: 10px;
            max-width: 100%; /* 限制最大宽度为容器宽度 */
            height: auto; /* 高度自适应，保持原始长宽比 */
            object-fit: cover; /* 保持图片填充容器同时不失真 */
        }
       .message-style{
           text-align: center; /* 使文本居中 */
           margin: auto; /* 自动水平居中 */
           width: fit-content; /* 让宽度适应内容 */
           max-width: 500px; /* 可选：设置最大宽度，防止内容过宽 */
           padding: 10px; /* 可选：增加内边距以提高可读性 */
           background-color: rgba(255, 255, 255, 0.8); /* 可选：调整背景颜色以提高可见性 */
           border-radius: 5px; /* 可选：增加圆角 */
           box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); /* 可选：添加阴影效果 */
           transition: opacity 0.3s ease; /* 可选：添加过渡效果 */
           opacity: 1; /* 初始化为完全可见 */
       }
        .message-style.hidden { /* 当消息隐藏时应用的样式 */
            opacity: 0; /* 逐渐变为不可见 */
            pointer-events: none; /* 禁用鼠标事件，防止用户点击已隐藏的消息 */
        }
    </style>
    <script>
        function updatePasswordBtn(event) {
            let x;
            const r = confirm("是否确认操作？");
            if (r === true) {
                x = "你点击了确定";
            } else {
                event.preventDefault();
                x = "你点击了取消";
            }
            document.getElementsByClassName("z")[0].innerHTML = x; // 注意此处的索引访问
        }

        <%-- 将消息存储在一个数组中 --%>
        <%
            List<String> msgs = new ArrayList<>();
            if (request.getSession().getAttribute("updateAvatar") != null) {
    //    修改头像弹窗
                msgs.add((String) request.getSession().getAttribute("updateAvatar"));
                session.setAttribute("updateAvatar", null);
            }
                        if (request.getSession().getAttribute("msg") != null) {
    //    修改密码失败弹窗
                msgs.add((String) request.getSession().getAttribute("msg"));
                session.setAttribute("msg", null);
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

<div class="box">
    <div class="left">
        <img class="img3" src="<%=session.getAttribute("avatar")%>" alt="头像" style="width: 100%; height: auto; object-fit: cover;">
        <form action="<%request.getContextPath();%>/user/updateAvatar" method="post">
            <label>
                <input type="text" name="avatar" value="<%=session.getAttribute("avatar")%>" placeholder="请输入头像地址" required>
            </label>
            <input type="submit" class="submit-btn" value="修改头像">
        </form>
    </div>
    <div class="right">
        <h2>用户名：<%=session.getAttribute("username")%></h2>
        <h2>密码：<%=session.getAttribute("password")%></h2>
        <form action="<%request.getContextPath();%>/user/update-password" method="post">
            <label>
                <input type="password" name="old_password" placeholder="请输入原密码">
            </label>
            <label>
                <input type="password" name="new_password" placeholder="请输入新密码">
            </label>
            <input type="submit" class="submit-btn z" onclick="updatePasswordBtn(event)" value="修改密码">
        </form>
    </div>
</div>
<%--msg显示用户修改密码失败信息--%>
<%--<div id="message" class="message-style">${msg}</div>--%>

</body>
</html>
