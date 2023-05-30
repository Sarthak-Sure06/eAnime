package com.user.servlet;

import java.io.IOException;
import com.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOimpl;
import com.DB.DBconn;

@WebServlet("/updateprofile")
public class updateprofile extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int id = Integer.parseInt(req.getParameter("id")); 
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phoneno = req.getParameter("phone");
			String password = req.getParameter("password");
			//String check = req.getParameter("check");
			
			User us = new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phoneno);
			HttpSession session = req.getSession();
			UserDAOimpl dao = new UserDAOimpl(DBconn.getConn());
			boolean f = dao.checkpassword(id, password);
			if(f) {
				boolean f2 = dao.updateprofile(us);
				if (f2) {
					// System.out.println("User Register Succesfully");
					session.setAttribute("succMsg", "Updated Succesfully");
					resp.sendRedirect("edit_profile.jsp");
				} else {
					// System.out.println("Something went wrong");
					session.setAttribute("failedMsg", "Something went wrong");
					resp.sendRedirect("edit_profile.jsp");
				}
			}
			else {
				session.setAttribute("failedMsg", "Your Password is incorrect");
				resp.sendRedirect("edit_profile.jsp");

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	

}
