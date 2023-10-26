package com.files.dao;

import java.util.List;

import com.file.entities.BookOrder;

public interface BookOrderDao
{
	public int getOrderNo();
	public boolean saveOrder(List<BookOrder> blist);
	
	public List<BookOrder> getBook(String email);
	
	public List<BookOrder> allOrderBook();

}
