<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../part/head.jspf"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<script>
	var MemberModifyForm__submitDone = false;
	function MemberModifyForm__submit(form) {
		if (MemberModifyForm__submitDone) {
			alert('처리중입니다.');
			return;
		}

		form.loginPw.value = form.loginPw.value.trim();

		if (form.loginPw.value.length == 0) {
			form.loginPw.focus();
			alert('로그인 비밀번호를 입력해주세요.');

			return;
		}

		if (form.loginPw.value.length < 5) {
			form.loginPw.focus();
			alert('로그인 비밀번호를 5자 이상 입력해주세요.');

			return;
		}

		if (form.loginPwConfirm.value.length == 0) {
			form.loginPwConfirm.focus();
			alert('로그인 비밀번호 확인을 입력해주세요.');

			return;
		}

		if (form.loginPw.value != form.loginPwConfirm.value) {
			form.loginPwConfirm.focus();
			alert('로그인 비밀번호 확인이 일치하지 않습니다.');

			return;
		}

		form.nickname.value = form.nickname.value.trim();

		if (form.nickname.value.length == 0) {
			form.nickname.focus();
			alert('닉네임을 입력해주세요.');

			return;
		}

		form.email.value = form.email.value.trim();

		if (form.email.value.length == 0) {
			form.email.focus();
			alert('이메일을 입력해주세요.');

			return;
		}

		form.cellphoneNo.value = form.cellphoneNo.value.trim();
		form.cellphoneNo.value = form.cellphoneNo.value.replaceAll('-', '');
		form.cellphoneNo.value = form.cellphoneNo.value.replaceAll(' ', '');

		if (form.cellphoneNo.value.length == 0) {
			form.cellphoneNo.focus();
			alert('휴대전화번호를 입력해주세요.');

			return;
		}

		if (form.cellphoneNo.value.length < 10) {
			form.cellphoneNo.focus();
			alert('휴대폰번호를 10자 이상 입력해주세요.');

			return;
		}

		if (isCellphoneNo(form.cellphoneNo.value) == false) {
			form.cellphoneNo.focus();
			alert('휴대전화번호를 정확히 입력해주세요.');
		}

		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';
		form.loginPwConfirm.value = '';

		form.submit();
		MemberModifyForm__submitDone = true;
	}
</script>

<style>
input {
	text-align:center;
	width: 50%;
	margin-bottom: 10px;
	background: rgba(0, 0, 0, 0.3);
	outline: none;
	padding: 10px;
	font-size: 13px;
	color: #fff;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.3);
	border: 1px solid rgba(0, 0, 0, 0.3);
	border-radius: 4px;
	box-shadow: inset 0 -5px 45px rgba(100, 100, 100, 0.2), 0 1px 1px
		rgba(255, 255, 255, 0.2);
	transition: box-shadow .5s ease;
}

input:focus {
	box-shadow: inset 0 -5px 45px rgba(100, 100, 100, 0.4), 0 1px 1px
		rgba(255, 255, 255, 0.2);
}

h5 {
	text-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	letter-spacing: 1px;
	text-align: center;
	font-size: medium
}

h5 small {
	text-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	letter-spacing: 1px;
	text-align: center;
	font-size: small
}
</style>

<form method="POST" class="modify-box" action="doModify" onsubmit="MemberModifyForm__submit(this); return false;">
	<input type="hidden" name="redirectUri" value="/usr/member/login">
	<input type="hidden" name="id" value="${id}"> 
	<input type="hidden" name="loginPwReal">

	<h5>로그인 비번</h5>
	<div class="form-control-box">
		<input type="password" placeholder="로그인 비밀번호를 입력해주세요." name="loginPw"/>
	</div>
	<h5>로그인 비번 확인</h5>
	<div class="form-control-box">
		<input type="password" placeholder="로그인 비밀번호 확인을 위해 입력해주세요." name="loginPwConfirm"/>
	</div>
	<h5>닉네임</h5>
	<div class="form-control-box">
		<h5 small>기존 닉네임 : ${member.nickname}</h5 small>
		<input class="input" type="text" placeholder="활동명 입력해주세요."
			name="nickname"/>
	</div>
	<h5>이메일</h5>
	<div class="form-control-box">
		<h5 small>현재 이메일 : ${member.email}</h5 small>
		<input class="input" type="email" placeholder="이메일 입력해주세요."
			name="email" />
	</div>
	<h5>휴대폰</h5>
	<div class="form-control-box">
		<h5 small>현재 번호 : ${member.phoneNo}</h5 small>
		<input class="input" type="tel" placeholder="휴대전화번호를 입력해주세요."
			name="cellphoneNo" />
	</div>
	<button class="btn btn-primary" type="submit">수정</button>
	<button class="btn btn-info" type="button" onclick="history.back();">취소</button>
</form>

<%@ include file="../part/foot.jspf"%>