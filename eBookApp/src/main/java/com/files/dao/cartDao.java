package com.files.dao;

import java.util.List;

import com.file.entities.Cart;


public interface cartDao 
{
	public boolean addcart(Cart c);
	
	public List<Cart> getBookByUser(int userId);
	
	public boolean RemoveBook(int bid,int uid,int cid);
}
