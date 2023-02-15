<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/jspTemplete/test/test02/style.css" type="text/css">
<title>노래 세부사항 화면</title>
</head>
<body>
<%
	List<Map<String, Object>> musicList = new ArrayList<>();
	
	Map<String, Object> musicInfo = new HashMap<>();
	musicInfo.put("id", 1);
	musicInfo.put("title", "팔레트");
	musicInfo.put("album", "Palette");
	musicInfo.put("singer", "아이유");
	musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/b/b6/IU_Palette_final.jpg");
	musicInfo.put("time", 217);
	musicInfo.put("composer", "아이유");
	musicInfo.put("lyricist", "아이유");
	musicList.add(musicInfo);
	
	musicInfo = new HashMap<>();
	musicInfo.put("id", 2);
	musicInfo.put("title", "좋은날");
	musicInfo.put("album", "Real");
	musicInfo.put("singer", "아이유");
	musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/3/3c/IU_-_Real.jpg");
	musicInfo.put("time", 233);
	musicInfo.put("composer", "이민수");
	musicInfo.put("lyricist", "김이나");
	musicList.add(musicInfo);
	
	musicInfo = new HashMap<>();
	musicInfo.put("id", 3);
	musicInfo.put("title", "밤편지");
	musicInfo.put("album", "palette");
	musicInfo.put("singer", "아이유");
	musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/b/b6/IU_Palette_final.jpg");
	musicInfo.put("time", 253);
	musicInfo.put("composer", "제휘,김희원");
	musicInfo.put("lyricist", "아이유");
	musicList.add(musicInfo);
	
	musicInfo = new HashMap<>();
	musicInfo.put("id", 4);
	musicInfo.put("title", "삐삐");
	musicInfo.put("album", "삐삐");
	musicInfo.put("singer", "아이유");
	musicInfo.put("thumbnail", "https://image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/111/535/81111535_1539157728291_1_600x600.JPG");
	musicInfo.put("time", 194);
	musicInfo.put("composer", "이종훈");
	musicInfo.put("lyricist", "아이유");
	musicList.add(musicInfo);
	
	musicInfo = new HashMap<>();
	musicInfo.put("id", 5);
	musicInfo.put("title", "스물셋");
	musicInfo.put("album", "CHAT-SHIRE");
	musicInfo.put("singer", "아이유");
	musicInfo.put("thumbnail", "https://image.genie.co.kr/Y/IMAGE/IMG_ALBUM/080/724/877/80724877_1445520704274_1_600x600.JPG");
	musicInfo.put("time", 194);
	musicInfo.put("composer", "아이유,이종훈,이채규");
	musicInfo.put("lyricist", "아이유");
	musicList.add(musicInfo);
	
	musicInfo = new HashMap<>();
	musicInfo.put("id", 6);
	musicInfo.put("title", "Blueming");
	musicInfo.put("album", "Love poem");
	musicInfo.put("singer", "아이유");
	musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/6/65/%EC%95%84%EC%9D%B4%EC%9C%A0_-_Love_poem.jpg");
	musicInfo.put("time", 217);
	musicInfo.put("composer", "아이유,이종훈,이채규");
	musicInfo.put("lyricist", "아이유");
	musicList.add(musicInfo);
	
	String number = request.getParameter("id"); 

	Integer id = null;
	if(number != null) {
		id  = Integer.parseInt(number);
	}

	
	String title = request.getParameter("title");

%>
		<div id="wrap">
		<jsp:include page ="header.jsp"/>
		<jsp:include page ="menu.jsp"/>
		
		<div class="songInfo_box">
			<h4><b>곡 정보</b></h4>
			<div class="songInfo">
				<div class="d-flex border border-success h-100">
					<% for(Map<String, Object> songInfo:musicList) {
							Integer songId = null;
							if(number != null) {
								songId = (Integer) songInfo.get("id");
							}	
							if((title == null && id == songId) || (title != null && title.equals(songInfo.get("title")))){
								Integer time = (Integer)songInfo.get("time");%>
					<div class="ml-3 d-flex align-items-center">
						<img width="160"; src="<%= songInfo.get("thumbnail") %>">
					</div>
					<div class="ml-3 mt-4">
						<h3><b><%= songInfo.get("title")%></b></h3>
						<div class="small text-success"><b><%= songInfo.get("singer") %></b></div>
						<div class="d-flex small text-secondary">
							<div>앨범</div>
							<div class="ml-5"><%= songInfo.get("album") %></div>
						</div>
						<div class="d-flex small text-secondary">
							<div>재생시간</div>
							<div class="ml-3"><%= time / 60 %> : <%= time % 60 %></div>
						</div>
						<div class="d-flex small text-secondary">
							<div>작곡가</div>
							<div class="ml-4"><%= songInfo.get("composer") %></div>
						</div>
						<div class="d-flex small text-secondary">
							<div>작사가</div>
							<div class="ml-4"><%= songInfo.get("lyricist") %></div>
						</div>
					</div>
				</div>
				<% 		}	
					} 
				%>
			</div>
		</div>
		<div class="lyrics mt-4">
			<div>
				<h4><b>가사</b></h4>
				<hr>
			</div>
			<div>
				<div class="small text-secondary"><b>가사 정보 없음</b></div>
			</div>
		</div>
		
		<jsp:include page ="footer.jsp"/>
	</div>




</body>
</html>