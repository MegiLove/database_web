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
	
	//예외발생: 인덱스에서 누락된 IN 또는 OUT 매개변수:: 1
	//sql문안에 ?에 값이 누락된경우에 이런 오류가 발생합니다.
	
	public ArrayList<TicketVO> getTicket(String name) {
		String sql=" select 극장이름,상영관.상영관번호,영화제목,날짜,좌석번호,가격 from 극장, 상영관, 예약, 고객 where 극장.극장번호=상영관.극장번호 and 상영관.극장번호=예약.극장번호 and 상영관.상영관번호= 예약.상영관번호 and 예약.고객번호= 고객.고객번호 and 이름=?";
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
	
	public int getTotalByCinemaName(String cinemaName) {
		int total=0;
		String sql=" select sum(count(*)*"
				+ " (select 가격 from 상영관 where 예약.극장번호=상영관.극장번호 and 예약.상영관번호=상영관.상영관번호)) total"
				+ " from 예약"
				+ " where to_char(날짜,'yyyy/mm/dd')=to_char(sysdate,'yyyy/mm/dd') and"
				+ " 극장번호=(select 극장번호 from 극장 where 극장이름=?)"
				+ " group by 극장번호,상영관번호"
				+ " order by 극장번호,상영관번호";
		
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
		
		
		return total;
	}
	public ArrayList<TheaterVO> listTheater(String cinemaName){
		ArrayList<TheaterVO> list= new ArrayList<TheaterVO>();
		String sql=" select 상영관.극장번호,상영관.상영관번호,영화제목,가격,좌석수 from 상영관,극장"
				+ " where(상영관.극장번호, 상영관번호) in"
				+ " (select distinct 극장번호,상영관번호 from 예약"
				+ " where to_char(날짜,'yyyy/mm/dd')=to_char(sysdate,'yyyy/mm/dd'))"
				+ " and 상영관.극장번호=극장.극장번호 and 극장이름=?";
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
