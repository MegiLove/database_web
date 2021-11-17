package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.vo.EmpVO;

public class EmpDAO {
	private String driver="oracle.jdbc.driver.OracleDriver";
	private String url="jdbc:oracle:thin:@localhost:1521:XE";
	private String user="c##madang";
	private String password="madang";
	
	public ArrayList<EmpVO> listEmp(String mgrname, int months){
		ArrayList<EmpVO> list= new ArrayList<EmpVO>();
		String sql="select e.eno, e.ename, e.hirdate, (e.salary+e.comm)*12, rpad(substr(e.jumin,1,8),14,'*'), substr(e.email,1,instr(e.email,'@')-1) from emp e, emp m where e.mgr= m.eno and m.ename=? and months_between(sysdate, e.hirdate)>=?";
		Connection conn= null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			Class.forName(driver);
			conn= DriverManager.getConnection(url, user, password);
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1,mgrname);
			pstmt.setInt(2, months);
			rs=pstmt.executeQuery();			
			while(rs.next()) {
				list.add(new EmpVO(rs.getInt(1),rs.getString(2),rs.getDate(3), rs.getInt(4), rs.getString(5),rs.getString(6)));
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
		return list;
	}
}
