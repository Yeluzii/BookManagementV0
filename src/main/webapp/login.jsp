<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <script src="./js/jquery.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>图书管理系统</title>
    <link rel="stylesheet" href="./css/dynamicBackground.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url("/images/background.JPEG");
            background-size: cover;
        }

        nav {
            /*background-color: #eee;*/
            padding: 10px;
            text-align: center;
        }

        section {
            padding: 20px;
            text-align: center;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #aca9bb;
            padding: 20px;
            border-radius: 5px;
            opacity: 0.7;
            box-shadow: 5px 5px 5px rgba(20, 173, 239, 0.75);
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

        div {
            margin-top: 150px;
        }

        .h1{
            text-align: center;
            color: bisque;
        }
        #login a,#register a{
            text-decoration: none;
        }
        #login a:hover,#register a:hover {
            color: #fff43c;
        }

    </style>
</head>
<body>

<canvas></canvas>
<script src="./js/dynamicBackground.js"></script>
<div>
        <h1 class="h1">图书管理系统</h1>

    <section id="login">

        <form id="loginForm" action="<%request.getContextPath();%>/user/login" method="post">
            <h2>Login</h2>
            <label for="loginUsername">Username:</label><input type="text" id="loginUsername" name="loginUsername"
                                                               required>

            <label for="loginPassword">Password:</label><input type="password" id="loginPassword" name="loginPassword"
                                                               required>

            <nav>
                <a href="#" onclick="showRegister()">未拥有账号，去注册</a>

                <label>
                    <input id="verifyCode1" name="verifyCode" type="text" placeholder="输入验证码（区分大小写）" required>
                </label>
                <img src="${pageContext.request.contextPath}/verifyCode" alt="验证码" id="code1">
                <a href="" id="change1">看不清，换一张</a>

            </nav>

            <button type="submit" onclick="loginMessage()">Login</button>
        </form>
    </section>

    <section id="register" style="display:none;">

        <form id="registerForm" action="<%request.getContextPath();%>/user/register" method="post">
            <h2>Register</h2>
            <label for="regUsername">Username:</label>
            <input type="text" id="regUsername" name="regUsername" required>

            <label for="regPassword">Password:</label>
            <input type="password" id="regPassword" name="regPassword" required>

            <nav>
                <a href="#" onclick="showLogin()">注册完成，去登录</a>

                <label>
                    <input id="verifyCode2" name="verifyCode" type="text" placeholder="输入验证码（区分大小写）" required>
                </label>
                <img src="${pageContext.request.contextPath}/verifyCode" alt="验证码" id="code2">
                <a href="" id="change2">看不清，换一张</a>

            </nav>

            <button type="submit" onclick="messageWrong()">Register</button>
        </form>
    </section>

</div>

<script>
    function showRegister() {
        document.getElementById("register").style.display = "block";
        document.getElementById("login").style.display = "none";
    }

    function showLogin() {
        document.getElementById("register").style.display = "none";
        document.getElementById("login").style.display = "block";
    }

</script>

<%--验证码--%>
<script>
    window.onload = function () {
        //  获取图片对象
        let img1 = document.getElementById("code1");
        //  获取超链接对象
        let href1 = document.getElementById("change1");
        href1.onclick = function () {
            //  加时间戳
            const date = new Date().getTime();
            img1.src = "verify-code?" + date;
        }

        //  获取图片对象
        let img2 = document.getElementById("code2");
        //  获取超链接对象
        let href2 = document.getElementById("change2");
        href2.onclick = function () {
            //  加时间戳
            const date = new Date().getTime();
            img2.src = "verify-code?" + date;
        }

        <%--验证码错误弹窗--%>
        <% if (session.getAttribute("codeError") != null) { %>
        alert('<%= session.getAttribute("codeError") %>');
        <%session.setAttribute("codeError", null);%>
        <%}%>
        <%--登录失败弹窗--%>
        <% if (request.getSession().getAttribute("msg1") != null) { %>
        alert('<%= request.getSession().getAttribute("msg1") %>');
        <%session.setAttribute("msg1", null);%>
        <%}%>
        <%--注册成功失败弹窗--%>
        <% if (request.getSession().getAttribute("msg2") != null) { %>
        alert('<%= request.getSession().getAttribute("msg2") %>');
        <%session.setAttribute("msg2", null);%>
        <%}%>
        <%--修改密码成功弹窗--%>
        <% if (request.getSession().getAttribute("msg") != null) { %>
        alert('<%= request.getSession().getAttribute("msg") %>');
        <%session.setAttribute("msg", null);%>
        <%}%>
    }
</script>

</body>
</html>

