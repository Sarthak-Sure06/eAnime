package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.cartDAOimpl;
import com.DAO.ordersDAOimpl;
import com.DB.DBconn;
import com.entity.cartitem;
import com.entity.itemorder;
import com.mysql.cj.Session;

@WebServlet("/order")
public class orderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			HttpSession session = req.getSession();

			int id = Integer.parseInt(req.getParameter("id"));

			String name = req.getParameter("username");
			String email = req.getParameter("username");
			String phone = req.getParameter("username");
			String address = req.getParameter("username");
			String city = req.getParameter("username");
			String state = req.getParameter("username");
			String pincode = req.getParameter("username");
			String paymentType = req.getParameter("username");

			String fulladdr = address + "," + city + "," + state + "," + pincode;

			cartDAOimpl dao = new cartDAOimpl(DBconn.getConn());
			List<cartitem> b1 = dao.getItembyUser(id);
			ordersDAOimpl dao2 = new ordersDAOimpl(DBconn.getConn());

			int i = dao2.getOrderno();

			itemorder o = null;

			ArrayList<itemorder> orderlist = new ArrayList<itemorder>();
			for (cartitem c : b1) {
				o = new itemorder();
				o.setOrderid("item-order - " + i);
				o.setUsername(name);
				o.setEmail(email);
				o.setAddress(address);
				o.setPhone(phone);
				o.setItem(c.getItem());
				o.setCompany(c.getCompany());
				o.setPrice(c.getPrice() + "");
				o.setPaymenttype(paymentType);
				orderlist.add(o);
			}

			if ("noselect".equals(paymentType)) {
				session.setAttribute("failedMsg", "Please select payment");
				resp.sendRedirect("cart.jsp");
			} else {
				boolean f = dao2.saveorders(orderlist);
				if (f) {

					resp.sendRedirect("order_succ.jsp");

				} else {
					session.setAttribute("failedMsg", "Your order failed");
					resp.sendRedirect("cart.jsp");
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
