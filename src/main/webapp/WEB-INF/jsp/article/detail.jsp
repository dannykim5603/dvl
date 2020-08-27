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
    	
    </table>
</div>
<div class="btn-box con margin-top-20">
    <a class="btn btn-primary" href="./${board.code}-write">글쓰기</a>
</div>

<%@ include file="../part/foot.jspf" %>