package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOimpl;
import com.DB.DBconn;
import com.entity.User;

@WebServlet("/login")
public class LoginServelet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			UserDAOimpl dao = new UserDAOimpl(DBconn.getConn());

			HttpSession session = req.getSession();

			String email = req.getParameter("email");
			String password = req.getParameter("password");

			if ("admin@admin.com".equals(email) && "admin123".equals(password)) {
				User us = new User();
				us.setName("Admin");
				session.setAttribute("userobj", us);
				resp.sendRedirect("admin/Home.jsp");
			} else {

				User us = dao.loginR(email, password);
				if (us != null) {
					session.setAttribute("userobj", us);
					resp.sendRedirect("index.jsp");
				} else {
					session.setAttribute("failedMsg", "Invalid email & password");
					resp.sendRedirect("Login.jsp");
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}

