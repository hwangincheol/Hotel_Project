package com.javalab.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalab.dao.AskDao;
import com.javalab.vo.AskVo;

@WebServlet("/askServlet")
public class AskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private AskDao askDao = AskDao.getInstance();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("askServlet doPost()");
		request.setCharacterEncoding("utf-8");
	    response.setContentType("application/text; charset:utf-8");
	    response.setCharacterEncoding("utf-8");

	    String ask_name = request.getParameter("ask_name");
	    String ask_title = request.getParameter("ask_title");
	    String ask_content = request.getParameter("ask_content");
	    String ask_phone = request.getParameter("ask_phone");
	    String ask_email = request.getParameter("ask_email");
	    
	    
	    //서버의 시간을 String으로 변환(서버 날짜)
	    LocalDateTime currentDate = LocalDateTime.now();
	    String ask_date = currentDate.format(DateTimeFormatter.ofPattern("YYYY-MM-dd E HH:mm"));
	    
	    AskVo ask = new AskVo(ask_name, ask_title, ask_content, ask_phone, ask_email, ask_date);
		System.out.println("ask.toString(): " + ask.toString());
		
		//데이터에 저장
		askDao = AskDao.getInstance();
		askDao.addAsk(ask);
		
		//다시 화면으로 문의화면으로 가기
		String contextPath = request.getContextPath();		
		String url = contextPath + "/ask/askform.jsp";	// 게시물 목록 서블릿 호출		
		response.sendRedirect(url);
		
	}
}
