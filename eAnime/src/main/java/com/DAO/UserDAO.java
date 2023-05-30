package com.DAO;

import com.entity.User;

public interface UserDAO {
	public boolean userR(User us);

	public User loginR(String email, String password);

	public boolean checkpassword(int id , String ps);

	public boolean updateprofile(User us);
}

