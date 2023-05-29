package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.ADDitem;

public class ItemDAOimpl implements ItemDAO {

	private Connection c;

	public ItemDAOimpl(Connection c) {
		super();
		this.c = c;
	}

	public boolean additem(ADDitem at) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {

			String sql = "insert into admin(Name , Company , Price , Type , Status , Photos) values(?,?,?,?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, at.getIname());
			ps.setString(2, at.getIcompany());
			ps.setString(3, at.getPrice());
			ps.setString(4, at.getItype());
			ps.setString(5, at.getIstatus());
			ps.setString(6, at.getIphotos());

			int check = ps.executeUpdate();
			if (check == 1) {
				f = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;

	}

	public List<ADDitem> getallitems() {
		// TODO Auto-generated method stub
		List<ADDitem> list = new ArrayList<ADDitem>();
		ADDitem b = null;
		try {

			String sql = "select * from admin";
			PreparedStatement ps = c.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new ADDitem();
				b.setId(rs.getInt(1));
				b.setIname(rs.getString(2));
				b.setIcompany(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setItype(rs.getString(5));
				b.setIstatus(rs.getString(6));
				b.setIphotos(rs.getString(7));
				list.add(b);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	public ADDitem getItembyId(int a) {
		// TODO Auto-generated method stub

		ADDitem b = null;

		try {
			String sql = "select * from admin where ID=?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, a);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new ADDitem();
				b.setId(rs.getInt(1));
				b.setIname(rs.getString(2));
				b.setIcompany(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setItype(rs.getString(5));
				b.setIstatus(rs.getString(6));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return b;
	}

	public boolean updateedit(ADDitem b) {
		// TODO Auto-generated method stub

		boolean f = false;

		try {

			String sql = "update admin set Name = ? , Company = ? , Price = ? , Status = ? , Photos = ? where ID = ?";
			PreparedStatement ps = c.prepareStatement(sql);

			ps.setString(1, b.getIname());
			ps.setString(2, b.getIcompany());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getIstatus());
			ps.setString(5, b.getIphotos());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return f;
	}

	public List<ADDitem> getItems() {
		// TODO Auto-generated method stub
		List<ADDitem> list = new ArrayList<ADDitem>();
		ADDitem b = null;

		try {

			String sql = "select * from admin where Type = ? and Status = ? order by ID desc";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, "item1");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();

			int i = 1;
			while (rs.next() && i <= 4) {
				b = new ADDitem();
				b.setId(rs.getInt(1));
				b.setIname(rs.getString(2));
				b.setIcompany(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setItype(rs.getString(5));
				b.setIstatus(rs.getString(6));
				b.setIphotos(rs.getString(7));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	public List<ADDitem> getRecentItem() {
		// TODO Auto-generated method stub
		List<ADDitem> list = new ArrayList<ADDitem>();
		ADDitem b = null;

		try {

			String sql = "select * from admin where Status = ? order by ID desc";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();

			int i = 1;
			while (rs.next() && i <= 4) {
				b = new ADDitem();
				b.setId(rs.getInt(1));
				b.setIname(rs.getString(2));
				b.setIcompany(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setItype(rs.getString(5));
				b.setIstatus(rs.getString(6));
				b.setIphotos(rs.getString(7));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	public List<ADDitem> allRecentItem() {
		// TODO Auto-generated method stub
		List<ADDitem> list = new ArrayList<ADDitem>();
		ADDitem b = null;

		try {

			String sql = "select * from admin where Status = ? order by ID desc";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();

			//int i = 1;
			while (rs.next()) {
				b = new ADDitem();
				b.setId(rs.getInt(1));
				b.setIname(rs.getString(2));
				b.setIcompany(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setItype(rs.getString(5));
				b.setIstatus(rs.getString(6));
				b.setIphotos(rs.getString(7));
				list.add(b);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}
	
	

}
