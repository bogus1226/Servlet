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
				<h4><b><%= artistInfo.get("name")%></b></h4>
				<div class="m-0 small text-secondary"><b><%= artistInfo.get("agency") %></b></div>
				<div class="m-0 small text-secondary"><b><%= artistInfo.get("debute") %> 데뷔</b></div>
				<div class="d-flex m-0">
					<div class="small text-secondary"><b>데뷔곡 2008.09.23</b></div>
					<div class="small text-secondary ml-1"><b>미아</b></div>
				</div>
				<div class="d-flex m-0">
					<div class="small text-secondary"><b>활동장르</b></div>
					<div class="small text-secondary ml-1"><b>발라드, 댄스, 록/메탈</b></div>
				</div>
				<div class="d-flex m-0">
					<div class="small text-secondary"><b>생일</b></div>
					<div class="small text-secondary ml-1"><b>1993 05 16</b></div>
				</div>
			</div>
		</div>