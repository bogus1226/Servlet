package com.bogus.servlet.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test07")
public class Test07Controller extends HttpServlet{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		String address = request.getParameter("address");
		String card = request.getParameter("card");
		int price = Integer.parseInt(request.getParameter("price"));
		
		String addressInfo = address + " 배달 준비중";
		String priceInfo = "결제금액 : " + price + "원";
		
		out.println("<html><head><title>주문하기</title></head><body>");
		
		if(address.contains("서울시")) {
			out.println("<h2>배달 불가 지역입니다.</h2>");
			out.println("<hr>");
			out.println("결제 오류...(배달불가지역)");
		} else if(card.contains("신한카드")) {
			out.println("<h2>배달 대기중(결제불가카드)</h2>");
			out.println("<hr>");
			out.println("결제 불가 카드 입니다.");
		} else {
			out.println("<h2>" + addressInfo + "</h2>");
			out.println("<hr>");
			out.println(priceInfo);
		}
		out.println("</body></html>");
	}
}
