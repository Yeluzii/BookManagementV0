<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <script src="./js/jquery.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>网上图书商城的设计与开发</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            /*background-image:url("/images/background.JPEG");*/
            background-size:1600px 800px ;
        }

        header {
            padding: 15px;
            text-align: center;
            /*background-color: #333;*/
            /*color: #fff;*/
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
            /*box-shadow: 0 0 10px rgba(0, 0, 0, 0);*/
            opacity: 0.5;
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

        div{
            margin-top: 150px;
        }
    </style>
</head>
<body>
<div>
<header>
    <h1>图书管理系统</h1>
</header>

<%--<nav>--%>
<%--    <a href="#" onclick="showRegister()">注册</a> |--%>
<%--    <a href="#" onclick="showLogin()">登录</a> |--%>
<%--    <a href="#" onclick="showHome()">主页</a>--%>
<%--</nav>--%>

<section id="login" >
    <%=session.getAttribute("login")%>
    <%=session.getAttribute("register")%>

    <form id="loginForm" action="<%request.getContextPath();%>/user/login">
        <h2>Login</h2>
        <label for="loginUsername">Username:</label><input type="text" id="loginUsername" name="loginUsername" required>

        <label for="loginPassword">Password:</label><input type="password" id="loginPassword" name="loginPassword" required>

<%--        <label>--%>
<%--            <input id="verifyCode" name="verifyCode" type="text" placeholder="输入验证码">--%>
<%--        </label>--%>
<%--        <img src="/verifyCode" alt="验证码" id="code">--%>
<%--        <a href="" id="change">看不清，换一张</a>--%>
<%--        <script>--%>
<%--            window.onload = function () {--%>
<%--                //  获取图片对象--%>
<%--                let img = document.getElementById("code");--%>
<%--                //  获取超链接对象--%>
<%--                let href = document.getElementById("change");--%>
<%--                href.onclick = function () {--%>
<%--                    //  加时间戳--%>
<%--                    const date = new Date().getTime();--%>
<%--                    img.src = "verify-code?" + date;--%>
<%--                }--%>
<%--            }--%>
<%--        </script>--%>

        <nav>
            <a href="#" onclick="showRegister()">未拥有账号，去注册</a>
        </nav>

            <button type="submit" >Login</button>
    </form>
</section>

    <section id="register" style="display:none;">

        <form id="registerForm" action="<%request.getContextPath();%>/user/register">
            <h2>注册</h2>
            <label for="regUsername">Username:</label>
            <input type="text" id="regUsername" name="regUsername" required>

            <label for="regPassword">Password:</label>
            <input type="password" id="regPassword" name="regPassword" required>

<%--            <label>--%>
<%--                <input id="verifyCode" name="verifyCode" type="text" placeholder="输入验证码">--%>
<%--            </label>--%>
<%--            <img src="/verifyCode" alt="验证码" id="code">--%>
<%--            <a href="" id="change">看不清，换一张</a>--%>
<%--            <script>--%>
<%--                window.onload = function () {--%>
<%--                    //  获取图片对象--%>
<%--                    let img = document.getElementById("code");--%>
<%--                    //  获取超链接对象--%>
<%--                    let href = document.getElementById("change");--%>
<%--                    href.onclick = function () {--%>
<%--                        //  加时间戳--%>
<%--                        const date = new Date().getTime();--%>
<%--                        img.src = "verify-code?" + date;--%>
<%--                    }--%>
<%--                }--%>
<%--            </script>--%>

            <nav>
                <a href="#" onclick="showLogin()">注册完成，去登录</a>
            </nav>

            <button type="submit" >注册</button>
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


    // function register() {
    //     if (sessionStorage.getItem("register") === "FAILED"){
    //         alert("REGISTER FAILED!!!");
    //     }else if (sessionStorage.getItem("register") === "SUCCESS"){
    //         alert("REGISTER SUCCESSFULLY!")
    //     }
    //     sessionStorage.clear();
    // }
    //
    //
    // function login() {
    //     if (sessionStorage.getItem("login") === "FAILED"){
    //         sessionStorage.setItem("login", "FAILED")
    //         alert("LOGIN FAILED!!!");
    //     }
    //     sessionStorage.clear();
    // }
</script>

</body>
</html>

