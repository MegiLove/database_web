package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.vo.BookVO;

public class BookDAO {
	private String driver="oracle.jdbc.driver.OracleDriver";
	private String url="jdbc:oracle:thin:@localhost:1521:XE";
	private String user="c##madang";
	private String password="madang";
	
	public ArrayList<BookVO> listBook(String name){
		ArrayList<BookVO> list= new ArrayList<BookVO>();
		String sql="select * from book"
				+ "		where bookid in (select bookid from"
				+ "			orders"
				+ "			where custid = (select custid from("
				+ "			select custid, count(bookid) "
				+ "			from orders "
				+ "			where bookid in (select bookid from orders where custid = (select custid from customer where name = ?))"
				+ "			and custid != (select custid from customer where name = ?)"
				+ "			group by custid"
				+ "			order by count(bookid) desc) where rownum = 1)"
				+ "			minus"
				+ "			select bookid from orders where custid = (select custid from customer where name = ?))";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			Class.forName(driver);
			conn= DriverManager.getConnection(url, user, password);
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, name);
			pstmt.setString(3, name);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				list.add(new BookVO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4)));
			}
		} catch (Exception e) {
			System.out.println("예외발생: "+e.getMessage());
		}finally {
			try {
				if(conn!=null) {
					conn.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(rs!=null) {
					rs.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return list;
	}
}