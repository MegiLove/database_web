package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.vo.BookNameVO;



public class BookNameDAO {
	
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String user="c##madang";
	String pwd= "madang";
	
	
	public ArrayList<BookNameVO> listOrders(String name){
		ArrayList<BookNameVO> list= new ArrayList<BookNameVO>();
		String sql="select bookname from book where bookid not in(select bookid from orders where custid=(select custid from customer where name=?))";
		Connection conn= null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			Class.forName(driver);
			conn= DriverManager.getConnection(url, user, pwd);
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(new BookNameVO(rs.getString(1)));
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
