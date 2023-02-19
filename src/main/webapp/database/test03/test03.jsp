<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bogus.servlet.common.MysqlService" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/database/test03/style.css" type="text/css">
<title>홍당무 마켓</title>
</head>
<body>
	<%
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		
		String query = "SELECT * FROM `used_goods` ORDER BY `id` DESC;";
		ResultSet resultSet = mysqlService.select(query);
		
		String nickNameQuery = null;
		ResultSet nickNameResultSet = null;
		
	%>
	
	<div id="wrap">
		<jsp:include page ="header.jsp"/>
		<jsp:include page ="menu.jsp"/>
		<section class="main-contents d-flex flex-wrap">
			<% while(resultSet.next()) { %>
			<div class="content d-flex justify-content-around align-items-center mt-3">
				<div class="content-info">
					<img width="360" height="200" onerror="this.onerror=null; this.src='http://cheongjucci.korcham.net/images/no-image01.gif';" src="<%= resultSet.getString("picture") %>">
					<div class="mt-1"><b><%= resultSet.getString("description") %></b></div>
					<div class="text-secondary"><%= resultSet.getString("price") %></div>
					<% nickNameQuery = "SELECT * FROM `seller` WHERE `id` =  " + resultSet.getInt("sellerId") + ";"; 
					nickNameResultSet = mysqlService.select2(nickNameQuery);
						while(nickNameResultSet.next()) {%>
					<div class="nick-name"><%= nickNameResultSet.getString("nickname") %></div>		
					<% 	} %>
				</div>
			</div>
			<% 
				} 
				resultSet.close();
			%>
		</section>
		
		<jsp:include page ="footer.jsp"/>
	</div>

</body>
</html>