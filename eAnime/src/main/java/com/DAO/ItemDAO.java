package com.DAO;

import java.util.List;

import com.entity.ADDitem;

public interface ItemDAO {

	public boolean additem(ADDitem at);

	public List<ADDitem> getallitems();

	public ADDitem getItembyId(int a);

	public boolean updateedit(ADDitem b);

	public List<ADDitem> getItems();

	public List<ADDitem> getRecentItem();
	
	public List<ADDitem> allRecentItem();

}

