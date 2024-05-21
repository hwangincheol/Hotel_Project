package com.javalab.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.tag.compat.sql.SetDataSourceTag;

import com.javalab.dao.ReserveDao;
import com.javalab.vo.ReserveInfoVo;

@WebServlet("/reserveComplete")
public class ReserveCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReserveCompleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReserveCompleteServlet doGet()");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReserveCompleteServlet doPost()");
		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("user_id");
		String hotelName = request.getParameter("hotelName");
		String roomName = request.getParameter("roomName");
		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");
		int numOfuser = Integer.parseInt(request.getParameter("numOfuser"));
		String diffDay = request.getParameter("diffDay");
		// 데이터 검증 완료
		
		ReserveDao rdao = ReserveDao.getInstance();
		rdao.insertReserve(user_id, roomName, hotelName, checkin, checkout, numOfuser);
		
		String reserveNo = rdao.getLastReserveNo();
		request.setAttribute("reserveNo", reserveNo);
		
		String contextPath = request.getContextPath();
		RequestDispatcher rd = request.getRequestDispatcher(contextPath + "/reserve/reserveComplete.jsp");
		rd.forward(request, response);
	}

}
