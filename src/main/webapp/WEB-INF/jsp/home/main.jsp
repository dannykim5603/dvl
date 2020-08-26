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
<h1> 알파 테스트 (v.0.0.1.6)</h1>
<h1 style="color:red"> 데빌런</h1>
<h2 style="background-color:black"> > Daily VilLains < </h2>
	<ul class="option-list">
		<li>회원가입[o]</li>
		<li>로그인[o]</li>
		<li>로그아웃[o]</li>
		<li>로그인, 로그아웃시 자동 페이지 새로고침[o]</li>
		<li>회원정보 수정[o]</li>
		<li>이름, 이메일 입력시 아이디 찾기[폼만 구현, 스킵]</li>
		<li>가입시 감사메일 발송[o]</li>
		<li>자유 공지 게시판[ ]</li>
		<li>자유 공지 게시물 리스트/작성[ ]</li>
		<li>공지/자유게시물 작성시 이미지 파일 첨부[ ]</li>
		<li>공지/자유게시물 상세페이지[ ]</li>
		<li>공지/자유게시물 상세페이지에서 첨부된 이미지파일이 있다면 노출[ ]</li>
		<li>회원탈퇴 (delStatus 를 1로 , 해당 아이디로 다른 사람이 새로 가입할 수 없다.)[ ]</li>
	</ul>
	
	
<%@ include file="../part/foot.jspf" %>