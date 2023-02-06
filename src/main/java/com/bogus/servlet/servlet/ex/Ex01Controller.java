package com.bogus.servlet.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex01Controller extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// response header 셋팅
		// 캐릭터 셋
		response.setCharacterEncoding("utf-8");
		// 데이터 타입 (MIME)
		response.setContentType("text/plain");
		
		// 날짜 표현하기
		// 현재 날짜 시간을 2023-02-01 17:31:12
		Date now = new Date();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String dateTimeString = formatter.format(now);
		
		// response에 값 채우기
		PrintWriter out = response.getWriter();
		out.println(now);
		out.println(dateTimeString);
		
	}
}
