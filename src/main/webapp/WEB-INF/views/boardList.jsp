<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<%@include file="component/header.jsp" %>
<%@include file="component/nav.jsp" %>
<br>
<c:forEach items="${boardList}" var="board">
    <tr>
        <td>${board.boardWriter}</td>
        <td>${board.boardTitle}</td>
        <td>${board.boardHits}</td>

        <td>
            <button class="btn btn-primary" onclick="detail_fn('${board.id}')">조회</button>
            <button class="btn btn-primary" onclick="delete_fn('${board.id}')">삭제</button>

        </td>
    </tr>
    <br>
</c:forEach>
<%@include file="component/footer.jsp" %>
</body>
<script>
    const detail_fn = (id) => {
        location.href = "/board/detail?id=" + id;
    }
    const delete_fn = (id) => {
        location.href = "/board/check?id=" + id;
    }
</script>
</html>
