<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>달력</title>
</head>
<body>
	<%
		Calendar calendar = Calendar.getInstance();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM");
		
		int month = calendar.get(Calendar.DAY_OF_MONTH);
		
		calendar.add(Calendar.DATE, -month + 1);
		
		String dateString = formatter.format(calendar.getTime());
		
		int day = calendar.get(Calendar.DAY_OF_WEEK);
		
		int lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);	
		
	%>
		
	<%!
		public int dateSearch(int count, Calendar calendar) {
			calendar = Calendar.getInstance();
			calendar.set(Calendar.DATE, count);
			return calendar.get(Calendar.DAY_OF_WEEK);
		}
	%>
	
	<div class="container">
		<h2 class="text-center"><%= dateString %></h2>
		<table class="table">
			<tr>
				<th class="text-danger">일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
			</tr>
			<tr>
		<% 		int count = 0;
				for(int i = 1; i <= 7; i++) { 
					if(i < day) {		
		%> 				<td></td>		
		<%			} else { 
						if(dateSearch(count, calendar) == 1) {%>
							<td class="text-danger"><%= i - (day - 1) %></td>
		<%					count++;
						} else {%>
							<td><%= i - (day - 1) %></td>
		<%					count++;
						}
					}
				}
		%>
			</tr>
		<% 		count += 1;
				while(true) {
					if(count <= lastDay) {%>	
						<tr>
		<%				for(int i = 0; i < 7; i++) {%>
						<%	if(count <= lastDay) { 
								if(dateSearch(count, calendar) == 1) {%>
								<td class="text-danger"><%= count %></td>				
		<%						count++;
								} else {%>
									<td><%= count %></td>
		<%							count++;
								}
							} else {%>
								<td></td>
		<%					}
						}%>
						</tr>
		<%			}	
					else {
						break;
					}
				}%>
					
		
		</table>
	</div>
</body>
</html>