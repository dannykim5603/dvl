<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../part/head.jspf" %>

<style>
.form1 {
	padding-bottom:30px;
}
.title {
	text-align:center;
	margin:30px;
}
.title >.name{
	text-decoration:none;
	color:crimson;
	letter-spacing:-3px;
}
.table-box {
	
}
.table-box > table > thead {

}
.table-box > tbody > tr > th {

}
.article-detail-box >.tr {
	background-color:black;
	color:crimson;
	text-align-last:center;
}
.article-detail-box > .td {
	text-align:center;
}
</style>
<div class = "title">
	<a class="name">${board.name} 게시판</a>
</div>
<div class="article-detail-box table-box table-box-vertical con">

	<div class ="tr">
	<h3>제목</h3>
	</div>
	
	<div class="td">
	<h3>${article.title}</h3>
	</div>
	
	<div class ="tr">
	<h4>번호 / 날짜</h4>
	</div>
	
	<div class="td">
	<h4>${article.id} / ${article.regDate}</h4>
	</div>
	
	<div class ="tr">
	<h3>내용</h3>
	</div>
	
	<div class="td">
	<h2>${article.body}</h2>
	</div>
	
	<table>
		<colgroup>
			<col class ="table-first-col"/>
		</colgroup>
		<tbody>
			<tr>
				<th>번호</th>
				<td>${article.id}</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${article.regDate}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${article.title}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${article.body}</td>
			</tr>
			<tr>
				<c:forEach var="i" begin="1" end="3" step="1">
					<c:set var="fileNo" value="${String.valueOf(i)}" />
					<c:set var="file" value="${article.extra.file__common__attachment[fileNo]}"/>
					<c:if test="${file != null}">
						<tr>
							<th>첨부파일 ${fileNo}</th>
							<td>
								<c:if test="${file.fileExtTypeCode == 'video'}">
									<div class="video-box">
										<video controls src="/usr/file/streamVideo?id=${file.id}&updateDate=${file.updateDate}"></video>
									</div>
								</c:if>
								<c:if test ="${file.fileExtTypeCode == 'img'}">
									<div class="img-box img-box-auto">
										<img src="/usr/file/img?id=${file.id}&updateDate=${file.updateDate}" alt="" />
									</div>
								</c:if>
							</td>	
						</tr>
					</c:if>
				</c:forEach>
			</tr>
		</tbody>
	</table>
</div>

<%@ include file="../part/foot.jspf" %>