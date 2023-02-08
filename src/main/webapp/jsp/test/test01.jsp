<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 스크립트 요소</title>
</head>
<body>
	
	<%-- 1. 점수들의 평균 구하기 --%>
	<%
		int[] scores = {80, 90, 100, 95, 80};	
		int sum = scores[0];
		for(int i = 1; i < scores.length; i++) {
			sum += scores[i];
		}
		double average = sum / (double)scores.length;
	%>
	<h2>점수 평균은 <%= average %> 입니다.</h2>
	
	
	<%-- 2. 채점 결과 --%>
	<%
		List<String> scoreList = Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});
		int scoringResult = 0;
		for(int i = 0; i < scoreList.size(); i++) {
			if(scoreList.get(i).equals("O")) {
				scoringResult += 100 / scoreList.size();
			}
		}
	%>
	<h2>체점 결과는 <%= scoringResult %> 점입니다.</h2>
	
	
	<%-- 3. 1부터 n까지의 합계를 구하는 함수 --%>
	<%!
		public int getSum(int number) {
		int sum = 0;
		for(int i = 1; i <= number; i++) {
			sum += i;
		}
		return sum;
	}
	%>
	<h2>1부터 50까지의 합은 <%= getSum(50) %></h2>
	
	
	<%-- 4. 나이 구하기 --%>
	<%-- 한국나이 기준으로 풀이하였습니다. --%>
	<%
		String birthDay = "20010820";
		int year = Integer.parseInt(birthDay.substring(0, 4));
		int age = 2023 - year + 1;
	%>
	<h2><%= birthDay %> 의 나이는 <%= age %> 살 입니다.</h2>
	
	
</body>
</html>