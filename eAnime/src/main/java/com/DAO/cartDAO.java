package com.DAO;


import java.util.List;

import com.entity.cartitem;

public interface cartDAO {
	
	public boolean addcart(cartitem c);
	public List<cartitem> getItembyUser(int uid);
	public boolean deleteItem(int tid,int uid);
}
