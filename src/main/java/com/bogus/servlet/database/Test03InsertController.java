package com.bogus.servlet.database;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bogus.servlet.common.MysqlService;

@WebServlet("/database/test03/insert")
public class Test03InsertController extends HttpServlet{

	@Override 
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int sellerId = Integer.parseInt(request.getParameter("sellerId"));
		String title = request.getParameter("title");
		int price = Integer.parseInt(request.getParameter("price"));
		String description = request.getParameter("description");
		String picture = request.getParameter("picture");
		
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		
		String query = "INSERT INTO `used_goods`\r\n"
				+ "(`sellerId`, `title`, `price`, `description`, `picture`, `createdAt`, `updatedAt`)\r\n"
				+ "VALUE\r\n"
				+ "(" + sellerId + ", '" + title + "', " + price + ", '" + description +"', '" + picture + "', now(), now());";
		
		mysqlService.update(query);
		
		mysqlService.disconnect();
		
		response.sendRedirect("/database/test03/test03.jsp");
	}
}
