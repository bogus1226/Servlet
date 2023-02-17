package com.bogus.servlet.database;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bogus.servlet.common.MysqlService;

@WebServlet("/database/test02/delete")
public class Test02DeleteController extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		MysqlService mysqlService = MysqlService.getInstance();
		
		mysqlService.connect();
		
		String query = "DELETE FROM `book_mark` WHERE `id` = " + id +"; ";
		
		int count = mysqlService.update(query);
		
		mysqlService.disconnect();
		
		response.sendRedirect("/database/test02.jsp");
	}

}
