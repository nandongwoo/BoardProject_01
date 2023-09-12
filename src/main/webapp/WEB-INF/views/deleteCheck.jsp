<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<%@include file="component/nav.jsp" %>
<form action="/board/check" method="post" name = "deleteform">
    <h1>삭제 비밀번호 입력</h1>
    <input name="id" type="hidden" value='${board.id}'>
    <input id="boardPass" type="text" placeholder="비밀번호">
    <input type="button" onclick="check_fn()" value="확인">
</form>
<%@include file="component/footer.jsp" %>
</body>
<script>
    const check_fn = () => {
        const check = document.getElementById("boardPass").value;
        console.log(check)
        if(check==${board.boardPass}){
            document.deleteform.submit();
        }else {
            alert("비밀번호를 확인하세요")
        }

    }
</script>
</html>
