<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../part/head.jspf"%>
<style>
main {
  height: 30px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.text {
  background: url(https://media.giphy.com/media/3o6Ztb45EYezY9x9gQ/giphy.gif);
  background-size: contain;
  background-position: top left;
  -webkit-background-clip: text;
  color: transparent;
  font-size: 30px;
  font-weight: bold;
  font-family: sans-serif;
}

h1 {
	margin-top: 20px;
}

h2 {
	color: crimson;
}

.option-list {
	
}

.option-list>li {
	padding-top: 10px;
}

body {
	font-family: "DH";
	height:1080px;
}
</style>
<img src="/resource/img/dvl_logo_v1.png" style="width: 100px;" />
<br />
<br />
<main>
  <div class="text">
    Daily Villain's
	<br />
<h5>알파 테스트 (v.0.4.1)</h5>
  </div>
</main>
<br />
<br />
<ul class="option-list h5 small">
	<li>- 관리자 모드[]</li>
	<a> 신고된 게시물 확인하기 /</a>
	<a> 회원 정지 /</a>
	<a> 회원 상태 보기 </a>
	<a> 중복신고 방지 기능[]</a>
	<li>- 임시 비밀번호 메일 발송하기[]</li>
	<li>- 댓글 신고기능[]</li>
	<li>- 게시물 수정[]</li>
	<li>- 레벨 별 기능 제한[]</li>
	<li>- 계정간 쪽지[]</li>
	<li>- 프로필 사진[]</li>
	<li>- 어카운트 정보 CSS[]</li>
</ul>

<%@ include file="../part/foot.jspf"%>