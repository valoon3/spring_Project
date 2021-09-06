<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<c:if test="${!empty loginError}">
		<Script>
			window.onload=function(){
				alert("${loginError}");
			}
			
		</Script>
	</c:if>
	<%@ include file="navBar.jsp" %>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="/boardApp/navBarLogin">
					<h3 style="text-align: center;">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
						<c:if test="${!empty userIDError}">
							<span style="color:red">${userIDError}</span>
						</c:if>
					</div>
					
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
						<%-- <c:if test="${!empty userPasswordError}">
							<script>
								window.onload=function(){
									alert('비밀번호가 틀렸습니다.');
								}
							</script>
						</c:if> --%>
							<c:if test="${!empty userPasswordError}">
								<span style="color:red">${userPasswordError}</span>
							</c:if>
					</div>
					<input id="btnLogin" type="submit" class="btn btn-primary form-control" value="로그인">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>