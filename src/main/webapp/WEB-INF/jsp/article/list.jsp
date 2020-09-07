<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../part/head.jspf" %>

<style>
.title {
	text-align:center;
	margin:30px;
}
.title >.name{
	text-decoration:none;
}
.table-box {
	
}
.table-box > table > thead {
	background-color:black;
	color:crimson;
	text-align-last:center;
}
</style>
<div class = "title">
	<a class="name">${board.name}</a>
</div>
<div class="table-box table-box-data con">
    <table>
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
                    <!--
                    <td class="visible-on-sm-down">
                        <a href="${article.getDetailLink(board.code)}" class="flex flex-row-wrap flex-ai-c">
                            <span class="badge badge-primary bold margin-right-10">${article.id}</span>
                            <div class="title flex-1-0-0 text-overflow-el">${article.forPrintTitle}</div>
                            <div class="width-100p"></div>
                            <div class="writer">${article.extra.writer}</div>
                            &nbsp;|&nbsp;
                            <div class="reg-date">${article.regDate}</div>
                        </a>
                    </td>
                    -->
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<div class="btn-box con margin-top-20">
    <a class="btn btn-primary" href="./${board.code}-write" style="background:crimson">글쓰기</a>
</div>

<%@ include file="../part/foot.jspf" %>