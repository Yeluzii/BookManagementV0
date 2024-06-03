<%@ page import="java.util.List" %>
<%@ page import="top.cjw.bookmanagementv0.entity.Book" %><%--
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
    <title>BookList</title>
</head>
<body>

<jsp:include page="header.jsp"/>

<div>

<%--    <%--%>
<%--        List<Book> list = (List<Book>) request.getAttribute("bookList");--%>
<%--        for (Book book : list) {--%>
<%--    %>--%>

<%--    <span>--%>
<%--        <img class="img1" src=" <%=book.getCover() %>" alt="无法识别图片">--%>
<%--        <br>--%>
<%--        <%=book.getName()%>|库存：<%=book.getCount()%>本--%>
<%--    </span>--%>

<%--    <%--%>
<%--        }--%>
<%--    %>--%>
<%--</div>--%>

    <div>
        <c:forEach items="${bookList}" var="book">
        <span>
            <img class="img1" src="${book.cover}" alt="无法识别图片">
            <br>
            ${book.name}|库存：${book.count}本
            <a href="<%request.getContextPath();%>/book/borrow?bId=${book.bookId}">借阅</a>
        </span>
        </c:forEach>
    </div>

</body>
</html>
