package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String fullname = req.getParameter("fullname");
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			User u = new User(fullname, email, password);

			UserDao dao = new UserDao(DBConnect.getConnection());

			HttpSession session = req.getSession();

			boolean f = dao.register(u);

			if (f) {

				session.setAttribute("sucMsg", "Registerd Successfully");
				resp.sendRedirect("signup.jsp");

//				System.out.println("User details Inserted Successfully");
			} else {
				session.setAttribute("errorMsg", "Something Went Wrong");
				resp.sendRedirect("signup.jsp");
				
//				System.out.println("Something Went Wrong");
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}
