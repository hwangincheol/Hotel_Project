package com.javalab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalab.vo.ReserveCheckVo;

public class ReserveCheckDao {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource dataSource;
	private static ReserveCheckDao instance;
	

	// 기본 생성자에서 환경변수를 통한 데이터베이스 관련 DataSource얻어옴
	// Server / contex.xml에 Resource로 세팅해놓은 정보
	public ReserveCheckDao() {
		System.out.println("여기는 ReserveDao 생성자");
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 싱글톤 팬턴으로 생성
	public static ReserveCheckDao getInstance() {
		if (instance == null)
			instance = new ReserveCheckDao();
		return instance;
	}	

	//체크
	public ReserveCheckVo reserveCheck(String reserve_no) {
		
		ReserveCheckVo reserve = new ReserveCheckVo();
		
		String sql = "";
		sql = "Select re.reserve_no, re.reserve_name, r.room_type,";
		sql += " to_char(re.checkin, 'yyyy-MM-dd') as checkin, to_char(re.checkout, 'yyyy-MM-dd') as checkout";
		sql += " from tbl_reserve re, tbl_room r";
		sql += " where re.room_id = r.room_id";
		sql += " and re.reserve_no = ?";

		

		try {
			con = dataSource.getConnection(); // 커넥션 객체 얻기
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reserve_no);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				reserve = new ReserveCheckVo();
				reserve.setReserve_no(rs.getInt("reserve_no"));
				reserve.setReserve_name(rs.getString("reserve_name"));
				reserve.setRoom_type(rs.getString("room_type"));
				reserve.setCheckin(rs.getString("checkin"));
				reserve.setCheckout(rs.getString("checkout"));
			}
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return reserve;
		
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
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	} // end close()	


		
}
