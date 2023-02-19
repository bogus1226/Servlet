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
<title>마이페이지</title>
</head>
<body>
	<%
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
			
		String sellerQuery = "SELECT * FROM `seller`;";
		ResultSet sellerResultSet = mysqlService.select3(sellerQuery);
		
		String goodsQuery = null;
		ResultSet goodsResultSet = null;
		
		String nickNameQuery = null;
		ResultSet nickNameResultSet = null;
		
		int count = 0;
		
		String sellerId = request.getParameter("sellerId");
	%>
	<div id="wrap">
		<jsp:include page ="header.jsp"/>
		<jsp:include page ="menu.jsp"/>
		<section class="goods_up">
			<aside>
				<form method="get" action="/database/test03/mypage.jsp">
					<div class="goods_up_box container mt-4">
						<div class="mt-3 d-flex" >
							<h4><b>마이 페이지</b></h4>
							<div class="d-flex justify-content-end ml-5 col-10 input-group">
								<select id="selectValue" class="form-control col-2" name="sellerId">
									<option selected value=0>-아이디 선택-</option>
								<% while(sellerResultSet.next()) {%>
									<option value=<%= sellerResultSet.getString("id") %>><%= sellerResultSet.getString("nickname") %></option>
								<% } %>
								</select>	
								<div class="input-group-append">
									<button type="submit" class="btn btn-secondary">검색</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</aside>
			
			
			
			
			
			
			<article class="main-contents d-flex flex-wrap">
				<% 	
					goodsQuery = "SELECT * FROM `used_goods` WHERE `sellerId`= " + sellerId + " ORDER BY `id` DESC;";
					goodsResultSet = mysqlService.select(goodsQuery);
					while(goodsResultSet.next()) { %>
				<div class="content d-flex justify-content-around align-items-center mt-3">
					<div class="content-info">
						<img width="360" height="200" onerror="this.onerror=null; this.src='http://cheongjucci.korcham.net/images/no-image01.gif';" src="<%= goodsResultSet.getString("picture") %>">
						<div class="mt-1"><b><%= goodsResultSet.getString("description") %></b></div>
						<div class="text-secondary"><%= goodsResultSet.getString("price") %></div>
						<% nickNameQuery = "SELECT * FROM `seller` WHERE `id` =  " + goodsResultSet.getInt("sellerId") + ";"; 
						nickNameResultSet = mysqlService.select2(nickNameQuery);
							while(nickNameResultSet.next()) {%>
						<div class="d-flex justify-content-between">
							<div class="nick-name"><%= nickNameResultSet.getString("nickname") %></div>
							<a href="/database/test03/delete?id=<%= goodsResultSet.getInt("id") %>&sellerId=<%= goodsResultSet.getInt("sellerId") %>">삭제</a>
						</div>
						<% 	} %>
					</div>
				</div>
				<% 
					} 
					goodsResultSet.close();
				%>
			</article>
		</section>
		
		<jsp:include page ="footer.jsp"/>
	</div>
</body>

</html>