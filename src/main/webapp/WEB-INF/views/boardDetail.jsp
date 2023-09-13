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
                        <c:forEach items="${boardFileList}" var="boardFile">
                            <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFileName}"
                                 alt="" width="100" height="100">
                        </c:forEach>
                    </td>
                </tr>
                </c:if>
                <td>
                    <button onclick="board_list()">목록</button>
                    <button class="btn btn-primary" onclick="update_fn('${board.id}')">수정</button>
                </td>

                </tr>
            </div>
        </table>
    </div>
</div>

<div id="comment-write-area">
    <input id="comment-writer" name="commentWriter" placeholder="작성자" type="text">
    <input id="comment-contents" name="commentContents" placeholder="내용" type="text">
    <input type="button" value="등록" onclick="comment_write()">
</div>
<div id="comment-list-area">
    <c:choose> <%-- choose,when,otherwise = if/else문과 같은 기능   --%>
        <c:when test="${commentList == null}">
            <h3>작성 된 댓글이 없습니다.</h3>
        </c:when>
        <c:otherwise>
            <table id="comment-list">
                <tr>
                    <th>작성자</th>
                    <th>내용</th>
                    <th>작성시간</th>
                </tr>
                <c:forEach items="${commentList}" var="comment">
                    <tr>
                        <td>${comment.commentWriter}</td>
                        <td>${comment.commentContents}</td>
                        <td>${comment.createdAt}</td>
                        <td></td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
</div>

<%@include file="component/footer.jsp" %>
</body>
<script>
    const board_list = () => {
        const page = '${page}';
        location.href = "/board/list?page=" + page;
    }

    const update_fn = (id) => {
        location.href = "/board/update?id=" + id;
    }

    const comment_write = () => {
        const writer = document.getElementById("comment-writer").value;
        const contents = document.querySelector("#comment-contents").value;
        const boardId = '${board.id}';
        const result = document.getElementById("comment-list-area")
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                commentWriter: writer,
                commentContents: contents,
                boardId: boardId
            },
            success: function (res) {
                console.log("리턴값 : ", res)
                let output = "<table id=\"comment-list\">\n" +
                    "    <tr>\n" +
                    "        <th>작성자</th>\n" +
                    "        <th>내용</th>\n" +
                    "        <th>작성시간</th>\n" +
                    "    </tr>\n";
                for (let i in res) {
                    output += "    <tr>\n";
                    output += "        <td>" + res[i].commentWriter + "</td>\n";
                    output += "        <td>" + res[i].commentContents + "</td>\n";
                    output += "        <td>" + res[i].createdAt + "</td>\n";
                    output += "    </tr>\n";
                }
                output += "</table>";
                result.innerHTML = output;
                // innerHTML = 해당 부분의 내용에 덮어쓰기가 됨.
                // model = 이름을 다르게하면 하나의 메서드에서도 model을 여러번 쓸 수있음.
                document.getElementById("comment-writer").value = "";
                document.getElementById("comment-contents").value = "";
            },
            error: function () {
                console.log("댓글 작성 실패")
            }

        })

    }
</script>
</html>
