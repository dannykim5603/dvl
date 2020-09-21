<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../part/head.jspf" %>

<style>
.title {
	text-align:center;
	margin:30px;
}
.title >.name {
	text-decoration:none;
}
.body {
	height:100%;
}
.table-box {

}


.table-box > table > thead {
	background-color:#343a40;
	color:crimson;
	text-align-last:center;
	border-top:none;
}

.table-box > table > tbody{
	text-align-last:center;
}

table {
	border:3px double rgba(0,0,0,0.1);
}

table > tbody > tr > td > a{
	text-decoration:none;
	color:black;
}

table > tbody > tr > td > a:hover {
	text-decoration:none;
	color:crimson;
}

</style>
<div class = "title">
	<h1>${board.name}</h1>
</div>
<div class="table-box table-box-data con">
    <table class="">
        <colgroup>
            <col width="100" />
            <col width="200" />
            <col width="700" />
        </colgroup>
        <thead>
            <tr>
                <th>번호</th>
                <th>날짜</th>
                <th>제목</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${articles}" var="article">
                <tr>
                    <td>${article.id}</td>
                    <td>${article.regDate}</td>
                    <td>
                        <a href="${article.getDetailLink(board.code)}" class="block width-100p text-overflow-el">${article.forPrintTitle}</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<div class="btn-box con margin-top-20">
	<c:if test="${board.id == '2'}">
		<c:if test="${member.level == 10}">
   		<a class="btn btn-primary" href="./${board.code}-write" style="background:crimson">글쓰기</a>
		</c:if>
	</c:if>
	<c:if test="${board.code != 'notice'}">
    <a class="btn btn-primary" href="./${board.code}-write" style="background:crimson">글쓰기</a>
	</c:if>
</div>

<%@ include file="../part/foot.jspf" %>