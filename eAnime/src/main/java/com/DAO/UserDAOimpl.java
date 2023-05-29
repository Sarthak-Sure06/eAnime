package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAOimpl implements UserDAO {

	private Connection c;

	public UserDAOimpl(Connection c) {
		super();
		this.c = c;
	}

	public boolean userR(User us) {
		boolean f = false;

		try {

			String sql = "insert into user(NAME,EMAIL,PHONENO,PASSWORD) values(?,?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhone());
			ps.setString(4, us.getPassword());

			int check = ps.executeUpdate();
			if (check == 1) {
				f = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return f;
	}

	public User loginR(String email, String password) {

		User us = null;

		try {

			String sql = "select * from user where email=? and password=?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhone(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return us;

	}

}

