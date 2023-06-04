package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FirstProgram implements Servlet {

	ServletConfig con;

	@Override
	public void destroy() {
		System.out.println("Destroy Method");

	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("Init Method");
		con = config;

	}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		System.out.println("Service Method 2");
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		out.println("Welcome to Servlet");
		out.println("Today " + new Date().toString());
		System.out.println(getServletConfig());
		System.out.println(getServletInfo());

	}

	@Override
	public ServletConfig getServletConfig() {
		// TODO Auto-generated method stub
		return con;
	}

	@Override
	public String getServletInfo() {
		// TODO Auto-generated method stub
		return "My First Program";
	}

}
