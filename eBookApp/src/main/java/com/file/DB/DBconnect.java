package com.file.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect
{
	 static Connection conn;
	
	public static Connection getCon()
	{
		try 
		{ 
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver found!");
			
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook","root","12345");
			System.out.println("connection create!");
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return conn;
		
	
	}
}
