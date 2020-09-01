<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="아이디 찾기" />
<%@ include file="../part/head.jspf"%>

<script>
	var MemberFindIdForm__submitDone = false;
	function MemberFindIdForm__submit(form) {
		if (MemberFindIdForm__submitDone) {
			alert('처리중입니다.');
			return;
		}
		
		form.name.value = form.name.value.trim();

		if (form.name.value.length == 0) {
			form.name.focus();
			alert('이름을 입력해주세요.');
			return;
		}
		
		form.email.value = form.email.value.trim();

		if (form.email.value.length == 0) {
			form.email.focus();
			alert('이메일을 입력해주세요.');
			return;
		}

		form.submit();
		MemberFindIdForm__submitDone = true;
	}
</script>
<form method="POST" class="table-box con form1" action="doFindId" onsubmit="MemberFindIdForm__submit(this); return false;">
	<input type="hidden" name="redirectUri" value="${param.redirectUri}">

	<table>
		<colgroup>
			<col width="70">
		</colgroup>
		<tbody>
			<tr>
				<th>이름</th>
				<td>
					<div class="form-control-box">
						<input type="text" placeholder="로그인 아이디 입력해주세요." name="name" maxlength="30" autofocus="autofocus" />
					</div>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<div class="form-control-box">
						<input type="email" placeholder="이메일을 입력해주세요." name="email" maxlength="50" />
					</div>
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<button class="btn btn-primary" type="submit">찾기</button>
					<button class="btn btn-info" onclick="history.back();" type="button">취소</button>
				</td>
			</tr>
		</tbody>
	</table>
</form>

<%@ include file="../part/foot.jspf"%>