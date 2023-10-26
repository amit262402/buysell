package com.files.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.file.entities.user;

public class userDaoImpl implements userDao
{
	private Connection conn;
	
	
	public userDaoImpl(Connection conn)
	{
		super();
		this.conn = conn;
	}


	@Override
	public boolean userRegister(user us) 
	{
		boolean f=false;
		try 
		{
			String sql="insert into ebookuser(name,email,phone,password) values(?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhone());
			ps.setString(4, us.getPassword());
			int i =ps.executeUpdate();
			
			
			if(i==1)
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


	public user userlogin(String email, String password) 
	{
		user us=null;
		try 
		{
			String sql="select*from ebookuser where email=? and password=?";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				us=new user();
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
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return us;
	
	}


	@Override
	public boolean checkpassword(String ps ,int id) 
	{
		boolean b=false;
		try {
			String sql="select*from ebookuser where id=? and password=?";
			PreparedStatement ps1=conn.prepareStatement(sql);
			ps1.setInt(1, id);
			ps1.setString(2, ps);
			
			
			ResultSet rs = ps1.executeQuery();
			while(rs.next())
			{
				b=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}


	@Override
	public boolean updateProfile(user u)
	{
		boolean f=false;
		try 
		{
			String sql="update ebookuser set name=?,email=?,phone=?,password=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPhone());
			ps.setString(4, u.getPassword());
			ps.setInt(5, u.getId());
			int i =ps.executeUpdate();
			
			
			if(i==1)
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
	public boolean checkUser(String cu) {
		
		boolean f=true;
		try 
		{
			String sql="select * from ebookuser where email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, cu);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				f=false;
			}
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
}
