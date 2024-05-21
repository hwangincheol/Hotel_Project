package com.javalab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalab.vo.HotelVo;
import com.javalab.vo.RoomVo;

public class HotelDao {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource dataSource;
	private static HotelDao instance;
	
	private HotelDao() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			System.out.println("HotelDao() 생성자 에러 : " + e.getMessage());
		}
	}
	
	public static HotelDao getInstance() {
		if(instance == null) {
			instance = new HotelDao();
		}
		return instance;
	}
	
	public HotelVo getHotelInfoForName(String hotelName) {
		HotelVo hotel = null;
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT * FROM TBL_HOTEL WHERE HOTEL_NAME = ?");
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, hotelName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				hotel = new HotelVo(
						rs.getString("hotel_id"), rs.getString("hotel_name"),
						rs.getString("hotel_phone"));
			}
			
		} catch (SQLException e) {
			System.out.println("getRoomInfo SQLException : " + e.getMessage());
		}
		
		return hotel;
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
