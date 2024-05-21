package com.javalab.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.javalab.dao.ReserveCheckDao;
import com.javalab.vo.ReserveCheckVo;

@WebServlet("/reserveCheck")
public class ReserveCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ReserveCheckDao reserveCheckDao = ReserveCheckDao.getInstance();
	
	ReserveCheckVo reserve = new ReserveCheckVo();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("ReserveCheckServlet doPost()");
		
		request.setCharacterEncoding("utf-8");
	    response.setContentType("application/text; charset:utf-8");
	    response.setCharacterEncoding("utf-8");
	    //클라이언트에서 serialize()함수로 묶어서 보낸 경우 추출
	    //data : params
	    String reserve_no = request.getParameter("reserve_no");
	    
	    
	    reserveCheckDao = ReserveCheckDao.getInstance();
	    reserve = reserveCheckDao.reserveCheck(reserve_no);
		
		//Gson으로 자바 객체를 다시 JSON Type 문자열로 변환
		Gson gson = new Gson();
		String jsonString = gson.toJson(reserve);
		
		//사용자의 웹브라우저에 쓰기(success 콜백함수에 전달됨)
		PrintWriter out = response.getWriter();
		out.print(jsonString);
	}
}
