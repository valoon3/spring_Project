<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
</head>

<body>
	<nav class="navbar navbar-default">
		<!-- 네비게이션 바 -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<!-- 화면 우측상단의 버튼 -->
				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/boardApp/main">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="/boardApp/main">메인</a></li>
				<li><a href="/boardApp/navBarBoard">게시판</a></li>
				<!-- <li><a href="/boardApp/navBarBoard">전자우편</a></li>
				<li><a href="/boardApp/navBarBoard">일정관리</a></li> -->
			</ul>
			<c:if test='${empty userVO}'>	
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><A href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></A>
						<ul class="dropdown-menu">
							<li><a href="/boardApp/navBarLogin">로그인</a></li>
							<!-- active : 선택되었음을 의미한다 -->
							<!-- <li class="active"><a href="mainController/navBarJoin.jsp">회원가입</a></li> -->
							<li><a href="/boardApp/navBarJoin">회원가입</a></li>
						</ul></li>
				</ul>
			</c:if>

			<c:if test='${!empty userVO}'>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><A href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></A>
						<ul class="dropdown-menu">
							<li><a href="/boardApp/logOut">로그아웃</a></li>
							<li><a href="/boardApp/myPage">마이페이지</a></li>
						</ul></li>
				</ul>
			</c:if>

		</div>
	</nav>
</body>
</html>