<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<div class="container">
    <div id="board-detail">
        <table class="table table-bordered">
            <div class="mt-5">
                <tr>
                    <td>${board.boardWriter}</td>
                    <td>${board.boardTitle}</td>
                    <td>${board.boardHits}</td>
                    <br>
                    <td>${board.createdAt}</td>
                    <br><br>
                    <td>${board.boardContents}</td>

                    <c:if test="${board.fileAttached == 1}">
                <tr>
                    <th>image</th>
                    <td>
                        <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFileName}"
                             alt="" width="100" height="100">
                    </td>
                </tr>
                </c:if>
                <td>
                    <button class="btn btn-primary" onclick="update_fn('${board.id}')">수정</button>
                </td>

                </tr>
            </div>
        </table>
    </div>
</div>
<div>
    <p id="writer-save"></p>
    <p id="comment-save"></p>
</div>
<div>
    <input id="commentWriter" name="commentWriter" placeholder="작성자" type="text">
    <input id="commentContents" name="commentContents" placeholder="내용" type="text">
    <input type="button" value="등록" onclick="comment_save()">
</div>


<%@include file="component/footer.jsp" %>
</body>
<script>
    const update_fn = (id) => {
        location.href = "/board/update?id=" + id;
    }

    const comment_save = () => {
        const writer = document.getElementById("commentWriter").value;
        const contents = document.getElementById("commentContents").value;
        const writerSave = document.getElementById("writer-save")
        const commentSave = document.getElementById("comment-save")
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {commentWriter: writer, commentContents: contents},
            success: function (res) {
                let result = ""
                "<table>";
                result += "<tr>";
                result += "<td>" + res.commentWriter + "</td>";
                let result2 = "<td>" + res.commentContents + "</td>";
                result2 += "</tr>";
                result2 += "</table>";
                writerSave.innerHTML = result;
                commentSave.innerHTML = result2;
            },

        })

    }
</script>
</html>
