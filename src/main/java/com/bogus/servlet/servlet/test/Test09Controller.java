package com.bogus.servlet.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test09")
public class Test09Controller extends HttpServlet{
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		// 이름과 자기소개서를 전달 받고, html 화면 구성
		String name = request.getParameter("name");
		String introduce = request.getParameter("introduce");
		
		out.println("<html><head><title>지원 결과</title></head><body>");
		
		out.println("<h2>" + name + "님 지원이 완료 되었습니다.</h2>");
		out.println("<hr>");
		out.println("지원내용<br>");
		out.println(introduce);
		
		out.println("</body></html>");
	}

}
