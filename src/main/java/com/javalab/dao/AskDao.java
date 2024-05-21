package com.javalab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalab.vo.AskVo;

public class AskDao {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource dataSource;
	private static AskDao instance;

	// 기본 생성자에서 환경변수를 통한 데이터베이스 관련 DataSource얻어옴
	// Server / contex.xml에 Resource로 세팅해놓은 정보
	public AskDao() {
		System.out.println("여기는 AskDao 생성자");
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 싱글톤 팬턴으로 생성
	public static AskDao getInstance() {
		if (instance == null)
			instance = new AskDao();
		return instance;
	}	

	// 회원 저장 메소드
	public void addAsk(AskVo ask) {
		try {
			
			Connection con = dataSource.getConnection();
			
//			int ask_no = ask.getAsk_no();
			String ask_name = ask.getAsk_name();
			String ask_title = ask.getAsk_title();
			String ask_content = ask.getAsk_content();
			String ask_phone = ask.getAsk_phone();
			String ask_email = ask.getAsk_email();
			String ask_date = ask.getAsk_date();
			
			String query = "insert into TBL_ASK";			
			query += " (ask_no, ask_name, ask_title, ask_content, ask_phone, ask_email, ask_date)";
			query += " values(ask_no_seq.nextval,?,?,?,?,?,?)";
			
			System.out.println("SQL :  " + query);
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ask_name);
			pstmt.setString(2, ask_title);
			pstmt.setString(3, ask_content);
			pstmt.setString(4, ask_phone);
			pstmt.setString(5, ask_email);
			pstmt.setString(6, ask_date);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();			
		}
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
