package com.bogus.servlet.database;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bogus.servlet.common.MysqlService;

@WebServlet("/db/test01")
public class Test01Controller extends HttpServlet{
	
	@Override 
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		MysqlService mysqlService = MysqlService.getInstance();
		
		mysqlService.connect();
		
		ResultSet resultSet = mysqlService.select("SELECT * FROM `real_estate` ORDER BY `id` DESC LIMIT 10");
		
		out.println("<html><head><title>중고 목록</title></head><body>");
		
		try {
			while(resultSet.next()) {
				String address = resultSet.getString("address");
				int area = Integer.parseInt(resultSet.getString("area"));
				String type = resultSet.getString("type");
				out.print("<div>매물 주소 : " + address + ", 면적 : " + area + ", 타입 : " + type);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		out.println("</body></html>");
		mysqlService.disconnect();
	}
	
		
}
