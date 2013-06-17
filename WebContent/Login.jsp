<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	 <!-- bootstrap -->
	<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
	<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	 <!-- jq CDN -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
	<!-- jstl core -->
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
 <jsp:include page="rows/8rows.html"/>
<div align="center">
	<form class="form-inline" method="POST" action='<%= response.encodeURL("j_security_check")%>'>
		<c:if test='${not empty param["Retry"]}'>
			<div class="alert">
				You are kidding me.. You dont even remember your Name/Password.. <a class="close" onclick="$('.alert').hide()">x</a>
			</div>			
		</c:if>
			<input type="text" name="j_username" class="input-small" placeholder="name">
			<input type="password" name="j_password" class="input-small" placeholder="password">
		<button type="submit" class="btn">Sing In</button>
	</form>
</div>


</body>
</html>