package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.entity.itemorder;

public class ordersDAOimpl implements ordersDAO {
	
	private Connection c;
	
	public ordersDAOimpl(Connection c){
		super();
		this.c = c;
	}

	public int getOrderno() {
		// TODO Auto-generated method stub
		int i = 1;
		try {
			
			String sql = "select * from orders";
			PreparedStatement ps = c.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				i++;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); 
		}
		
		return i;
	}

	public boolean saveorders(List<itemorder> b1) {
		// TODO Auto-generated method stub
		boolean f = false;
		
		try {
			
			String sql = "insert into orders(orderid,user_name,email,address,phone,item,company,price,payment) values(?,?,?,?,?,?,?,?,?)";
			
			c.setAutoCommit(false);
			PreparedStatement ps = c.prepareStatement(sql);
			
			for(itemorder b : b1 ) {
				ps.setString(1, b.getOrderid());
				ps.setString(2, b.getUsername());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getAddress());
				ps.setString(5, b.getPhone());
				ps.setString(6, b.getItem());
				ps.setString(7, b.getCompany());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPaymenttype());
				ps.addBatch();
			}
			
			int[] count = ps.executeBatch();
			c.commit();
			f = true;
			c.setAutoCommit(true);
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}

}
