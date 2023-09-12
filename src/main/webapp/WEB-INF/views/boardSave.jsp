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

<form action="/board/save" method="post" enctype="multipart/form-data">
    작성자 : <input type="text" name="boardWriter" placeholder="작성자"> <br>
    비밀번호 : <input type="text" name="boardPass" placeholder="비밀번호"> <br>
    제목 : <input type="text" name="boardTitle" placeholder="제목"> <br>
    글내용 : <input type="text" name="boardContents" placeholder="글내용"> <br>
    <input type="file" name = "boardFile"> <br>
    <input type="submit" value="글작성">
</form>

<%@include file="component/footer.jsp" %>
</body>
</html>
