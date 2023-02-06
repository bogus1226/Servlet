package com.bogus.servlet.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test08")
public class Test08Controller extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		String search = request.getParameter("search");
		
		List<String> list = new ArrayList<>(Arrays.asList(
		        "강남역 최고 맛집 소개 합니다.", 
		        "오늘 기분 좋은 일이 있었네요.", 
		        "역시 맛집 데이트가 제일 좋네요.", 
		        "집에 가는 길에 동네 맛집 가서 안주 사갑니다.",
		        "자축 저 오늘 생일 이에요."));
		
		out.println("<html><head><title>검색하기</title></head><body>");
		
		for(String sentence:list) {
			// 문자열 안에 특정한 keyword 가 포함되어 있는지 확인
			if(sentence.contains(search)) { 
				// html 에 포함시킨다.
				// 강남역 최고 맛집 소개 합니다.
				// 강남역 최고 <b>맛집</b> 소개 합니다.
				sentence = sentence.replace(search, "<b>" + search + "</b>");
				out.println(sentence + "<hr>");
			}
		}
		
		/* int count = 0;
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).contains(search)) {
				String searchList = list.get(i).replace(search, "<b>" + search + "</b>");
				out.println(searchList);
				out.println("<hr>");
			} else if(count == list.size()-1) {
				out.println("검색결과없음...");
			} else {
				count++;
			}
		} */
		out.println("</body></html>"); 
	}
}
