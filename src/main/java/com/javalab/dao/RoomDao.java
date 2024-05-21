package com.javalab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalab.vo.RoomVo;

public class RoomDao {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource dataSource;
	private static RoomDao instance;
	
	private RoomDao() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			System.out.println("RoomDao() 생성자 에러 : " + e.getMessage());
		}
	}
	
	public static RoomDao getInstance() {
		if(instance == null) {
			instance = new RoomDao();
		}
		return instance;
	}
	
	// 룸 객체 가져오는 함수
	public RoomVo getRoom(String room_id) {
		RoomVo room = null;
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT * FROM TBL_ROOM WHERE ROOM_ID = ? ");
		
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, room_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				room = new RoomVo(
						rs.getString("room_id"), rs.getString("room_name"), rs.getString("room_type"), 
						rs.getInt("room_capacity"), rs.getString("room_price")
						);
			}
			
		} catch (SQLException e) {
			System.out.println("getRoom() SQLException : " + e.getMessage()); 
		} finally {
			close();
		}
		
		return room;
	}
	
	public RoomVo getRoomInfoForType(String roomType) {
		RoomVo room = null;
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT * FROM TBL_ROOM WHERE ROOM_TYPE = ?");
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, roomType);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				room = new RoomVo(
						rs.getString("room_id"), rs.getString("room_name"), 
						rs.getString("room_type"), rs.getInt("room_capacity"), 
						rs.getString("room_price"));
			}
			
		} catch (SQLException e) {
			System.out.println("getRoomInfo SQLException : " + e.getMessage());
		}
		
		return room;
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
