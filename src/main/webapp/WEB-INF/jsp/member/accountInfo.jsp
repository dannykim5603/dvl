<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../part/head.jspf"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<style>
.input {
	margin-top: 10px;
}
.accountInfo {
	text-align:center;
	border: double 2px black;
}
</style>

<table class="accountInfo">
	<colgroup>
		<col width="70">
	</colgroup>
	<tbody>
		<tr>
			<th>아이디</th>
			<td>${member.loginId}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${member.name}</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>${member.nickname}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${member.email}</td>
		</tr>
		<tr>
			<th>휴대폰</th>
			<td>${member.phoneNo}</td>
		</tr>
		<tr>
			<th></th>
			<td class="flex">
				<form method="POST" class="table-box con form1"
					action="deleteAccount"
					onsubmit="MemberModifyForm__submit(this); return false;">
					<button class="btn btn-primary" type="submit">회원탈퇴</button>
				</form>
				<button class="btn btn-info" type="button" onclick="history.back();">취소</button>
			</td>
		</tr>
	</tbody>
</table>

<%@ include file="../part/foot.jspf"%>