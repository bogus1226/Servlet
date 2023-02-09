<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>길이 변환</title>
</head>
<body>
	<%
		// cm 길이와 단위들을 전달 받고,
		// 대상의 단위 결과들을 보여준다
		
		int length = Integer.parseInt(request.getParameter("length"));
	
		// 단위들 unit
		// inch, yard, feet, meter
		String[] unitArray = request.getParameterValues("unit");
		
		String result = "";
		for(int i = 0; i < unitArray.length; i++) {
			if(unitArray[i].equals("inch")) {
				result += (length * 0.39) + " in" + "<br>";
			} else if(unitArray[i].equals("yard")) {
				result += (length * 0.010936133) + " yd" + "<br>";
			} else if(unitArray[i].equals("feet")) {
				result += (length * 0.032808399) + " ft" + "<br>";
			} else if(unitArray[i].equals("meter")){
				result += (length / 100.0) + " m" + "<br>";
			}
		
		}
		
	%>
	
		<h2>변환 결과</h2>
		<h2><%= length %>cm</h2>
		<hr>
		<h2><%= result %></h2>
</body>
</html>