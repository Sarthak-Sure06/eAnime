package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.ItemDAOimpl;
import com.DB.DBconn;
import com.entity.ADDitem;

@WebServlet("/AddItems")
@MultipartConfig
public class Itemadd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			String Iname = req.getParameter("iname");
			String Icompany = req.getParameter("icname");
			String Price = req.getParameter("iprice");
			String Itype = req.getParameter("itype");
			String Istatus = req.getParameter("istatus");
			Part part = req.getPart("ipic");
			String Iphotos = part.getSubmittedFileName();

			ADDitem a = new ADDitem(Iname, Icompany, Price, Itype, Istatus, Iphotos);

			ItemDAOimpl dao = new ItemDAOimpl(DBconn.getConn());

			boolean f = dao.additem(a);

			HttpSession session = req.getSession();

			if (f) {

				String path = getServletContext().getRealPath("") + "ITEM";
				java.io.File nf = new java.io.File(path);
				part.write(path + java.io.File.separator + Iphotos);

				session.setAttribute("succMsg", "Item Added Succesfully");
				resp.sendRedirect("admin/AddItems.jsp");
			} else {
				session.setAttribute("failedMsg", "Something went wrong");
				resp.sendRedirect("admin/AddItems.jsp");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}

