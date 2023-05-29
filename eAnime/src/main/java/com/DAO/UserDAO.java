package com.DAO;

import com.entity.User;

public interface UserDAO {
	public boolean userR(User us);

	public User loginR(String email, String password);

}

