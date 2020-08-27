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
		<img src="/resource/img/dvl_logo_v1.png" style="width:100px;"/>
<h2 style="background-color:black"> > Daily VilLains < </h2>
<h1> 알파 테스트 (v.0.0.1.6)</h1>
	<ul class="option-list">
		<li>- 회원가입[o]</li>
		<li>- 로그인[o]</li>
		<li>- 로그아웃[o]</li>
		<li>- 로그인, 로그아웃시 자동 페이지 새로고침[o]</li>
		<li>- 회원정보 수정[o]</li>
		<li>- 이름, 이메일 입력시 아이디 찾기[폼만 구현, 스킵(왜안되는지 모르겠음)]</li>
		<li>- 가입시 감사메일 발송[o]</li>
		<li>- 자유 공지 게시판[o]</li>
		<li>- 자유 공지 게시물 리스트[o]</li>
		<li>- 공지/자유게시물 상세페이지[ ]</li>
		<li>- 자유 공지 게시물 작성[ ]</li>
		<li>- 공지/자유게시물 작성시 이미지 파일 첨부[ ]</li>
		<li>- 공지/자유게시물 상세페이지에서 첨부된 이미지파일이 있다면 노출[ ]</li>
		<li>- 회원탈퇴 (delStatus 를 1로 , 해당 아이디로 다른 사람이 새로 가입할 수 없다.)[ ]</li>
		<li>- 리팩토링<br>
			<a href="">-중복된 로직 제거 </a>
			<a href="">-지저분한 소스코드 정리 </a>
			<a href="">-변수명 함수명을 좀 더 일관성 있고 직관적으로 변경 </a>
			<a href="">-테스트 </a>
			<a href="">-DB 인덱스 전략 재확인 </a>
		</li>
		<li>- 회원가입시 아이디 중복검사를 ajax로 처리<br>
			<a href="">-lodash의 debounce 적용하여 최적화 (ajax 통신횟수를 극도로 줄이기) </a>
			<a href="">-아이디 입력란이 비어 있다면 메세지도 없어야 함 </a>
		</li>
		<br>
		<br>
	</ul>
	
	
<%@ include file="../part/foot.jspf" %>