package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.vo.EmpVO;

public class EmpDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userName = "c##madang";
	String password = "madang";
	
	public ArrayList<EmpVO> listEmp(String dloc){
		ArrayList<EmpVO> list = new ArrayList<EmpVO>();
		String sql = "select eno,ename,salary,comm,salary+comm,d.dno,dname from emp e,dept d where e.dno = d.dno and dloc=? order by dname,ename";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userName, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dloc);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new EmpVO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getString(7)));
			}
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return list;
	}
}
