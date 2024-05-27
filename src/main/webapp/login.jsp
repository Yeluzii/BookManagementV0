<%--
  Created by IntelliJ IDEA.
  User: yeluzi
  Date: 2024/5/27
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <title>图书管理系统</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            /*background-color: #f4f4f4;*/
            background-image: url("./images/IMG_5811(20240524-203904).JPEG");
        }

        header {
            background-color: #333;
            padding: 15px;
            text-align: center;
            color: #fff;
        }

        nav {
            background-color: #eee;
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
    <h1>网上图书商城</h1>
</header>

<nav>
    <a href="#" onclick="showHome()">首页</a> |
    <a href="#" onclick="showLogin()">登录</a> |
    <a href="#" onclick="showRegister()">注册</a>

</nav>

<section id="home" style="display:none;">
    <h2>图书管理系统</h2>
    <p>————————这是首页————————</p>
</section>

<section id="login" style="display:none;">
    <h2>登录</h2>
    <form id="loginForm" action="<%request.getContextPath();%>/login" method="post">
        <label for="loginUsername">Username:</label>
        <input type="text" id="loginUsername" name="loginUsername" required placeholder="请输入用户名">
        <span style="color:red;font-size: 13px;margin-left: -17px">${usernameError}</span>
        <label for="loginPassword">Password:</label>
        <input type="password" id="loginPassword" name="loginPassword" required placeholder="请输入密码 ">

        <button type="submit" onclick="login()">登录</button>
    </form>
</section>

<section id="register">
    <h2>注册</h2>
    <form id="registerForm" action="<%request.getContextPath();%>/register" method="post">
        <label for="regUsername">Username:</label>
        <input type="text" id="regUsername" name="regUsername" required placeholder="请输入用户名">

        <label for="regPassword">Password:</label>
        <input type="password" id="regPassword" name="regPassword" required placeholder="请输入密码">

        <label for="regPhone">Phone:</label>
        <input type="password" id="regPhone" name="regPhone" required placeholder="请输入电话号码">

        <label for="regAddress">Address:</label>
        <input type="password" id="regAddress" name="regAddress" required placeholder="请输入收货地址">

        <button type="submit" onclick="register()">注册</button>
    </form>
</section>

<script>
    function showHome() {
        document.getElementById("register").style.display = "none";
        document.getElementById("login").style.display = "none";
        document.getElementById("home").style.display = "block";
    }

    function showRegister() {
        document.getElementById("register").style.display = "block";
        document.getElementById("login").style.display = "none";
        document.getElementById("home").style.display = "none";
    }

    function showLogin() {
        document.getElementById("register").style.display = "none";
        document.getElementById("login").style.display = "block";
        document.getElementById("home").style.display = "none";
    }


    // function register() {
    //     // Implement registration logic here
    //     alert("Registration logic will go here!");
    // }
    //
    // function login() {
    //     // Implement login logic here
    //     alert("Login logic will go here!");
    //
    // }

</script>

</body>
</html>
