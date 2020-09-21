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
</style>
<img src="/resource/img/dvl_logo_v1.png" style="width: 100px;" />
<br />
<br />
<main>
  <div class="text">
    Daily Villain's
<br />
<h5>알파 테스트 (v.0.3.6)</h5>
  </div>
</main>
<br />
<br />
<ul class="option-list">
	<li>- 관리자 모드[]</li>
	<li>- 게시물 신고기능[]</li>
	<li>- 댓글 신고기능[]</li>
	<li>- 레벨 별 기능 제한[]</li>
	<li>- 실시간 채팅[]</li>
	<li>- 계정간 쪽지[]</li>
	<li>- 프로필 사진[]</li>
	<li>- 이름, 이메일 입력시 아이디 찾기[△, 폼만 구현, 스킵(왜안되는지 모르겠음)]</li>
	
	<br>
	<br>
</ul>

<%@ include file="../part/foot.jspf"%>