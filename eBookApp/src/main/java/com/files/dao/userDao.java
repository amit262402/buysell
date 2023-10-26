package com.files.dao;

import com.file.entities.user;

public interface userDao 
{
	public boolean userRegister(user us);
	
	public user userlogin(String email,String password);
	
	public boolean checkpassword(String ps ,int id);
	
	public boolean updateProfile(user u);
	
	public boolean checkUser(String cu);
}
