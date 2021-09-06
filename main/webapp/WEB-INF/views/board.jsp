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
					<%-- <c:forEach var="i" begin="0" end="${listSize}">
						<tr>
							<td><c:out value="${list[i].boardID}"/></td>
							<td>${list[i].boardID}</td>
							<td><a href="mainController/boardTitle/${list[i].boardID}">${list[i].boardTitle}</a></td>
							<td><a href="mainController/boardTitle?boardID=${list[i].boardID}">${list[i].boardTitle}</a></td>
							<td>${list[i].userID}</td>
							<td>${list[i].boardDate}</td>
						</tr>
					</c:forEach> --%>
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

			<%-- 
					<tr>
						<td><%=list.get(i).getBbsID()%></td>
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
		.replaceAll("\n", "<br>")%></td>
						<!-- 특수문자를 다르게 치환함으로써 보안문제(스크립트 삽입 해킹 공격을 방지)를 해결한다. -->
						<td><%=list.get(i).getUserID()%></td>
						<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
		+ list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
					</tr> 
					 --%>

			<c:if test="${pageNumber != 1}">
				<!-- pageNumber가 없으면 이전 버튼이안나온다. -->
				<a href="/boardApp/navBarBoard?pageNumber=${pageNumber - 1}"
					class="btn btn-success btn-arraw-left">이전</a>
			</c:if>
			<c:if test="${nextPage == true}">
				<a href="/boardApp/navBarBoard?pageNumber=${pageNumber + 1}"
					class="btn btn-success btn-arraw-right">다음</a>
				<%-- <c:set var="pageNumber" value="${pageNumber} + 1" /> --%>
			</c:if>

			<a href="/boardApp/boardWrite" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>