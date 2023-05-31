package com.DAO;

import java.util.List;

import com.entity.itemorder;

public interface ordersDAO {
	
	public int getOrderno();
	
	public boolean saveorders(List<itemorder> b );

}
