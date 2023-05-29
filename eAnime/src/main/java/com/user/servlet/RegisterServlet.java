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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phoneno = req.getParameter("phone");
			String password = req.getParameter("password");
			String check = req.getParameter("check");

			// System.out.println(name + email + phoneno + password + check);

			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phoneno);
			us.setPassword(password);

			HttpSession session = req.getSession();

			if (check != null) {
				UserDAOimpl dao = new UserDAOimpl(DBconn.getConn());
				boolean f = dao.userR(us);
				if (f) {
					// System.out.println("User Register Succesfully");
					session.setAttribute("successMsg", "Registered Succesfully");
					resp.sendRedirect("Register.jsp");
				} else {
					// System.out.println("Something went wrong");
					session.setAttribute("failedMsg", "Something went wrong");
					resp.sendRedirect("Register.jsp");
				}
			}

			else {
				// System.out.println("Please click on check box");
				session.setAttribute("failedMsg", "Please click on check box");
				resp.sendRedirect("Register.jsp");
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
