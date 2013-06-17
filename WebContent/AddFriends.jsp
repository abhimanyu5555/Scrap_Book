<!-- AddFriends.html & AddFriends.jsp, i know they both have same names they basically do the same thing of adding frind to DD
BUT i had to sperate them, cos when "freshlly" adding a friend, without any request attribute set HTML seems to be lot better
choice, BUT when i'm editing some friend, i need to display to user what he is editing by providing data of friend from DB
So request level attribute come in playing, so i decided to have 2 seperate "AddFriends" functionality-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ page import="user.model.Friend" %>

<link rel="stylesheet" type="text/css" href="DefaultBG.css">
 <!-- bootstrap -->
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
 <!-- jq CDN -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<!-- datepicker -->
 <script type="text/javascript">
	$(function(){
		$("#datepicker").datepicker();
	});
</script>
<!-- css -->
	<link href="crudStyle.css" rel="stylesheet" type="text/css">
<!-- core JSTL -->
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- format -->
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	function single(){
		document.getElementById("single").checked=true
	}
	function married(){
		document.getElementById("married").checked=true
	}
</script>
	
</head>
<body>
	<form action="Serv" method="POST">
	<div class="container" style="background-color: #DCDCDC;">
		<div class="row-fluid">
			<div class="row-fluid">
				<div class="span12"></div>
			</div>
<!-- Home button -->
			<div class="row-fluid">
				<div class="span2 offset1">
					<a href="Home.html" class="btn btn-large btn-block">Home</a>
				</div>
			</div>
				<div class="row-fluid">
					<div class="span12"></div>
				</div>
			<div class="row-fluid"> 
 				<!-- left side -->
		 			<div class="span6">
		 			<!-- this is hidden field, will be used on server side -->
		 				<input type="hidden" name="id" value="<c:out value="${editThisFriend.id}"/>">
		 				<div class="row-fluid">
			 				<div class="span2 offset1">Name</div>
			 				<div class="span1">
			 					<input type="text" name="name" value="<c:out value="${editThisFriend.name}" />">
			 				</div>
			 			</div>
			 			<div class="row-fluid">
			 				<div class="span2 offset1">D.O.B</div>
		 					<div class="span1">
		 						<input type="text" id="datepicker" name="dob" value="<fmt:formatDate pattern="MM/dd/yyyy" value="${editThisFriend.DOB}"/>"/>		
		 					</div>
		 				</div>
		 				<div class="row-fluid">
			 				<div class="span3 offset1">Martial Status</div>
			 				<div class="span4">
			 					Single:&emsp;<input type="radio" name="status" value="single" id="single" > &emsp;
			 					Married:&emsp;<input type="radio" name="status" value="married" id="married" >
			 				</div>
		 				</div>
		 				<!-- favourite container --> 
		 				<div class="row-fluid">
		 					<div class="row-fluid">
				 				<div class="span2 offset4">
				 					<div class="span1"><h5>Favourite</h5></div>
				 				</div>
			 				</div>
			 				<div class="row-fluid">
			 					<div class="span2 offset1">Actor</div>
				 				<div class="span1"><input type="text" name="actor" value="${editThisFriend.actor}"></div>
			 				</div>
			 				<div class="row-fluid">
			 					<div class="span2 offset1">Actress</div>
				 				<div class="span1"><input type="text" name="actress" value="${editThisFriend.actress}" ></div>
			 				</div>
			 				<div class="row-fluid">
			 					<div class="span2 offset1">Cuisine</div>
				 				<div class="span1"><input type="text" name="cuisine" value="${editThisFriend.cuisine}" ></div>
			 				</div>
			 				<div class="row-fluid">
			 					<div class="span2 offset1">Destination</div>
				 				<div class="span1"><input type="text" name="destination" value="${editThisFriend.destination}" ></div>
			 				</div>
			 				<div class="row-fluid">
			 					<div class="span2 offset1">Ideal</div>
				 				<div class="span1"><input type="text" name="ideal" value="${editThisFriend.ideal}" ></div>
			 				</div>
			 				<div class="row-fluid">
			 					<div class="span2 offset1">Profession</div>
				 				<div class="span1"><input type="text" name="profession" value="${editThisFriend.profession}" ></div>
			 				</div>
					<!-- Blank rows -->			 				
		 				</div>
		 				<div class="row-fluid">
			 				<div class="span12"></div>
		 				</div>
		 				<div class="row-fluid">
			 				<div class="span12"></div>
		 				</div>
		 			</div>
		 			
		 			<!-- Right Side -->
		 			<div class="span6">
		 				<div class="row-fluid">
			 				<div class="span12">
			 					<div class="span3 offset2">Address</div>
				 				<div class="span1">
				 					<textarea rows="4" name="address" ><%Friend friend = (Friend) request.getAttribute("editThisFriend");%><%= friend.getAddress() %></textarea>
				 				</div>
			 				</div>
		 				</div>
		 				
		 				<!-- blank rows -->
		 				<div class="row-fluid">
			 				<div class="span12"></div>
		 				</div>
		 				
		 				<div class="row-fluid">
		 					<div class="span12">
			 					<div class="span2 offset2">1st Crush</div>
			 					<div class="span2 offset1"><input type="text" name="crush" value="${editThisFriend.crush}" > </div>
		 					</div>
		 				</div>
		 				<div class="row-fluid">
		 					<div class="span12">
			 					<div class="span4 offset2">Bike brand you prefer</div>
			 					<div class="row-fluid">
			 						<div class="span12">
				 						<div class="span2 offset2">Honda:&emsp;<input type="radio" name="bike" value="Honda"></div>
				 						<div class="span2">KTM:&emsp;<input type="radio" name="bike" value="KTM"></div>
				 						<div class="span2">Ducati:&emsp;<input type="radio" name="bike" value="Ducati"></div>
				 						<div class="span2">Suzuki:&emsp;<input type="radio" name="bike" value="Suzuki"></div>
			 						</div>
			 					</div>
		 					</div>
		 				</div>
		 				<div class="row-fluid">
		 					<div class="span2 offset2">Email</div>
			 				<div class="span2 offset1">
				 				<input type="text" name="email" value="${editThisFriend.email}" required>
			 				</div>
		 				</div>
		 				<!-- blank rows -->
		 				<div class="row-fluid">
			 				<div class="span12"></div>
		 				</div>
		 				<div class="row-fluid">
			 				<div class="span12"></div>
		 				</div>
		 				<div class="row-fluid">
			 				<div class="span12"></div>
		 				</div>
		 				<div class="row-fluid">
			 				<div class="span12"></div>
		 				</div>
		 				<div class="row-fluid">
			 				<div class="span12"></div>
		 				</div>
		 				<div class="row-fluid">
			 				<div class="span12"></div>
		 				</div>
		 				<div class="row-fluid">
			 				<div class="span12"></div>
		 				</div>
					</div>
				</div>				
			</div>
			<!-- submit -->
		 	<div class="row-fluid">
				<div class="span2 offset1" align="right"></div>
				<div class="span2 offset6" align="left">
					<input type="submit" class="btn btn-success btn-primary btn-large btn-block" value="Save">
				</div>
	 		</div>
 			<div class="row-fluid">
				<div class="span12"></div>
			</div>
			<div class="row-fluid">
				<div class="span12"></div>
			</div>
		</div>
	</form> 
</body>
</html>
