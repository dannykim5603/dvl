<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../part/head.jspf"%>
<%@ include file="../part/toastuiEditor.jspf"%>

<style>
.form1 {
	padding-bottom: 30px;
}

.title {
	text-align: center;
	margin: 30px;
}

.title>.name {
	text-decoration: none;
	color: crimson;
	letter-spacing: -3px;
}

.table-box {
	
}

.table-box>table>thead {
	
}

.table-box>table th, .table-box>table>th {
	background: #111111;
	color: crimson;
	text-align: center;
}

.article-detail-box {
	margin-top: 150px;
}

.article-detail-box>.tr {
	background-color: black;
	color: crimson;
	text-align-last: center;
}

.article-detail-box>.td {
	text-align: center;
}

.button {
	margin-top: 30px;
	text-align: center;
}
</style>
<div class="title">
	<a class="name">${board.name} 게시판</a>
</div>
<div class="article-detail-box table-box table-box-vertical con">

	<table>
		<colgroup>
			<col class="table-first-col" />
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
				<td><script type="text/x-template">${article.body}</script>
					<div class="toast-editor toast-editor-viewer"></div></td>
			</tr>
			<tr>
				<c:forEach var="i" begin="1" end="3" step="1">
					<c:set var="fileNo" value="${String.valueOf(i)}" />
					<c:set var="file" value="${article.extra.file__common__attachment[fileNo]}" />
					<c:if test="${file != null}">
						<tr>
							<th>첨부파일 ${fileNo}</th>
							<td>
								<c:if test="${file.fileExtTypeCode == 'video'}">
									<div class="video-box">
										<video controls	src="/usr/file/streamVideo?id=${file.id}&updateDate=${file.updateDate}"></video>
									</div>
								</c:if> 
								<c:if test="${file.fileExtTypeCode == 'img'}">
									<div class="img-box img-box-auto">
										<img src="/usr/file/img?id=${file.id}&updateDate=${file.updateDate}" alt="" />
									</div>
								</c:if>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<th>비고</th>
				<td>
				<c:if test="${article.extra.actorCanModify}">
						<a class="btn btn-info"	href="${board.code}-modify?id=${article.id}&listUrl=${Util.getUriEncoded(listUrl)}">수정</a>
				</c:if>
				<c:if test="${article.extra.actorCanDelete}">
						<a class="btn btn-danger" href="${board.code}-delete?id=${article.id}" onclick="if ( confirm('삭제하시겠습니까?') == false ) return false;">삭제</a>
				</c:if>
				</td>
			</tr>
		</tbody>
	</table>

	<div class="btn-box con margin-top-20" style="float: right">
		<a href="${listUrl}" class="btn btn-info">목록</a>
	</div>


</div>

<%@ include file="../part/foot.jspf"%>