<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../part/head.jspf" %>
<style>
	body {
		text-align:center; 
	}
	h1 {
		margin-top:20px;
	}
	h2 {
		color:crimson;
	}
	.option-list {
	}
	.option-list > li {
		padding-top:10px;
	}
</style>
<h1> 알파 테스트 (v.0.0.1.4)</h1>
<h1 style="color:red"> 데빌런</h1>
<h2 style="background-color:black"> Daily VilLains</h2>
	<ul class="option-list">
		<li>회원가입[o]</li>
		<li>로그인[o]</li>
		<li>로그아웃[o]</li>
		<li>로그인, 로그아웃시 자동 페이지 새로고침[o]</li>
		<li>회원정보 수정[o]</li>
		<li>이름, 이메일 입력시 아이디 찾기[ ]</li>
		<li>가입시 감사메일 발송[ ]</li>
		<li>자유 공지 게시판[ ]</li>
		<li>자유 공지 게시물 리스트/작성[ ]</li>
	</ul>
	
	
<%@ include file="../part/foot.jspf" %>