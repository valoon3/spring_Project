<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹사이트</title>
<Style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}
</Style>

</head>

<body>
	<%@ include file="navBar.jsp"%>
		
		<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="/boardApp/myPageUserUpdate">
					<h3 style="text-align: center;">회원정보 수정</h3>
					<div class="form-group">
						<input type="text" class="form-control" value="${userVO.userID}"  name="userID" maxlength="20" width="10" > 
						<input type="button" value="중복 확인" onclick="openIdChk()">
						<input type="hidden" name="idDuplication" value="idUncheck">	
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="비밀번호 : ${userVO.userPassword}" name="userPassword" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름 : ${userVO.userName}" name="userName" maxlength="20">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active">
								<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
							</label>
							<label class="btn btn-primary">
								<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
							</label>
						</div>
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일 : ${userVO.userEmail }" name="userEmail" maxlength="20">
						<c:if test="${!empty nullError}">
									<span style="color:red">${nullError}</span>
						</c:if>
					</div>
					<input type="submit" class="btn btn-primary form-control" value="회원정보 수정">
				</form>
				<h1></h1>
				<form action="/boardApp/myPageUserDelete" method="post">
					<input type="submit" class="btn btn-primary form-control" value="회원탈퇴">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	
	
	 <div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<!-- 테이블의 제목부분 -->
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="boardList" items="${boardList}" >
						<tr>
							<td>${boardList.boardID }</td>
							<td><a href="/boardApp/boardTitle?boardID=${boardList.boardID}&&pageNumber=${pageNumber}">${boardList.boardTitle }</a></td>
							<td>${boardList.userID }</td>
							<td>${boardList.boardDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


			<a href="/boardApp/boardWrite" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	
	
	
	
	
	<%-- <div class="container">
	<h1>내가 쓴글</h1>
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead><!-- 테이블의 제목부분 -->
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getMyList(pageNumber, userID);
						for(int i=0; i< list.size(); i++){
					%>
						<tr>
							<td><%= list.get(i).getBbsID() %></td>
							<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
							<!-- 특수문자를 다르게 치환함으로써 보안문제(스크립트 삽입 해킹 공격을 방지)를 해결한다. -->
							<td><%= list.get(i).getUserID() %></td>
							<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
						--%>
	
	
	
	
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>