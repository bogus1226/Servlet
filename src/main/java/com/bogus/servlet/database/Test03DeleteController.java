package com.bogus.servlet.database;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bogus.servlet.common.MysqlService;

@WebServlet("/database/test03/delete")
public class Test03DeleteController extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		int sellerId = Integer.parseInt(request.getParameter("sellerId"));
		
		MysqlService mysqlService = MysqlService.getInstance();
		
		mysqlService.connect();
		
		String query = "DELETE FROM `used_goods` WHERE `id` = " + id + ";";
		
		mysqlService.update(query);
		
		mysqlService.disconnect();
		
		response.sendRedirect("/database/test03/mypage.jsp?sellerId=" + sellerId);
	}

}
