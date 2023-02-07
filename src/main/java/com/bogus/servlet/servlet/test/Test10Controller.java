package com.bogus.servlet.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test10")
public class Test10Controller extends HttpServlet{
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		// 아이디와 비밀번호를 전달 받고, 그에 따른 처리를 html 로 만든다.
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		out.println("<html><head><title>로그인</title></head><body>");
		
		if(!userMap.get("id").equals(id)) {
			out.println("<h2>id가 일치하지 않습니다.</h2>");
		} else if(!userMap.get("password").equals(password)) {
			out.println("<h2>password가 일치하지 않습니다.</h2>");
		} else {
			out.println("<h2>" + userMap.get("name") + "님 환영 합니다.</h2>");
		}
		
		out.println("</body></html>"); 
	}
	
	private final Map<String, String> userMap =  new HashMap<String, String>() {
	    {
	        put("id", "hagulu");
	        put("password", "asdf");
	        put("name", "김인규");
	    }
	};

}
