<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
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
</head>
<body>
	<c:if test="${empty post}">
		<script>
			alert('유효하지 않은 글입니다.')
			location.href = '/boardApp/navBarBoard'
		</script>
	</c:if>
	<%@ include file="navBar.jsp" %>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead><!-- 테이블의 제목부분 -->
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글보기 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글제목</td>
						<td colspan="2">${post.boardTitle}</td>
					</tr> 
					<tr>
						<td>작성자</td>
						<td colspan="2">${post.userID}</td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2">${post.boardDate}</td><%-- <%= //bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(14, 16) + "분" %> --%>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;">${post.boardContent}</td>
						<%-- <%= //bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %> --%>
						
						<!-- html은 특수문자 입력방식이 다르기 때문에 해결을 위해서 replaceAll 을 사용해야한다.  -->
					</tr>
				</tbody>
			</table>
			<a href="/boardApp/navBarBoard?pageNumber=${pageNumber}" class="btn btn-primary">목록</a>
			<c:if test="${!empty userVO && post.userID == userVO.userID}">
				<a href="/boardApp/editWrite?boardID=${post.boardID}" class="btn btn-primary">수정</a>
				<a onclick="return confirm('정말로 삭제하시겠습니까')"  href="/boardApp/delete?boardID=${post.boardID}" class="btn btn-primary">삭제</a>
			</c:if>
					
	
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>