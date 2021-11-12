package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BookDao {
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String user="c##madang";
	String password="madang";
	
	//고객이름을 매개변수로 전달받아 그 고객이 주문하지 않는 도서이름들을 반환하는 메소드를 정의
	public ArrayList<String> getNotPurchased(String name){
		ArrayList<String> list= new ArrayList<String>();
		String sql="select bookname from book where bookid not in(select bookid from orders where custid=(select custid from customer where name=?))";
		Connection conn= null;
		PreparedStatement pstmt= null;
		ResultSet rs= null;		
		try {
			Class.forName(driver);
			conn= DriverManager.getConnection(url, user, password);
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (Exception e) {
			System.out.println("예외발생: "+e.getMessage());
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(conn!=null) {
					conn.close();
				}
			} catch (Exception e2) {
				System.out.println("예외발생: "+e2.getMessage());
			}
		}
	
		return list;
	}
}
