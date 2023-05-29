package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.cartDAOimpl;
import com.DB.DBconn;

@WebServlet("/remove_cart")
public class remove extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		
		int tid = Integer.parseInt(req.getParameter("tid"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		cartDAOimpl dao = new cartDAOimpl(DBconn.getConn());
		boolean f = dao.deleteItem(tid,uid);
	
		HttpSession session = req.getSession();
		if(f) {
			session.setAttribute("succMsg", "Item removed from cart");
			resp.sendRedirect("cart.jsp");
		}
		else {
			session.setAttribute("failedMsg", "Something went wrong");
			resp.sendRedirect("cart.jsp");
		}
	}

}
