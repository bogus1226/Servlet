<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post method</title>
</head>
<body>
	<%
		String nickname = request.getParameter("nickname");
		
		String animal = request.getParameter("animal");
		
		String fruit = request.getParameter("fruit");
		
		String[] foodArray = request.getParameterValues("food");
		
		String foodString = "";
		for(int i = 0; i < foodArray.length; i++) {
			foodString += foodArray[i] + " ";
		}
	%>
	
	<h4><%= nickname %></h4>

	<h4><%= animal %></h4>
	
	<h4><%= fruit %></h4>
	
	<h3><%= foodString %></h3>
	
</body>
</html>