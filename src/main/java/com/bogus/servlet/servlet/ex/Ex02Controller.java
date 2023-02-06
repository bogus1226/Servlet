package com.bogus.servlet.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/ex02")
public class Ex02Controller extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		// 1 ~ 10 까지의 합을 html로 구성해서 response에 담는다.
		int sum = 0;
		for(int i = 0; i <= 10; i++) {
			sum += i;
		}
		
		out.println("<html><head><title>합계</title></head> <body>");
		out.println("합계 : <b>" + sum + "</b></body></html>");
		
	}
	
}
