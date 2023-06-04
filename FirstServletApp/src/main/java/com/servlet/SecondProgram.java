package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class SecondProgram extends GenericServlet{

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		System.out.println("Generic Servlet");
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		out.println("Welcome to GenericServlet ");
		out.println("Today " + new Date().toString());
		System.out.println(getServletConfig());
		System.out.println(getServletInfo());
		
	}

}
