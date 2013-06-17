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
<!-- core JSTL -->
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- format -->
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
</head>
<body>
<div class="row-fluid">
 	<div class="row-fluid">
		<div class="span"></div>
		<div class="span2">
			<a href="Home.html" class="btn btn-large btn-block">Home</a>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12"></div>
	</div>
</div>
<table class="table table-hover table-condensed">
	<thead>
		<tr>
			<th>Name</th>
			<th>D.o.b.</th>
			<th>Status</th>
			<th>Actor</th>
			<th>Actress</th>
			<th>Cuisine</th>
			<th>Destination</th>
			<th>Ideal</th>
			<th>Profession</th>
			<th>Address</th>
			<th>Crush</th>
			<th>Bike</th>
			<th>Email</th>
		</tr>
	</thead>

	<tbody>
 		<c:forEach items="${userList}" var="user">
			<tr>
				<td>
					<c:out value="${user.name}"/>
				</td>
				<td>
					<fmt:formatDate pattern="dd MMM''yy" value="${user.DOB}" />
				</td>
				<td>
					<c:out value="${user.status}"></c:out>
				</td>
				<td>
					<c:out value="${user.actor }"></c:out>
				</td>
				<td>
					<c:out value="${user.actress }"></c:out>
				</td>
				<td>
					<c:out value="${user.cuisine }"></c:out>
				</td>
				<td>
					<c:out value="${user.destination }"></c:out>
				</td>
				<td>
					<c:out value="${user.ideal }"></c:out>
				</td>
				<td>
					<c:out value="${user.profession }"></c:out>
				</td>
				<td>
					<c:out value="${user.address }"></c:out>
				</td>
				<td>
					<c:out value="${user.crush }"></c:out>
				</td>
				<td>
					<c:out value="${user.bike }"></c:out>
				</td>
				<td>
					<c:out value="${user.email}"></c:out>
				<td>
					<%if(request.getAttribute("link").equals("delete")){%>
						<a href="Serv?action=delete&id=<c:out value="${user.id}"/>"><b>X</b></a>
					<%}else if(request.getAttribute("link").equals("edit")){%>
						<a href="Serv?action=edit&id=<c:out value="${user.id}"/>"><b>Edit</b></a>
					<%}else{}%>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>	
</body>
</html>
