package com.sist.book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class OrdersDAO {
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:XE";
	private String userName = "c##madang";
	private String passWord = "madang";
	
	public ArrayList<OrdersVO> searchOrders(int custid){
		ArrayList<OrdersVO> list= new ArrayList<OrdersVO>();
		Connection conn= null;
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		String sql= "select * from orders where custid=?";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userName, passWord);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, custid);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(new OrdersVO(rs.getInt(1),rs.getInt(2),
						rs.getInt(3),rs.getInt(4),rs.getDate(5)));
			}
		} catch (Exception e) {
			System.out.println("예외발생: "+ e.getMessage());
		}finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}

				if (conn != null) {
					conn.close();
				}
				
				if(rs!= null) {
					rs.close();
				}
			} catch (Exception e2) {
				System.out.println("예외발생: "+ e2.getMessage());
			}
		}
		
		return list;
	}
}
