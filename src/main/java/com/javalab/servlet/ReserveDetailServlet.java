package com.javalab.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalab.vo.MemberVo;

@WebServlet("/reserveDetail")
public class ReserveDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReserveDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReserveDetailServlet doGet()");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		MemberVo member = (MemberVo)session.getAttribute("member");
		
		String room_id = request.getParameter("room");
		
		String contextPath = request.getContextPath();
		String loginUrl = contextPath + "/login/login.jsp";
		String reserveDetailUrl = contextPath + "/reserve/reserveDetail.jsp?room=" + room_id;
		
		// member가 존재 하지 않는다면
		if(member == null) {
			// login 화면으로 이동
			response.sendRedirect(loginUrl);
			return;
		} else {
			// 존재하면 reserveDetail 화면으로 이동
			RequestDispatcher rd = request.getRequestDispatcher(reserveDetailUrl);
			rd.forward(request, response);
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReserveDetailServlet doPost()");
		
	}

}
