package com.files.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.file.entities.BookOrder;
import com.file.entities.bookDetails;

public class BookOrderDaoImpl implements BookOrderDao
{

	private Connection conn;
	
	public BookOrderDaoImpl(Connection conn) {
		this.conn = conn;
	}



	@Override
	public int getOrderNo() 
	{
		int i=1;
		try {
			
			String sql="select*from userorder2";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				++i;
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}



	@Override
	public boolean saveOrder(List<BookOrder> blist) {
      boolean f=false;
		
		try {
			
			String sql="insert into userorder2(orderid,username,email,address,phone,bookname,author,price,payment) values(?,?,?,?,?,?,?,?,?)";
			
			conn.setAutoCommit(false);
			PreparedStatement ps =conn.prepareStatement(sql);
			for(BookOrder b:blist)
			{
				ps.setString(1, b.getOrderid());
				ps.setString(2, b.getName());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFulladd());
				ps.setString(5,b.getPhone() );
				ps.setString(6, b.getBookname());
				ps.setString(7, b.getAuthor());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPaymentType());
				
				ps.addBatch();
			}
			int []count=ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}



	@Override
	public List<BookOrder> getBook(String email) {
		List<BookOrder> list=new ArrayList<BookOrder>();
		BookOrder b=null;
		try
		{
			String sql="select * from userorder2 where email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b=new BookOrder();
				
				b.setId(rs.getInt(1));
				b.setOrderid(rs.getString(2));
				b.setName(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setFulladd(rs.getString(5));
				b.setPhone(rs.getString(6));
				b.setBookname(rs.getString(7));
				b.setAuthor(rs.getString(8));
				b.setPrice(rs.getString(9));
				b.setPaymentType(rs.getString(10));
				list.add(b);
				
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return list;
	}



	@Override
	public List<BookOrder> allOrderBook() 
	{
		List<BookOrder> list=new ArrayList<BookOrder>();
		BookOrder b=null;
		try
		{
			String sql="select * from userorder2";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b=new BookOrder();
				
				b.setId(rs.getInt(1));
				b.setOrderid(rs.getString(2));
				b.setName(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setFulladd(rs.getString(5));
				b.setPhone(rs.getString(6));
				b.setBookname(rs.getString(7));
				b.setAuthor(rs.getString(8));
				b.setPrice(rs.getString(9));
				b.setPaymentType(rs.getString(10));
				list.add(b);
				
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return list;
	}


 
	




	
}
