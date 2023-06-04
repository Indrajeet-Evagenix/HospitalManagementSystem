package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ThirdProgram extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("This is doGet Methods");
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		out.println("Welcome to doGet Methods ");
		out.println("Today " + new Date().toString());
		System.out.println(getServletConfig());
		System.out.println(getServletInfo());

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("This is doPost Methods");
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		out.println("Welcome to doPost Methods ");
		out.println("Today " + new Date().toString());
		System.out.println(getServletConfig());
		System.out.println(getServletInfo());
	}
	
	

}
