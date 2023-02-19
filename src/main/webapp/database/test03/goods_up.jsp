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
<title>물건올리기</title>
</head>
<body>
	<%
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		
		String query = "SELECT * FROM `seller`;";
		ResultSet resultSet = mysqlService.select(query);
	%>
	<div id="wrap">
		<jsp:include page ="header.jsp"/>
		<jsp:include page ="menu.jsp"/>
		
		<section class="goods_up">
			<form method="get" action="/database/test03/insert">
				<div class="goods_up_box container mt-4">
					<h4><b>물건 올리기</b></h4>
					<div class="mt-3 d-flex justify-content-between" >
						<select id="selectValue" class="form-control col-3" name="sellerId">
							<option selected value=0>-아이디 선택-</option>
						<% while(resultSet.next()) {%>
							<option value=<%= resultSet.getString("id") %>><%= resultSet.getString("nickname") %></option>
						<% } %>
						</select>
						<input id="inputTitle" type="text" class="form-control col-5" placeholder="* 제목 (필수)" name="title">
						<div class="col-3 p-0">
							<div class="input-group">
								<input id="inputPrice" type="text" class="form-control " placeholder="* 가격 (필수)" name="price">
								<div class="input-group-append">
									<div class="input-group-text">원</div>
								</div>
							</div>
						</div>	
					</div>
					
					<textarea id="description" rows="6" class="mt-3 form-control" name="description" placeholder="* 상품설명 (필수)"></textarea>
					
					<div class="input-group mt-3">
						<div class="input-group-prepend">
							<span class="input-group-text">이미지 url</span>
						</div>
						<input type="text" class="form-control" name="picture" placeholder="이미지 첨부">	
					</div>
					
					<button id="saveButton" class="btn btn-secondary form-control mt-3" type="button">저장</button>
				</div>
			</form>
		</section>
		
		<jsp:include page ="footer.jsp"/>
	</div>
</body>

<script>
    $(document).ready(function(){
        $("#saveButton").on("click",function(){
			let select = $("#selectValue").val();
			let title = $("#inputTitle").val();
			let price = $("#inputPrice").val();
			let description = $("#description").val();
			
			if(select == 0) {
				alert("아이디를 선택하세요");
             	return ;
			}else if(title == "") {
				alert("제목을 입력하세요");
             	return ;
			}else if(price == "") {
				alert("가격을 입력하세요");
				return ;
			}else if(isNaN(price) != false) {
				alert("가격을 숫자로입력하세요");
				return ;
			}else if(description == "") {
				alert("상품 설명을 입력하세요");
				return ;
			}
			
				
			$("#saveButton").attr("type", "submit")
			
           
        });   
    });
</script>
</html>