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
            <col width="200" />
        </colgroup>
        <thead>
            <tr>
                <th>번호</th>
                <th>아이디</th>
                <th>가입일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${members}" var="member">
                <tr>
                    <td>${member.id}</td>
                    <td><a href="${member.getProfileLink(member.loginId)}">${member.loginId}</a></td>
                    <td>${member.regDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<%@ include file="../part/foot.jspf" %>