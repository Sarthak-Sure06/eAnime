package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ItemDAOimpl;
import com.DB.DBconn;
import com.entity.ADDitem;

@WebServlet("/edititem")
public class EditItem extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			int id = Integer.parseInt(req.getParameter("id"));
			String Iname = req.getParameter("iname");
			String Icompany = req.getParameter("icname");
			String Price = req.getParameter("iprice");
			String Istatus = req.getParameter("istatus");

			ADDitem b = new ADDitem();
			b.setId(id);
			b.setIname(Iname);
			b.setIcompany(Icompany);
			b.setPrice(Price);
			b.setIstatus(Istatus);

			ItemDAOimpl dao = new ItemDAOimpl(DBconn.getConn());
			boolean f = dao.updateedit(b);
			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("successMsg", "Item Updates Succesfully");
				resp.sendRedirect("admin/Allitems.jsp");
			} else {
				session.setAttribute("failedMsg", "Something went wrong");
				resp.sendRedirect("admin/Allitems.jsp");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
