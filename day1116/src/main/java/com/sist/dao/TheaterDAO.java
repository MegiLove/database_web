package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.vo.TheaterVO;
import com.sist.vo.TicketVO;

public class TheaterDAO {
	private String driver="oracle.jdbc.driver.OracleDriver";
	private String url="jdbc:oracle:thin:@localhost:1521:XE";
	private String user="c##sist";
	private String password="sist";
	
	//���ܹ߻�: �ε������� ������ IN �Ǵ� OUT �Ű�����:: 1
	//sql���ȿ� ?�� ���� �����Ȱ�쿡 �̷� ������ �߻��մϴ�.
	
	public ArrayList<TicketVO> getTicket(String name) {
		String sql=" select �����̸�,�󿵰�.�󿵰���ȣ,��ȭ����,��¥,�¼���ȣ,���� from ����, �󿵰�, ����, �� where ����.�����ȣ=�󿵰�.�����ȣ and �󿵰�.�����ȣ=����.�����ȣ and �󿵰�.�󿵰���ȣ= ����.�󿵰���ȣ and ����.����ȣ= ��.����ȣ and �̸�=?";
		ArrayList<TicketVO> list= new ArrayList<TicketVO>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			Class.forName(driver);
			conn= DriverManager.getConnection(url, user, password);
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				list.add(new TicketVO(rs.getString(1),rs.getInt(2),rs.getString(3),rs.getDate(4),rs.getInt(5),rs.getInt(6)));
			}
		} catch (Exception e) {
			System.out.println("���ܹ߻�: "+e.getMessage());
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
	
	public int getTotalByCinemaName(String cinemaName) {
		int total=0;
		String sql=" select sum(count(*)*"
				+ " (select ���� from �󿵰� where ����.�����ȣ=�󿵰�.�����ȣ and ����.�󿵰���ȣ=�󿵰�.�󿵰���ȣ)) total"
				+ " from ����"
				+ " where to_char(��¥,'yyyy/mm/dd')=to_char(sysdate,'yyyy/mm/dd') and"
				+ " �����ȣ=(select �����ȣ from ���� where �����̸�=?)"
				+ " group by �����ȣ,�󿵰���ȣ"
				+ " order by �����ȣ,�󿵰���ȣ";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			Class.forName(driver);
			conn= DriverManager.getConnection(url, user, password);
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, cinemaName);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				total=rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("���ܹ߻�: "+e.getMessage());
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
		
		
		return total;
	}
	public ArrayList<TheaterVO> listTheater(String cinemaName){
		ArrayList<TheaterVO> list= new ArrayList<TheaterVO>();
		String sql=" select �󿵰�.�����ȣ,�󿵰�.�󿵰���ȣ,��ȭ����,����,�¼��� from �󿵰�,����"
				+ " where(�󿵰�.�����ȣ, �󿵰���ȣ) in"
				+ " (select distinct �����ȣ,�󿵰���ȣ from ����"
				+ " where to_char(��¥,'yyyy/mm/dd')=to_char(sysdate,'yyyy/mm/dd'))"
				+ " and �󿵰�.�����ȣ=����.�����ȣ and �����̸�=?";
		Connection conn= null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			Class.forName(driver);
			conn= DriverManager.getConnection(url, user, password);
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, cinemaName);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(new TheaterVO(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4),rs.getInt(5)));
			}
			
		} catch (Exception e) {
			System.out.println("���ܹ߻�: "+e.getMessage());
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
