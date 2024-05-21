package com.javalab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalab.vo.HotelVo;
import com.javalab.vo.MemberVo;
import com.javalab.vo.RoomVo;

public class ReserveDao {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource dataSource;
	private static ReserveDao instance;
	
	private ReserveDao() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			System.out.println("ReserveDao() 생성자 에러 : " + e.getMessage());
		}
	}
	
	public static ReserveDao getInstance() {
		if(instance == null) {
			instance = new ReserveDao();
		}
		return instance;
	}
	
	
	// 예약 정보 데이터베이스 등록
	public void insertReserve(String user_id, String roomType, String hotelName, String checkin, String checkout, int numofuser) {
		RoomDao rdao = RoomDao.getInstance();
		HotelDao hdao = HotelDao.getInstance();
		MemberDao mdao = MemberDao.getInstance();
		
		MemberVo member = mdao.getMember(user_id);
		RoomVo room = rdao.getRoomInfoForType(roomType);
		HotelVo hotel = hdao.getHotelInfoForName(hotelName);
		
		StringBuffer sb = new StringBuffer();
		sb.append("INSERT INTO TBL_RESERVE(RESERVE_NO, USER_ID, HOTEL_ID, ROOM_ID, ");
		sb.append("RESERVE_NAME, RESERVE_PHONE, RESERVE_EMAIL, CHECKIN, CHECKOUT, NUM_OF_USER) ");
		sb.append("VALUES(SEQ_RESERVE_NO.NEXTVAL, ?, ?, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), TO_DATE(?, 'YYYY-MM-DD'), ?)");
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, member.getUser_id());
			pstmt.setString(2, hotel.getHotel_id());
			pstmt.setString(3, room.getRoom_id());
			pstmt.setString(4, member.getName());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, checkin);
			pstmt.setString(8, checkout);
			pstmt.setInt(9, numofuser);
			pstmt.executeQuery();
			System.out.println("예약 정보 등록 완료");
			
		} catch (SQLException e) {
			System.out.println("insertReserve SQLException : " + e.getMessage());
		} finally {
			close();
		}
	}
	
	// 예약 등록 후 최신 예약 데이터 1행을 가져오는 함수
	public String getLastReserveNo() {
		String result = "";
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT RESERVE_NO FROM TBL_RESERVE WHERE ROWNUM BETWEEN 1 AND 1 ORDER BY RESERVE_NO DESC");
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getString("RESERVE_NO");
			}
			
		} catch (SQLException e) {
			System.out.println("getLastReserveNo SQLException : " + e.getMessage());
		} finally {
			close();
		}
		
		return result;
	}
	
	
	// DB 자원해제
	private void close()
	{
		try {
			if ( pstmt != null ){ 
				pstmt.close(); 
			}
			if ( con != null ){ 
				con.close(); 
			}
			if( rs != null ) {
				rs.close();
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	} // end close()
}
