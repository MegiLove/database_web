package com.sist.vo;

public class BookVO {
	private int bookid;
	private String bookname;
	public BookVO(int bookid, String bookname) {
		super();
		this.bookid = bookid;
		this.bookname = bookname;
	}
	public BookVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	
	
}
