package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EmpDAO {
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String user="c##madang";
	String password="madang";
	
	public ArrayList<String> getEmpName(String ename, String dloc){
		ArrayList<String> list= new ArrayList<String>();
		String sql="select distinct ename from emp e, dept d where d.dno=e.dno and (e.dno=(select dno from emp where ename=?) or dloc=?)";
		Connection conn= null;
		PreparedStatement pstmt= null;
		ResultSet rs= null;	
		try {
			Class.forName(driver);
			conn= DriverManager.getConnection(url, user, password);
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, ename);
			pstmt.setString(2, dloc);
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

