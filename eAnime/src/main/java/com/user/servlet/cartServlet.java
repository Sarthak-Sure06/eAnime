package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ItemDAOimpl;
import com.DAO.cartDAOimpl;
import com.DB.DBconn;
import com.entity.ADDitem;
import com.entity.cartitem;

@WebServlet("/cart")
public class cartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
		
			int tid = Integer.parseInt(req.getParameter("tid").trim());
			int uid = Integer.parseInt(req.getParameter("uid"));
			
			ItemDAOimpl dao = new ItemDAOimpl(DBconn.getConn());
			ADDitem i = dao.getItembyId(tid);
			
			cartitem c = new cartitem();
			c.setTid(tid);
			c.setUid(uid);
			c.setItem(i.getIname());
			c.setCompany(i.getIcompany());
			c.setPrice(Double.parseDouble(i.getPrice()));
			c.setTotal(Double.parseDouble(i.getPrice()));
			
			cartDAOimpl dao2 = new cartDAOimpl(DBconn.getConn());
			boolean f = dao2.addcart(c);
			
			HttpSession session = req.getSession(); 
			
			if(f) {
				session.setAttribute("success", "item added succesfully");
				resp.sendRedirect("seeall_recent.jsp");
			}
			else {
				session.setAttribute("failed", "Something went wrong");
				resp.sendRedirect("seeall_recent.jsp");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	
	

}

