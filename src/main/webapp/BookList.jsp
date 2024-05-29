<%--
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
<jsp:include page="header.jsp">
    <jsp:param name="title" value="BookList"/>
</jsp:include>

<div>
    <c:forEach  items="${book-list}" var="book" >
        <span>
            <img class="img1" src="${book.cover}" alt="无法识别图片">
            ${book.name}
        </span>
    </c:forEach>
</div>

</body>
</html>
