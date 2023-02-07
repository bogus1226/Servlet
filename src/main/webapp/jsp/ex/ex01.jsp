<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h2>JSP 기본 문법</h2>
	
	<!-- html 주석 -->
	<%-- jsp 주석 --%>
	
	<%-- 1 부터 10까지의 합을 구한다 --%>
	
	<%
		// 1부터 10까지 합
		int sum = 0;
		for(int i = 1; i <= 10; i++) {
			sum += i;
		}
	%>
	
	<h3>합계 : <%= sum %></h3>
	<input type ="text" value="<%=sum %>">
	
	<%
		// 동물이름 리스트
		List<String> animal = new ArrayList<>();
		animal.add("dog");
		animal.add("cat");
	%>
	
	<h3><%= animal.get(0) %></h3>
	<h3><%= animal.get(1) %></h3>
	
	<%-- 메소드 만들기 --%>
	
	<%!
		// hello world를 리턴하는 메소드
		
		public String getHelloWorld() {
		
			return "Hello World";
		}
	%>
	
	<h3><%= getHelloWorld() %></h3>
	
	
	
</body>
</html>