<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
    <%
		Map<String, Object> artistInfo = new HashMap<>();
		artistInfo.put("name", "아이유");
		artistInfo.put("debute", 2008);
		artistInfo.put("agency", "EDAM엔터테인먼트");
		artistInfo.put("photo", "http://image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/867/444/81867444_1616662460652_1_600x600.JPG");
	%>
    
		<div class="singerInfo d-flex border border-success">
			<div class="ml-3 d-flex align-items-center">
				<img width="160"; src="<%= artistInfo.get("photo") %>">
			</div>
			<div class="ml-3 mt-4">
				<h3><b><%= artistInfo.get("name")%></b></h3>
				<h5 class="m-0"><%= artistInfo.get("agency") %></h5>
				<h5><%= artistInfo.get("debute") %> 데뷔</h5>
			</div>
		</div>