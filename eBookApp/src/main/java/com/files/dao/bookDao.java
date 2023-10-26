package com.files.dao;

import java.util.List;

import com.file.entities.bookDetails;

public interface bookDao
{
	public boolean addbook(bookDetails bd);
	
	public List<bookDetails> getallbook();
	
	public bookDetails getBookbyId(int id);
	
	public boolean updateEditBooks(bookDetails b);
	
	public boolean deletebook(int id);
	
	public List<bookDetails> getNewBook();
	
	public List<bookDetails> getRecentBook();
	
	public List<bookDetails> getOldBook();
	
	public List<bookDetails> getAllRecentBook();
	
	public List<bookDetails> getAllNewBook();
	
	public List<bookDetails> getAllOldBook();
	
	public List<bookDetails> getBookOldByUser(String email,String cate);
	
	public boolean OldBookDeleteByUser(String email,String Cat,int id);

	public List<bookDetails> getBookbySearch(String ch);
}

















