<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<div class="section">
    <div id="board-detail">
        <div class="mt-5">
            <form action="/board/update" method="post" name = "updateForm">
                <input name = "id" type = "hidden" value="${board.id}">
                <input name="boardTitle" value="${board.boardTitle}" type="text">
                <input name="boardContents" value="${board.boardContents}" type="text">
                <input id="boardPass" placeholder="비밀번호 입력" type="text">
                <input type="button" onclick="check_fn('${board.boardPass}')" value="수정">
            </form>
        </div>
    </div>
</div>
<%@include file="component/footer.jsp" %>
</body>
<script>
    const check_fn = () => {
        const passInput = document.getElementById("boardPass").value;
        if ('${board.boardPass}' == passInput) {
            document.updateForm.submit();

        } else {
            alert("비밀번호가 일치하지 않습니다!");
        }

    }

</script>
</html>
