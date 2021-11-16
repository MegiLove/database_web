package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.sist.vo.OrdersVO;

public class OrdersDAO {
	private String driver="oracle.jdbc.driver.OracleDriver";
	private String url="jdbc:oracle:thin:@localhost:1521:XE";
	private String user="c##madang";
	private String password="madang";
	
	public int getNextOrderid() {
		int orderid=0;
		String sql="select max(orderid)+1 from orders";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			Class.forName(driver);
			conn= DriverManager.getConnection(url, user, password);
			pstmt= conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				orderid=rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("예외발생: "+e.getMessage());
		}finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}
				if(conn!=null) {
					conn.close();
				}
				if(rs!=null) {
					rs.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return orderid;
	}
	
	public int insertOrders(OrdersVO o) {
		int re=-1;
		String sql="insert into orders values(?,?,?,?,sysdate)";
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			Class.forName(driver);
			conn= DriverManager.getConnection(url, user, password);
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, getNextOrderid());
			pstmt.setInt(2, o.getCustid());
			pstmt.setInt(3, o.getBookid());
			pstmt.setInt(4, o.getSaleprice());
			re=pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("예외발생: "+e.getMessage());
		}finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}
				if(conn!=null) {
					conn.close();
				}
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return re;
	}
}
