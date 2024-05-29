<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<ul>--%>

<%--    <c:forEach var="student" items="${students}">--%>

<%--        <li>--%>

<%--            Name: ${student.name}, Score: ${student.score}--%>

<%--        </li>--%>

<%--    </c:forEach>--%>

<%--</ul>--%>
————————————————————————————————————————————————————————————————————
//循环输出全部图书
<div>

    <c:forEach var="book" items="${Book}">
        <span>
            <img class="img1" src="${book.cover}" alt="无法识别图片">
            ${book.name}

        </span>
    </c:forEach>
</div>
