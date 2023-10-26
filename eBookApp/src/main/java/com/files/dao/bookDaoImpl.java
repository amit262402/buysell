package com.files.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.file.entities.bookDetails;

public class bookDaoImpl implements bookDao
{

	private Connection conn;
	

	public bookDaoImpl(Connection conn) 
	{
		this.conn = conn;
	}


	@Override
	public boolean addbook(bookDetails b) 
	{
		boolean f=false;
		try 
		{
			String sql="insert into addbook(bookname,author,price,bookCategory,photo,useremail,status) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2,b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getPhoto());
			ps.setString(6, b.getEmail());
			ps.setString(7, b.getStatus());
			
			int rs = ps.executeUpdate();
			
			if(rs==1)
			{
				f=true;
			}
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}


	@Override
	public List<bookDetails> getallbook() 
	{
	
			List<bookDetails> list=new ArrayList<bookDetails>();
			bookDetails b=null;
			
			try {
				String sql="select * from addbook";
				
				PreparedStatement ps=conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while(rs.next())
				{
					b=new bookDetails();
					
					b.setBookid(rs.getInt(1));
					b.setBookname(rs.getString(2));
					b.setAuthor(rs.getString(3));
					b.setPrice(rs.getString(4));
					b.setBookCategory(rs.getString(5));
					b.setPhoto(rs.getString(6));
					b.setEmail(rs.getString(7));
					b.setStatus(rs.getString(8));
					
					list.add(b);
					
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		return list;
	}


	@Override
	public bookDetails getBookbyId(int id) 
	{
		bookDetails b=null;
		try {
			String sql="select *from addbook where bookid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b=new bookDetails();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setPhoto(rs.getString(6));
				b.setEmail(rs.getString(7));
				b.setStatus(rs.getString(8));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}


	@Override
	public boolean updateEditBooks(bookDetails b) {
		
		boolean f=false;
		try {
			String sql="update addbook set bookname=?,author=?,price=?,bookCategory=?,useremail=?,status=? where bookid=?";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getEmail());
			ps.setString(6, b.getStatus());
			ps.setInt(7, b.getBookid());
			
			int i = ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}


	@Override
	public boolean deletebook(int id) 
	{
		boolean f=false;
		
		try {
			String sql="delete from addbook where bookid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	@Override
	public List<bookDetails> getNewBook() 
	{
		List<bookDetails> list=new ArrayList<bookDetails>();
		
		bookDetails b=null;
		try 
		{
			String sql="select * from addbook where bookCategory=? and status=? order by bookid DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			int i = 1;
			while(rs.next() && i<=4)
			{
				b=new bookDetails();
				
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setPhoto(rs.getString(6));
				b.setEmail(rs.getString(7));
				b.setStatus(rs.getString(8));
				list.add(b);
				i++;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<bookDetails> getRecentBook() 
	{
        List<bookDetails> list2=new ArrayList<bookDetails>();
		
		bookDetails b=null;
		try 
		{
			String sql="select * from addbook where status=? order by bookid DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Active");
			
			ResultSet rs=ps.executeQuery();
			int i = 1;
			while(rs.next() && i<=4)
			{
				b=new bookDetails();
				
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setPhoto(rs.getString(6));
				b.setEmail(rs.getString(7));
				b.setStatus(rs.getString(8));
				list2.add(b);
				i++;
				
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list2;
	}


	@Override
	public List<bookDetails> getOldBook() 
	{

        List<bookDetails> list1=new ArrayList<bookDetails>();
		
		bookDetails b=null;
		try 
		{
			String sql="select * from addbook where  bookCategory =? and status=? order by bookid DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			
			ResultSet rs=ps.executeQuery();
			int i = 1;
			while(rs.next() && i<=4)
			{
				b=new bookDetails();
				
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setPhoto(rs.getString(6));
				b.setEmail(rs.getString(7));
				b.setStatus(rs.getString(8));
				list1.add(b);
				i++;
				
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list1;
	}


	@Override
	public List<bookDetails> getAllRecentBook() 
	{
		 List<bookDetails> list2=new ArrayList<bookDetails>();
			
			bookDetails b=null;
			try 
			{
				String sql="select * from addbook where status=? order by bookid DESC";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, "Active");
				
				ResultSet rs=ps.executeQuery();
				
				while(rs.next())
				{
					b=new bookDetails();
					
					b.setBookid(rs.getInt(1));
					b.setBookname(rs.getString(2));
					b.setAuthor(rs.getString(3));
					b.setPrice(rs.getString(4));
					b.setBookCategory(rs.getString(5));
					b.setPhoto(rs.getString(6));
					b.setEmail(rs.getString(7));
					b.setStatus(rs.getString(8));
					list2.add(b);
					
					
				}	
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list2;
	
	}


	@Override
	public List<bookDetails> getAllNewBook() {
List<bookDetails> list=new ArrayList<bookDetails>();
		
		bookDetails b=null;
		try 
		{
			String sql="select * from addbook where bookCategory=? and status=? order by bookid DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				b=new bookDetails();
				
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setPhoto(rs.getString(6));
				b.setEmail(rs.getString(7));
				b.setStatus(rs.getString(8));
				list.add(b);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<bookDetails> getAllOldBook() {

        List<bookDetails> list1=new ArrayList<bookDetails>();
		
		bookDetails b=null;
		try 
		{
			String sql="select * from addbook where  bookCategory =? and status=? order by bookid DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				b=new bookDetails();
				
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setPhoto(rs.getString(6));
				b.setEmail(rs.getString(7));
				b.setStatus(rs.getString(8));
				list1.add(b);
				
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list1;
	}


	@Override
	public List<bookDetails> getBookOldByUser(String email,String cate) {
		List<bookDetails> list =new ArrayList<bookDetails>();
		bookDetails b=null;
		try 
		{
			String sql="select *from addbook where bookCategory=? and useremail=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, cate);
			ps.setString(2, email);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b=new bookDetails();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setPhoto(rs.getString(6));
				b.setEmail(rs.getString(7));
				b.setStatus(rs.getString(8));
				list.add(b);
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public boolean OldBookDeleteByUser(String email, String Cat,int id) {
		boolean b=false;
		try {
			String sql="delete from addbook where bookCategory=? and useremail=? and bookid=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, Cat);
			ps.setString(2, email);
			ps.setInt(3, id);
			
			int i = ps.executeUpdate();
			if(i==1)
			{
				b=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}


	@Override
	public List<bookDetails> getBookbySearch(String ch) {
		List<bookDetails> list =new ArrayList<bookDetails>();
		bookDetails b=null;
		try 
		{
			String sql="select *from addbook where bookname like ? or author like ? or bookCategory like ? and status=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "active" );
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b=new bookDetails();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setPhoto(rs.getString(6));
				b.setEmail(rs.getString(7));
				b.setStatus(rs.getString(8));
				list.add(b);
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
