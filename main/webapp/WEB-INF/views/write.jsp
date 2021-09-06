<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹사이트</title>
<c:if test="${!empty NullError}">
		<script>
		window.onload=function(){
			alert("${NullError}");
		}
		</script>
	</c:if>


</head>
<body>
	<%@ include file="navBar.jsp" %>
	<div class="container">
		<div class="row">
		<c:if test="${empty boardVO}">
					<form method="post" action="/boardApp/boardWriteComplete">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead><!-- 테이블의 제목부분 -->
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="boardTitle" maxlength="50"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="boardContent" maxlength="2048" style="height: 350px;"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
		</form>
		</c:if>
		
		<c:if test="${!empty boardVO}">
		<form method="post" action="/boardApp/editComplete?boardID=${boardVO.boardID}">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead><!-- 테이블의 제목부분 -->
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 수정 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" name="boardTitle" maxlength="50" value="${boardVO.boardTitle}"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" name="boardContent" maxlength="2048" style="height: 350px;">${boardVO.boardContent}</textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
		</form>
		</c:if>
		

		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>