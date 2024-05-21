package com.javalab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalab.vo.MemberVo;

public class MemberDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource dataSource;
	private static MemberDao instance;

	
	private MemberDao() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			System.out.println("MemberDao() 생성자 에러 : " + e.getMessage());
		}
	}
	
	public static MemberDao getInstance() {
		if(instance == null) {
			instance = new MemberDao();
		}
		return instance;
	}
	
	
	// 회원 데이터에 ID와 PASSWORD가 일치하는 데이터가 있으면 데이터를 반환하는 함수
	public MemberVo ExistsMember(MemberVo inputData) {
		MemberVo member = null;
		StringBuffer sb = new StringBuffer();
		
		String username = inputData.getUser_id();
		String password = inputData.getPassword();
		
		
		sb.append("SELECT * FROM TBL_MEMBER WHERE USER_ID = ? AND PASSWORD = ?");
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberVo(
						rs.getString("user_id"), rs.getString("password"),
						rs.getString("name"), rs.getString("phone"), 
						rs.getString("email")
						);
			}
			
		} catch (SQLException e) {
			System.out.println("getMember SQLException : " + e.getMessage());
			
		} finally {
			close();
		}
		
		return member;
		
	}
	
	// 회원 ID로 정보를 검색(비밀번호 제외) - 아이디가 존재하는지 여부 확인
		public MemberVo getMember(String user_id) {
			MemberVo member = null;
			StringBuffer sb = new StringBuffer();
			
			String username = user_id;
			
			
			sb.append("SELECT * FROM TBL_MEMBER WHERE USER_ID = ?");
			try {
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(sb.toString());
				pstmt.setString(1, username);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					member = new MemberVo(
							rs.getString("user_id"), rs.getString("name"), 
							rs.getString("phone"), rs.getString("email")
							);
				}
				
			} catch (SQLException e) {
				System.out.println("getMember SQLException : " + e.getMessage());
				
			} finally {
				close();
			}
			
			return member;
		}
		
		
		// 아이디 존재하는지 확인
		public String isExistMember(String user_id) {
			String result = "false";
			StringBuffer sb = new StringBuffer();
			sb.append("SELECT DECODE(COUNT(*), 1, 'true', 'false') ISEXIST FROM TBL_MEMBER WHERE USER_ID = ?");
			try {
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(sb.toString());
				pstmt.setString(1, user_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					result = rs.getString("isexist");
				}
				
			} catch (SQLException e) {
				System.out.println("isExistMember SQLException : " + e.getMessage());
			} finally {
				close();
			}
			
			return result;
			
		}
		
		// 회원가입
		public int join(MemberVo member) {
			System.out.println("MemberDao join()");
			int result = 0;
	        boolean flag = false;
	        Connection conn = null;
	        
	        System.out.println("member.getUser_id(): " + member.getUser_id());
	       
	        String sql = "INSERT INTO TBL_MEMBER VALUES(?, ?, ?, ?, ?)";

	        try {
	            conn = dataSource.getConnection();
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, member.getUser_id());
	            pstmt.setString(2, member.getPassword());

	            if (member.getName() != null)
	                pstmt.setString(3, member.getName());
	            else
	                pstmt.setString(3, "");

	            if (member.getPhone() != null)
	                pstmt.setString(4, member.getPhone());
	            else
	                pstmt.setString(4, "");

	            if (member.getEmail() != null)
	                pstmt.setString(5, member.getEmail());
	            else
	                pstmt.setString(5, "");

	            result = pstmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();

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
