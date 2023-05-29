package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.ADDitem;
import com.entity.cartitem;
import com.mysql.cj.protocol.Resultset;

public class cartDAOimpl implements cartDAO {
	
	private Connection c;

	public cartDAOimpl(Connection c) {
		super();
		this.c = c;
	}
	public boolean addcart(cartitem ca) {
		// TODO Auto-generated method stub
		boolean f = false;
		
		try {
			
			String sql = "insert into cart(tid,uid,Item,ItemCompany,Price,Total) values(?,?,?,?,?,?)";
			PreparedStatement ps = (c).prepareStatement(sql);
			ps.setInt(1, ca.getTid());
			ps.setInt(2, ca.getUid());
			ps.setString(3, ca.getItem());
			ps.setString(4, ca.getCompany());
			ps.setDouble(5, ca.getPrice());
			ps.setDouble(6, ca.getTotal());
			
			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	public List<cartitem> getItembyUser(int uid) {
		// TODO Auto-generated method stub
		List<cartitem> list = new ArrayList<cartitem>();
		cartitem a = null;
		double totalprice = 0;
		try {
			String sql = "select * from cart where uid=?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, uid);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				a = new cartitem();
				a.setCid(rs.getInt(1));
				a.setTid(rs.getInt(2));
				a.setUid(rs.getInt(3));
				a.setItem(rs.getString(4));
				a.setCompany(rs.getString(5));
				a.setPrice(rs.getDouble(6));
				
				totalprice += rs.getDouble(7);
				a.setTotal(totalprice);
			
				list.add(a);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		
		}
		
		return list;
	}
	public boolean deleteItem(int tid , int uid) {
		// TODO Auto-generated method stub
		boolean f = false;
		
		try {
			String sql = "delete from cart where tid=? and uid=?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, tid);
			ps.setInt(2, uid);
			
			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}

}
