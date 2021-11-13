package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.vo.NewBookVO;

public class NewBookDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "c##madang";
	String pwd = "madang";

	public ArrayList<NewBookVO> listBook(int bookid, String bookname, String publisher, int price) {
		ArrayList<NewBookVO> list = new ArrayList<NewBookVO>();
		String sql = "select ";

		return list;
	}

	public void addBook(int bookid, String bookname, String publisher, int price) {
		String sql = "insert into book values(?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
	
		try {
			Class.forName(driver);
			conn= DriverManager.getConnection(url, user, pwd);
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, bookid);
			pstmt.setString(2, bookname);
			pstmt.setString(3, publisher);
			pstmt.setInt(4, price);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("예외발생: " + e.getMessage());

		} finally {
			try {				
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				System.out.println("예외발생: " + e2.getMessage());
			}
		}

	}
}
